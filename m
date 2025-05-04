Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12201C3ABBC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:07:09 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.28299.1746364018885948097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=FM7FMD6i;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-2025050413065616808c3c863e8c5289-vaakzx@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025050413065616808c3c863e8c5289
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=j4dOpDBVpkcSN9Hk4grBhX6DHPfFL1IpG+In39BGjIM=;
 b=FM7FMD6ixR3ZybW+2nNVwcRKfsoEciuBx+r+HFo+2DpW1rcnoI8R2p0VIP5Frf6pi/C8pz
 sOu9pSLMUhfEnHq233p5Ep3YM4v6a6kNROqCGiAUda2nzjaDiC5kmb2g6LyuMmi/HI1adBwJ
 /Nh1dRMtp4XSWyJLYpi1pBLw+WJ2y3nHzL15BxA5Wed7ZH5pynGVoH0apa2bpBoMsRl0EAwC
 JJpfDN+gpTZs7m+DaSqe+wRoA7+R1kPLiknBqE9Xt19sIQbIt8a2H1QZw7/2t+nbc7eWnX7z
 6usVlp6nEqbpO/RF34TeGIwl9WGEfD1xbvh0nDN8qGuiE2QWJI+0g+eA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 11/20] oe-selftest: fitimage refactor kernel-fitimage.bbclass
Date: Sun,  4 May 2025 15:04:58 +0200
Message-ID: <20250504130507.717954-11-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215955

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Support that a recipe other than virtual/kernel provides the kernel FIT
image. Therefore
* Support building with either:
  - KERNEL_IMAGETYPES += " fitImage "
  - KERNEL_CLASSES = " kernel-fitimage "
  or
  - KERNEL_CLASSES = " kernel-uboot "
* allow to specify which recipe gets bitbaked.
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 55 +++++++++++++++---------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 7e81f155e7a..3a1d263eb9e 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -394,6 +394,7 @@ class KernelFitImageBase(FitImageTestCase):
             'INITRAMFS_IMAGE_BUNDLE',
             'INITRAMFS_IMAGE_NAME',
             'INITRAMFS_IMAGE',
+            'KERNEL_DEPLOYSUBDIR',
             'KERNEL_DEVICETREE',
             'KERNEL_FIT_LINK_NAME',
             'MACHINE',
@@ -410,10 +411,21 @@ class KernelFitImageBase(FitImageTestCase):
             'UBOOT_SIGN_KEYDIR',
             'UBOOT_SIGN_KEYNAME',
         }
-        bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/kernel")
+        bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), self.kernel_recipe)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
+    def _config_add_kernel_classes(self, config):
+        config += '# Use kernel-fitimage.bbclass for the creation of the fitImage' + os.linesep
+        config += 'KERNEL_IMAGETYPES += " fitImage "' + os.linesep
+        config += 'KERNEL_CLASSES = " kernel-fitimage "' + os.linesep
+        return config
+
+    @property
+    def kernel_recipe(self):
+        # virtual/kernel does not work with SRC_URI:append:pn-%s
+        return "linux-yocto"
+
     def _config_add_uboot_env(self, config):
         """Generate an u-boot environment
 
@@ -427,7 +439,7 @@ class KernelFitImageBase(FitImageTestCase):
         config += '# Add an u-boot script to the fitImage' + os.linesep
         config += 'FIT_UBOOT_ENV = "%s"' % fit_uenv_file + os.linesep
         config += 'FILESEXTRAPATHS:prepend := "${TOPDIR}/%s:"' % test_files_dir + os.linesep
-        config += 'SRC_URI:append:pn-linux-yocto = " file://${FIT_UBOOT_ENV}"' + os.linesep
+        config += 'SRC_URI:append:pn-%s = " file://${FIT_UBOOT_ENV}"' % self.kernel_recipe + os.linesep
 
         if not os.path.isdir(test_files_dir):
             os.makedirs(test_files_dir)
@@ -439,7 +451,7 @@ class KernelFitImageBase(FitImageTestCase):
 
     def _bitbake_fit_image(self, bb_vars):
         """Bitbake the kernel and return the paths to the its file and the FIT image"""
-        bitbake("virtual/kernel")
+        bitbake(self.kernel_recipe)
 
         # Find the right its file and the final fitImage and check if both files are available
         deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
@@ -458,8 +470,13 @@ class KernelFitImageBase(FitImageTestCase):
             fitimage_name = "fitImage"  # or fitImage-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
         else:
             self.fail('Invalid configuration: INITRAMFS_IMAGE_BUNDLE = "1" and not INITRAMFS_IMAGE')
-        fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_its_name))
-        fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_name))
+        kernel_deploysubdir = bb_vars['KERNEL_DEPLOYSUBDIR']
+        if kernel_deploysubdir:
+            fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, kernel_deploysubdir, fitimage_its_name))
+            fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, kernel_deploysubdir, fitimage_name))
+        else:
+            fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_its_name))
+            fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_name))
         return (fitimage_its_path, fitimage_path)
 
     def _get_req_its_paths(self, bb_vars):
@@ -701,10 +718,7 @@ class KernelFitImageTests(KernelFitImageBase):
         Author:      Usama Arif <usama.arif@arm.com>
         """
         config = """
-# Enable creation of fitImage
 KERNEL_IMAGETYPE = "Image"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
 
 # RAM disk variables including load address and entrypoint for kernel and RAM disk
 IMAGE_FSTYPES += "cpio.gz"
@@ -717,6 +731,7 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
 """
