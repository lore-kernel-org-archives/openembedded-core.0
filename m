Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42162CDB466
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 11:21:00 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40381.1781868056696435714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 04:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=cXuUuOmm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260619112053065d7a74e9000207b0-ajboza@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260619112053065d7a74e9000207b0
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Jun 2026 13:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qBFHZ4FuYGAL5aijx9htgbCeSWFsF3D7FaVQFJYLFVo=;
 b=cXuUuOmmltKMJsF0gqNuLwCJPBcj65J/EJNQyzIN75nXpuwuV6qUgyBwEldy2puUr86xUQ
 iIufJgFgHSVTt7KR/RCUupZQjLA0agfjjah7gTgvUohCOOe6rRJtXqPSaIAe9ZBrngxveCSD
 HeQ1XPVEYjbGFVGsYMn0eU1oI1v1heQkuFDVvxNvVxRNCVOrof8YFNlO/ub5QSbRCcG6FJQ2
 AD8R2Ghlkm2/mTVNPUyr5XRDp2Cu8TvuqbyaZms6f7sY901+6dWhUT85XXCLBa3d0YC7IRZP
 XxDbNSPu94eJHPYMSqFTapabrKFLWGsBJROnW8CtSHgXNAQXIdAffIGQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/6] oe-selftest: fitimage: replace bbb-dtbs-as-ext with test-dtbs-as-ext
Date: Fri, 19 Jun 2026 13:17:11 +0200
Message-ID: <20260619112046.125876-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260619112046.125876-1-adrian.freihofer@siemens.com>
References: <20260619112046.125876-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239163

From: Adrian Freihofer <adrian.freihofer@siemens.com>

bbb-dtbs-as-ext is tightly coupled to the beaglebone-yocto BSP: it
requires kernel sources from that machine to compile the TI DTS files and
is restricted to COMPATIBLE_MACHINE = "^(beaglebone-yocto)$".  This makes
the external-DTB FIT image selftests impossible to run on any other
machine. The beaglebone-yocto BSP is not part of oe-core.

Replace it with the machine-agnostic test-dtbs-as-ext recipe added in the
previous commit. test-dtbs-as-ext ships self-contained DTS files with no
kernel source dependencies and sets COMPATIBLE_MACHINE = ".*".

Changes:
- Delete bbb-dtbs-as-ext.bb and its DTS source files (am335x-bonegreen-ext.dts,
  BBORG_RELAY-00A2.dts).
- Update _get_dtb_files() to recognise test-dtbs-as-ext as the virtual/dtb
  provider and return the new filenames (test-ext.dtb, test-overlay.dtbo,
  test-ext-alias.dtb).
- Update test_get_compatible_from_dtb() to build test-dtbs-as-ext, check for
  the new compatible string "oe-selftest,test-ext", and drop the
  beaglebone-yocto MACHINE / poky DISTRO overrides that were only needed
  for the old recipe.
- Update test_fit_image_ext_dtb_dtbo() to set
  PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext".
- Update test_fitimage_py_conf_mappings_with_alias() to use the new DTB and
  symlink names.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/ext-dtb/bbb-dtbs-as-ext.bb   | 29 -----------
 .../ext-dtb/files/BBORG_RELAY-00A2.dts        | 49 -------------------
 .../ext-dtb/files/am335x-bonegreen-ext.dts    | 14 ------
 meta/lib/oeqa/selftest/cases/fitimage.py      | 30 ++++++------
 4 files changed, 15 insertions(+), 107 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts

