Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UForJ-0007Zq-SU
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 17:49:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2013 09:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,838,1355126400"; d="scan'208";a="214076225"
Received: from adamian-desktop.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2013 09:32:03 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 638BC5608C0; Wed, 13 Mar 2013 18:32:18 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 18:32:16 +0200
Message-Id: <1363192336-29324-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363191954-28073-1-git-send-email-alexandru.damian@intel.com>
References: <1363191954-28073-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH v2] qemu: remove revert to vmware vga driver
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 16:49:11 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

The reverted patch breaks the Xorg vmware driver, as noted
in qemu commit 1f202568e0553b416483e5993f1bde219c22cf72

This is root cause of [YOCTO 3879] and [YOCTO 3828].

With this patch, the Xorg in QEMUX86 and X86_64 starts
to a magenta screeni, but works ok. 
The magenta problem will be fixed in an Xorg patch.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 ...re_vga-Add-back-some-info-in-local-state-.patch |  114 --------------------
 meta/recipes-devtools/qemu/qemu.inc                |    1 -
 2 files changed, 115 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch

diff --git a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch b/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
deleted file mode 100644
index d56256e..0000000
--- a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 2cf7df441ce4c36525ba4d2d040f8cb0b0c75f14 Mon Sep 17 00:00:00 2001
-From: Constantin Musca <constantinx.musca@intel.com>
-Date: Fri, 7 Dec 2012 12:33:42 +0200
-Subject: [PATCH] Revert "vmware_vga: Add back some info in local state
- partially reverting aa32b38c"
-
-- this reverts commit 1f202568e0553b416483e5993f1bde219c22cf72
-- do not cache the DS depth (the depth might change)
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
----
- hw/vmware_vga.c | 30 +++++++++---------------------
- 1 file changed, 9 insertions(+), 21 deletions(-)
-
-diff --git a/hw/vmware_vga.c b/hw/vmware_vga.c
-index 834588d..7c766fb 100644
---- a/hw/vmware_vga.c
-+++ b/hw/vmware_vga.c
-@@ -39,8 +39,6 @@ struct vmsvga_state_s {
-     VGACommonState vga;
- 
-     int invalidated;
--    int depth;
--    int bypp;
-     int enable;
-     int config;
-     struct {
-@@ -57,9 +55,6 @@ struct vmsvga_state_s {
-     int new_height;
-     uint32_t guest;
-     uint32_t svgaid;
--    uint32_t wred;
--    uint32_t wgreen;
--    uint32_t wblue;
-     int syncing;
- 
-     MemoryRegion fifo_ram;
-@@ -723,25 +718,25 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
-         return SVGA_MAX_HEIGHT;
- 
-     case SVGA_REG_DEPTH:
--        return s->depth;
-+        return ds_get_depth(s->vga.ds);
- 
-     case SVGA_REG_BITS_PER_PIXEL:
--        return (s->depth + 7) & ~7;
-+        return ds_get_bits_per_pixel(s->vga.ds);
- 
-     case SVGA_REG_PSEUDOCOLOR:
-         return 0x0;
- 
-     case SVGA_REG_RED_MASK:
--        return s->wred;
-+        return ds_get_rmask(s->vga.ds);
- 
-     case SVGA_REG_GREEN_MASK:
--        return s->wgreen;
-+        return ds_get_gmask(s->vga.ds);
- 
-     case SVGA_REG_BLUE_MASK:
--        return s->wblue;
-+        return ds_get_bmask(s->vga.ds);
- 
-     case SVGA_REG_BYTES_PER_LINE:
--        return s->bypp * s->new_width;
-+        return ds_get_bytes_per_pixel(s->vga.ds) * s->new_width;
- 
-     case SVGA_REG_FB_START: {
-         struct pci_vmsvga_state_s *pci_vmsvga
-@@ -806,7 +801,7 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
-         return s->cursor.on;
- 
-     case SVGA_REG_HOST_BITS_PER_PIXEL:
--        return (s->depth + 7) & ~7;
-+        return ds_get_bits_per_pixel(s->vga.ds);
- 
-     case SVGA_REG_SCRATCH_SIZE:
-         return s->scratch_size;
-@@ -869,7 +864,7 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
-         break;
- 
-     case SVGA_REG_BITS_PER_PIXEL:
--        if (value != s->depth) {
-+        if (value != ds_get_bits_per_pixel(s->vga.ds)) {
-             printf("%s: Bad bits per pixel: %i bits\n", __func__, value);
-             s->config = 0;
-         }
-@@ -1089,7 +1084,7 @@ static const VMStateDescription vmstate_vmware_vga_internal = {
-     .minimum_version_id_old = 0,
-     .post_load = vmsvga_post_load,
-     .fields      = (VMStateField[]) {
--        VMSTATE_INT32_EQUAL(depth, struct vmsvga_state_s),
-+        VMSTATE_UNUSED(4), /* was depth */
-         VMSTATE_INT32(enable, struct vmsvga_state_s),
-         VMSTATE_INT32(config, struct vmsvga_state_s),
-         VMSTATE_INT32(cursor.id, struct vmsvga_state_s),
-@@ -1142,13 +1137,6 @@ static void vmsvga_init(struct vmsvga_state_s *s,
-     vga_common_init(&s->vga);
-     vga_init(&s->vga, address_space, io, true);
-     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
--    /* Save some values here in case they are changed later.
--     * This is suspicious and needs more though why it is needed. */
--    s->depth = ds_get_bits_per_pixel(s->vga.ds);
--    s->bypp = ds_get_bytes_per_pixel(s->vga.ds);
--    s->wred = ds_get_rmask(s->vga.ds);
--    s->wgreen = ds_get_gmask(s->vga.ds);
--    s->wblue = ds_get_bmask(s->vga.ds);
- }
- 
- static uint64_t vmsvga_io_read(void *opaque, hwaddr addr, unsigned size)
--- 
-1.7.11.7
-
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5616a06..5d6f9ce 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -25,7 +25,6 @@ SRC_URI = "\
     file://fallback-to-safe-mmap_min_addr.patch \
     file://larger_default_ram_size.patch \
     file://arm-bgr.patch \
-    file://Revert-vmware_vga-Add-back-some-info-in-local-state-.patch \
     "
 
 SRC_URI_append_class-nativesdk = "\
-- 
1.7.10.4



