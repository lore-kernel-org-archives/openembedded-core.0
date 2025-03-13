Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBD4C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:49:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.22953.1741891775800025839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 11:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHg1g2XT;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-394780e98easo896907f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741891774; x=1742496574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=snTQ/gbD4tB4FsMsylS97MNYU0fiB2g2Bq8lg5Q8qp0=;
        b=FHg1g2XTRdaLV220POTrTtZxh6+819G7M7m1lWqnnegGFhOSTCUQV7W+gcMJA/PISD
         +CTKC+FjHAMD2TNoa0RZ1KCUS19t6lm24DIGlgQWVQXPjz+K80R9H9g4MYFD+aJD/+r4
         uVUlPyvsBRmuN4zFV7B08mE3tLosb6a2hmFnXefwSxnhULcNKn0QyFbS5YPGhELONaCO
         nSKS3aL/YSMzGk6L+3nhOt1qg4rwgffiEJWFihz4s9NDw0rR9SKqDizfREbhvbiPXm5P
         mgIgq2JVtgkluaGqJpuWupUCj/ppUsFRh75CEfTQB31+DrvVHJp0m7TPg+6Edr4+lrU/
         mqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741891774; x=1742496574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snTQ/gbD4tB4FsMsylS97MNYU0fiB2g2Bq8lg5Q8qp0=;
        b=HTpqcd2+D6vv2sX03ndt4+EkslYRTn9hfXzDC7nZskKqVdb9hoHjcEiz9XslI83h88
         WEfvI44t8qqIkawGx+QCYjPYVre/ktPqKyZDTGJSalzH6cNH+bnCDFzhu1tAHcYz7EUQ
         xDm5UEovT/BvTxjSEwvFLszaPMEkW6JIWhjbtG2WRolyxziBImbScujYScV4ItsNTQdm
         gZ2ESIA4CJQZvej/I0hQdLTPU4sUA0ZexT4B+kZJtNVDyXb6ysVE99tMeWgRAflGa6dR
         65XEJI4pl8diL+hNJBpjHlV+TYPCCa0RoHP7Z+78M/lEXdNfsD/mOJTI+XWw1GlUt2yc
         lYyA==
X-Gm-Message-State: AOJu0YzC4+66TMvFgRM79l6HGZiLFB8T2Ov46J+dY16ROKq7Y4AC13me
	BXYfxVVTmDbFtQvIMPyJspOZm88axL6Bu11C9Tx8RBhFP6wPIB98HCjHBA==
X-Gm-Gg: ASbGncvQLtlMi7lzDXYtrJ3yHtNr92KBegnfMGgKnAIRr/OS6OFJTodYdaU4xbOq/aW
	/dfx/8WrSlASwY5CfnNaFOj+aTxcB2tQzKzUD4iZjsWicUQIpFccsV0T5Y66rIDq1nWSvuTck0z
	Yx2S+MmBaiAKf/r8u2C8FcKm9CYDz0ulFNmnwHRjramdcEy9zgOsYYviQr8/9RpwKsWZUydFN7T
	87FLUoe6c07e/gd0RNMsq7tMn+M7pjBuRCwTavPfUou5BIgVticlvoyqgvb86d8Q2aCa9EoxH/1
	sU7azP+DKQVH8cp1cA5lYH/XzIq8QVfHY4QPCEViXBoVcnv4XV9ZZPSFxJyEGAcwUlA=
X-Google-Smtp-Source: AGHT+IE5rQIm/DXAL/dMkxJdWdzknW1SZrbBzjbddT5eVnj4HyWDPorRfCGUS/WTG7i7nmV8oCkKjQ==
X-Received: by 2002:a05:6000:18a7:b0:391:481a:5e75 with SMTP id ffacd0b85a97d-396c1c26b14mr724296f8f.22.1741891773560;
        Thu, 13 Mar 2025 11:49:33 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975bdfsm2912056f8f.49.2025.03.13.11.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:49:33 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2] oe-selftest: fitimage add more u-boot tests
Date: Thu, 13 Mar 2025 19:49:26 +0100
Message-ID: <20250313184926.2605982-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 18:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212803

Add a new test function which checks that the device-tree of U-Boot
contains the public keys which are required for checking the signature
of the kernel FIT image at run-time.

Use this new _check_kernel_dtb function in the existing
test_sign_cascaded_uboot_fit_image test case which already creates a
build configuration with UBOOT_SIGN_ENABLE = "1" and keys for the kernel.
But so far there was no check that the keys for the kernel verification
got added to U-Boot's DTB.
This test case checks the configuration where only the configuration
nodes of the kernel FIT image are signed.

A new test case test_sign_uboot_kernel_individual checks the
configuration with two keys and signed image and signed configuration
nodes.
This test case covers the use case which recently broke with commit:
  OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e
               u-boot: kernel-fitimage: Fix dependency loop if
               UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
and got fixed with commit
  OE-Core rev: 0106e5efab99c8016836a2ab71e2327ce58a9a9d
               u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1"
               behavior

