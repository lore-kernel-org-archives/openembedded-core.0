Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C79BC54E93
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:09:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.48710.1747652938269988406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Inv0lSp1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250519110856e47410f66fdee377c8-7nnshp@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250519110856e47410f66fdee377c8
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 May 2025 13:08:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2S4vWSQgMdKDL+vk9HmdqEoJDGHgtFghCsIH+t2ZJRc=;
 b=Inv0lSp1yDFpnEe9SXLxzj5rQv0DPt6XdArbXK/c6B6AsTWcOMeVFLOMPm/6oSEZQdfjW2
 c5KlLJpdXc3TxtL1Y+dpDO/c5pkGeudHVhTic9/Sy9zBlFQAExnGb5cMC7pfG/jP4p+zMtQi
 kppemOHIDBcw7Y91qEKUkkLP2zjaCwAViQJ5bXyP2zTGeQFqLTcDhbkWpIHkS1Y8qwzaLyX0
 T4HaXLxZE0q+2hMBAynE3CuNtp0G0WHDh8dyLCqQGCa8HZOKu05+fF27cEAqEmG3amDJtEk1
 a2FrntvlWxArov5XVxtjH1b3c9fwDOt6VFipVpoCDjFf15hBVip6sC4A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 10/16] oe-selftest: fitimage support new FIT recipe as well
Date: Mon, 19 May 2025 13:07:54 +0200
Message-ID: <20250519110838.82978-11-adrian.freihofer@siemens.com>
In-Reply-To: <20250519110838.82978-1-adrian.freihofer@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216842

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Enable all existing tests to be compatible with FIT images generated
either by the new linux-yocto-fitimage recipe or the legacy
kernel-fitimage.bbclass approach.

- Make the following configurations optional:
  - KERNEL_IMAGETYPES += "fitImage"
  - KERNEL_CLASSES = "kernel-fitimage"
- Allow the tests to specify which kernel recipe should be used for the
  build (e.g., linux-yocto, linux-yocto-fitimage, etc.)
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 58 +++++++++++++++---------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index d9d1211b074..693d48644af 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -428,6 +428,7 @@ class KernelFitImageBase(FitImageTestCase):
             'INITRAMFS_IMAGE_BUNDLE',
             'INITRAMFS_IMAGE_NAME',
             'INITRAMFS_IMAGE',
+            'KERNEL_DEPLOYSUBDIR',
             'KERNEL_DEVICETREE',
             'KERNEL_FIT_LINK_NAME',
             'MACHINE',
@@ -444,10 +445,21 @@ class KernelFitImageBase(FitImageTestCase):
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
 
@@ -461,7 +473,7 @@ class KernelFitImageBase(FitImageTestCase):
         config += '# Add an u-boot script to the fitImage' + os.linesep
         config += 'FIT_UBOOT_ENV = "%s"' % fit_uenv_file + os.linesep
         config += 'FILESEXTRAPATHS:prepend := "${TOPDIR}/%s:"' % test_files_dir + os.linesep
-        config += 'SRC_URI:append:pn-linux-yocto = " file://${FIT_UBOOT_ENV}"' + os.linesep
+        config += 'SRC_URI:append:pn-%s = " file://${FIT_UBOOT_ENV}"' % self.kernel_recipe + os.linesep
 
         if not os.path.isdir(test_files_dir):
             os.makedirs(test_files_dir)
@@ -473,7 +485,7 @@ class KernelFitImageBase(FitImageTestCase):
 
     def _bitbake_fit_image(self, bb_vars):
         """Bitbake the kernel and return the paths to the its file and the FIT image"""
-        bitbake("virtual/kernel")
+        bitbake(self.kernel_recipe)
 
         # Find the right its file and the final fitImage and check if both files are available
         deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
@@ -492,8 +504,13 @@ class KernelFitImageBase(FitImageTestCase):
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
@@ -683,6 +700,7 @@ class KernelFitImageBase(FitImageTestCase):
         uboot_sign_keyname = bb_vars['UBOOT_SIGN_KEYNAME']
         uboot_sign_img_keyname = bb_vars['UBOOT_SIGN_IMG_KEYNAME']
         deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
+        kernel_deploysubdir = bb_vars['KERNEL_DEPLOYSUBDIR']
         fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
         fit_hash_alg_len = FitImageTestCase.MKIMAGE_HASH_LENGTHS[fit_hash_alg]
         fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[fit_sign_alg]
@@ -696,6 +714,8 @@ class KernelFitImageBase(FitImageTestCase):
                 self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
                 dtb_file_name = section.replace('conf-', '')
                 dtb_path = os.path.join(deploy_dir_image, dtb_file_name)
+                if kernel_deploysubdir:
+                    dtb_path = os.path.join(deploy_dir_image, kernel_deploysubdir, dtb_file_name)
                 # External devicetrees created by devicetree.bbclass are in a subfolder and have priority
                 dtb_path_ext = os.path.join(deploy_dir_image, "devicetree", dtb_file_name)
                 if os.path.exists(dtb_path_ext):
@@ -741,10 +761,7 @@ class KernelFitImageTests(KernelFitImageBase):
         Author:      Usama Arif <usama.arif@arm.com>
         """
         config = """
-# Enable creation of fitImage
 KERNEL_IMAGETYPE = "Image"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
 
 # RAM disk variables including load address and entrypoint for kernel and RAM disk
 IMAGE_FSTYPES += "cpio.gz"
@@ -757,6 +774,7 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
 """
+        config = self._config_add_kernel_classes(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
@@ -772,11 +790,10 @@ FIT_DESC = "A model description"
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
@@ -801,13 +818,12 @@ PREFERRED_PROVIDER_virtual/dtb = "bborg-relay-00a2"
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
 
@@ -852,8 +868,6 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         config = """
 # Enable creation of fitImage
 MACHINE = "beaglebone-yocto"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
@@ -862,6 +876,7 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
+        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -888,8 +903,6 @@ MACHINE = "beaglebone-yocto"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
 UBOOT_MACHINE = "am335x_evm_defconfig"
-KERNEL_CLASSES = " kernel-fitimage "
-KERNEL_IMAGETYPES = "fitImage"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYNAME = "beaglebonekey"
 UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
@@ -908,6 +921,7 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
+        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -948,8 +962,6 @@ INITRAMFS_IMAGE_BUNDLE = "1"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
 UBOOT_MACHINE = "am335x_evm_defconfig"
-KERNEL_CLASSES = " kernel-fitimage "
-KERNEL_IMAGETYPES = "fitImage"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYNAME = "beaglebonekey"
 UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
@@ -966,11 +978,13 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
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
 
@@ -1069,6 +1083,8 @@ class FitImagePyTests(KernelFitImageBase):
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
 
+    BOOTLOADER_RECIPE = "virtual/bootloader"
+
     def _fit_get_bb_vars(self, additional_vars=[]):
         """Get bb_vars as needed by _test_sign_fit_image
 
@@ -1110,13 +1126,13 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -1634,7 +1650,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         # Using a static key. FIT_GENERATE_KEYS = "1" does not work without kernel-fitimage.bbclass
         self._gen_signing_key(bb_vars)
 
-        bitbake("virtual/bootloader")
+        bitbake(UBootFitImageTests.BOOTLOADER_RECIPE)
 
         # Just check the DTB of u-boot since there is no u-boot FIT image
         self._check_kernel_dtb(bb_vars)
-- 
2.49.0


