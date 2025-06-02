Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F482C71130
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:34 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.44199.1748851049112316153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=yDKxMbk6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202506020757269f8baffeb00e58e95a-lfwref@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202506020757269f8baffeb00e58e95a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AcPXn0QSUTyakbWsLGQxdt9nPf5L/P+U8ZAEpkG1jik=;
 b=yDKxMbk6HFGD1eYFW84jLTrX8T+GGcnT3j8DvPk7mQ+ylp6AlC6p86SuYXaiAF5GUqP7o9
 mdOO8f3RZjHCJwiOJoTD7oEeZaLGnsgfuRA/pq3Ys0BEbjrqSfm6F6P47AyuV3StBYj7QeSj
 USrhfAaa3GxDIUP7vTwf2Pnmd6ElikgnOXARYAKp+KV22NKegp4F7bLz7UugVmvmdR3L7vsj
 BXNEJEX5SyHBFsHzfr/YO7E0DMQ+tru7GvNh9CZvGAftZTgGerY3v1SC7MEdSyZ+Dk+Rhy5L
 4Kza9Tui5Ng80G5DREzzvVR3mop3x1a24IBCsrXVclProWCiC0k2p9ow==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 04/21] oe-selftest: fitimage: test FIT_CONF_PREFIX
Date: Mon,  2 Jun 2025 09:56:14 +0200
Message-ID: <20250602075714.32122-5-adrian.freihofer@siemens.com>
In-Reply-To: <20250602075714.32122-1-adrian.freihofer@siemens.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 07:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217699

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a test which does not use the default FIT_CONF_PREFIX configuration.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 28 ++++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 31116979ef7..812b34fab47 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -256,7 +256,7 @@ class FitImageTestCase(OESelftestTestCase):
         self.logger.debug("sigs:\n%s\n" % pprint.pformat(sigs, indent=4))
         if req_sigvalues_config or req_sigvalues_image:
             for its_path, values in sigs.items():
-                if 'conf-' in its_path:
+                if bb_vars.get('FIT_CONF_PREFIX', "conf-") in its_path:
                     reqsigvalues = req_sigvalues_config
                 else:
                     reqsigvalues = req_sigvalues_image
@@ -380,6 +380,7 @@ class KernelFitImageTests(FitImageTestCase):
         """
         internal_used = {
             'DEPLOY_DIR_IMAGE',
+            'FIT_CONF_PREFIX',
             'FIT_DESC',
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
@@ -486,9 +487,9 @@ class KernelFitImageTests(FitImageTestCase):
 
         # configuration nodes (one per DTB and also one per symlink)
         if dtb_files:
-            configurations = [ 'conf-' + conf for conf in dtb_files + dtb_symlinks]
+            configurations = [bb_vars['FIT_CONF_PREFIX'] + conf for conf in dtb_files + dtb_symlinks]
         else:
-            configurations = [ 'conf-1' ]
+            configurations = [bb_vars['FIT_CONF_PREFIX'] + '1']
 
         # Create a list of paths for all image and configuration nodes
         req_its_paths = []
@@ -526,7 +527,7 @@ class KernelFitImageTests(FitImageTestCase):
             if uboot_rd_entrypoint:
                 its_field_check.append("entry = <%s>;" % uboot_rd_entrypoint)
         its_field_check += [
-            # 'default = "conf-1";', needs more work
+            # 'default = bb_vars['FIT_CONF_PREFIX'] + "1";', needs more work
             'kernel = "kernel-1";',
         ]
         if initramfs_image and initramfs_image_bundle != "1":
@@ -599,33 +600,35 @@ class KernelFitImageTests(FitImageTestCase):
         # Create a configuration section for each DTB
         if dtb_files:
             for dtb in dtb_files + dtb_symlinks:
+                conf_name = bb_vars['FIT_CONF_PREFIX'] + dtb
                 # Assume that DTBs with an "-alias" in its name are symlink DTBs created e.g. by the
                 # bbb-dtbs-as-ext test recipe. Make the configuration node pointing to the real DTB.
                 real_dtb = dtb.replace("-alias", "")
                 # dtb overlays do not refer to a kernel (yet?)
                 if dtb.endswith('.dtbo'):
-                    req_sections['conf-' + dtb] = {
+                    req_sections[conf_name] = {
                         "FDT": 'fdt-' + real_dtb,
                     }
                 else:
-                    req_sections['conf-' + dtb] = {
+                    req_sections[conf_name] = {
                         "Kernel": "kernel-1",
                         "FDT": 'fdt-' + real_dtb,
                     }
                 if initramfs_image and initramfs_image_bundle != "1":
-                    req_sections['conf-' + dtb]['Init Ramdisk'] = "ramdisk-1"
+                    req_sections[conf_name]['Init Ramdisk'] = "ramdisk-1"
         else:
-            req_sections['conf-1'] = {
+            conf_name = bb_vars['FIT_CONF_PREFIX'] +  '1'
+            req_sections[conf_name] = {
                 "Kernel": "kernel-1"
             }
             if initramfs_image and initramfs_image_bundle != "1":
-                req_sections['conf-1']['Init Ramdisk'] = "ramdisk-1"
+                req_sections[conf_name]['Init Ramdisk'] = "ramdisk-1"
 
         # Add signing related properties if needed
         if uboot_sign_enable == "1":
             for section in req_sections:
                 req_sections[section]['Hash algo'] = fit_hash_alg
-                if section.startswith('conf-'):
+                if section.startswith(bb_vars['FIT_CONF_PREFIX']):
                     req_sections[section]['Hash value'] = "unavailable"
                     req_sections[section]['Sign algo'] = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_keyname)
                     num_signatures += 1
@@ -652,13 +655,13 @@ class KernelFitImageTests(FitImageTestCase):
         fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[fit_sign_alg]
         for section, values in sections.items():
             # Configuration nodes are always signed with UBOOT_SIGN_KEYNAME (if UBOOT_SIGN_ENABLE = "1")
-            if section.startswith("conf"):
+            if section.startswith(bb_vars['FIT_CONF_PREFIX']):
                 sign_algo = values.get('Sign algo', None)
                 req_sign_algo = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_keyname)
                 self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
                 sign_value = values.get('Sign value', None)
                 self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
-                dtb_file_name = section.replace('conf-', '')
+                dtb_file_name = section.replace(bb_vars['FIT_CONF_PREFIX'], '')
                 dtb_path = os.path.join(deploy_dir_image, dtb_file_name)
                 # External devicetrees created by devicetree.bbclass are in a subfolder and have priority
                 dtb_path_ext = os.path.join(deploy_dir_image, "devicetree", dtb_file_name)
@@ -718,6 +721,7 @@ UBOOT_RD_ENTRYPOINT = "0x88000000"
 UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
+FIT_CONF_PREFIX = "foo-"
 """
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
-- 
2.49.0