This patch also fixes a few more details:
- Use the get function to access the bb_var dicts where appropriate.
- log bb_vars if oe-selftest is called with -v
- Simplify the code by moving all the U-Boot related variables to the
  _fit_get_bb_vars function.
- Do not set FIT_GENERATE_KEYS = "1" without inheriting the
  kernel-fitimage.bbclass which handles this variable.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 130 ++++++++++++++++++++---
 1 file changed, 118 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 721628d8e73..d79c8cf321a 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -56,10 +56,10 @@ class FitImageTestCase(OESelftestTestCase):
         # Define some variables which are usually defined by the kernel-fitimage.bbclass.
         # But for testing purpose check if the uboot-sign.bbclass is independent from
         # the kernel-fitimage.bbclass
-        fit_sign_numbits = bb_vars['FIT_SIGN_NUMBITS'] or "2048"
-        fit_key_genrsa_args = bb_vars['FIT_KEY_GENRSA_ARGS'] or "-F4"
-        fit_key_req_args =  bb_vars['FIT_KEY_REQ_ARGS'] or "-batch -new"
-        fit_key_sign_pkcs = bb_vars['FIT_KEY_SIGN_PKCS'] or "-x509"
+        fit_sign_numbits = bb_vars.get('FIT_SIGN_NUMBITS') or "2048"
+        fit_key_genrsa_args = bb_vars.get('FIT_KEY_GENRSA_ARGS') or "-F4"
+        fit_key_req_args =  bb_vars.get('FIT_KEY_REQ_ARGS') or "-batch -new"
+        fit_key_sign_pkcs = bb_vars.get('FIT_KEY_SIGN_PKCS') or "-x509"
 
         uboot_sign_keydir = bb_vars['UBOOT_SIGN_KEYDIR']
         sign_keys = [bb_vars['UBOOT_SIGN_KEYNAME']]
@@ -112,6 +112,22 @@ class FitImageTestCase(OESelftestTestCase):
         self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
         self.assertIn("Signature check OK", result.output)
 
