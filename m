Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE58FC54EDA
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:28 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.44374.1747993341128759349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=F10sllh7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20250523094219c606fc26dd2e1c1279-drgy0s@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250523094219c606fc26dd2e1c1279
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PhjmjClip/o9NSERA8G8Yw12V2dNnYUM3Z5JT3Tffhc=;
 b=F10sllh7Tx00z2awY2qC6umcD6avj6/NKyIJ0oa/mffdCv5xKhGLf58UfRBGTY9r7c2xkc
 3P+AkPEDW56ldogGX6H8tE43dsUYcQ16Ve5p+OACfhPv514aHhnqd9IB3AKnrtRAbi/LNMCQ
 9FnA5WGc2bixx4MODX4LBUejLoQ3bMT6CvnTBcIRWhUUR3s7cMTqPVB5hddPoysoZbZ66TE+
 hnIYLghEqsEIJ3hxrE6SgPt5UNnRWoGU266JMKjSMY+Z/bAgYUrMC1u/PqJ5YueM4a2YQtCN
 xGRghGBJ49I6TAuuYADoIY4pEjlQ9HMtAC7DsiuicRBZUZKMbKf2BSLA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 10/17] oe-selftest: fitimage add tests for fitimage.py
Date: Fri, 23 May 2025 11:41:11 +0200
Message-ID: <20250523094152.727177-11-adrian.freihofer@siemens.com>
In-Reply-To: <20250523094152.727177-1-adrian.freihofer@siemens.com>
References: <20250523094152.727177-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217188

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Having the FIT image generator code as a separate class, which is
essentially independent of BitBake, also allows testing the code
separately from BitBake. Take advantage of this enables testing more
use cases with significantly faster tests.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 145 ++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 47fb8534b37..d9d1211b074 100644
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
@@ -85,6 +108,25 @@ class FitImageTestCase(OESelftestTestCase):
                 sing_key_path
             ))
 
+    @staticmethod
+    def generate_rsa_key(keydir, keyname, numbits, genrsa_args, req_args, sign_pkcs, openssl_path="openssl"):
+        sing_key_path = os.path.join(keydir, keyname)
+        if not os.path.isdir(keydir):
+            os.makedirs(keydir)
+        runCmd("%s genrsa %s -out %s.key %s" % (
+            openssl_path,
+            genrsa_args,
+            sing_key_path,
+            numbits
+        ))
+        runCmd("%s req %s %s -key %s.key -out %s.crt" % (
+            openssl_path,
+            req_args,
+            sign_pkcs,
+            sing_key_path,
+            sing_key_path
+        ))
+
     @staticmethod
     def _gen_random_file(file_path, num_bytes=65536):
         with open(file_path, 'wb') as file_out:
@@ -367,8 +409,7 @@ class FitImageTestCase(OESelftestTestCase):
         # Verify the FIT image
         self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
 
-
-class KernelFitImageTests(FitImageTestCase):
+class KernelFitImageBase(FitImageTestCase):
     """Test cases for the kernel-fitimage bbclass"""
 
     def _fit_get_bb_vars(self, additional_vars=[]):
@@ -683,6 +724,8 @@ class KernelFitImageTests(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
+class KernelFitImageTests(KernelFitImageBase):
+    """Test cases for the kernel-fitimage bbclass"""
 
     def test_fit_image(self):
         """
@@ -928,6 +971,100 @@ FIT_HASH_ALG = "sha256"
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
+    def test_fitimage_py_default(self):
+        self._test_fitimage_py()
+
 
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
-- 
2.49.0


