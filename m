Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.57219.1600078101050498141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 03:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: VXTODGcPGOfKWYz1QqtJW0d6fpkvXVD3wJZIvJ+YsYB/29wpxlMo68xF+wq7pVDuOt0DFRFo+8
 ipBeZqVQ12TQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="156494961"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
   d="scan'208";a="156494961"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 03:08:20 -0700
IronPort-SDR: GfwZ+hkYoQ5RDSN9xrLXcLEB7ahxMkCerFWspTLrzAICOW+IqAYuBlj2eZpRGuugCGLulZkwC6
 Rp7vvcsnI8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
   d="scan'208";a="330671921"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2020 03:08:19 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH v4] wic/bootimg-efi: IMAGE_EFI_BOOT_FILES variable added to separate bootimg-efi and bootimg-partition
Date: Mon, 14 Sep 2020 18:08:18 +0800
Message-Id: <1600078098-80227-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

Due to recent changes in bootimg-efi to include IMAGE_BOOT_FILES,
when both bootimg-partition and bootimg-efi occur in a single .wks
and IMAGE_BOOT_FILES are defined, files listed in IMAGE_BOOT_FILES
will be duplicated in both partition.
Since IMAGE_BOOT_FILES are crucial for bootimg-partition, but
optional for bootimg-efi, hence allowing bootimg-efi to have the option
to ignore it.

The new variable, IMAGE_EFI_BOOT_FILES, was added to help handle this
issue. Its basic usage is the same as IMAGE_BOOT_FILES.
Usage example:
        ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img \

This commit is also squashed with the updated testcase to cover for
this change.

[YOCTO #14011]

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

---

v4: Added fix
sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
---
 meta/classes/image_types_wic.bbclass          |  2 +-
 meta/lib/oeqa/selftest/cases/wic.py           | 13 ++++++++++++-
 scripts/lib/wic/plugins/source/bootimg-efi.py |  8 ++++----
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 2a1feed..4f888ef 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -1,7 +1,7 @@
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
 WICVARS ?= "\
-           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
+           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_EFI_BOOT_FILES IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
            ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index e6b23c6..714637e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -235,6 +235,17 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
 
+    def test_efi_bootpart(self):
+        """Test creation of efi-bootpart image"""
+        cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+        self.append_config('IMAGE_EFI_BOOT_FILES = "%s;kernel"\n' % kimgtype)
+        runCmd(cmd)
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        images = glob(self.resultdir + "mkefidisk-*.direct")
+        result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))       
+        self.assertIn("kernel",result.output)
+
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
@@ -689,7 +700,7 @@ class Wic2(WicTestCase):
         wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
                                       'INITRD', 'INITRD_LIVE', 'ISODIR','INITRAMFS_IMAGE',
                                       'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME',
-                                      'APPEND'))
+                                      'APPEND', 'IMAGE_EFI_BOOT_FILES'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 14c1723..cdc7254 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -212,8 +212,8 @@ class BootimgEFIPlugin(SourcePlugin):
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified")
 
-        if get_bitbake_var("IMAGE_BOOT_FILES") is None:
-            logger.debug('No boot files defined in IMAGE_BOOT_FILES')
+        if get_bitbake_var("IMAGE_EFI_BOOT_FILES") is None:
+            logger.debug('No boot files defined in IMAGE_EFI_BOOT_FILES')
         else:
             boot_files = None
             for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), (None, None)):
@@ -222,7 +222,7 @@ class BootimgEFIPlugin(SourcePlugin):
                 else:
                     var = ""
 
-                boot_files = get_bitbake_var("IMAGE_BOOT_FILES" + var)
+                boot_files = get_bitbake_var("IMAGE_EFI_BOOT_FILES" + var)
                 if boot_files:
                     break
 
@@ -292,7 +292,7 @@ class BootimgEFIPlugin(SourcePlugin):
             (staging_kernel_dir, kernel, hdddir, kernel)
         exec_cmd(install_cmd)
 
-        if get_bitbake_var("IMAGE_BOOT_FILES"):
+        if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
                 install_cmd = "install -m 0644 -D %s %s" \
                               % (os.path.join(kernel_dir, src_path),
-- 
2.7.4