+    def _verify_dtb_property(self, dtc_bindir, dtb_path, node_path, property_name, req_property, absent=False):
+        """Verify device tree properties
+
+        The fdtget utility from ftc-native is called and the property is compared.
+        """
+        fdtget_path = os.path.join(dtc_bindir, 'fdtget')
+        cmd = '%s %s %s %s' % (fdtget_path, dtb_path, node_path, property_name)
+        if absent:
+            result = runCmd(cmd, ignore_status=True)
+            self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
+            self.assertIn("FDT_ERR_NOTFOUND", result.output)
+        else:
+            result = runCmd(cmd)
+            self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
+            self.assertEqual(req_property, result.output.strip())
+
     @staticmethod
     def _find_string_in_bin_file(file_path, search_string):
         """find strings in a binary file
@@ -145,7 +161,7 @@ class FitImageTestCase(OESelftestTestCase):
 
     @staticmethod
     def _get_dtb_files(bb_vars):
-        kernel_devicetree = bb_vars['KERNEL_DEVICETREE'] or ""
+        kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE') or ""
         if kernel_devicetree:
             return [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
         return []
@@ -281,7 +297,6 @@ class FitImageTestCase(OESelftestTestCase):
                     key = key.strip()
                     value = value.strip()
                 except ValueError as val_err:
-                    self.logger.debug("dumpimage debug: %s = %s" % (key, line))
                     # Handle multiple entries as e.g. for Loadables as a list
                     if key and line.startswith("   "):
                         value = sections[in_section][key] + "," + line.strip()
@@ -377,6 +392,7 @@ class KernelFitImageTests(FitImageTestCase):
             'UBOOT_SIGN_KEYNAME',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/kernel")
+        self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
     def _config_add_uboot_env(self, config):
@@ -877,12 +893,20 @@ class UBootFitImageTests(FitImageTestCase):
         """
         internal_used = {
             'DEPLOY_DIR_IMAGE',
+            'FIT_HASH_ALG',
+            'FIT_KEY_GENRSA_ARGS',
+            'FIT_KEY_REQ_ARGS',
+            'FIT_KEY_SIGN_PKCS',
+            'FIT_SIGN_ALG',
+            'FIT_SIGN_INDIVIDUAL',
+            'FIT_SIGN_NUMBITS',
             'MACHINE',
             'SPL_MKIMAGE_SIGN_ARGS',
             'SPL_SIGN_ENABLE',
             'SPL_SIGN_KEYNAME',
             'UBOOT_ARCH',
             'UBOOT_DTB_BINARY',
+            'UBOOT_DTB_IMAGE',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
@@ -898,9 +922,13 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_USER_SETTINGS',
             'UBOOT_FITIMAGE_ENABLE',
             'UBOOT_NODTB_BINARY',
+            'UBOOT_SIGN_ENABLE',
             'UBOOT_SIGN_IMG_KEYNAME',
+            'UBOOT_SIGN_KEYDIR',
+            'UBOOT_SIGN_KEYNAME',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/bootloader")
+        self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
     def _bitbake_fit_image(self, bb_vars):
@@ -1082,6 +1110,50 @@ class UBootFitImageTests(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
+    def _check_kernel_dtb(self, bb_vars):
+        """
+        Check if the device-tree from U-Boot has the kernel public key(s).
+
+        The concat_dtb function of the uboot-sign.bbclass injects the public keys
+        which are required for verifying the kernel at run-time into the DTB from
+        U-Boot. The following example is from a build with FIT_SIGN_INDIVIDUAL
+        set to "1". If it is set to "0" the key-the-kernel-image-key node is not
+        present.
+        / {
+            ...
+            signature {
+                key-the-kernel-image-key {
+                required = "image";
+                algo = "sha256,rsa2048";
+                ...
+            };
+            key-the-kernel-config-key {
+                required = "conf";
+                algo = "sha256,rsa2048";
+                ...
+            };
+        };
+        """
+        # Setup u-boot-tools-native
+        dtc_bindir = FitImageTestCase._setup_native('dtc-native')
+
+        # Check if 1 or 2 signature sections are in the DTB.
+        uboot_dtb_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], bb_vars['UBOOT_DTB_IMAGE'])
+        algo = "%s,%s" % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG'])
+        if bb_vars['FIT_SIGN_INDIVIDUAL'] == "1":
+            uboot_sign_img_keyname = bb_vars['UBOOT_SIGN_IMG_KEYNAME']
+            key_dtb_path = "/signature/key-" + uboot_sign_img_keyname
+            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "required", "image")
+            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "algo", algo)
+            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "key-name-hint", uboot_sign_img_keyname)
+
+        uboot_sign_keyname = bb_vars['UBOOT_SIGN_KEYNAME']
+        key_dtb_path = "/signature/key-" + uboot_sign_keyname
+        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "required", "conf")
+        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "algo", algo)
+        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "key-name-hint", uboot_sign_keyname)
+
+
     def test_uboot_fit_image(self):
         """
         Summary:     Check if Uboot FIT image and Image Tree Source
@@ -1174,9 +1246,9 @@ UBOOT_FIT_HASH_ALG = "sha256"
                         via UBOOT_FIT_GENERATE_KEYS)
                      3) Dumping the FIT image indicates signature values
                         are present
-                     4) Examination of the do_uboot_assemble_fitimage
-                     runfile/logfile indicate that UBOOT_MKIMAGE, UBOOT_MKIMAGE_SIGN
-                     and SPL_MKIMAGE_SIGN_ARGS are working as expected.
+                     4) Examination of the do_uboot_assemble_fitimage that
+                     UBOOT_MKIMAGE, UBOOT_MKIMAGE_SIGN and SPL_MKIMAGE_SIGN_ARGS
+                     are working as expected.
         Product:     oe-core
         Author:      Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> based upon
                      work by Paul Eggleton <paul.eggleton@microsoft.com> and
@@ -1206,15 +1278,17 @@ UBOOT_EXTLINUX = "0"
 UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
 UBOOT_SIGN_ENABLE = "1"
-FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
 UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
-FIT_SIGN_INDIVIDUAL = "1"
 """
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
+
+        # Using a static key. FIT_GENERATE_KEYS = "1" does not work without kernel-fitimage.bbclass
+        self._gen_signing_key(bb_vars)
+
         self._test_fitimage(bb_vars)
+        self._check_kernel_dtb(bb_vars)
 
     def test_uboot_atf_tee_fit_image(self):
         """
@@ -1349,3 +1423,35 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
         FitImageTestCase._gen_random_file(dummy_tee)
 
         self._test_fitimage(bb_vars)
+
+
+    def test_sign_uboot_kernel_individual(self):
+        """
+        Summary:     Check if the device-tree from U-Boot has two public keys
+                     for verifying the kernel FIT image created by the
+                     kernel-fitimage.bbclass included.
+                     This test sets: FIT_SIGN_INDIVIDUAL = "1"
+        Expected:    There must be two signature nodes. One is required for
+                     the individual image nodes, the other is required for the
+                     verification of the configuration section.
+        """
+        config = """
+# Enable creation of fitImage
+MACHINE = "beaglebone-yocto"
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_SIGN_KEYNAME = "the-kernel-config-key"
+UBOOT_SIGN_IMG_KEYNAME = "the-kernel-image-key"
+UBOOT_MKIMAGE_DTCOPTS="-I dts -O dtb -p 2000"
+FIT_SIGN_INDIVIDUAL = "1"
+"""
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+
+        # Using a static key. FIT_GENERATE_KEYS = "1" does not work without kernel-fitimage.bbclass
+        self._gen_signing_key(bb_vars)
+
+        bitbake("virtual/bootloader")
+
+        # Just check the DTB of u-boot since there is no u-boot FIT image
+        self._check_kernel_dtb(bb_vars)
-- 
2.48.1


