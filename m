Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716F2CCD1A5
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 16:44:57 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.57.1760892291189754830
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 09:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=W1smaOdd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2025101916444707df7ac764000207b3-cqtk5m@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025101916444707df7ac764000207b3
        for <openembedded-core@lists.openembedded.org>;
        Sun, 19 Oct 2025 18:44:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3HrCOQJIJg93vLuOh4QA3xk9dLf7sAwE0h5lyMUMi98=;
 b=W1smaOddXwm3WXc8m0t3P/Jg+dE9qyI633/k9Cavwq3W2pAZF6Xmyszs/N3GuYKqlGoOPC
 m7ySwQCtmMguAVL3e8IfZmOwAeFI8lPTG/udrIkY1xSn9bW29H1cdNYP8pvqqRn9t/PRxRMW
 O7SsaqWP6qLc32nPPXtcixq3uNQPxykv9c4IesnDxUrzWz2qVCgb1vImJ777TBoTDnpOrDkP
 FmH/Ln3HwpcHB1IBxx05UvOEjwy6yDf4Lz0fNrcOUVBZiJVzc4lc7Dw4ZlFXX4/J1FufRNLs
 KngXrHe1B4kFrr49Iz8HtZybvXHvM+7HDaBOUMJQbnsvOObgH+ctmHtA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: kavinaya@qti.qualcomm.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] oe-selftest: fitimage: test FIT image with/without kernel node
Date: Sun, 19 Oct 2025 18:44:12 +0200
Message-ID: <20251019164435.3794482-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251019164435.3794482-1-adrian.freihofer@siemens.com>
References: <20251019164435.3794482-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 16:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225085

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add test coverage for the feature added with commit
oe-selftest: fitimage: add FIT_LINUX_BIN to control kernel node creation
which adds support for FIT images without a kernel node when
FIT_LINUX_BIN is set to an empty string.

Extend the functions _get_req_its_paths to return also a list of
not expected paths in the ITS file to verify that no kernel node is
created when FIT_LINUX_BIN = "".

This also adds some basic test coverage for the configuration nodes in
the ITS file.

Minor cleanups:
- Remove unused import of tempfile module.
- Print the configuration for the fitimage.FitImagePyTests when
  overrides are provided.
- Remove empty line at the end of the file.
- Sort the list of bb_vars keys in _test_fitimage_py().

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 133 +++++++++++++++++------
 1 file changed, 99 insertions(+), 34 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 9c2e10dd2bf..4dd577097a6 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -9,7 +9,6 @@ import re
 import shlex
 import logging
 import pprint
-import tempfile
 
 import oe.fitimage
 
@@ -47,10 +46,11 @@ class FitImageTestCase(OESelftestTestCase):
         # Check if the its file contains the expected paths and attributes.
         # The _get_req_* functions are implemented by more specific chield classes.
         self._check_its_file()
-            req_its_paths = self._get_req_its_paths()
+            req_its_paths, not_req_its_paths = self._get_req_its_paths()
             req_sigvalues_config = self._get_req_sigvalues_config()
             req_sigvalues_image = self._get_req_sigvalues_image()
-            # Compare the its file against req_its_paths, req_sigvalues_config, req_sigvalues_image
+            # Compare the its file against req_its_paths, not_req_its_paths,
+            #                              req_sigvalues_config, req_sigvalues_image
 
         # Call the dumpimage utiliy and check that it prints all the expected paths and attributes
         # The _get_req_* functions are implemented by more specific chield classes.
@@ -198,7 +198,7 @@ class FitImageTestCase(OESelftestTestCase):
         # Support only the test recipe which provides 1 devicetree and 1 devicetree overlay
         pref_prov_dtb = bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
         if pref_prov_dtb == "bbb-dtbs-as-ext":
-            all_dtbs += ["am335x-bonegreen-ext.dtb", "BBORG_RELAY-00A2.dtbo"]
+            all_dtbs += ["BBORG_RELAY-00A2.dtbo", "am335x-bonegreen-ext.dtb"]
             dtb_symlinks.append("am335x-bonegreen-ext-alias.dtb")
         return (all_dtbs, dtb_symlinks)
 
