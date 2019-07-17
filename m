Return-Path: <chee.yang.lee@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6678C7BD72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 02:02:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2019 19:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,272,1559545200"; d="scan'208";a="169430885"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 16 Jul 2019 19:02:43 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 10:02:42 +0800
Message-Id: <1563328962-14728-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: add support for kernel with initramfs bundled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jul 2019 02:02:43 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

when INITRAMFS_IMAGE_BUNDLE and INITRAMFS_IMAGE are set, wic should
look for kernel with initramfs image bundled.

Include required variable MACHINE, INITRAMFS_IMAGE_BUNDLE,
INITRAMFS_IMAGE, INITRAMFS_LINK_NAME and KERNEL_IMAGETYPE in WICVARS.
No longer require default value for variable kernel as KERNEL_IMAGETYPE
is not optional variable and included in WICVARS.
image_types_wic to inherit kernel-artifact-names to obtain default
INITRAMFS_LINK_NAME when INITRAMFS_IMAGE_BUNDLE are set.

update wic.Wic2.test_image_env test case to filter optional
variable INITRAMFS_LINK_NAME, INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/classes/image_types_wic.bbclass                 |  5 ++++-
 meta/lib/oeqa/selftest/cases/wic.py                  |  3 ++-
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 18 ++++++++++++------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     |  6 ++++--
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 19 +++++++++++++------
 5 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 5b40a9e..97d681b 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -3,7 +3,10 @@
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
+           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
+           KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME"
+
+inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index f1c6f39..c390749 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -499,7 +499,8 @@ class Wic2(WicTestCase):
         wicvars = set(bb_vars['WICVARS'].split())
         # filter out optional variables
         wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
-                                      'INITRD', 'INITRD_LIVE', 'ISODIR'))
+                                      'INITRD', 'INITRD_LIVE', 'ISODIR','INITRAMFS_IMAGE',
+                                      'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 5cc5c8a..2cfdc10 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -74,8 +74,10 @@ class BootimgEFIPlugin(SourcePlugin):
             grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
 
             kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-            if not kernel:
-                kernel = "bzImage"
+            if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+                if get_bitbake_var("INITRAMFS_IMAGE"):
+                    kernel = "%s-%s.bin" % \
+                        (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
             label = source_params.get('label')
             label_conf = "root=%s" % creator.rootdev
@@ -154,8 +156,10 @@ class BootimgEFIPlugin(SourcePlugin):
         if not custom_cfg:
             # Create systemd-boot configuration using parameters from wks file
             kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-            if not kernel:
-                kernel = "bzImage"
+            if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+                if get_bitbake_var("INITRAMFS_IMAGE"):
+                    kernel = "%s-%s.bin" % \
+                        (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
             title = source_params.get('title')
 
@@ -225,8 +229,10 @@ class BootimgEFIPlugin(SourcePlugin):
         hdddir = "%s/hdd/boot" % cr_workdir
 
         kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-        if not kernel:
-            kernel = "bzImage"
+        if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+            if get_bitbake_var("INITRAMFS_IMAGE"):
+                kernel = "%s-%s.bin" % \
+                    (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
         install_cmd = "install -m 0644 %s/%s %s/%s" % \
             (staging_kernel_dir, kernel, hdddir, kernel)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 670d347..f2639e7 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -150,8 +150,10 @@ class BootimgPcbiosPlugin(SourcePlugin):
         hdddir = "%s/hdd/boot" % cr_workdir
 
         kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-        if not kernel:
-            kernel = "bzImage"
+        if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+            if get_bitbake_var("INITRAMFS_IMAGE"):
+                kernel = "%s-%s.bin" % \
+                    (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
         cmds = ("install -m 0644 %s/%s %s/vmlinuz" %
                 (staging_kernel_dir, kernel, hdddir),
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 74d6f14..24299c1 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -71,8 +71,11 @@ class IsoImagePlugin(SourcePlugin):
         syslinux_conf += "LABEL boot\n"
 
         kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-        if not kernel:
-            kernel = "bzImage"
+        if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+            if get_bitbake_var("INITRAMFS_IMAGE"):
+                kernel = "%s-%s.bin" % \
+                    (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
+
         syslinux_conf += "KERNEL /" + kernel + "\n"
         syslinux_conf += "APPEND initrd=/initrd LABEL=boot %s\n" \
                              % bootloader.append
@@ -117,8 +120,10 @@ class IsoImagePlugin(SourcePlugin):
             grubefi_conf += "menuentry 'boot'{\n"
 
             kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-            if not kernel:
-                kernel = "bzImage"
+            if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+                if get_bitbake_var("INITRAMFS_IMAGE"):
+                    kernel = "%s-%s.bin" % \
+                        (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
             grubefi_conf += "linux /%s rootwait %s\n" \
                             % (kernel, bootloader.append)
@@ -273,8 +278,10 @@ class IsoImagePlugin(SourcePlugin):
             os.remove("%s/initrd.cpio.gz" % cr_workdir)
 
         kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-        if not kernel:
-            kernel = "bzImage"
+        if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+            if get_bitbake_var("INITRAMFS_IMAGE"):
+                kernel = "%s-%s.bin" % \
+                    (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
         install_cmd = "install -m 0644 %s/%s %s/%s" % \
                       (kernel_dir, kernel, isodir, kernel)
-- 
2.7.4


