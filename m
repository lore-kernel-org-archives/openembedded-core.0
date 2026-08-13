Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895F8C5DF64
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:44 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21623.1786634559042427452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M4c941i2;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4998590d392so541045e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634557; x=1787239357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A8AHs1ylDIbWoWM8khx49NBOGIBfL422tBGEC4AB8Cw=;
        b=M4c941i2BexGNLV54nyB8FXoCnVmpLgPdIyzWlsuG2tc0fqkKM4PKxjjHneEyjx1Lf
         YXQvazHQZBSxGqpv4Z0yIFlLPv7WNfOmUtm8j7Y2Lu9JJs/V//dOybhqntmXQBVnR1L+
         g0WcOx18xHm1XPLpotvmEwd05VtXIrOmLIz18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634557; x=1787239357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A8AHs1ylDIbWoWM8khx49NBOGIBfL422tBGEC4AB8Cw=;
        b=VmNKzVNVPyJjVXZClfL6z5t7Vu4TTVaGOywgYxTQ/208/Arr37FtJUUdcWRGzkeNHl
         VVsvEZw+e0u6TmvRTbbywxbDB4jHEbRXGzyJ5XLg9hDUJVb6xD7u59B+NntySmkJS2WM
         KIVjhbTliW2u0HHvYSQG6nhSTH9549Zf71uD5jXtVKaXe05XnCDZFvhbcK9oI6VKIiO/
         3qPs3ajbPhzWrK6xsIRlDRlmiNNK3xPr4NE2JZDGuYRzK++0QMFMw9uBoEQ4o2N0MeHK
         lBwWB1Q6txU1EU/WOHmebl7TiWoSXEbwF0AQtKL1/KeEyAAZ6Pozz5lrj+uPXXquqPvc
         16Iw==
X-Gm-Message-State: AOJu0YxfNmaq16tYkjDDJ3P+y2IqgnvmOntI/MB4MSpJURUPQddtflgd
	EpttJ0dRzWtlBtQQDuXyncuOnJMJLn1RqqiLYxt8ArylwW7gjd2KZtrEPpqJEQV5uR1lxxWW2Sr
	FuOth2Ew5XA==
X-Gm-Gg: AR+sD13yh8pBgIsaQJQiaoOIq3R4RZSs6Eitt0y9qdJp4tGjYjv+jX0YfLz4czHIyL8
	d5CLxhM6Wvv/BXSEbvbHJnn118yusp6zi9ZK2TAruAoegVRtn18nTOSPeYUJuAuTRWPsEpGb1Io
	Nl8M+VezTxpoH2NATpQiDNUdbCqLHN43dTxMfA6RYiuP0SJY1Tm9uJZ7oQWAhphyEhp5siCDlOR
	2km4EvfppE3CTiT0+/d1MEvMDFzNSQ2EL3cL0GLbw0ApW8ZoiNPwfDdKw+lK5ChVithYm0e6Cnp
	RutAhvCUoR0jv0j9B42r/5/RoeTcf2YZTT5NQ5+cY++OOjb6m/AnGEoEpJMNSLusuyBMfvpWv9r
	X5wYcLStXrDz80llq0LwUCFlkBWEjPbOeeAcJobXaB8WnxolP/isLPTIvldCZ0dPfBiaKsVdWIQ
	G4yAjyF2p/S/joKx/qlLYhGpNTEvi1bTNyxx9UNUdDKA5a21umA+b8QSVd092TZLVdc263Twu7I
	oqPifzGk8AKrvoHGkcTN/9OYGJfR0JqmfVKsJGd1YBdNyQf4DmTLlDakJbDKaqqLYYUbtNrTJoC
	Lav514xmkvD2KzBuuH1x5xtm0/jAK9+ZsiiWBzix
X-Received: by 2002:a05:6000:4403:b0:481:4f2a:bdb0 with SMTP id ffacd0b85a97d-48159fe3cf8mr7741603f8f.18.1786634557104;
        Thu, 13 Aug 2026 08:22:37 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:36 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/17] oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED
Date: Thu, 13 Aug 2026 17:22:07 +0200
Message-ID: <d75e9cc17035bcd403b101298be1503697a6f929.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243374

