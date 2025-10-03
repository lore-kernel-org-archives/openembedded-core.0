Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D49CCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:25:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.10401.1759505107470497031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 08:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XGQ4ue+Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so25981605e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759505105; x=1760109905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObMNlvtNLlUJKHSr61xMISW3/8NCMGYZu6vJAI/S/2E=;
        b=XGQ4ue+YqalnNX81HOUX5BcoOMCNcpuKaPvvHfvEs/c8KbDd9SDSN6fXaJKNFlvWtX
         tbNL3VXg+s0fI9LQWF+Rb3IEdkL+gu5zgnnoWi7H7HKgkDqTx7UTGg3wqbOyfgoMF+j5
         mpg9JgrPNNhk3y3KFB2GmjsMWX327Xh2Q5u6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759505105; x=1760109905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObMNlvtNLlUJKHSr61xMISW3/8NCMGYZu6vJAI/S/2E=;
        b=iyV6jTRyOn6twhgtdFMlr49FAf654XZhnfcnrvJVzZIJnPABRroCfPB/dJlTYOVsvn
         mhvPIU65kyEQb3gDcayVVAkgBCH9U9LjX0zP+P5mEKPMyBMxj4iBvbn3VPh2+ChC0Pi+
         DeoNr7VS+ZYqyCdj/F5C+mX1LusRpOZWFy10uOwRVcrt+DCXAdbzbJTkE7NIRIACoFoz
         gPN8i4L/2hAz32EBRi/QzpgLkn1H4j9+WDWXj4nh96BLrid3hZN9kEdQXYmEVnkuuHvs
         4Y0f2QS2m5e+EjrmaaINoRQ2vzCuEU+JuZ+x3kR29/Z7DS8Y5T42uMoxzlXr3QypkDNM
         /W7g==
X-Gm-Message-State: AOJu0YxhDobqGkbK/lh4hxsvNAADz06/2SAm0DIqC5L2E5a+eyJcPebb
	5ZNGBA8eNAvrR+wIylX2Afjwi+2GlygL4f1mtaCxsnqLEyCdEGL3cCZdxeSLIm4ciqykurs+EGN
	Ii+Nu
X-Gm-Gg: ASbGncuN/f5rp/Dq2pcHbX1pAHc88rNzmuFWT8eMC/UgzXlEKfZTAc6SnuoLqKZshw9
	HXyVkUjvxv2P/ZRwCRiEdiRErW/bRXgmkxTrHqbKS3qyWC6zPY2JJRN232zMahMLz2hLn3XZ/w7
	OyHHvffAO3j7ZJIKiS4hxzFkGQZb2K8FpGyF/MNo2WctYp/hfQRTAHxz2rvF6iNvzbUccdu/zTu
	Rq0Pu4EgbTRk2ncuoay0YEZmmX0Yw3p4M3AFHUSMn4ttC6/29IFYgNnp+A5/RCEejfSp85uJg2Q
	d9Ixh3k3UwMppncI+9RXkfmYBI+apBCANVKtHTkqXJX+Xvf7gcFVNxTjNxUF/UtXeJl0JEo+DYf
	qqNkWIxb2uoywifKYxdDQN1BjNkmw2qW+sFfpjTuBQKNIZq+6MDST1kMrq7wHIHbfo1UokbzdaQ
	==
X-Google-Smtp-Source: AGHT+IGRXRuCrNB3EQt0rZP9gVhLPsxi7DOLTNDNTLvjerZdfE9FcStItJe+4fNprJPq2Kmv5WmF+A==
X-Received: by 2002:a05:600c:4fc6:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-46e7114ea13mr22738045e9.27.1759505105158;
        Fri, 03 Oct 2025 08:25:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:67c:cc8a:4a49:c12a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e674b6591sm103052175e9.4.2025.10.03.08.25.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:25:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oeqa/selftest/bblock/fitimage: Fix changing MACHINE during the test
Date: Fri,  3 Oct 2025 16:25:03 +0100
Message-ID: <20251003152503.488601-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 15:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224398

With config fragments, changing MACHINE in the test like this no
longer works. Use the forcevarable override to allow it to work.
This also needs a tweak to bitbake to work correctly, sent
seperately. Whilst ugly, this avoids the need to start changing
config fragments.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bblock.py   |  4 ++--
 meta/lib/oeqa/selftest/cases/fitimage.py | 26 ++++++++++++------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblock.py b/meta/lib/oeqa/selftest/cases/bblock.py
index 2b62d2a0aa2..cb99d32bb5d 100644
--- a/meta/lib/oeqa/selftest/cases/bblock.py
+++ b/meta/lib/oeqa/selftest/cases/bblock.py
@@ -122,11 +122,11 @@ class BBLock(OESelftestTestCase):
         else:
             machine = "qemux86-64"
 
-        self.write_config('MACHINE = "%s"\n' % machine)
+        self.write_config('MACHINE:forcevariable = "%s"\n' % machine)
 
         self.lock_recipes(recipes, tasks)
 
-        self.write_config('MACHINE = "%s"\n' % self.td["MACHINE"])
+        self.write_config('MACHINE:forcevariable = "%s"\n' % self.td["MACHINE"])
         # modify quilt's do_compile task
         self.modify_tasks(recipes, tasks)
 
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3c408577476..195b9ee8b59 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -787,7 +787,7 @@ FIT_CONF_PREFIX = "foo-"
 
         config = """
 DISTRO = "poky"
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 """
         self.write_config(config)
 
@@ -828,7 +828,7 @@ MACHINE = "beaglebone-yocto"
         """
         config = """
 # Enable creation of fitImage
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 # Add a devicetree overlay which does not need kernel sources
 PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
 """
@@ -855,7 +855,7 @@ PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
         # Generate a configuration section which gets included into the local.conf file
         config = """
 # Enable creation of fitImage
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "dev"
@@ -903,7 +903,7 @@ FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
         # Generate a configuration section which gets included into the local.conf file
         config = """
 # Enable creation of fitImage
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
@@ -939,7 +939,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 
         config = """
 DISTRO = "poky"
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
 UBOOT_MACHINE = "am335x_evm_defconfig"
@@ -993,7 +993,7 @@ FIT_HASH_ALG = "sha256"
 
         config = """
 DISTRO = "poky"
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 INITRAMFS_IMAGE_BUNDLE = "1"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
@@ -1412,7 +1412,7 @@ class UBootFitImageTests(FitImageTestCase):
         """
         config = """
 # We need at least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 
@@ -1451,7 +1451,7 @@ UBOOT_FIT_DESC = "A model description"
         config = """
 # There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
@@ -1498,7 +1498,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
@@ -1546,7 +1546,7 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
         """
         config = """
 # We need at least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 
@@ -1612,7 +1612,7 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
@@ -1676,7 +1676,7 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
         """
         config = """
 # Enable creation of fitImage
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "the-kernel-config-key"
@@ -1715,7 +1715,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         config = """
 # There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 # Enable creation and signing of the U-Boot fitImage (no SPL)
 UBOOT_FITIMAGE_ENABLE = "1"

