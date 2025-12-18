Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8207BD711A7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:14:53 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1705.1766088888315011344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=IJK5duVZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202512182014454043595f4b00020732-wkmf_r@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202512182014454043595f4b00020732
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Dec 2025 21:14:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lJNFAcrPOWBcCMUhDFCUOKSkDhlIhzLvdMlEiRmZu40=;
 b=IJK5duVZhTswszTBZTUdrSLXwQfxzdZmeDy4Clr88Lj8eNtsix4KstaLs6PZRLMgDppQ2n
 7cMQmqqWJauPhXB2aiwPQGM4xdbcHiVBJzc6fHdrdYtQ+2ejqkiZj/L6DTIqrpnWJ4MqfE87
 Eku7L9g5Jy7PrJJzRLDeYsyMqw7W7qqkUDtrgeDwjvElj+blbuY7FwsRQDxSkBRTPSDhrFNn
 LZz3H+C8TL2qUy93EfRvz0jHyU1QW6+h/nVQtdimKU+0qDFp0O5nzUoqyQ8FpYhg++LocXcB
 s6+aAC0wiiUUJHirI5vMig3aHMrfA1dNxjAgH6KPYK9KYcMU21fl3F4w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] oe-selftest: fitimage: support FIT_CONF_MAPPINGS
Date: Thu, 18 Dec 2025 21:14:04 +0100
Message-ID: <20251218201432.1608259-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251218201432.1608259-1-adrian.freihofer@siemens.com>
References: <20251218201432.1608259-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228140

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add some quick tests for the FIT_CONF_MAPPINGS handling in fitimage.py

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 99 +++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 8df5e92a34..0f2d9d17db 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -12,6 +12,7 @@ import pprint
 
 import oe.fitimage
 
+from bb import BBHandledException
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_var
 
@@ -411,6 +412,7 @@ class KernelFitImageBase(FitImageTestCase):
         internal_used = {
             'DEPLOY_DIR_IMAGE',
             'FIT_CONF_DEFAULT_DTB',
+            'FIT_CONF_MAPPINGS',
             'FIT_CONF_PREFIX',
             'FIT_DESC',
             'FIT_HASH_ALG',
@@ -542,9 +544,52 @@ class KernelFitImageBase(FitImageTestCase):
         else:
             not_images.append('ramdisk-1')
 
-        # configuration nodes (one per DTB and also one per symlink)
+        # configuration nodes (one per DTB, symlink, and mappings)
+        configurations = []
         if dtb_files:
-            configurations = [bb_vars['FIT_CONF_PREFIX'] + conf for conf in dtb_files + dtb_symlinks]
+            fit_conf_prefix = bb_vars['FIT_CONF_PREFIX']
+            fit_conf_mappings = bb_vars.get('FIT_CONF_MAPPINGS', '')
+
+            # Parse mappings to build configuration node names
+            dtb_confs = {}
+            dtb_extra_confs = []
+            if fit_conf_mappings:
+                for mapping in fit_conf_mappings.split():
+                    mapping_type, dtb_name, alt_name = mapping.split(':')
+                    if mapping_type == "dtb-conf":
+                        dtb_confs[dtb_name] = alt_name
+                    elif mapping_type == "dtb-extra-conf":
+                        dtb_extra_confs.append((dtb_name, alt_name))
+                    else:
+                        self.fail("Invalid FIT_CONF_MAPPINGS type: %s" % mapping_type)
+
+            # Generate configuration names based on DTBs and mappings
+            for dtb in dtb_files:
+                if dtb in dtb_confs:
+                    # DTB is renamed via dtb-conf
+                    configurations.append(fit_conf_prefix + dtb_confs[dtb])
+                else:
+                    # Default configuration name
+                    configurations.append(fit_conf_prefix + dtb)
+
+                # Add extra configurations for this DTB
+                for dtb_extra_name, dtb_extra_alias in dtb_extra_confs:
+                    if dtb == dtb_extra_name:
+                        configurations.append(fit_conf_prefix + dtb_extra_alias)
+
+            # Add symlink configurations with mapping support
+            for dtb_symlink in dtb_symlinks:
+                if dtb_symlink in dtb_confs:
+                    # Symlink is renamed via dtb-conf
+                    configurations.append(fit_conf_prefix + dtb_confs[dtb_symlink])
+                else:
+                    # Default configuration name for symlink
+                    configurations.append(fit_conf_prefix + dtb_symlink)
+
+                # Add extra configurations for this DTB symlink
+                for dtb_extra_name, dtb_extra_alias in dtb_extra_confs:
+                    if dtb_symlink == dtb_extra_name:
+                        configurations.append(fit_conf_prefix + dtb_extra_alias)
         else:
             configurations = [bb_vars['FIT_CONF_PREFIX'] + '1']
 
@@ -1069,6 +1114,7 @@ class FitImagePyTests(KernelFitImageBase):
             # image-fitimage.conf
             'FIT_ADDRESS_CELLS': "1",
             'FIT_CONF_DEFAULT_DTB': "",
+            'FIT_CONF_MAPPINGS': "",
             'FIT_CONF_PREFIX': "conf-",
             'FIT_DESC': "Kernel fitImage for a dummy distro",
             'FIT_GENERATE_KEYS': "0",
@@ -1128,11 +1174,17 @@ class FitImagePyTests(KernelFitImageBase):
             bb_vars.get('UBOOT_MKIMAGE_KERNEL_TYPE'), bb_vars.get("UBOOT_ENTRYSYMBOL")
         )
 
