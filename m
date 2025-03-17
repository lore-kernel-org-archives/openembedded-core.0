Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A2FC35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:12:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.50849.1742213531011995958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JsvIq3bu;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f2f391864so2459066f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742213526; x=1742818326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSZby/vbcfVc0JSVGWVKpoMq1QpuvPTvg4Z6bgxhgWU=;
        b=JsvIq3burzOhDqsDvizWK8fNMhHJnvb5Fvi7ilsC1FwKo/TGnIvcJfVUrdtR86Gh5n
         Ha+npV0BCKcbua4G6h42sfhjG/IO/7C+4FjUJCIEMMVF3NEHUJajgLo9wFyFS8Z6mmx0
         7eO4ZAw5cecZm7xTdXzU7L3i4qBmLefyAHA4yr/eMs/CJcTSPAnJtjvwzsR2AbsBrVAh
         Dhfy21dUgx+YK3UJX77p+i7uwhlX1KTDsHKF1GOUTWI8CclpmUWRyI5qAm/YZpTvUCmQ
         Kggq4gCxi/ThVrO7RfMlHgO+H7xefumHfBKgnT5lf9/fbTHaENTvef/cUZamjuQB1JVX
         PDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213526; x=1742818326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSZby/vbcfVc0JSVGWVKpoMq1QpuvPTvg4Z6bgxhgWU=;
        b=UcoW1gi+2G8LkfJ+maHPy6zg5wKFnybUOuGJ4TBHoOy4naf8TZfm6iDwYWcvLO7EpH
         mECALbCyXSxJik6SW6fL5inPlE/ZQD3TtfHIMqF2eORIdITDD+UTvPGCy4asHkvl6Yzo
         piW57oYadK1pvqzAaG4Ld1EAZxhYHUts11Rm/hlAfYvONGvBmp2+suCAXH+6r7vr9X60
         n/yrqevIFrF9IO5v4ud/7e+TnJJG7RT8gWaZ2qvobjYaA34pwsn+Pk0WbLN3XG9PzdMu
         QUtX8rZikAd7OX/gbMcB+il77KFsmcr8IyQ8bYe10PvyEmsu9VGqAPrQDqGMupWH26sn
         tgyg==
X-Gm-Message-State: AOJu0Yx71X3wI1gSqssh4Xj6KjMSEPe1WLJRC+7r464LfHooaHK5Lomm
	d7TmbDWafJRdtX7Zp43fHT1Bijr7Y+IFeo1e3FwUH7f0r8lszCup9txE5A==
X-Gm-Gg: ASbGnctpziMbEsqLX8iuY/qVVY9OjgBrYqYS7pFZ7TG0Lg9VWQMIM5OyI/IKKwV9N9N
	9bNN/LZ9S81ghyUQuTjruxmujA4s0e1sGshWQ7w4YlETmBrAv3rccC5EfSmXjdvErLyC0eP9hEV
	i+cB7OE804dChrsD99IVmgw8t/g2z+5vp7TzUxS/Y8gvd2ROlxRp8MFxzw06SmuAekawLvA03RL
	rF+6Ywn96eC3Ka/Zz3nu/f9W4bPalnD95KzrASeCeNBaFZIteciXWFetVg2g/BJk2ZcZhxWyFnD
	WisMFqbFEo8ACTafrvBS4hrIbZrcJVskW6ZnkRHZpv17VgYmS2VlgFb0Bs2CsLsjARQ=
X-Google-Smtp-Source: AGHT+IFoDsjiUVySv8my/Q+Q9gsFbTMG/psQ8Ma4t24tk6qBhoQzAw7zD3ZmeYsreJRNtKVgh5xoxA==
X-Received: by 2002:a5d:64e4:0:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-3971fdc266fmr12645695f8f.53.1742213525981;
        Mon, 17 Mar 2025 05:12:05 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3974d771160sm11066893f8f.19.2025.03.17.05.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:12:05 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 2/2] oe-selftest: fitimage add more u-boot tests
Date: Mon, 17 Mar 2025 13:10:14 +0100
Message-ID: <20250317121120.130476-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121120.130476-1-adrian.freihofer@siemens.com>
References: <20250317121120.130476-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213079

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
- Simplify the code by moving all the U-Boot related variables to the
  _fit_get_bb_vars function.
- Do not set FIT_GENERATE_KEYS = "1" without inheriting the
  kernel-fitimage.bbclass which handles this variable.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 117 +++++++++++++++++++++--
 1 file changed, 111 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 60c9406489e..48f2e3323ef 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -112,6 +112,22 @@ class FitImageTestCase(OESelftestTestCase):
         self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
         self.assertIn("Signature check OK", result.output)
 
+    def _verify_dtb_property(self, dtc_bindir, dtb_path, node_path, property_name, req_property, absent=False):
+        """Verify device tree properties
+
+        The fdtget utility from dtc-native is called and the property is compared.
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
@@ -879,12 +895,20 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -900,7 +924,10 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_USER_SETTINGS',
             'UBOOT_FITIMAGE_ENABLE',
             'UBOOT_NODTB_BINARY',
+            'UBOOT_SIGN_ENABLE',
             'UBOOT_SIGN_IMG_KEYNAME',
+            'UBOOT_SIGN_KEYDIR',
+            'UBOOT_SIGN_KEYNAME',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/bootloader")
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
@@ -1085,6 +1112,50 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -1177,9 +1248,9 @@ UBOOT_FIT_HASH_ALG = "sha256"
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
@@ -1209,15 +1280,17 @@ UBOOT_EXTLINUX = "0"
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
@@ -1352,3 +1425,35 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
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


