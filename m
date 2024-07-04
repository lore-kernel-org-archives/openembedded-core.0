Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACC9C41513
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.5043.1720077023634939455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEcTtxM7;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4256aee6e4dso1886305e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077022; x=1720681822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4kYEv4+Ia1Yc0EMof7AFIkGmXmCTtrt6tBMU0SZbM0=;
        b=OEcTtxM7me8INfVbHhDcwk27XByj4yVCNMxKzIy/IoYaTGN+ODPDz0Yez/7MJSfLNN
         IkxLPMQkWputkYclbhaZZ6BnzKPz5RRlib+n1R2ridYP8tCbv75TJbTDDLcCiI2k8IOL
         Ehk7eKwNJFsVOLJGKbDDxwClhwhW3ol2fvOD+uSqOLVwUnonjZem/xY74PynZ1wIZ4eN
         /StZAgv6x2ViQhXE7fM2rhNL3FpzPMdTbwZtI3YXgRhuMiUJN4tewcpq8Tl6RsNL/chQ
         9yB/sqjH9fdp5HTM5tc+NSxfsfesl/MZ+TAi4xiwvS2jD/EFNSaoUSDTkC13eAbL2rSr
         nRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077022; x=1720681822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4kYEv4+Ia1Yc0EMof7AFIkGmXmCTtrt6tBMU0SZbM0=;
        b=j3XqKnzk/iRRKoEZGCzdwLKocS+QxRKOhImn7lzliLQkxEJDktZzkSb+cgkrDX+WK6
         w4ZpeqYhGEqhsYAgVskHR1GQFxwwVOVZoWr6J9lFidREsrm1lFtOQ5l4NSSWVogtrZ86
         C8llnG4CjTiBNQFhyyu6pjC0wZLWF+LD1IZxs+VYPoVC8S3I4XfR6o9FUgOmwcUUA1R0
         QYVJbdbDry+Gu62L88yU6ke/AULqDUtY53c878dC9KulTBzR3laaNca5paTb+rUzOKtH
         1QV96h1rOJoq3CqF2/iQ/IMda/wjqzsMZsx7gtTWRDm5aWtRP8iZZ9ehqrREdfePwSbW
         48CQ==
X-Gm-Message-State: AOJu0YwbRrDlX9LmCjNfTIsNIevd7sOfL3D01YjP6juBORpKmznI70LM
	EoSL2rn57gC6EXcpUM8ULMT8IhVZp+J2/UBE50o5bMKKwMYjXvp6OihHOA==
X-Google-Smtp-Source: AGHT+IGMlB9NdD1cGVCNccFSV9ZvAMhINOQ4Dv4Dw6nbi+z1UR1p0U1BxP0Cq6hbTPJGTdK4NbiaaQ==
X-Received: by 2002:a05:600c:4616:b0:424:eeca:6bd0 with SMTP id 5b1f17b1804b1-4264a3d76ccmr5206995e9.13.1720077021651;
        Thu, 04 Jul 2024 00:10:21 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:21 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 03/14] oe-selftest: fitimage drop test-mkimage-wrapper
Date: Thu,  4 Jul 2024 09:09:39 +0200
Message-ID: <20240704071013.2982700-4-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201508

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Rather than writing hints into log files and verify the hints can be
found, the tests should verify that the artifacts in the deploy folder
are correctly signed. This is a much better test.
u-boot-tools provide a utility fit_check_sign which can verify the
signatures in fit images. Lets use it.

grepping in temp/run. or temp/log. files also does not work if the tasks
runs from sstate and the corresponding run file is not even generated.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../classes/test-mkimage-wrapper.bbclass      |  19 ---
 meta/lib/oeqa/selftest/cases/fitimage.py      | 118 ++++++++++++------
 2 files changed, 77 insertions(+), 60 deletions(-)
 delete mode 100644 meta-selftest/classes/test-mkimage-wrapper.bbclass