diff --git a/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb b/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
deleted file mode 100644
index 5055d03e54..0000000000
--- a/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Boeaglebone Devicetrees"
-DESCRIPTION = "Handle the dtc files of the beaglebone-yocto via devicetree.bbclass just for testing purpose"
-SECTION = "kernel"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-inherit devicetree
-
-COMPATIBLE_MACHINE  = "^(beaglebone-yocto)$"
-
-# Take a copy of a small devicetree from the kernel's source directory for handling it externally
-# Borrowed an example DTB overlay from
-# https://raw.githubusercontent.com/beagleboard/linux/refs/heads/5.10/arch/arm/boot/dts/overlays/BBORG_RELAY-00A2.dts
-SRC_URI = "\
-    file://am335x-bonegreen-ext.dts \
-    file://BBORG_RELAY-00A2.dts \
-"
-
-# The am335x-bonegreen-ext.dts needs also the ti directories
-DT_INCLUDE:append = " ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/ti/omap"
-
-# Sym-links are handled as extra configuration nodes in FIT images.
-do_install:append() {
-    ln -sf am335x-bonegreen-ext.dtb "${D}/boot/devicetree/am335x-bonegreen-ext-alias.dtb"
-}
-
-do_deploy:append() {
-    ln -sf am335x-bonegreen-ext.dtb "${DEPLOYDIR}/devicetree/am335x-bonegreen-ext-alias.dtb"
-}
diff --git a/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts b/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
deleted file mode 100644
index 9530fa50fe..0000000000
--- a/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
+++ /dev/null
@@ -1,49 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2015 Robert Nelson <robertcnelson@gmail.com>
- * Copyright (C) 2019 Amilcar Lucas <amilcar.lucas@iav.de>
- */
-
-/dts-v1/;
-/plugin/;
-
-&{/chosen} {
-	overlays {
-		BBORG_RELAY-00A2.kernel = __TIMESTAMP__;
-	};
-};
-
-&ocp {
-	P9_41_pinmux { pinctrl-0 = <&P9_41_gpio_pin>;};
-	P9_42_pinmux { pinctrl-0 = <&P9_42_gpio_pin>;};
-	P9_30_pinmux { pinctrl-0 = <&P9_30_gpio_pin>;};
-	P9_27_pinmux { pinctrl-0 = <&P9_27_gpio_pin>;};
-};
-
-// relay1
-&bone_led_P9_41 {
-	status = "okay";
-	label = "relay1";
-	default-state = "keep";
-};
-
-// relay2
-&bone_led_P9_42 {
-	status = "okay";
-	label = "relay2";
-	default-state = "keep";
-};
-
-// realy3
-&bone_led_P9_30 {
-	status = "okay";
-	label = "relay3";
-	default-state = "keep";
-};
-
-// realy4
-&bone_led_P9_27 {
-	status = "okay";
-	label = "relay4";
-	default-state = "keep";
-};
diff --git a/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts b/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
deleted file mode 100644
index a0b39337a9..0000000000
--- a/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
- */
-/dts-v1/;
-
-#include "am33xx.dtsi"
-#include "am335x-bone-common.dtsi"
-#include "am335x-bonegreen-common.dtsi"
-
-/ {
-	model = "TI AM335x BeagleBone Green External";
-	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
-};
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 2d3337aabd..3a2ba2208d 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -247,7 +247,7 @@ class FitImageTestCase(OESelftestTestCase):
 
         The list should be used to check the dtb and conf nodes in the FIT image or its file.
         In addition to the entries from KERNEL_DEVICETREE, the external devicetree and the
