Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C766C3ABC1
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:07:09 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.28206.1746364018480856130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Lvv7ovgA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2025050413065652715c90db1b6d5ebc-fsaygb@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025050413065652715c90db1b6d5ebc
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7WxpuNa+eaFk2uq9TYs2zrqZBYsIQAxtmhWM+H6dcYo=;
 b=Lvv7ovgAh34TGSx1voK4OdCkQ8inBOQqjdVomdSYi4DUk0D8hK/DWZLBEgfXTjdmt4SDQP
 Q8aiapkkOku/e0y8PC9p0Y7qWYL1RA/MElGpPLLLzNmBzbYMjdgZOPnfwkgqrLX5g9u7xCyZ
 lyrHdFiQWymSoy4+ZB4p1EdLDqRjpH7iq5z8RhDkkIsEQ1UXrFbBpstrBwv4T0HAe3pq5yi8
 omIOgSEQ/qWXsNWlxITgQ5MY55AUddrKY6+CwV96+69H3d01CvMOOMr31+BRvF49sIgQ3Ves
 6vikLgw+GOJmylGzL2cwNzE4OYQy+25ml3+87NOdn4LY4+hHFob/SXtQ==;
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
Subject: [PATCH 10/20] oe-selftest: fitimage add tests for fitimage.py
Date: Sun,  4 May 2025 15:04:57 +0200
Message-ID: <20250504130507.717954-10-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215954

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Having the FIT image generator code as a separate class, which is
essentially independent of BitBake, also allows testing the code
separately from BitBake. Take advantage of this enables testing more
use cases with significantly faster tests.

Add also test cases for the new gen rsa keys function.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 201 +++++++++++++++++++----
 1 file changed, 173 insertions(+), 28 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 81585aa10b3..7e81f155e7a 100644
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
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars
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
@@ -56,34 +79,19 @@ class FitImageTestCase(OESelftestTestCase):
         # Define some variables which are usually defined by the kernel-fitimage.bbclass.
         # But for testing purpose check if the uboot-sign.bbclass is independent from
         # the kernel-fitimage.bbclass
-        fit_sign_numbits = bb_vars.get('FIT_SIGN_NUMBITS', "2048")
-        fit_key_genrsa_args = bb_vars.get('FIT_KEY_GENRSA_ARGS', "-F4")
-        fit_key_req_args =  bb_vars.get('FIT_KEY_REQ_ARGS', "-batch -new")
-        fit_key_sign_pkcs = bb_vars.get('FIT_KEY_SIGN_PKCS', "-x509")
+        numbits = bb_vars.get('FIT_SIGN_NUMBITS', "2048")
+        genrsa_args = bb_vars.get('FIT_KEY_GENRSA_ARGS', "-F4")
+        req_args =  bb_vars.get('FIT_KEY_REQ_ARGS', "-batch -new")
+        sign_pkcs = bb_vars.get('FIT_KEY_SIGN_PKCS', "-x509")
 
-        uboot_sign_keydir = bb_vars['UBOOT_SIGN_KEYDIR']
+        keydir = bb_vars['UBOOT_SIGN_KEYDIR']
         sign_keys = [bb_vars['UBOOT_SIGN_KEYNAME']]
         if bb_vars['FIT_SIGN_INDIVIDUAL'] == "1":
             sign_keys.append(bb_vars['UBOOT_SIGN_IMG_KEYNAME'])
-        for sign_key in sign_keys:
-            sing_key_path = os.path.join(uboot_sign_keydir, sign_key)
-            if not os.path.isdir(uboot_sign_keydir):
-                os.makedirs(uboot_sign_keydir)
-            openssl_bindir = FitImageTestCase._setup_native('openssl-native')
-            openssl_path = os.path.join(openssl_bindir, 'openssl')
-            runCmd("%s genrsa %s -out %s.key %s" % (
-                openssl_path,
-                fit_key_genrsa_args,
-                sing_key_path,
-                fit_sign_numbits
-            ))
-            runCmd("%s req %s %s -key %s.key -out %s.crt" % (
-                openssl_path,
-                fit_key_req_args,
-                fit_key_sign_pkcs,
-                sing_key_path,
-                sing_key_path
-            ))
+        openssl_bindir = FitImageTestCase._setup_native('openssl-native')
+        openssl_path = os.path.join(openssl_bindir, 'openssl')
+        for keyname in sign_keys:
+            oe.fitimage.generate_rsa_key(keydir, keyname, numbits, genrsa_args, req_args, sign_pkcs, openssl_path)
 
     @staticmethod
     def _gen_random_file(file_path, num_bytes=65536):