@@ -234,8 +234,9 @@ class FitImageTestCase(OESelftestTestCase):
                 self.logger.debug("its file: %s" % its_file.read())
 
         # Generate a list of expected paths in the its file
-        req_its_paths = self._get_req_its_paths(bb_vars)
+        req_its_paths, not_req_its_paths = self._get_req_its_paths(bb_vars)
         self.logger.debug("req_its_paths:\n%s\n" % pprint.pformat(req_its_paths, indent=4))
+        self.logger.debug("not_req_its_paths:\n%s\n" % pprint.pformat(not_req_its_paths, indent=4))
 
         # Generate a dict of expected configuration signature nodes
         req_sigvalues_config = self._get_req_sigvalues_config(bb_vars)
@@ -275,6 +276,11 @@ class FitImageTestCase(OESelftestTestCase):
             if not req_path in its_paths:
                 self.fail('Missing path in its file: %s (%s)' % (req_path, its_file_path))
 
+        # check if all not expected paths are absent in the its file
+        for not_req_path in not_req_its_paths:
+            if not_req_path in its_paths:
+                self.fail('Unexpected path found in its file: %s (%s)' % (not_req_path, its_file_path))
+
         # Check if all the expected singnature nodes (images and configurations) are found
         self.logger.debug("sigs:\n%s\n" % pprint.pformat(sigs, indent=4))
         if req_sigvalues_config or req_sigvalues_image:
@@ -353,7 +359,7 @@ class FitImageTestCase(OESelftestTestCase):
 
     def _get_req_its_paths(self, bb_vars):
         self.logger.error("This function needs to be implemented")
-        return []
+        return ([], [])
 
     def _get_req_its_fields(self, bb_vars):
         self.logger.error("This function needs to be implemented")
@@ -409,6 +415,7 @@ class KernelFitImageBase(FitImageTestCase):
             'FIT_DESC',
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
+            'FIT_LINUX_BIN',
             'FIT_SIGN_ALG',
             'FIT_SIGN_INDIVIDUAL',
             'FIT_UBOOT_ENV',
@@ -499,7 +506,7 @@ class KernelFitImageBase(FitImageTestCase):
         return (fitimage_its_path, fitimage_path)
 
     def _get_req_its_paths(self, bb_vars):
