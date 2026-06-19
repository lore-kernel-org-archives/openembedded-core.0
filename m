Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236C6CD98FA
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 11:21:10 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40123.1781868063131051823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 04:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=C4WSbIlv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260619112053f74d379549000207d9-jhzaqr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260619112053f74d379549000207d9
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Jun 2026 13:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KWLVdB2pxpWz1dj74OFelFt8BgoEGTwn1EncRFukzCo=;
 b=C4WSbIlvFYFaSso1sUetuHOEmGGqAcubLRTgoHhbgb+aEPhZ3ssOyYjVlF9H+n/LGDSny0
 hNtpWzg5zCHGDKe3NNXVNOkcxu7+uwU/3RH/483i6PCgWZdkN9vANOnoMV5+kv8Td9r8uc7R
 RFjCIuX+GzLqMM442Wd5RaRggwbTfNGtmcZ93vC933mUjBZLdq9dRe04Z/BUxHysY3SH0Ijz
 6XtTyf9ngsxNo/ezeAZMqlrHAU4Mp3tKx+bgbNXMWDhgohcGp3cgOFRCIaPrlmwhhP0WjAhr
 kwS+WCUgUyLQj+fw8CzsoXsz72NQ4XYxRxemX5+IvMCuLV0D/45YMx9Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 4/6] oe-selftest: fitimage: replace MACHINE==qemux86-64 guards with KERNEL_SETUP_BIN
Date: Fri, 19 Jun 2026 13:17:12 +0200
Message-ID: <20260619112046.125876-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260619112046.125876-1-adrian.freihofer@siemens.com>
References: <20260619112046.125876-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239166

From: Adrian Freihofer <adrian.freihofer@siemens.com>

On x86, the kernel build produces setup.bin which is packed as a separate
section in the FIT image. The existing code used MACHINE == "qemux86-64"
as a proxy to detect this, which is fragile and non-composable.

Replace all such guards with a KERNEL_SETUP_BIN variable that is set to
the filename ("setup.bin") when the artifact is present, or left empty
otherwise.

Also fix the signing verification helpers for machines without DTBs
(e.g. qemux86-64 that uses conf-1 instead of conf-<dtb>.dtb):

- _get_req_sigvalues_config(): make "fdt" conditional in sign-images;
  x86 FIT images have no DTB sections, so the ITS only signs "kernel".
- _check_signing(): when conf-1 has no matching DTB filename, fall back
  to UBOOT_DTB_IMAGE as the key-holding DTB for fit_check_sign; if that
  is also absent, skip the cryptographic check and log a debug message.
- _fit_get_bb_vars(): fetch UBOOT_DTB_IMAGE needed by the above.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 76 ++++++++++++++++++++----
 1 file changed, 64 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3a2ba2208d..57bff2e4c6 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -509,6 +509,7 @@ class KernelFitImageBase(FitImageTestCase):
             'UBOOT_SIGN_IMG_KEYNAME',
             'UBOOT_SIGN_KEYDIR',
             'UBOOT_SIGN_KEYNAME',
+            'UBOOT_DTB_IMAGE',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), self.kernel_recipe)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
@@ -571,9 +572,21 @@ class KernelFitImageBase(FitImageTestCase):
         if kernel_deploysubdir:
             fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, kernel_deploysubdir, fitimage_its_name))
             fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, kernel_deploysubdir, fitimage_name))
+            setup_bin_dir = os.path.join(deploy_dir_image, kernel_deploysubdir)
         else:
             fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_its_name))
             fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_name))
+            setup_bin_dir = deploy_dir_image
+        # x86 kernel builds produce setup.bin which is packed into the FIT image.
+        # Detect this and inject KERNEL_SETUP_BIN into bb_vars so that the
+        # downstream helpers (_get_req_its_paths, _get_req_sections, etc.) can
+        # use it instead of checking MACHINE == "qemux86-64" directly.
+        if bb_vars['MACHINE'] == "qemux86-64":
+            setup_bin_path = os.path.join(setup_bin_dir, "setup.bin")
+            self.assertExists(setup_bin_path, "Expected setup.bin artifact not found: %s" % setup_bin_path)
+            bb_vars['KERNEL_SETUP_BIN'] = "setup.bin"
+        else:
+            bb_vars['KERNEL_SETUP_BIN'] = ""
         return (fitimage_its_path, fitimage_path)
 
     def _get_req_its_paths(self, bb_vars):
@@ -605,7 +618,10 @@ class KernelFitImageBase(FitImageTestCase):
         else:
             not_images.append('bootscr-boot.cmd')
 
-        if bb_vars['MACHINE'] == "qemux86-64": # Not really the right if
+        # setup-1 is an x86-only section present when the kernel build emits
+        # setup.bin. KERNEL_SETUP_BIN is either injected by _bitbake_fit_image
+        # after the build, or set explicitly in unit tests.
+        if bb_vars.get('KERNEL_SETUP_BIN'):
             images.append('setup-1')
         else:
             not_images.append('setup-1')
@@ -737,11 +753,16 @@ class KernelFitImageBase(FitImageTestCase):
         """Generate a dictionary of expected configuration signature nodes"""
         if bb_vars.get('UBOOT_SIGN_ENABLE') != "1":
             return {}
-        sign_images = '"kernel", "fdt"'
+        sign_images = '"kernel"'
+        dtb_files, _ = FitImageTestCase._get_dtb_files(bb_vars)
+        if dtb_files:
+            sign_images += ', "fdt"'
         if bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDLE'] != "1":
             sign_images += ', "ramdisk"'
         if bb_vars['FIT_UBOOT_ENV']:
             sign_images += ', "bootscr"'
