Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.13317.1599539311582549074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 21:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: Rxc58RfNr0WDP0M9bMdRltnhEoqrwK8rxJS4IHe3yRNyqg8WG7Gq4UQ5WWn74IRLsmnGyvIo1B
 Wh9vAUkQkvtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="242886517"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; 
   d="scan'208";a="242886517"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 21:28:29 -0700
IronPort-SDR: ZaMPVAKcjIzmfF6mFnhlOG4jYWREapcIRTDNl9cgSC1AnPtrLeJSsYpzD6GmA0KmfHykECuH1l
 v0RuJ9MeDcOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; 
   d="scan'208";a="343412052"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga007.jf.intel.com with ESMTP; 07 Sep 2020 21:28:28 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH v3] wic/bootimg-efi: IMAGE_EFI_BOOT_FILES variable added to separate bootimg-efi and bootimg-partition
Date: Tue,  8 Sep 2020 12:28:27 +0800
Message-Id: <1599539307-52761-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
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
 meta/classes/image_types_wic.bbclass          |  2 +-
 meta/lib/oeqa/selftest/cases/wic.py           | 12 +++++++++++-
 scripts/lib/wic/plugins/source/bootimg-efi.py |  8 ++++----
 3 files changed, 16 insertions(+), 6 deletions(-)

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
index e6b23c6..ac136bb 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -235,6 +235,16 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
 
+    def test_efi_bootpart(self):
+        """Test creation of efi-bootpart image"""
+        cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+        self.append_config('IMAGE_EFI_BOOT_FILES = "%s;kernel"\n' % kimgtype)
+        runCmd(cmd)
+        images = glob(self.resultdir + "mkefidisk-*.direct")
+        result = runCmd("wic ls %s:1/ -n %s " % (images[0], kimgtype))
+        self.assertIn('\nkernel         ',result.output)
+
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
@@ -689,7 +699,7 @@ class Wic2(WicTestCase):
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

