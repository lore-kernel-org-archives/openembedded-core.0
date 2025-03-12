Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8218EC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:51:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.1600.1741801870922364075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 10:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fYXswTUs;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390fdaf2897so121006f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 10:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741801869; x=1742406669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUXZB0uAh2SqXzy14iZAG6onqPOB9rIG6ggcRyrW0w8=;
        b=fYXswTUsJOlmMoiXvdiy/r+M7K4HESdvrdplZ85ns55Fdwy6HFQD3F9hOL+TF0Kxfv
         05J2+T65ZfrGp9GrdeS+YF2zIYJtLBaAm0kpadzAQiUbr3nxNRGPwhSgEo91R27HCwx0
         flDc6EG6i4xbjFcOsD0Xz69KCO1YpoIcheDG3jC/V4WlrQ7TZx1s/ZzKKSsiz/Gd/VUU
         jFHYLYQVdLp989ACh+CKhkOWl2/lK3dlWC7CXUWkSdHn0sNNLmj57GzT1F2dTAmwL84X
         bCSiPIbRH/K764SGt46Qp0g/fHpHkPr3JkZ2jfI2soFpawdTGM/CsQtbl+t4/CHZD2tf
         Mn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801869; x=1742406669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUXZB0uAh2SqXzy14iZAG6onqPOB9rIG6ggcRyrW0w8=;
        b=bgIhb5UiNWilKVkLEbpJpV+7pUiW2pMj81jhG1UtiUkZNyYBfrW7NSOcq33GoRXUxg
         VfIqHlwZwpDGynRDkWx8P5cle6pyTinr30stJKUGvGir7ZHfFhhs/CfSGJuWPmnzf5YI
         1cxGBU0Oa7uTZc+w2rIHuC+5TUUECjC/lWMggHEN4PGqSga6PEprLbzDlk6KB/YGkllm
         Kmx4XoHelzCTTBV8n1d7yWTgaJvLjSovRDadH8nnWyh7wA29Jjqlg1B0fAuW8kj3mpl1
         HJDuHAabk2raHKJV5Yy4cMCi4yiPnfkt1KwTXtBE1Zdl+MPOhqBXdCX+G5bCh3eH5Xh8
         M5AA==
X-Gm-Message-State: AOJu0YwiSPYnzleURR+CMesfVH4UCtRtgEEVfyqTuX7bP1A8jnWGGgl9
	zdBqzIE+iNfGWzA70cJixvdzHG4AaJBIJE0nBd1y0UkM7MWtrVOBEoYhbA==
X-Gm-Gg: ASbGncta/R/sXIbmMyLtHmLn5st9QPNBjhR8xAwvVpauJhyV/w1RcsPGSzMD4BtoO1o
	uKuPW5eTsIrfQ6yUHzUx3+CTbUYVpIo5fIHea2IqTABkJ6tqOJ14z3HtgW2LVWYuBe8V4Nn59m5
	7U/deJ3uCUXhdOlEwpJ8OzIHh/Ad+X3goieNkH7rLe7ughoITBZSvoQnoSxNqN07oJhuz3l1GOT
	cSZ+0A7662IFkiRGSCWdgdU5i8hvbYcTSdttrOpX6ilfGkR9Ti14wnOtYu85sIfUQcsZt0Xwziz
	aQ+N99ikkqO6TsDEr8HvhmBOkzCvhO+xWAoGDUiPFarxFR4tqotP9UdDuz/CC9lgf1g=
X-Google-Smtp-Source: AGHT+IEDGvNBfssUG8KCMJgs4jSz18Huu8zJmZ0sFlgBBZLSmPJ4y/7vU5CLC6e2KdsuQDMuIJwJUA==
X-Received: by 2002:a5d:64c7:0:b0:391:11b:c7e9 with SMTP id ffacd0b85a97d-39132d6011emr21652756f8f.28.1741801868822;
        Wed, 12 Mar 2025 10:51:08 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdff57sm22136171f8f.37.2025.03.12.10.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:51:08 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oe-selftest: fitimage add more u-boot tests