+        if bb_vars.get('KERNEL_SETUP_BIN'):
+            sign_images += ', "setup"'
         req_sigvalues_config = {
             'algo': '"%s,%s"' % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG']),
             'key-name-hint': '"%s"' % bb_vars['UBOOT_SIGN_KEYNAME'],
@@ -789,6 +810,9 @@ class KernelFitImageBase(FitImageTestCase):
         # Add a script section if there is a script
         if fit_uboot_env:
             req_sections['bootscr-' + fit_uboot_env] = { "Type": "Script" }
+        # Add the x86 setup section if present
+        if bb_vars.get('KERNEL_SETUP_BIN'):
+            req_sections['setup-1'] = { "Type": "x86 setup.bin" }
         # Add the initramfs
         if initramfs_image and initramfs_image_bundle != "1":
             req_sections['ramdisk-1'] = {
@@ -864,6 +888,15 @@ class KernelFitImageBase(FitImageTestCase):
         fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
         fit_hash_alg_len = FitImageTestCase.MKIMAGE_HASH_LENGTHS[fit_hash_alg]
         fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[fit_sign_alg]
+        dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        all_dtb_names = set(dtb_files + dtb_symlinks)
+        # The public key is always injected into UBOOT_DTB_IMAGE (-K flag in
+        # uboot-sign.bbclass concat_dtb). For DTB-based configurations the same
+        # key is also injected into each per-configuration DTB, so either file
+        # works. For configurations without a matching DTB (e.g. conf-1 on x86)
+        # UBOOT_DTB_IMAGE is the only option.
+        uboot_dtb_image = bb_vars.get('UBOOT_DTB_IMAGE')
+        uboot_dtb_path_default = os.path.join(deploy_dir_image, uboot_dtb_image) if uboot_dtb_image else None
         for section, values in sections.items():
             # Configuration nodes are always signed with UBOOT_SIGN_KEYNAME (if UBOOT_SIGN_ENABLE = "1")
             if section.startswith(bb_vars['FIT_CONF_PREFIX']):
@@ -873,13 +906,29 @@ class KernelFitImageBase(FitImageTestCase):
                 sign_value = values.get('Sign value', None)
                 self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
                 dtb_file_name = section.replace(bb_vars['FIT_CONF_PREFIX'], '')
-                dtb_path = os.path.join(deploy_dir_image, dtb_file_name)
-                if kernel_deploysubdir:
-                    dtb_path = os.path.join(deploy_dir_image, kernel_deploysubdir, dtb_file_name)
-                # External devicetrees created by devicetree.bbclass are in a subfolder and have priority
-                dtb_path_ext = os.path.join(deploy_dir_image, "devicetree", dtb_file_name)
-                if os.path.exists(dtb_path_ext):
-                    dtb_path = dtb_path_ext
+                if dtb_file_name in all_dtb_names:
+                    # Use the per-configuration DTB (public key is also injected there)
+                    dtb_path = os.path.join(deploy_dir_image, dtb_file_name)
+                    if kernel_deploysubdir:
+                        dtb_path = os.path.join(deploy_dir_image, kernel_deploysubdir, dtb_file_name)
+                    # External devicetrees created by devicetree.bbclass are in a subfolder and have priority
+                    dtb_path_ext = os.path.join(deploy_dir_image, "devicetree", dtb_file_name)
+                    if os.path.exists(dtb_path_ext):
+                        dtb_path = dtb_path_ext
+                elif uboot_dtb_path_default:
+                    # No per-config DTB (e.g. conf-1 on x86): use the U-Boot DTB
+                    # which always gets the public key injected via -K in concat_dtb
+                    dtb_path = uboot_dtb_path_default
+                else:
+                    # No key-holding DTB available (e.g. qemux86-64 without
+                    # UBOOT_DTB_BINARY). The algo/key-name/value checks above
+                    # already ran; the cryptographic fit_check_sign step is not
+                    # possible without a DTB containing the public key.
+                    self.logger.debug(
+                        "Skipping fit_check_sign for section %s: no UBOOT_DTB_IMAGE "
+                        "available to carry the public key on MACHINE=%s"
+                        % (section, bb_vars.get('MACHINE', '?')))
+                    continue
                 self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, dtb_path, section)
             else:
                 # Image nodes always need a hash which gets indirectly signed by the config signature
@@ -1247,7 +1296,10 @@ class FitImagePyTests(KernelFitImageBase):
             # others
             'MACHINE': "qemux86-64",
             'UBOOT_ARCH': "x86",
-            'HOST_PREFIX': "x86_64-poky-linux-"
+            'HOST_PREFIX': "x86_64-poky-linux-",
+            # x86 kernels produce a setup.bin section; set to the file name to
+            # enable it, or to "" / omit the key to suppress it.
+            'KERNEL_SETUP_BIN': 'setup1.bin',
         }
         if bb_vars_overrides:
             bb_vars.update(bb_vars_overrides)
@@ -1286,8 +1338,8 @@ class FitImagePyTests(KernelFitImageBase):
             root_node.fitimage_emit_section_boot_script(
                 "bootscr-" + bb_vars['FIT_UBOOT_ENV'], bb_vars['FIT_UBOOT_ENV'])
 
-        if bb_vars['MACHINE'] == "qemux86-64": # Not really the right if
-            root_node.fitimage_emit_section_setup("setup-1", "setup1.bin")
+        if bb_vars.get('KERNEL_SETUP_BIN'):
+            root_node.fitimage_emit_section_setup("setup-1", bb_vars['KERNEL_SETUP_BIN'])
 
         if bb_vars.get('INITRAMFS_IMAGE') and bb_vars.get("INITRAMFS_IMAGE_BUNDLE") != "1":
             root_node.fitimage_emit_section_ramdisk("ramdisk-1", "a-dir/a-initramfs-1",
-- 
2.54.0


