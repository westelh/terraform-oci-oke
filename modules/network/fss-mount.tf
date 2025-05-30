resource "oci_file_storage_mount_target" "fss" {
  count               = var.use_fss ? 1 : 0
  compartment_id      = var.compartment_id
  display_name        = "oke-fss-${var.state_id}"
  defined_tags        = var.defined_tags
  freeform_tags       = var.freeform_tags
  availability_domain = var.fss_availability_domain
  nsg_ids             = [local.fss_nsg_id]
  subnet_id           = lookup(local.subnet_output, "fss", null)
}