-        dtb_files, _ = FitImageTestCase._get_dtb_files(bb_vars)
+        dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         for dtb in dtb_files:
             root_node.fitimage_emit_section_dtb(dtb, os.path.join("a-dir", dtb),
                 bb_vars.get("UBOOT_DTB_LOADADDRESS"), bb_vars.get("UBOOT_DTBO_LOADADDRESS"))
 
+        for dtb_symlink in dtb_symlinks:
+            # For test purposes, assume each symlink points to a DTB with the same basename minus "-alias"
+            # In this case, "am335x-bonegreen-ext-alias.dtb" -> "am335x-bonegreen-ext.dtb"
+            dtb_target = dtb_symlink.replace("-alias", "")
+            root_node.fitimage_emit_section_dtb_alias(dtb_symlink, os.path.join("a-dir", dtb_target))
+
         if bb_vars.get('FIT_UBOOT_ENV'):
             root_node.fitimage_emit_section_boot_script(
                 "bootscr-" + bb_vars['FIT_UBOOT_ENV'], bb_vars['FIT_UBOOT_ENV'])
@@ -1145,7 +1197,7 @@ class FitImagePyTests(KernelFitImageBase):
                 "core-image-minimal-initramfs",
                 bb_vars.get("UBOOT_RD_LOADADDRESS"), bb_vars.get("UBOOT_RD_ENTRYPOINT"))
 
-        root_node.fitimage_emit_section_config(bb_vars['FIT_CONF_DEFAULT_DTB'])
+        root_node.fitimage_emit_section_config(bb_vars['FIT_CONF_DEFAULT_DTB'], bb_vars.get('FIT_CONF_MAPPINGS'))
         root_node.write_its_file(fitimage_its_path)
 
         self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -1162,6 +1214,45 @@ class FitImagePyTests(KernelFitImageBase):
         }
         self._test_fitimage_py(bb_vars_overrides)
 
+    def test_fitimage_py_conf_mappings(self):
+        """Test FIT_CONF_MAPPINGS functionality with dtb-conf and dtb-extra-conf"""
+        bb_vars_overrides = {
+            'KERNEL_DEVICETREE': "am335x-bonegreen.dtb am335x-boneblack.dtb beaglebone.dtb",
+            'FIT_CONF_MAPPINGS': "dtb-extra-conf:am335x-bonegreen.dtb:bonegreen.dtb dtb-conf:am335x-boneblack.dtb:bbblack",
+            'FIT_CONF_DEFAULT_DTB': "bbblack"
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_conf_mappings_with_alias(self):
+        """Test FIT_CONF_MAPPINGS with external DTB aliases (symlinks)"""
+        bb_vars_overrides = {
+            'PREFERRED_PROVIDER_virtual/dtb': "bbb-dtbs-as-ext",
+            'FIT_CONF_MAPPINGS': "dtb-conf:am335x-bonegreen-ext-alias.dtb:green-alias-renamed dtb-extra-conf:am335x-bonegreen-ext.dtb:green-extra",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_conf_mappings_unused_error(self):
+        """Test that unused FIT_CONF_MAPPINGS cause a fatal error"""
+        bb_vars_overrides = {
+            'KERNEL_DEVICETREE': "am335x-bonegreen.dtb am335x-boneblack.dtb",
+            'FIT_CONF_MAPPINGS': "dtb-conf:nonexistent.dtb:renamed",
+        }
+
+        # This should raise an exception because the mapping references a non-existent DTB
+        with self.assertRaises(BBHandledException):
+            self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_conf_extra_mappings_unused_error(self):
+        """Test that unused dtb-extra-conf mappings cause a fatal error"""
+        bb_vars_overrides = {
+            'KERNEL_DEVICETREE': "am335x-bonegreen.dtb",
+            'FIT_CONF_MAPPINGS': "dtb-extra-conf:nonexistent.dtb:extra-conf",
+        }
+
+        # This should raise an exception because the extra-conf mapping references a non-existent DTB
+        with self.assertRaises(BBHandledException):
+            self._test_fitimage_py(bb_vars_overrides)
+
 
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
-- 
2.52.0