diff --git a/meta-selftest/classes/test-mkimage-wrapper.bbclass b/meta-selftest/classes/test-mkimage-wrapper.bbclass
deleted file mode 100644
index 7c98d7b71e4..00000000000
--- a/meta-selftest/classes/test-mkimage-wrapper.bbclass
+++ /dev/null
@@ -1,19 +0,0 @@
-# Class to test UBOOT_MKIMAGE and UBOOT_MKIMAGE_SIGN
-# (in conjunction with kernel-fitimage.bbclass)
-#
-# SPDX-License-Identifier: MIT
-#
-
-UBOOT_MKIMAGE = "test_mkimage_wrapper"
-UBOOT_MKIMAGE_SIGN = "test_mkimage_signing_wrapper"
-
-test_mkimage_wrapper() {
-    echo "### uboot-mkimage wrapper message"
-    uboot-mkimage "$@"
-}
-
-test_mkimage_signing_wrapper() {
-    echo "### uboot-mkimage signing wrapper message"
-    uboot-mkimage "$@"
-}
-
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 15baf3b2392..4891ac8010b 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -16,6 +16,46 @@ class FitImageTests(OESelftestTestCase):
         bitbake("u-boot-tools-native -c addto_recipe_sysroot")
         return get_bb_var('RECIPE_SYSROOT_NATIVE', 'u-boot-tools-native')
 
+    def _verify_fit_image_signature(self, uboot_tools_sysroot_native, fitimage_path, dtb_path, conf_name=None):
+        """Verify the signature of a fit contfiguration
+
+        The fit_check_sign utility from u-boot-tools-native is called.
+        uboot-fit_check_sign -f fitImage -k $dtb_name -c conf-$dtb_name
+        """
+        fit_check_sign_path = os.path.join(uboot_tools_sysroot_native, 'usr', 'bin', 'uboot-fit_check_sign')
+        cmd = '%s -f %s -k %s' % (fit_check_sign_path, fitimage_path, dtb_path)
+        if conf_name:
+            cmd += ' -c %s' % conf_name
+        result = runCmd(cmd)
+        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
+        self.assertIn("Signature check OK", result.output)
+
+    @staticmethod
+    def _find_string_in_bin_file(file_path, search_string):
+        """find stings in a binary file
+
+        Shell equivalent: strings "$1" | grep "$2" | wc -l
+        return number of matches
+        """
+        found_positions = 0
+        with open(file_path, 'rb') as file:
+            byte = file.read(1)
+            current_position = 0
+            current_match = 0
+            while byte:
+                char = byte.decode('ascii', errors='ignore')
+                if char == search_string[current_match]:
+                    current_match += 1
+                    if current_match == len(search_string):
+                        found_positions += 1
+                        current_match = 0
+                else:
+                    current_match = 0
+                current_position += 1
+                byte = file.read(1)
+        return found_positions
+
+
     def test_fit_image(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are built
@@ -113,19 +153,21 @@ FIT_DESC = "A model description"
         Author:      Paul Eggleton <paul.eggleton@microsoft.com> based upon
                      work by Usama Arif <usama.arif@arm.com>
         """
+        a_comment = "a smart comment"
         config = """
 # Enable creation of fitImage
 MACHINE = "beaglebone-yocto"
 KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage test-mkimage-wrapper "
+KERNEL_CLASSES = " kernel-fitimage "
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
 UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
-UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
-"""
+UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
+""" % a_comment
+
         self.write_config(config)
 
         # fitImage is created as part of linux recipe
@@ -227,17 +269,15 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
             value = values.get('Sign value', None)
             self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
 
-        # Check for UBOOT_MKIMAGE_SIGN_ARGS
-        result = runCmd('bitbake -e virtual/kernel | grep ^T=')
-        tempdir = result.output.split('=', 1)[1].strip().strip('')
-        result = runCmd('grep "a smart comment" %s/run.do_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN_ARGS value did not get used')
+        # Search for the string passed to mkimage: 1 kernel + 3 DTBs + config per DTB = 7 sections
+        # Looks like mkimage supports to add a comment but does not support to read it back.
+        found_comments = FitImageTests._find_string_in_bin_file(fitimage_path, a_comment)
+        self.assertEqual(found_comments, 7, "Expected 7 signed and commented section in the fitImage.")
 
-        # Check for evidence of test-mkimage-wrapper class
-        result = runCmd('grep "### uboot-mkimage wrapper message" %s/log.do_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE did not work')
-        result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
+        # Verify the signature for all configurations = DTBs
+        for dtb in ['am335x-bone.dtb', 'am335x-boneblack.dtb', 'am335x-bonegreen.dtb']:
+            self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path,
+                                             os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], dtb), 'conf-' + dtb)
 
     def test_uboot_fit_image(self):
         """
@@ -354,7 +394,6 @@ UBOOT_ENTRYPOINT = "0x80080000"
 UBOOT_FIT_DESC = "A model description"
 KERNEL_IMAGETYPES += " fitImage "
 KERNEL_CLASSES = " kernel-fitimage "
-INHERIT += "test-mkimage-wrapper"
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
@@ -428,6 +467,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
                      work by Paul Eggleton <paul.eggleton@microsoft.com> and
                      Usama Arif <usama.arif@arm.com>
         """
