Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AE4CCF9EC
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:58:14 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.2561.1761598691566524256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=BgM8chOi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202510272058096fb4552b190002071a-2fg_qa@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202510272058096fb4552b190002071a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 21:58:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=H4dEnSxmR1ZqGqQOvNilpaqLwMaRmTMu0mLPH6ftpmg=;
 b=BgM8chOiZ3ZG6BtYe6HwCsc7MbM9brRuEKuuPtDpqp95xi227Vf13BCbnG4eWTDuHkFCvc
 km0wXarK1P62usn0Os+PcEOjwCzXI9iRz4OIbONVYrAAbp+v+4x/n95gxl12iISggh1vYPzI
 72WhaQ5hjcG34NQW3moEQYaQT7n8eNY04c19MSdFKI/5Y5PgbLGp5LLSyNXhUT34xrvbwbDs
 4HvG7opajix0zk6xbWHHgg0y49578Fw8Cjy55S2RTlgiboqNqQRwVIqCyf2Nua/J4bWfxigF
 pXheVjLmdyxajDDYJ+ko02jf1TjFN0pj3h8BJ2yfaoOOyUqL6xB592QA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: kavinaya@qti.qualcomm.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] oe-selftest: fitimage: test absent optional nodes in ITS files
Date: Mon, 27 Oct 2025 21:56:49 +0100
Message-ID: <20251027205741.2452251-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251027205741.2452251-1-adrian.freihofer@siemens.com>
References: <20251027205741.2452251-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 20:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225361

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend the test framework to verify that certain optional nodes are properly
absent from ITS files based on configuration. The _get_req_its_paths()
method now returns a tuple containing both expected and not-expected
paths, enabling negative testing of conditional components.

Test improvements:
- Add verification for absent bootscr, setup, and ramdisk image nodes
  when their respective features are disabled
- Extend configuration node testing with proper kernel/fdt/ramdisk
  field validation based on device tree and initramfs settings

Code cleanup:
- Remove unused tempfile module import
- Sort bb_vars keys alphabetically in _test_fitimage_py()
- Add debug output for bb_vars overrides when debug logging is enabled
- Remove trailing empty line
- Fix DTB file ordering for consistent test results

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 80 +++++++++++++++++-------
 1 file changed, 59 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 9c2e10dd2bf..8df5e92a34e 100644
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
@@ -499,7 +505,7 @@ class KernelFitImageBase(FitImageTestCase):
         return (fitimage_its_path, fitimage_path)
 
     def _get_req_its_paths(self, bb_vars):
-        """Generate a list of expected paths in the its file
+        """Generate a list of expected and a list of not expected paths in the its file
 
         Example:
             [
@@ -515,15 +521,26 @@ class KernelFitImageBase(FitImageTestCase):
         uboot_sign_enable = bb_vars.get('UBOOT_SIGN_ENABLE')
 
         # image nodes
-        images = [ 'kernel-1' ]
+        images = ['kernel-1']
+        not_images = []
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
@@ -541,7 +558,12 @@ class KernelFitImageBase(FitImageTestCase):
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
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
@@ -572,10 +594,23 @@ class KernelFitImageBase(FitImageTestCase):
             fit_conf_prefix = bb_vars.get('FIT_CONF_PREFIX', "conf-")
             its_field_check.append('default = "' + fit_conf_prefix + fit_conf_default_dtb + '";')
 
-        its_field_check.append('kernel = "kernel-1";')
+        # configuration nodes (one per DTB and also one per symlink)
+        dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        if dtb_files:
+            for dtb in dtb_files:
+                its_field_check.append('kernel = "kernel-1";')
+                its_field_check.append('fdt = "fdt-%s";' % dtb)
+            for dtb in dtb_symlinks:
+                its_field_check.append('kernel = "kernel-1";')
+                # Works only for tests were the symlink is with -alias suffix
+                its_field_check.append('fdt = "fdt-%s";' % dtb.replace('-alias', ''))
 
-        if initramfs_image and initramfs_image_bundle != "1":
-            its_field_check.append('ramdisk = "ramdisk-1";')
+            if initramfs_image and initramfs_image_bundle != "1":
+                its_field_check.append('ramdisk = "ramdisk-1";')
+        else:
+            its_field_check.append('kernel = "kernel-1";')
+            if initramfs_image and initramfs_image_bundle != "1":
+                its_field_check.append('ramdisk = "ramdisk-1";')
 
         return its_field_check
 
@@ -1032,20 +1067,21 @@ class FitImagePyTests(KernelFitImageBase):
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
@@ -1072,6 +1108,9 @@ class FitImagePyTests(KernelFitImageBase):
         }
         if bb_vars_overrides:
             bb_vars.update(bb_vars_overrides)
+            if logging.DEBUG >= self.logger.level:
+                debug_output = "\n".join([f"{key} = {value}" for key, value in bb_vars_overrides.items()])
+                self.logger.debug("bb_vars overrides:\n%s" % debug_output)
 
         root_node = oe.fitimage.ItsNodeRootKernel(
             bb_vars["FIT_DESC"], bb_vars["FIT_ADDRESS_CELLS"],
@@ -1204,7 +1243,7 @@ class UBootFitImageTests(FitImageTestCase):
                 req_its_paths.append(['/', 'images', image, 'signature'])
         for configuration in configurations:
             req_its_paths.append(['/', 'configurations', configuration])
-        return req_its_paths
+        return (req_its_paths, [])
 
     def _get_req_its_fields(self, bb_vars):
         loadables = ["uboot"]
@@ -1730,4 +1769,3 @@ UBOOT_FIT_GENERATE_KEYS = "1"
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
-
-- 
2.51.0


