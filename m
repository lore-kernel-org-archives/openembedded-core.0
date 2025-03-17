Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51D8C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:17:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.58809.1742231860668467533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FghDiuV6;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4134927f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742231855; x=1742836655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EJNio4kfk7Lv/Sv+wPCK0nTsVW24Ad1H6nHug+8wGE=;
        b=FghDiuV6QC2jN+Tjcrl7fz53M89mRnW4xQY6T4yDjRDx5lkOLaHbYQsVjlkcdzvAXB
         5KwjcFJgIzp0RjP5kPBQHfRS2JOzlKlH3nzyAmOmWsturO+A1WcPVxv0bvZvdrr9aYsg
         Ctu+eDj0a9iDksp6xO/J9Qhf0qqNzBIWF7qkexEuoQFkn+p3sPSC818DJfxiRxdF/3oA
         y1PluQUNxUv3EPtv3xWMi6Mt77sfiGqMHfooPAxHz9tO4dTdByJhZ2wsEt5yJfnIcjm1
         iH8eCC7JwThJvRYKKFdxPnRPY1FJ42njzBnNO3yqb0i5Q7gQT6CsG4Hs5j9Otq85L9RC
         y7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231855; x=1742836655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EJNio4kfk7Lv/Sv+wPCK0nTsVW24Ad1H6nHug+8wGE=;
        b=bq0etV59Y//7DlVNSlN4/6KyKEhmvSMReu9hHfGd2RbeygPtU1vBVicEUbXZmjWnWy
         EbVSQdCD93ZQdNzsnyLNQ1v479czlSEiGEeU2fTPrGyb3uKFfviwDeZUpaPLMxkU6eZ0
         AuW8a0wtg1bdDmVD2mOO+rh23IG+Ck2NB/ZuIOj68LVeBTaeeG008kGW+ZChTz3n+jXM
         UmdSCOA+UlipSRPkz4R5GMh9/IJq3Wl45DnXi07xAntLgDVsOu8kWMnjqQfAX+DL60Qq
         Psxaa8CTit/a5Ir06SuLwvPNYAmxVESlhaKYqMPYW4T5GAR2vwveGBGlKC91sBvFQI8p
         d6kw==
X-Gm-Message-State: AOJu0Yx9hjuM6hpL7Qn7E0NRZyj1oGxiwvdTxVr9WHzQA/dmC5J1x9FO
	01x/b/s4pSXvz3Wp10S1UFxu4+ljBcqNyOuGhcllZTpf/ho7LDImWFnQGA==
X-Gm-Gg: ASbGncsGOTodh56UqvSCHKd+sHhmOMI1ahCVoGBUbi0wyMksemQnVmBWtTbbuQnHFKf
	hDWRRK1Hqj1sIcAT+mGmlcnVR8Nf+FD12U1cgp/j9Tgwg5qMysuUk6pNsTgdNQu1cpaJq+vtD7/
	0Kte83pBcIH9823uh0MC/29PY03QMpIKNxoOC4ubFCJ0arwwueuEQsPvxNk1QOnXbDkDmWVOuZS
	yf7b2pBEhwlPrPh/UBpQi2ln0KJXMjX6mubrCOMASo2QRw/6SW2OMUYsWpTtUGNMaFiziL/kQRg
	6McKdVyODGDVyQ9yF0aHE3pL9GOmvQzsr5ECEZ7A2z4TWjnbatRD3z6Z8laUOqOWLQw=
X-Google-Smtp-Source: AGHT+IHi7JI1mNWkK8KPCdA74CLnoF0W04FpGhtPLwVGt4HmL2RIPI3IHXbgrBKnba9n4OWtGSdvGQ==
X-Received: by 2002:a05:6000:156a:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-3971fadd7d5mr14828820f8f.54.1742231854485;
        Mon, 17 Mar 2025 10:17:34 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm15255902f8f.23.2025.03.17.10.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:17:34 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 2/2] oe-selftest: fitimage add more u-boot tests
Date: Mon, 17 Mar 2025 18:13:56 +0100
Message-ID: <20250317171720.963083-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317171720.963083-1-adrian.freihofer@siemens.com>
References: <20250317171720.963083-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213121

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
index 666c4678efc..b39f2622dff 100644
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


