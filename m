Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3358BC0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 22:57:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.56267.1738882643523308417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 14:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNGNUq4x;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436a39e4891so9980335e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738882642; x=1739487442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+hc5ofnBj6jCXKT2DEqcJygZMjZJOOZpMl6o5R6IZg=;
        b=VNGNUq4xg2hBzEM3MRnwHRKOoCDkCP8IfHXUPTx5Hz6cJzDZXvX/RSD6Hx9bu7FGy/
         qYo5q6g70O9yyyKNQEEsXqktKY6QPyIOB0YHqcChqj3ZnyJsQHmytUz1m8ypaR0RHbLR
         p8o+25R7UkDH/BZSQmTLBkgPhz34iHy6zY65iMrmh/pyzLHc/MIGbQC2n/EV7CrmAm3g
         ejPnluVVpTVEQbTCTi1BkcpqrB1o/ack4S8Wgr7yQ6aBOWJWSiTTncsHYIf6ehFf2V8W
         tOhf+pc+Q3v0nIWTr5gpVhVHSVVuVXo0Q9fK4Z19Hz4kC29vBalMHrKxp4CtyOBo4eAs
         ql2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882642; x=1739487442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+hc5ofnBj6jCXKT2DEqcJygZMjZJOOZpMl6o5R6IZg=;
        b=rtH44kmtESfaJpCu1aIzO8IxIIm+py+bo4RsDUqHBIxfzZzHfR0hL0gJd/rCYqb/xw
         AWz0a6mFaZjrpdtbyOj6hr9Upc5le5GtoKC0ywxbDEMg4GySscwwRnnr1I2Wnhae7k91
         HmAG4hoUaAuF63WRvRA0ON3iKrvbhehsMtKh87SYlaAzwlQdrK8FOQff8SkeqnrPSpL5
         X4QmK4dNz9GXL5GqiiKKjEDsxBhGe4xFK+r4AGn4qeux8Mcm02jWWlou2nPShOaCfjOh
         chRFqPyWitdWHq8lfmHl53R1M94l3RJue7rnKSITCaFCUBOhm7XApV0zkCHpLel3xxJV
         ixGQ==
X-Gm-Message-State: AOJu0YwR0EW5/RkhAh3lzYvzFSZHuioHB9/Lqb+HvZxouSNWhhP3ZHmQ
	cqIUv26kdqi8+Q9epwJuzT+6iU3vAqA3+FiOrJGEBUgDOqEXiUu2Ui7BRA==
X-Gm-Gg: ASbGncuClV2KWzQ3HeAJ2ijqlMEDyvSTuVwf2RTY9GQZYAlVcwCHn2JSSZxmwk2E/rV
	6S4DCyfUT/YmHdftEOCI+J08LuwUapBU0yF9MriVR/v+Bj26J2rG6zLTeyjhchfGtAsvDn9sABT
	OkgMmYctxRRoDdvbSnojUM2d7u+7VW9qdQpDaZsZqh0zkmHv8KsfP8t2ySrckhzikO4+Q8BKNeI
	zwkGPfCLH70wRUpslIOolSidHDf8Zch8Y7u4Szn34mo5t8KU+VLF9wNDY4MoKl4PoQtxC0bPgcc
	DiggYvZBCCsVkGQuQLA4QjmmWI4GkWnoiCu2iw==
X-Google-Smtp-Source: AGHT+IG3d3N/IkUekCwgaGZNBXkbb33heBgO9CuDEq3Xuom9WueVczxqTLYNmPgsYdYhISwsKd/gaQ==
X-Received: by 2002:a05:6000:1a8d:b0:38d:b5e8:310a with SMTP id ffacd0b85a97d-38dc8fe5357mr438599f8f.28.1738882641456;
        Thu, 06 Feb 2025 14:57:21 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm68737535e9.0.2025.02.06.14.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:57:20 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/4] oe-selftest: fitimage add u-boot env script
Date: Thu,  6 Feb 2025 23:56:07 +0100
Message-ID: <20250206225654.1660760-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
References: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 22:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210966

Extend all kernel-fitimage tests to add a boot.cmd script to the
fitImage and verify the script ends up in the fitImage.

