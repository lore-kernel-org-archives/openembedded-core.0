Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F227FC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:37:05 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.33424.1741599423829766422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S35U5ejE;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-390fdaf2897so3722694f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599422; x=1742204222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNGOFdcTWFoNH4B0+vOal7LcuNg/Xj16EvNXrZYDmdA=;
        b=S35U5ejE6BBQC0aZKX4+bxkNT1PPzviQowxZK6a6TWv/S1y4N9jXQbX6JQEmNmz+4b
         vgzFzSaqjVE9Y+GaaZ5VzrwP/HD3ShD2ZjpnTZUFt+g3eMOMuQ4im1lEMjeE0zAGj0ku
         qECj5M/tMHLBDfuYup7P92ZK5fRGjqINsyu7uQF00yzTpKnmxZyOwVOoKu4k/LwZtVLP
         FwTMppHzt3nMlns6ayiIAcGIBHzUTJC8TB+cu2b6vtLNwbHiAS49LK3Y6UD0yNhZFVSi
         91j3/QaXXki6O6f5OV5XcV7oc1y9gQIEAbaUex+cclp9XQ8AHJdZ4FT/C4vUzlGKioxM
         A0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599422; x=1742204222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNGOFdcTWFoNH4B0+vOal7LcuNg/Xj16EvNXrZYDmdA=;
        b=of72cN3yBHQMZkVRqRsXAZbLGGoI+WCs8FfIRJU77Nst4lIJvS8O68L/pEAlYgKHhk
         SA5NmKMpyMh17++Fb0nJ621SkvVW60Y8NGHwCN+MHSVM7XMSxvLqbcWj7IO4wg7HP5C2
         1+QW7gCT8lgxl2TcAx9I8azJ6Us1AcR3hgmME1R1k92UMGxL9p+1/Xt3CISIZitQI6Qv
         oEG9VUUf86oAuF0hj3+E+COS3rZ6ASdX8O0ow1DBURSvONq8ezVJYIDJbVddaODr7V89
         Q0OaUdG52fhtyQyfDvropJ/F165X9fLawxjY2G5Y6wA85i7i6396WqSw5m9FzTD6SmmM
         SGHg==
X-Gm-Message-State: AOJu0YwNq1ld/hHiTeM8RxOsiJw/glEZiBK58CqdQJ61lh6/DKekcrjE
	VGF7nctIgwbNxlHsq8bT2wLwf15vybDTNprl2oSEuYkwIUKNYHG+UXbZQg==
X-Gm-Gg: ASbGncu4JoDuXaBZJ6Z9domwFVdIcvuQvEmRA4BOdZyM8A+Nz3+teDox/Wu5YFJThZ2
	8sho0U/sK+eY7lttsL/20hnc/23RG7xwCAOMywVON5OF6xiSCknVcCnzC+u7Am8gEhJj7q5BiLh
	VuMB7sQiB6ClLP2G0hpYb7//eGmnevewapR/KvoDOLqPbp/1Ajd5RXejUt4ajey51ZnRLjLAPM/
	HYIKKRpp/dju7mfp44j5leI7En9YzyVPzNAacKnjYBq+AIvSFv6W/hetNCeh0+F8NQovkWea715
	s9WAn223Vf8/AXUgHXJtJXEPKKXbeJpw8H9hISb38pQBY/sjqPlDBcNJHMaEIEgQGlM=
X-Google-Smtp-Source: AGHT+IGirYN76j5zngY36rj7BOuMadtC7TEbQl0SzpWBu5u6SCu/8GX6gFVQfHAbprW26CozcsZFgA==
X-Received: by 2002:a05:6000:1fa9:b0:391:212:459a with SMTP id ffacd0b85a97d-39132d3b46fmr10939032f8f.22.1741599421844;
        Mon, 10 Mar 2025 02:37:01 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm14554454f8f.13.2025.03.10.02.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:37:01 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/7] oe-selftest: adapt u-boot tests to latest changes
Date: Mon, 10 Mar 2025 10:35:46 +0100
Message-ID: <20250310093641.1983560-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
References: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212500

For u-boot test cases (bitbake virtual/bootloader) inheriting the
kernel-fitimage.bbclass is no longer needed. Also setting any variable
which is evaluated by the kernel-fitimage.bbclass but not by
uboot-sign.bbclass is pointless since:

* Commit OE-Core rev: 5e12dc911d0c541f43aa6d0c046fb87e8b7c1f7e
  changed the test case from
    bitbake virtual/kernel
  to
    bitbake virtual/bootloader

* Commit OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e has
  finally removed the dependency of uboot-sign.bbclass on the
  kernel-fitimage.bbclass completely.

Remove the related lines of code which are now without any effect.

The two test cases test_uboot_fit_image and test_uboot_sign_fit_image
do the exact same test. Both generate a binary equal its file:

/dts-v1/;

/ {
    description = "A model description";
    #address-cells = <1>;

    images {
        uboot {
            description = "U-Boot image";
            data = /incbin/("u-boot-nodtb.bin");
            type = "standalone";
            os = "u-boot";
            arch = "arm";
            compression = "none";
            load = <0x80080000>;
            entry = <0x80080000>;
        };
        fdt {
            description = "U-Boot FDT";
            data = /incbin/("u-boot.dtb");
            type = "flat_dt";
            arch = "arm";
            compression = "none";
        };
    };

    configurations {
        default = "conf";
        conf {
            description = "Boot with signed U-Boot FIT";
            loadables = "uboot";
            fdt = "fdt";
        };
    };
};

The code diff between the two equal test cases looks like:

@@ -1,8 +1,9 @@
-    def test_uboot_fit_image(self):
+    def test_uboot_sign_fit_image(self):
         """
         Summary:     Check if Uboot FIT image and Image Tree Source
                      (its) are built and the Image Tree Source has the
-                     correct fields.
+                     correct fields, in the scenario where the Kernel
+                     is also creating/signing it's fitImage.
         Expected:    1. u-boot-fitImage and u-boot-its can be built
                      2. The type, load address, entrypoint address and
                      default values of U-boot image are correct in the
@@ -26,16 +27,15 @@
 UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 UBOOT_FIT_DESC = "A model description"
-
-# Enable creation of Kernel fitImage
 KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage"
+KERNEL_CLASSES = " kernel-fitimage "
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
 UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
+UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
 """
         self.write_config(config)

Conclusion: The test case test_uboot_sign_fit_image looks redundant.
Contrary to its name, it does not insert any signature nodes into the
its-file and therefore does not test any type of signature.

Code history:
- Commit OE-Core rev: e71e4c617568496ae3bd6bb678f97b4f73cb43d8
  introduces both test cases.
- Commit OE-Core rev: 5e12dc911d0c541f43aa6d0c046fb87e8b7c1f7e
  changes both test cases like this:
  -        bitbake("virtual/kernel")
  +        bitbake("virtual/bootloader")

It looks like the original implementation of test_uboot_sign_fit_image
was supposed to test the interaction between the kernel-fitimage.bbclass
and uboot-sign.bbclass which does not longer work like that.

When compiling u-boot, the variable that is relevant for creating an its
file with signature nodes is: SPL_SIGN_ENABLE. This is what the test
case test_sign_standalone_uboot_fit_image verifies. Lets just delete the
now obsolete test_uboot_sign_fit_image test case.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 101 -----------------------
 1 file changed, 101 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 5af9ea8afc0..dd177e0b048 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -342,16 +342,6 @@ UBOOT_FITIMAGE_ENABLE = "1"
 UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 UBOOT_FIT_DESC = "A model description"
-
-# Enable creation of Kernel fitImage
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage"
-UBOOT_SIGN_ENABLE = "1"
-FIT_GENERATE_KEYS = "1"
-UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
-UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
-FIT_SIGN_INDIVIDUAL = "1"
 """
         self.write_config(config)
 
@@ -396,89 +386,6 @@ FIT_SIGN_INDIVIDUAL = "1"
                 "Fields in Image Tree Source File %s did not match, error in finding %s"
                 % (fitimage_its_path, its_field_check[field_index]))
 
-    def test_uboot_sign_fit_image(self):
-        """
-        Summary:     Check if Uboot FIT image and Image Tree Source
-                     (its) are built and the Image Tree Source has the
-                     correct fields, in the scenario where the Kernel
-                     is also creating/signing it's fitImage.
-        Expected:    1. u-boot-fitImage and u-boot-its can be built
-                     2. The type, load address, entrypoint address and
-                     default values of U-boot image are correct in the
-                     Image Tree Source. Not all the fields are tested,
-                     only the key fields that wont vary between
-                     different architectures.
-        Product:     oe-core
-        Author:      Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
-                     based on work by Usama Arif <usama.arif@arm.com>
-        """
-        config = """
-# We need at least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
-UBOOT_MACHINE = "am57xx_evm_defconfig"
-SPL_BINARY = "MLO"
-
-# Enable creation of the U-Boot fitImage
-UBOOT_FITIMAGE_ENABLE = "1"
-
-# (U-boot) fitImage properties
-UBOOT_LOADADDRESS = "0x80080000"
-UBOOT_ENTRYPOINT = "0x80080000"
-UBOOT_FIT_DESC = "A model description"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
-UBOOT_SIGN_ENABLE = "1"
-FIT_GENERATE_KEYS = "1"
-UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
-UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
-FIT_SIGN_INDIVIDUAL = "1"
-UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
-"""
-        self.write_config(config)
-
-        # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
-
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        # Check that the type, load address, entrypoint address and default
-        # values for kernel and ramdisk in Image Tree Source are as expected.
-        # The order of fields in the below array is important. Not all the
-        # fields are tested, only the key fields that wont vary between
-        # different architectures.
-        its_field_check = [
-            'description = "A model description";',
-            'type = "standalone";',
-            'load = <0x80080000>;',
-            'entry = <0x80080000>;',
-            'default = "conf";',
-            'loadables = "uboot";',
-            'fdt = "fdt";'
-            ]
-
-        with open(fitimage_its_path) as its_file:
-            field_index = 0
-            for line in its_file:
-                if field_index == len(its_field_check):
-                    break
-                if its_field_check[field_index] in line:
-                    field_index +=1
-
-        if field_index != len(its_field_check): # if its equal, the test passed
-            self.assertTrue(field_index == len(its_field_check),
-                "Fields in Image Tree Source File %s did not match, error in finding %s"
-                % (fitimage_its_path, its_field_check[field_index]))
-
-
     def test_sign_standalone_uboot_fit_image(self):
         """
         Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
@@ -505,9 +412,6 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
 MACHINE = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
-# The kernel-fitimage class is a dependency even if we're only
-# creating/signing the U-Boot fitImage
-KERNEL_CLASSES = " kernel-fitimage"
 # Enable creation and signing of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE = "1"
@@ -663,8 +567,6 @@ SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart cascaded U-Boot comment'"
 UBOOT_EXTLINUX = "0"
 UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
@@ -1030,9 +932,6 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
 MACHINE = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
-# The kernel-fitimage class is a dependency even if we're only
-# creating/signing the U-Boot fitImage
-KERNEL_CLASSES = " kernel-fitimage"
 # Enable creation and signing of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE = "1"
-- 
2.47.1