-        """Generate a list of expected paths in the its file
+        """Generate a list of expected and a list of not expected paths in the its file
 
         Example:
             [
@@ -508,6 +515,7 @@ class KernelFitImageBase(FitImageTestCase):
             ]
         """
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        fit_linux_bin = bb_vars['FIT_LINUX_BIN']
         fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
@@ -515,15 +523,30 @@ class KernelFitImageBase(FitImageTestCase):
         uboot_sign_enable = bb_vars.get('UBOOT_SIGN_ENABLE')
 
         # image nodes
-        images = [ 'kernel-1' ]
+        images = []
+        not_images = []
+        if fit_linux_bin:
+            images += [ 'kernel-1' ]
+        else:
+            not_images += [ 'kernel-1' ]
+
         if dtb_files:
             images += [ 'fdt-' + dtb for dtb in dtb_files ]
+
         if fit_uboot_env:
             images.append('bootscr-' + fit_uboot_env)
+        else:
+            not_images.append('bootscr-boot.cmd')
+
         if bb_vars['MACHINE'] == "qemux86-64": # Not really the right if
             images.append('setup-1')
+        else:
+            not_images.append('setup-1')
+
         if initramfs_image and initramfs_image_bundle != "1":
             images.append('ramdisk-1')
+        else:
+            not_images.append('ramdisk-1')
 
         # configuration nodes (one per DTB and also one per symlink)
         if dtb_files:
@@ -541,25 +564,36 @@ class KernelFitImageBase(FitImageTestCase):
             req_its_paths.append(['/', 'configurations', configuration, 'hash-1'])
             if uboot_sign_enable == "1":
                 req_its_paths.append(['/', 'configurations', configuration, 'signature-1'])
-        return req_its_paths
+
+        not_req_its_paths = []
+        for image in not_images:
+            not_req_its_paths.append(['/', 'images', image])
+
+        return (req_its_paths, not_req_its_paths)
 
     def _get_req_its_fields(self, bb_vars):
+        fit_linux_bin = bb_vars['FIT_LINUX_BIN']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
         initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
         uboot_rd_loadaddress = bb_vars.get('UBOOT_RD_LOADADDRESS')
         uboot_rd_entrypoint = bb_vars.get('UBOOT_RD_ENTRYPOINT')
 
         its_field_check = [
-            'description = "%s";' % bb_vars['FIT_DESC'],
-            'description = "Linux kernel";',
-            'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
-            # 'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";', defined based on files in TMPDIR, not ideal...
-            'data = /incbin/("linux.bin");',
-            'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
-            'os = "linux";',
-            'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
-            'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
+            'description = "%s";' % bb_vars['FIT_DESC']
         ]
+
+        if fit_linux_bin:
+            its_field_check += [
+                'description = "Linux kernel";',
+                'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
+                # 'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";', defined based on files in TMPDIR, not ideal...
+                'data = /incbin/("%s");' % fit_linux_bin,
+                'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
+                'os = "linux";',
+                'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
+                'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
+            ]
+
         if initramfs_image and initramfs_image_bundle != "1":
             its_field_check.append('type = "ramdisk";')
             if uboot_rd_loadaddress:
@@ -572,10 +606,26 @@ class KernelFitImageBase(FitImageTestCase):
             fit_conf_prefix = bb_vars.get('FIT_CONF_PREFIX', "conf-")
             its_field_check.append('default = "' + fit_conf_prefix + fit_conf_default_dtb + '";')
 
-        its_field_check.append('kernel = "kernel-1";')
+        # configuration nodes (one per DTB and also one per symlink)
+        dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        if dtb_files:
+            for dtb in dtb_files:
+                if fit_linux_bin:
+                    its_field_check.append('kernel = "kernel-1";')
+                its_field_check.append('fdt = "fdt-%s";' % dtb)
+            for dtb in dtb_symlinks:
+                if fit_linux_bin:
+                    its_field_check.append('kernel = "kernel-1";')
+                # Works only for tests were the symlink is with -alias suffix
+                its_field_check.append('fdt = "fdt-%s";' % dtb.replace('-alias', ''))
 
-        if initramfs_image and initramfs_image_bundle != "1":
-            its_field_check.append('ramdisk = "ramdisk-1";')
+            if initramfs_image and initramfs_image_bundle != "1":
+                its_field_check.append('ramdisk = "ramdisk-1";')
+        else:
+            if fit_linux_bin:
+                its_field_check.append('kernel = "kernel-1";')
+            if initramfs_image and initramfs_image_bundle != "1":
+                its_field_check.append('ramdisk = "ramdisk-1";')
 
         return its_field_check
 
@@ -1032,20 +1082,21 @@ class FitImagePyTests(KernelFitImageBase):
         # Provide variables without calling bitbake
         bb_vars = {
             # image-fitimage.conf
+            'FIT_ADDRESS_CELLS': "1",
+            'FIT_CONF_DEFAULT_DTB': "",
+            'FIT_CONF_PREFIX': "conf-",
             'FIT_DESC': "Kernel fitImage for a dummy distro",
-            'FIT_HASH_ALG': "sha256",
-            'FIT_SIGN_ALG': "rsa2048",
-            'FIT_PAD_ALG': "pkcs-1.5",
             'FIT_GENERATE_KEYS': "0",
-            'FIT_SIGN_NUMBITS': "2048",
+            'FIT_HASH_ALG': "sha256",
             'FIT_KEY_GENRSA_ARGS': "-F4",
             'FIT_KEY_REQ_ARGS': "-batch -new",
             'FIT_KEY_SIGN_PKCS': "-x509",
+            'FIT_LINUX_BIN': "linux.bin",
+            'FIT_PAD_ALG': "pkcs-1.5",
+            'FIT_SIGN_ALG': "rsa2048",
             'FIT_SIGN_INDIVIDUAL': "0",
-            'FIT_CONF_PREFIX': "conf-",
+            'FIT_SIGN_NUMBITS': "2048",
             'FIT_SUPPORTED_INITRAMFS_FSTYPES': "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio",
-            'FIT_CONF_DEFAULT_DTB': "",
-            'FIT_ADDRESS_CELLS': "1",
             'FIT_UBOOT_ENV': "",
             # kernel.bbclass
             'UBOOT_ENTRYPOINT': "0x20008000",
@@ -1072,6 +1123,9 @@ class FitImagePyTests(KernelFitImageBase):
         }
         if bb_vars_overrides:
             bb_vars.update(bb_vars_overrides)
+            if logging.DEBUG >= self.logger.level:
+                debug_output = "\n".join([f"{key} = {value}" for key, value in bb_vars_overrides.items()])
+                self.logger.debug("bb_vars overrides:\n%s" % debug_output)
 
         root_node = oe.fitimage.ItsNodeRootKernel(
             bb_vars["FIT_DESC"], bb_vars["FIT_ADDRESS_CELLS"],
@@ -1084,10 +1138,12 @@ class FitImagePyTests(KernelFitImageBase):
             oe.types.boolean(bb_vars['FIT_SIGN_INDIVIDUAL']), bb_vars['UBOOT_SIGN_IMG_KEYNAME']
         )
 
-        root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", "none",
-            bb_vars.get('UBOOT_LOADADDRESS'), bb_vars.get('UBOOT_ENTRYPOINT'),
-            bb_vars.get('UBOOT_MKIMAGE_KERNEL_TYPE'), bb_vars.get("UBOOT_ENTRYSYMBOL")
-        )
+        if bb_vars['FIT_LINUX_BIN']:
+            root_node.fitimage_emit_section_kernel(
+                "kernel-1", bb_vars['FIT_LINUX_BIN'], "none",
+                bb_vars.get('UBOOT_LOADADDRESS'), bb_vars.get('UBOOT_ENTRYPOINT'),
+                bb_vars.get('UBOOT_MKIMAGE_KERNEL_TYPE'), bb_vars.get("UBOOT_ENTRYSYMBOL")
+            )
 
         dtb_files, _ = FitImageTestCase._get_dtb_files(bb_vars)
         for dtb in dtb_files:
@@ -1123,6 +1179,15 @@ class FitImagePyTests(KernelFitImageBase):
         }
         self._test_fitimage_py(bb_vars_overrides)
 
+    def test_fitimage_py_no_kernel(self):
+        """Test FIT_LINUX_BIN is empty
+
+        Verify there is no kernel node created in the ITS file if FIT_LINUX_BIN = "".
+        """
+        bb_vars_overrides = {
+            'FIT_LINUX_BIN': "",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
 
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
@@ -1140,6 +1205,7 @@ class UBootFitImageTests(FitImageTestCase):
             'FIT_KEY_GENRSA_ARGS',
             'FIT_KEY_REQ_ARGS',
             'FIT_KEY_SIGN_PKCS',
+            'FIT_LINUX_BIN',
             'FIT_SIGN_ALG',
             'FIT_SIGN_INDIVIDUAL',
             'FIT_SIGN_NUMBITS',
@@ -1204,7 +1270,7 @@ class UBootFitImageTests(FitImageTestCase):
                 req_its_paths.append(['/', 'images', image, 'signature'])
         for configuration in configurations:
             req_its_paths.append(['/', 'configurations', configuration])
-        return req_its_paths
+        return (req_its_paths, [])
 
     def _get_req_its_fields(self, bb_vars):
         loadables = ["uboot"]
@@ -1730,4 +1796,3 @@ UBOOT_FIT_GENERATE_KEYS = "1"
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
-
-- 
2.51.0