The test covers the use case which is documented here:
https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image.
But instead of adding the sctip inline a script file is generated.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 44 ++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index a0ec406a0eb..5a400c200fc 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -60,6 +60,32 @@ class FitImageTests(OESelftestTestCase):
                 byte = file.read(1)
         return found_positions
 
+    def _config_add_uboot_env(self, config):
+        """Generate an u-boot environment
+
+        Create a boot.cmd file that is packed into the FitImage as a source-able text file.
+        """
+        fit_uenv_file =  "boot.cmd"
+        test_files_dir = "test-files"
+        fit_uenv_path = os.path.join(self.builddir, test_files_dir, fit_uenv_file)
+
+        config += '# Add an u-boot script to the fitImage' + os.linesep
+        config += 'FIT_UBOOT_ENV = "%s"' % fit_uenv_file + os.linesep
+        config += 'FILESEXTRAPATHS:prepend := "${TOPDIR}/%s:"' % test_files_dir + os.linesep
+        config += 'SRC_URI:append:pn-linux-yocto = " file://${FIT_UBOOT_ENV}"' + os.linesep
+
+        if not os.path.isdir(test_files_dir):
+            os.mkdir(test_files_dir)
+        self.logger.debug("Writing to: %s" % fit_uenv_path)
+        with open(fit_uenv_path, "w") as f:
+            f.write('echo "hello world"')
+
+        return config
+
+    def _verify_fitimage_uboot_env(self, dumpimage_result):
+        """Check if the boot.cmd script is part of the fitImage"""
+        num_scr_images = len(re.findall(r"^ *Image +[0-9]+ +\(bootscr-boot\.cmd\)$", dumpimage_result.output, re.MULTILINE))
+        self.assertEqual(1, num_scr_images, msg="Expected exactly 1 bootscr-boot.cmd image section in the fitImage")
 
     def test_fit_image(self):
         """
@@ -91,6 +117,7 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
 """
+        config = self._config_add_uboot_env(config)
         self.write_config(config)
 
         # fitImage is created as part of linux recipe
@@ -137,6 +164,10 @@ FIT_DESC = "A model description"
                 "Fields in Image Tree Source File %s did not match, error in finding %s"
                 % (fitimage_its_path, its_field_check[field_index]))
 
+        uboot_tools_bindir = self._setup_uboot_tools_native()
+        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
+        self._verify_fitimage_uboot_env(dumpimage_result)
+
 
     def test_sign_fit_image(self):
         """
@@ -171,6 +202,7 @@ FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
 """ % a_comment
 
+        config = self._config_add_uboot_env(config)
         self.write_config(config)
 
         # fitImage is created as part of linux recipe
@@ -228,7 +260,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
         reqsigvalues_config = {
             'algo': '"sha256,rsa2048"',
             'key-name-hint': '"cfg-oe-selftest"',
-            'sign-images': '"kernel", "fdt"',
+            'sign-images': '"kernel", "fdt", "bootscr"',
         }
 
         for itspath, values in sigs.items():
@@ -269,10 +301,13 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
             value = values.get('Sign value', None)
             self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
 
+        # Check if the u-boot boot.scr script is in the fitImage
+        self._verify_fitimage_uboot_env(dumpimage_result)
+
         # Search for the string passed to mkimage: 1 kernel + 3 DTBs + config per DTB = 7 sections
         # Looks like mkimage supports to add a comment but does not support to read it back.
         found_comments = FitImageTests._find_string_in_bin_file(fitimage_path, a_comment)
-        self.assertEqual(found_comments, 7, "Expected 7 signed and commented section in the fitImage.")
+        self.assertEqual(found_comments, 8, "Expected 8 signed and commented section in the fitImage.")
 
         # Verify the signature for all configurations = DTBs
         for dtb in ['am335x-bone.dtb', 'am335x-boneblack.dtb', 'am335x-bonegreen.dtb']:
@@ -771,6 +806,7 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
+        config = self._config_add_uboot_env(config)
         self.write_config(config)
 
         # fitImage is created as part of linux recipe
@@ -854,3 +890,7 @@ FIT_HASH_ALG = "sha256"
         # Verify the signature
         uboot_tools_bindir = self._setup_uboot_tools_native()
         self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], 'am335x-bone.dtb'))
+
+        # Check if the u-boot boot.scr script is in the fitImage
+        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
+        self._verify_fitimage_uboot_env(dumpimage_result)
-- 
2.47.1