@@ -367,8 +375,7 @@ class FitImageTestCase(OESelftestTestCase):
         # Verify the FIT image
         self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
 
-
-class KernelFitImageTests(FitImageTestCase):
+class KernelFitImageBase(FitImageTestCase):
     """Test cases for the kernel-fitimage bbclass"""
 
     def _fit_get_bb_vars(self, additional_vars=[]):
@@ -677,6 +684,8 @@ class KernelFitImageTests(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
+class KernelFitImageTests(KernelFitImageBase):
+    """Test cases for the kernel-fitimage bbclass"""
 
     def test_fit_image(self):
         """
@@ -922,6 +931,142 @@ FIT_HASH_ALG = "sha256"
         bb_vars = self._fit_get_bb_vars()
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
+        dtb_files = FitImageTestCase._get_dtb_files(bb_vars)
+        for dtb in dtb_files:
+            root_node.fitimage_emit_section_dtb("fdt-" + dtb, os.path.join("a-dir", dtb),
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
+        root_node.fitimage_emit_section_config()
+        root_node.write_its_file(fitimage_its_path)
+
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.logger.debug("Checking its: %s" % fitimage_its_path)
+        self._check_its_file(bb_vars, fitimage_its_path)
+
+    def _generate_rsa_keys(self, d):
+        sign_keydir = d.getVar('UBOOT_SIGN_KEYDIR')
+        sign_keyname = d.getVar('UBOOT_SIGN_KEYNAME')
+        sign_kc_path = os.path.join(sign_keydir, sign_keyname)
+        if not os.path.exists(sign_kc_path + '.key') or not os.path.exists(sign_kc_path + '.crt'):
+            self.logger.debug("Generating RSA private key and certificate for signing fitImage configurations")
+            oe.fitimage.generate_rsa_key(sign_keydir, sign_keyname,
+                d.getVar('FIT_SIGN_NUMBITS'), d.getVar('FIT_KEY_GENRSA_ARGS'),
+                d.getVar('FIT_KEY_REQ_ARGS'), d.getVar('FIT_KEY_SIGN_PKCS'))
+
+        if oe.types.boolean(d.getVar('FIT_SIGN_INDIVIDUAL')):
+            sign_img_keyname = d.getVar('UBOOT_SIGN_IMG_KEYNAME')
+            sign_img_kc_path = os.path.join(sign_keydir, sign_img_keyname)
+            if not os.path.exists(sign_img_kc_path + '.key') or not os.path.exists(sign_img_kc_path + '.crt'):
+                self.logger.debug("Generating RSA private key and certificate for signing fitImage individual images")
+                oe.fitimage.generate_rsa_key(sign_keydir, sign_img_keyname,
+                    d.getVar('FIT_SIGN_NUMBITS'), d.getVar('FIT_KEY_GENRSA_ARGS'),
+                    d.getVar('FIT_KEY_REQ_ARGS'), d.getVar('FIT_KEY_SIGN_PKCS'))
+
+
+    def test_fitimage_py_default(self):
+        self._test_fitimage_py()
+
+    def test_fitimage_py_generate_keys_one(self):
+        """Test if generating one key works"""
+        with tempfile.TemporaryDirectory() as keydir:
+            keyname = "a-foo-key"
+            bb_vars = BbVarsMockGenKeys(keydir, "1", "1", keyname)
+            self._generate_rsa_keys(bb_vars)
+            self.assertExists(os.path.join(keydir, keyname + '.key'))
+            self.assertExists(os.path.join(keydir, keyname + '.crt'))
+            self.assertEqual(len(os.listdir(keydir)), 2)
+
+    def test_fitimage_py_generate_keys_two(self):
+        """Test if generating two keys as used with FIT_SIGN_INDIVIDUAL=1 works"""
+        with tempfile.TemporaryDirectory() as keydir:
+            keyname = "a-foo-config-key"
+            img_keyname = "a-foo-image-key"
+            bb_vars = BbVarsMockGenKeys(keydir, "1", "1", keyname, "1", img_keyname)
+            self._generate_rsa_keys(bb_vars)
+            self.assertExists(os.path.join(keydir, keyname + '.key'))
+            self.assertExists(os.path.join(keydir, keyname + '.crt'))
+            self.assertExists(os.path.join(keydir, img_keyname + '.key'))
+            self.assertExists(os.path.join(keydir, img_keyname + '.crt'))
+            self.assertEqual(len(os.listdir(keydir)), 4)
 
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
-- 
2.49.0