+        config = self._config_add_kernel_classes(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
@@ -732,11 +747,10 @@ FIT_DESC = "A model description"
         config = """
 # Enable creation of fitImage
 MACHINE = "beaglebone-yocto"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
 # Add a devicetree overlay which does not need kernel sources
 PREFERRED_PROVIDER_virtual/dtb = "bborg-relay-00a2"
 """
+        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -761,13 +775,12 @@ PREFERRED_PROVIDER_virtual/dtb = "bborg-relay-00a2"
         config = """
 # Enable creation of fitImage
 MACHINE = "beaglebone-yocto"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "dev"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
+        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -812,8 +825,6 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         config = """
 # Enable creation of fitImage
 MACHINE = "beaglebone-yocto"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
@@ -822,6 +833,7 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
+        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -848,8 +860,6 @@ MACHINE = "beaglebone-yocto"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
 UBOOT_MACHINE = "am335x_evm_defconfig"
-KERNEL_CLASSES = " kernel-fitimage "
-KERNEL_IMAGETYPES = "fitImage"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYNAME = "beaglebonekey"
 UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
@@ -868,6 +878,7 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
+        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -908,8 +919,6 @@ INITRAMFS_IMAGE_BUNDLE = "1"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
 UBOOT_MACHINE = "am335x_evm_defconfig"
-KERNEL_CLASSES = " kernel-fitimage "
-KERNEL_IMAGETYPES = "fitImage"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYNAME = "beaglebonekey"
 UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
@@ -926,11 +935,13 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
+        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
 
+
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
 
@@ -1071,6 +1082,8 @@ class FitImagePyTests(KernelFitImageBase):
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
 
+    BOOTLOADER_RECIPE = "virtual/bootloader"
+
     def _fit_get_bb_vars(self, additional_vars=[]):
         """Get bb_vars as needed by _test_sign_fit_image
 
@@ -1112,13 +1125,13 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_SIGN_KEYDIR',
             'UBOOT_SIGN_KEYNAME',
         }
-        bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/bootloader")
+        bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), UBootFitImageTests.BOOTLOADER_RECIPE)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
     def _bitbake_fit_image(self, bb_vars):
         """Bitbake the bootloader and return the paths to the its file and the FIT image"""
-        bitbake("virtual/bootloader")
+        bitbake(UBootFitImageTests.BOOTLOADER_RECIPE)
 
         deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
         machine = bb_vars['MACHINE']
@@ -1636,7 +1649,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         # Using a static key. FIT_GENERATE_KEYS = "1" does not work without kernel-fitimage.bbclass
         self._gen_signing_key(bb_vars)
 
-        bitbake("virtual/bootloader")
+        bitbake(UBootFitImageTests.BOOTLOADER_RECIPE)
 
         # Just check the DTB of u-boot since there is no u-boot FIT image
         self._check_kernel_dtb(bb_vars)
-- 
2.49.0


