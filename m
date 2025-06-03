Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13779C61DB2
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.6266.1748939069319010803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=v7kkili/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250603082432f7f3adb024536601b2-fklxbk@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250603082432f7f3adb024536601b2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=36zQ0FWYDQ1Er1cyG6F/yzDW/IOA8wmgxN/r7tiOOhU=;
 b=v7kkili/d4KM9mqtfDODry9RD1x1jgP7whiLnzr5bRuosYtIhizkCqTZxk+ddq4UdOQb19
 eMFvX4Lyo3i+7XRXLWt2sluePKXf/rgtWsWE9NCI8U18QpaySO7EjCH8ailjQ87ezhDaarOl
 Ht6bt2m0w4AqC91WATEE2sfZaQILsM1pDH8gQbFHUkcmWrvmwzQ3eLa60ZzYiuzYf16zS2uW
 mc+gYmMtjGVySgjxZ8ED4M6SzL0A6RiEx13Phki29vorV87k34QRnE36PRrhbSpIPYap27yN
 X3MY92RbmZ3vJAxmW9P4wHlKhJ3Wcjc44aM8snpZov93WXa07xSweljA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 13/20] oe-selftest: fitimage: add tests for fitimage.py
Date: Tue,  3 Jun 2025 10:23:24 +0200
Message-ID: <20250603082419.409564-14-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217775

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Having the FIT image generator code as a separate class, which is
essentially independent of BitBake, also allows testing the code
separately from BitBake. Take advantage of this enables testing more
use cases with significantly faster tests.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 179 ++++++++++++++++++++++-
 1 file changed, 175 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 9c353b6ed13..3d6a5a582f0 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -4,13 +4,36 @@
 # SPDX-License-Identifier: MIT
 #
 
-from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_vars
 import os
 import re
 import shlex
 import logging
 import pprint
+import tempfile
+
+import oe.fitimage
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_var
+
+
+class BbVarsMockGenKeys:
+    def __init__(self, keydir, gen_keys="0", sign_enabled="0", keyname="", sign_ind="0", img_keyname=""):
+        self.bb_vars = {
+            'FIT_GENERATE_KEYS': gen_keys,
+            'FIT_KEY_GENRSA_ARGS': "-F4",
+            'FIT_KEY_REQ_ARGS': "-batch -new",
+            'FIT_KEY_SIGN_PKCS': "-x509",
+            'FIT_SIGN_INDIVIDUAL': sign_ind,
+            'FIT_SIGN_NUMBITS': "2048",
+            'UBOOT_SIGN_ENABLE': sign_enabled,
+            'UBOOT_SIGN_IMG_KEYNAME': img_keyname,
+            'UBOOT_SIGN_KEYDIR': keydir,
+            'UBOOT_SIGN_KEYNAME': keyname,
+        }
+
+    def getVar(self, var):
+        return self.bb_vars[var]
 
 class FitImageTestCase(OESelftestTestCase):
     """Test functions usable for testing kernel-fitimage.bbclass and uboot-sign.bbclass
@@ -369,8 +392,7 @@ class FitImageTestCase(OESelftestTestCase):
         # Verify the FIT image
         self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
 
-
-class KernelFitImageTests(FitImageTestCase):
+class KernelFitImageBase(FitImageTestCase):
     """Test cases for the kernel-fitimage bbclass"""
 
     def _fit_get_bb_vars(self, additional_vars=[]):
@@ -696,6 +718,8 @@ class KernelFitImageTests(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
+class KernelFitImageTests(KernelFitImageBase):
+    """Test cases for the kernel-fitimage bbclass"""
 
     def test_fit_image(self):
         """
@@ -732,6 +756,52 @@ FIT_CONF_PREFIX = "foo-"
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
 
