Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.7711.1598427963920826990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 00:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: gEL8ixdW2GlqSwtXmtNK1vLxu5CQ782sRtCzajn2bljXTlZbwLRbCleUXO+juykbKiOLNeln7t
 5/pSRrjsYHUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157288919"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="157288919"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 00:46:02 -0700
IronPort-SDR: B+2NMSkQU/qICCURMWZUAt89Kuj7NIwwT653LXVF+IEQEoIaWZOBc/R/j7LgcoAy96+ldzcLz9
 lAh9WT4XBIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="402991998"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2020 00:46:01 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.e.witt@linux.intel.com
Subject: [PATCH] wic/bootimg-efi: IMAGE_EFI_BOOT_FILES variable added to separate bootimg-efi and bootimg-partition
Date: Wed, 26 Aug 2020 15:45:59 +0800
Message-Id: <1598427959-10736-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

Due to recent changes in bootimg-efi to include IMAGE_BOOT_FILES,
when both bootimg-partition and bootimg-efi occur in a single .wks
and IMAGE_BOOT_FILES are defined, files listed in IMAGE_BOOT_FILES
will be duplicated in both partition.
Since IMAGE_BOOT_FILES are crucial for bootimg-partition, but
optional for bootimg-efi, hence allowing bootimg-efi to have the option
to ignore it.

Added a new variable, IMAGE_EFI_BOOT_FILES, to handle this
issue. Its basic usage is the same as IMAGE_BOOT_FILES.
Usage example:
        IMAGE_EFI_BOOT_FILES = "u-boot.img uImage;kernel"
        IMAGE_EFI_BOOT_FILES = "u-boot.${UBOOT_SUFFIX} ${KERNEL_IMAGETYPE}"

This commit is also squashed with the updated testcase to cover for this change.

[YOCTO #14011]

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 meta/classes/image_types_wic.bbclass          |  2 +-
 meta/lib/oeqa/selftest/cases/wic.py           | 10 +++++++++-
 scripts/lib/wic/plugins/source/bootimg-efi.py |  8 ++++----
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 7b1db50..def44bb 100644
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
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND"
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index e6b23c6..1149ae0 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -235,6 +235,14 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
 
+    def test_efi_bootpart(self):
+        """Test creation of efi-bootpart image"""
+        cmd = "wic create efi-bootpart -e core-image-minimal -o %s" % self.resultdir
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+        self.write_config('IMAGE_EFI_BOOT_FILES = "%s"\n' % kimgtype)
+        runCmd(cmd)
+        self.assertEqual(1, len(glob(self.resultdir + "efi-bootpart-*direct")))
+
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
@@ -689,7 +697,7 @@ class Wic2(WicTestCase):
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