-        external devicetree overlay added by the test recipe bbb-dtbs-as-ext are handled as well.
+        external devicetree overlay added by the test recipe test-dtbs-as-ext are handled as well.
         """
         kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE')
         all_dtbs = []
@@ -256,9 +256,9 @@ class FitImageTestCase(OESelftestTestCase):
             all_dtbs += [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
         # Support only the test recipe which provides 1 devicetree and 1 devicetree overlay
         pref_prov_dtb = bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
-        if pref_prov_dtb == "bbb-dtbs-as-ext":
-            all_dtbs += ["BBORG_RELAY-00A2.dtbo", "am335x-bonegreen-ext.dtb"]
-            dtb_symlinks.append("am335x-bonegreen-ext-alias.dtb")
+        if pref_prov_dtb == "test-dtbs-as-ext":
+            all_dtbs += ["test-ext.dtb", "test-overlay.dtbo"]
+            dtb_symlinks.append("test-ext-alias.dtb")
         return (all_dtbs, dtb_symlinks)
 
     @staticmethod
@@ -808,7 +808,7 @@ class KernelFitImageBase(FitImageTestCase):
             for dtb in dtb_files + dtb_symlinks:
                 conf_name = bb_vars['FIT_CONF_PREFIX'] + dtb
                 # Assume that DTBs with an "-alias" in its name are symlink DTBs created e.g. by the
-                # bbb-dtbs-as-ext test recipe. Make the configuration node pointing to the real DTB.
+                # test-dtbs-as-ext test recipe. Make the configuration node pointing to the real DTB.
                 real_dtb = dtb.replace("-alias", "")
                 # dtb overlays do not refer to a kernel (yet?)
                 if dtb.endswith('.dtbo'):
@@ -953,15 +953,15 @@ FIT_LOADABLE_TYPE[loadable2] = "firmware"
     def test_get_compatible_from_dtb(self):
         """Test the oe.fitimage.get_compatible_from_dtb function
 
-        1. bitbake bbb-dtbs-as-ext
+        1. bitbake test-dtbs-as-ext
         2. Check if symlink_points_below returns the path to the DTB
         3. Check if the expected compatible string is found by get_compatible_from_dtb()
         """
-        DTB_RECIPE = "bbb-dtbs-as-ext"
-        DTB_FILE = "am335x-bonegreen-ext.dtb"
-        DTB_SYMLINK = "am335x-bonegreen-ext-alias.dtb"
-        DTBO_FILE = "BBORG_RELAY-00A2.dtbo"
-        EXPECTED_COMP = ["ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx"]
+        DTB_RECIPE = "test-dtbs-as-ext"
+        DTB_FILE = "test-ext.dtb"
+        DTB_SYMLINK = "test-ext-alias.dtb"
+        DTBO_FILE = "test-overlay.dtbo"
+        EXPECTED_COMP = ["oe-selftest,test-ext"]
 
         config = """
 DISTRO = "poky"
@@ -1008,7 +1008,7 @@ MACHINE:forcevariable = "beaglebone-yocto"
 # Enable creation of fitImage
 MACHINE:forcevariable = "beaglebone-yocto"
 # Add a devicetree overlay which does not need kernel sources
-PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
+PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext"
 """
         config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
@@ -1278,7 +1278,7 @@ class FitImagePyTests(KernelFitImageBase):
 
         for dtb_symlink in dtb_symlinks:
             # For test purposes, assume each symlink points to a DTB with the same basename minus "-alias"
-            # In this case, "am335x-bonegreen-ext-alias.dtb" -> "am335x-bonegreen-ext.dtb"
+            # In this case, "test-ext-alias.dtb" -> "test-ext.dtb"
             dtb_target = dtb_symlink.replace("-alias", "")
             root_node.fitimage_emit_section_dtb_alias(dtb_symlink, os.path.join("a-dir", dtb_target))
 
@@ -1329,8 +1329,8 @@ class FitImagePyTests(KernelFitImageBase):
     def test_fitimage_py_conf_mappings_with_alias(self):
         """Test FIT_CONF_MAPPINGS with external DTB aliases (symlinks)"""
         bb_vars_overrides = {
-            'PREFERRED_PROVIDER_virtual/dtb': "bbb-dtbs-as-ext",
-            'FIT_CONF_MAPPINGS': "dtb-conf:am335x-bonegreen-ext-alias.dtb:green-alias-renamed dtb-extra-conf:am335x-bonegreen-ext.dtb:green-extra",
+            'PREFERRED_PROVIDER_virtual/dtb': "test-dtbs-as-ext",
+            'FIT_CONF_MAPPINGS': "dtb-conf:test-ext-alias.dtb:test-alias-renamed dtb-extra-conf:test-ext.dtb:test-extra",
         }
         self._test_fitimage_py(bb_vars_overrides)
 
-- 
2.54.0