From: Ryan Eatmon <reatmon@ti.com>

The recent changes to fixing KERNEL_DTBVENDORED support and then adding
the same mapping for FIT_CONF_DEFAULT_DTB exposed that we were missing
tests for these two cases.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de2e11e63624f86583875163e66f63ea7457c121)
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 55 +++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index e8435fb43c..b35dda6674 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -183,6 +183,16 @@ class FitImageTestCase(OESelftestTestCase):
                 pass
         return a_comment
 
+    @staticmethod
+    def _apply_dtbvendored(bb_vars,dtb):
+        """ This is (and should remain) the same logic that is in kernel-fit-image.bbclass
+        """
+        if bb_vars.get('KERNEL_DTBVENDORED') != "1":
+            mapped_name = os.path.basename(dtb)
+        else:
+            mapped_name = dtb.replace('/', '_')
+        return mapped_name
+
     @staticmethod
     def _get_dtb_files(bb_vars):
         """Return a list of devicetree names
@@ -195,7 +205,7 @@ class FitImageTestCase(OESelftestTestCase):
         all_dtbs = []
         dtb_symlinks = []
         if kernel_devicetree:
-            all_dtbs += [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
+            all_dtbs += [FitImageTestCase._apply_dtbvendored(bb_vars, dtb) for dtb in kernel_devicetree.split()]
         # Support only the test recipe which provides 1 devicetree and 1 devicetree overlay
         pref_prov_dtb = bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
         if pref_prov_dtb == "bbb-dtbs-as-ext":
@@ -437,6 +447,7 @@ class KernelFitImageBase(FitImageTestCase):
             'INITRAMFS_IMAGE',
             'KERNEL_DEPLOYSUBDIR',
             'KERNEL_DEVICETREE',
+            'KERNEL_DTBVENDORED',
             'KERNEL_FIT_LINK_NAME',
             'MACHINE',
             'PREFERRED_PROVIDER_virtual/dtb',
@@ -653,7 +664,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_conf_default_dtb = bb_vars.get('FIT_CONF_DEFAULT_DTB')
         if fit_conf_default_dtb:
             fit_conf_prefix = bb_vars.get('FIT_CONF_PREFIX', "conf-")
-            its_field_check.append('default = "' + fit_conf_prefix + fit_conf_default_dtb + '";')
+            its_field_check.append('default = "' + fit_conf_prefix + self._apply_dtbvendored(bb_vars, fit_conf_default_dtb) + '";')
 
         # configuration nodes (one per DTB and also one per symlink)
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
@@ -1142,6 +1153,46 @@ FIT_HASH_ALG = "sha256"
         self._gen_signing_key(bb_vars)
         self._test_fitimage(bb_vars)
 
+    def test_vendored_dtb_without_kernel_dtbvendored(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are created correctly with KERNEL_DTBVENDORED turned off.
+        Expected:    1) its and FIT image are built successfully
+                     2) Dumping the FIT image indicates the devicetree overlay
+        """
+
+        config = """
+MACHINE:forcevariable = "beaglebone-yocto"
+UBOOT_MACHINE = "am335x_evm_defconfig"
+UBOOT_ARCH = "arm"
+UBOOT_DTB_BINARY = "u-boot.dtb"
+KERNEL_DTBVENDORED = "0"
+"""
+        config = self._config_add_kernel_classes(config)
+        config = self._config_add_uboot_env(config)
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
+    def test_vendored_dtb_with_kernel_dtbvendored(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are created correctly with KERNEL_DTBVENDORED turned on.
+        Expected:    1) its and FIT image are built successfully
+                     2) Dumping the FIT image indicates the devicetree overlay
+        """
+
+        config = """
+MACHINE:forcevariable = "beaglebone-yocto"
+UBOOT_MACHINE = "am335x_evm_defconfig"
+UBOOT_ARCH = "arm"
+UBOOT_DTB_BINARY = "u-boot.dtb"
+KERNEL_DTBVENDORED = "1"
+"""
+        config = self._config_add_kernel_classes(config)
+        config = self._config_add_uboot_env(config)
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
 