+    def test_get_compatible_from_dtb(self):
+        """Test the oe.fitimage.get_compatible_from_dtb function
+
+        1. bitbake bbb-dtbs-as-ext
+        2. Check if symlink_points_below returns the path to the DTB
+        3. Check if the expected compatible string is found by get_compatible_from_dtb()
+        """
+        DTB_RECIPE = "bbb-dtbs-as-ext"
+        DTB_FILE = "am335x-bonegreen-ext.dtb"
+        DTB_SYMLINK = "am335x-bonegreen-ext-alias.dtb"
+        DTBO_FILE = "BBORG_RELAY-00A2.dtbo"
+        EXPECTED_COMP = ["ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx"]
+
+        config = """
+DISTRO="poky"
+MACHINE = "beaglebone-yocto"
+"""
+        self.write_config(config)
+
+        # Provide the fdtget command called by get_compatible_from_dtb
+        dtc_bindir = FitImageTestCase._setup_native('dtc-native')
+        fdtget_path = os.path.join(dtc_bindir, "fdtget")
+        self.assertExists(fdtget_path)
+
+        # bitbake an external DTB with a symlink to it and a DTB overlay
+        bitbake(DTB_RECIPE)
+        deploy_dir_image = get_bb_var("DEPLOY_DIR_IMAGE", DTB_RECIPE)
+        devicetree_dir = os.path.join(deploy_dir_image, "devicetree")
+        dtb_path = os.path.join(devicetree_dir, DTB_FILE)
+        dtb_alias_path = os.path.join(devicetree_dir, DTB_SYMLINK)
+        dtbo_file = os.path.join(devicetree_dir, DTBO_FILE)
+        self.assertExists(dtb_path)
+        self.assertExists(dtb_alias_path)
+        self.assertExists(dtbo_file)
+
+        # Test symlink_points_below
+        linked_dtb = oe.fitimage.symlink_points_below(dtb_alias_path, devicetree_dir)
+        self.assertEqual(linked_dtb, DTB_FILE)
+
+        # Check if get_compatible_from_dtb finds the expected compatible string in the DTBs
+        comp = oe.fitimage.get_compatible_from_dtb(dtb_path, fdtget_path)
+        self.assertEqual(comp, EXPECTED_COMP)
+        comp_alias = oe.fitimage.get_compatible_from_dtb(dtb_alias_path, fdtget_path)
+        self.assertEqual(comp_alias, EXPECTED_COMP)
+        # The alias is a symlink, therefore the compatible string is equal
+        self.assertEqual(comp_alias, comp)
 
     def test_fit_image_ext_dtb_dtbo(self):
         """
@@ -939,6 +1009,107 @@ FIT_HASH_ALG = "sha256"
         self._gen_signing_key(bb_vars)
         self._test_fitimage(bb_vars)
 
+class FitImagePyTests(KernelFitImageBase):
+    """Test cases for the fitimage.py module without calling bitbake"""
+
+    def _test_fitimage_py(self, bb_vars_overrides=None):
+        topdir = os.path.join(os.environ['BUILDDIR'])
+        fitimage_its_path = os.path.join(topdir, self._testMethodName + '.its')
+
+        # Provide variables without calling bitbake
+        bb_vars = {
+            # image-fitimage.conf
+            'FIT_DESC': "Kernel fitImage for a dummy distro",
+            'FIT_HASH_ALG': "sha256",
+            'FIT_SIGN_ALG': "rsa2048",
+            'FIT_PAD_ALG': "pkcs-1.5",
+            'FIT_GENERATE_KEYS': "0",
+            'FIT_SIGN_NUMBITS': "2048",
+            'FIT_KEY_GENRSA_ARGS': "-F4",
+            'FIT_KEY_REQ_ARGS': "-batch -new",
+            'FIT_KEY_SIGN_PKCS': "-x509",
+            'FIT_SIGN_INDIVIDUAL': "0",
+            'FIT_CONF_PREFIX': "conf-",
+            'FIT_SUPPORTED_INITRAMFS_FSTYPES': "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio",
+            'FIT_CONF_DEFAULT_DTB': "",
+            'FIT_ADDRESS_CELLS': "1",
+            'FIT_UBOOT_ENV': "",
+            # kernel.bbclass
+            'UBOOT_ENTRYPOINT': "0x20008000",
+            'UBOOT_LOADADDRESS': "0x20008000",
+            'INITRAMFS_IMAGE': "",
+            'INITRAMFS_IMAGE_BUNDLE': "",
+            # kernel-uboot.bbclass
+            'FIT_KERNEL_COMP_ALG': "gzip",
+            'FIT_KERNEL_COMP_ALG_EXTENSION': ".gz",
+            'UBOOT_MKIMAGE_KERNEL_TYPE': "kernel",
+            # uboot-config.bbclass
+            'UBOOT_MKIMAGE_DTCOPTS': "",
+            'UBOOT_MKIMAGE': "uboot-mkimage",
+            'UBOOT_MKIMAGE_SIGN': "uboot-mkimage",
+            'UBOOT_MKIMAGE_SIGN_ARGS': "",
+            'UBOOT_SIGN_ENABLE': "0",
+            'UBOOT_SIGN_KEYDIR': None,
+            'UBOOT_SIGN_KEYNAME': None,
+            'UBOOT_SIGN_IMG_KEYNAME': None,
+            # others
+            'MACHINE': "qemux86-64",
+            'UBOOT_ARCH': "x86",
+            'HOST_PREFIX': "x86_64-poky-linux-"
+        }
+        if bb_vars_overrides:
+            bb_vars.update(bb_vars_overrides)
+
+        root_node = oe.fitimage.ItsNodeRootKernel(
+            bb_vars["FIT_DESC"], bb_vars["FIT_ADDRESS_CELLS"],
+            bb_vars['HOST_PREFIX'], bb_vars['UBOOT_ARCH'],  bb_vars["FIT_CONF_PREFIX"],
+            oe.types.boolean(bb_vars['UBOOT_SIGN_ENABLE']), bb_vars["UBOOT_SIGN_KEYDIR"],
+            bb_vars["UBOOT_MKIMAGE"], bb_vars["UBOOT_MKIMAGE_DTCOPTS"],
+            bb_vars["UBOOT_MKIMAGE_SIGN"], bb_vars["UBOOT_MKIMAGE_SIGN_ARGS"],
+            bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG'], bb_vars['FIT_PAD_ALG'],
+            bb_vars['UBOOT_SIGN_KEYNAME'],
+            oe.types.boolean(bb_vars['FIT_SIGN_INDIVIDUAL']), bb_vars['UBOOT_SIGN_IMG_KEYNAME']
+        )
+
+        root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", "none",
+            bb_vars.get('UBOOT_LOADADDRESS'), bb_vars.get('UBOOT_ENTRYPOINT'),
+            bb_vars.get('UBOOT_MKIMAGE_KERNEL_TYPE'), bb_vars.get("UBOOT_ENTRYSYMBOL")
+        )
+
+        dtb_files, _ = FitImageTestCase._get_dtb_files(bb_vars)
+        for dtb in dtb_files:
+            root_node.fitimage_emit_section_dtb(dtb, os.path.join("a-dir", dtb),
+                bb_vars.get("UBOOT_DTB_LOADADDRESS"), bb_vars.get("UBOOT_DTBO_LOADADDRESS"))
+
+        if bb_vars.get('FIT_UBOOT_ENV'):
+            root_node.fitimage_emit_section_boot_script(
+                "bootscr-" + bb_vars['FIT_UBOOT_ENV'], bb_vars['FIT_UBOOT_ENV'])
+
+        if bb_vars['MACHINE'] == "qemux86-64": # Not really the right if
+            root_node.fitimage_emit_section_setup("setup-1", "setup1.bin")
+
+        if bb_vars.get('INITRAMFS_IMAGE') and bb_vars.get("INITRAMFS_IMAGE_BUNDLE") != "1":
+            root_node.fitimage_emit_section_ramdisk("ramdisk-1", "a-dir/a-initramfs-1",
+                "core-image-minimal-initramfs",
+                bb_vars.get("UBOOT_RD_LOADADDRESS"), bb_vars.get("UBOOT_RD_ENTRYPOINT"))
+
+        root_node.fitimage_emit_section_config(bb_vars['FIT_CONF_DEFAULT_DTB'])
+        root_node.write_its_file(fitimage_its_path)
+
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.logger.debug("Checking its: %s" % fitimage_its_path)
+        self._check_its_file(bb_vars, fitimage_its_path)
+
+    def test_fitimage_py_default(self):
+        self._test_fitimage_py()
+
+    def test_fitimage_py_default_dtb(self):
+        bb_vars_overrides = {
+            'KERNEL_DEVICETREE': "one.dtb two.dtb three.dtb",
+            'FIT_CONF_DEFAULT_DTB': "two.dtb"
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
 
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
-- 
2.49.0