Date: Wed, 12 Mar 2025 18:50:56 +0100
Message-ID: <20250312175056.1295538-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 17:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212662

Add two test cases which check that the device-tree of u-boot contains
the public keys which are required for checking the signature of the
kernel FIT image at run-time.
One test case checks the configuration where only the configuration
nodes of the kernel FIT image are signed.
The other test case checks the configuration with two keys and signed
image and signed configuration nodes.

This is the use case which recently broke with commit:
  OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e
               u-boot: kernel-fitimage: Fix dependency loop if
               UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
and got fixed with commit
  OE-Core rev: 0106e5efab99c8016836a2ab71e2327ce58a9a9d
               u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1"
               behavior

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 121 +++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 721628d8e73..212863a69a3 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
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
@@ -1349,3 +1365,108 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
         FitImageTestCase._gen_random_file(dummy_tee)
 
         self._test_fitimage(bb_vars)
+
+
+    def _test_sign_uboot_kernel(self, individual):
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
+        # Generate a configuration section which gets included into the local.conf file
+        config = """
+# Enable creation of fitImage
+MACHINE = "beaglebone-yocto"
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_SIGN_KEYNAME = "the-kernel-config-key"
+UBOOT_SIGN_IMG_KEYNAME = "the-kernel-image-key"
+UBOOT_MKIMAGE_DTCOPTS="-I dts -O dtb -p 2000"
+FIT_SIGN_INDIVIDUAL = "%s"
+""" % individual
+        self.write_config(config)
+
+        # Retrieve some variables from bitbake
+        bb_vars = self._fit_get_bb_vars([
+            'FIT_HASH_ALG',
+            'FIT_KEY_GENRSA_ARGS',
+            'FIT_KEY_REQ_ARGS',
+            'FIT_KEY_SIGN_PKCS',
+            'FIT_SIGN_ALG',
+            'FIT_SIGN_INDIVIDUAL',
+            'FIT_SIGN_NUMBITS',
+            'UBOOT_DTB_IMAGE',
+            'UBOOT_SIGN_ENABLE',
+            'UBOOT_SIGN_IMG_KEYNAME',
+            'UBOOT_SIGN_KEYDIR',
+            'UBOOT_SIGN_KEYNAME',
+        ])
+
+        # Using a static key. FIT_GENERATE_KEYS = "1" does not work without kernel-fitimage.bbclass
+        self._gen_signing_key(bb_vars)
+
+        bitbake("virtual/bootloader")
+
+        uboot_dtb_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], bb_vars['UBOOT_DTB_IMAGE'])
+
+        # Setup u-boot-tools-native
+        dtc_bindir = FitImageTestCase._setup_native('dtc-native')
+
+        # Check if 1 or 2 signature sections are in the DBP.
+        uboot_sign_img_keyname = bb_vars['UBOOT_SIGN_IMG_KEYNAME']
+        key_dtb_path = "/signature/key-" + uboot_sign_img_keyname
+        algo = "%s,%s" % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG'])
+        if bb_vars['FIT_SIGN_INDIVIDUAL'] == "1":
+            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "required", "image")
+            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "algo", algo)
+            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "key-name-hint", uboot_sign_img_keyname)
+        else:
+            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "required", "image", True)
+
+        uboot_sign_keyname = bb_vars['UBOOT_SIGN_KEYNAME']
+        key_dtb_path = "/signature/key-" + uboot_sign_keyname
+        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "required", "conf")
+        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "algo", algo)
+        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "key-name-hint", uboot_sign_keyname)
+
+
+    def test_sign_uboot_kernel_configurations(self):
+        """
+        Summary:     Check if the device-tree from U-Boot has the public key
+                     for verifying the kernel FIT image created by the
+                     kernel-fitimage.bbclass included.
+                     This test sets: FIT_SIGN_INDIVIDUAL = "0"
+        Expected:    There is only one signature node which is required for
+                     the verification of the configuration section.
+        """
+        self._test_sign_uboot_kernel("0")
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
+        self._test_sign_uboot_kernel("1")
-- 
2.48.1