+        a_comment = "a smart U-Boot comment"
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
@@ -437,7 +477,6 @@ SPL_BINARY = "MLO"
 # The kernel-fitimage class is a dependency even if we're only
 # creating/signing the U-Boot fitImage
 KERNEL_CLASSES = " kernel-fitimage"
-INHERIT += "test-mkimage-wrapper"
 # Enable creation and signing of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE = "1"
@@ -449,17 +488,17 @@ UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
 UBOOT_ARCH = "arm"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
-SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
+SPL_MKIMAGE_SIGN_ARGS = "-c '%s'"
 UBOOT_EXTLINUX = "0"
 UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
-"""
+""" % a_comment
+
         self.write_config(config)
 
         # The U-Boot fitImage is created as part of the U-Boot recipe
         bitbake("virtual/bootloader")
 
-        image_type = "core-image-minimal"
         deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
         machine = get_bb_var('MACHINE')
         fitimage_its_path = os.path.join(deploy_dir_image,
@@ -543,16 +582,14 @@ UBOOT_FIT_HASH_ALG = "sha256"
             self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
 
         # Check for SPL_MKIMAGE_SIGN_ARGS
-        result = runCmd('bitbake -e virtual/bootloader | grep ^T=')
-        tempdir = result.output.split('=', 1)[1].strip().strip('')
-        result = runCmd('grep "a smart U-Boot comment" %s/run.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'SPL_MKIMAGE_SIGN_ARGS value did not get used')
+        # Looks like mkimage supports to add a comment but does not support to read it back.
+        found_comments = FitImageTests._find_string_in_bin_file(fitimage_path, a_comment)
+        self.assertEqual(found_comments, 2, "Expected 2 signed and commented section in the fitImage.")
+
+        # Verify the signature
+        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path,
+                                         os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
 
-        # Check for evidence of test-mkimage-wrapper class
-        result = runCmd('grep "### uboot-mkimage wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE did not work')
-        result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
 
     def test_sign_cascaded_uboot_fit_image(self):
         """
@@ -574,6 +611,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
                      work by Paul Eggleton <paul.eggleton@microsoft.com> and
                      Usama Arif <usama.arif@arm.com>
         """
+        a_comment = "a smart cascaded U-Boot comment"
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
@@ -589,7 +627,7 @@ UBOOT_DTB_BINARY = "u-boot.dtb"
 UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
-UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart cascaded Kernel comment'"
+UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
 UBOOT_ARCH = "arm"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
@@ -599,20 +637,18 @@ UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
 KERNEL_IMAGETYPES += " fitImage "
 KERNEL_CLASSES = " kernel-fitimage "
-INHERIT += "test-mkimage-wrapper"
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
 UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
-"""
+""" % a_comment
         self.write_config(config)
 
         # The U-Boot fitImage is created as part of the U-Boot recipe
         bitbake("virtual/bootloader")
 
-        image_type = "core-image-minimal"
         deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
         machine = get_bb_var('MACHINE')
         fitimage_its_path = os.path.join(deploy_dir_image,
@@ -696,17 +732,13 @@ FIT_SIGN_INDIVIDUAL = "1"
             self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
 
         # Check for SPL_MKIMAGE_SIGN_ARGS
-        result = runCmd('bitbake -e virtual/bootloader | grep ^T=')
-        tempdir = result.output.split('=', 1)[1].strip().strip('')
-        result = runCmd('grep "a smart cascaded U-Boot comment" %s/run.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'SPL_MKIMAGE_SIGN_ARGS value did not get used')
-
-        # Check for evidence of test-mkimage-wrapper class
-        result = runCmd('grep "### uboot-mkimage wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE did not work')
-        result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
-        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
+        # Looks like mkimage supports to add a comment but does not support to read it back.
+        found_comments = FitImageTests._find_string_in_bin_file(fitimage_path, a_comment)
+        self.assertEqual(found_comments, 2, "Expected 2 signed and commented section in the fitImage.")
 
+        # Verify the signature
+        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path,
+                                         os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
 
 
     def test_initramfs_bundle(self):
@@ -843,3 +875,7 @@ FIT_HASH_ALG = "sha256"
 
             test_passed = True
             self.assertTrue(test_passed == True,"Initramfs bundle test success")
+
+        # Verify the signature
+        uboot_tools_sysroot_native = self._setup_uboot_tools_native()
+        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path, os.path.join(deploy_dir_image, 'am335x-bone.dtb'))
-- 
2.45.2


