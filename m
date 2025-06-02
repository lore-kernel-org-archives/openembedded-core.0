Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7311C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.44077.1748851051054912047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ZuoS2uw2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-2025060207572940b13552b153ec8ed5-qjaatl@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025060207572940b13552b153ec8ed5
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1EEw3/XeHtN8p22NoTs/dS6H5wIrVyyTJNZpMaG1G80=;
 b=ZuoS2uw2WSevmaM/EJbH3WRdpEwgcHpKFhxHhVeBIohKj+9KN58yDsRJnqxgOARV1kuFcc
 VXODaI7Uu86FV4NfNtWRenAsEdwzZQb5689DdrW/Gh8Lp1Ws8FBgvarufNDo+n5dl7Iaso1M
 iwisinGnjqtEGbAT48WwZN9EuynpkXBrli5B1IC7LrsGWVSm8+AR/X5Im1nWL4415QKlBgt4
 NZHy9ZpjI6nSHaTVxl7/3scvly7jb8OHRc+0RSmBN8GbCZ3BwRivdF2lWKQdp4cc76xTWMCc
 N3Kz21BVb4vRaf/b0ctSNf70lnTW5GZKuo+JzNkI3GP+iNz9Fpdhi33g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 19/21] oe-selftest: fitimage: remove kernel-fitimage tests
Date: Mon,  2 Jun 2025 09:56:29 +0200
Message-ID: <20250602075714.32122-20-adrian.freihofer@siemens.com>
In-Reply-To: <20250602075714.32122-1-adrian.freihofer@siemens.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 07:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217707

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Remove the test cases for the kernel-fitimage.bbclass.

The _config_add_kernel_classes function is no longer needed since the
kernel-fitimage.bbclass is no longer handled.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 25 ------------------------
 1 file changed, 25 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index fc66f22f2d2..1c8a5d1124c 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -434,11 +434,6 @@ class KernelFitImageBase(FitImageTestCase):
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
-    def _config_add_kernel_classes(self, config):
-        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
-        config += 'KERNEL_DEPLOYSUBDIR = "linux-yocto-fitimage"' + os.linesep
-        return config
-
     @property
     def kernel_recipe(self):
         return "linux-yocto-fitimage"
@@ -767,7 +762,6 @@ UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
 FIT_CONF_PREFIX = "foo-"
 """
-        config = self._config_add_kernel_classes(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
@@ -832,7 +826,6 @@ MACHINE = "beaglebone-yocto"
 # Add a devicetree overlay which does not need kernel sources
 PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -862,7 +855,6 @@ UBOOT_SIGN_KEYNAME = "dev"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -912,7 +904,6 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -960,7 +951,6 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -1013,27 +1003,12 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._gen_signing_key(bb_vars)
         self._test_fitimage(bb_vars)
 
-class KernelFitImageTests(KernelFitImageRecipeTests):
-    """Test cases for the kernel-fitimage.bbclass"""
-
-    @property
-    def kernel_recipe(self):
-        # virtual/kernel does not work with SRC_URI:append:pn-%s
-        return "linux-yocto"
-
-    def _config_add_kernel_classes(self, config):
-        config += '# Use kernel-fitimage.bbclass for the creation of the fitImage' + os.linesep
-        config += 'KERNEL_IMAGETYPES += " fitImage "' + os.linesep
-        config += 'KERNEL_CLASSES = " kernel-fitimage "' + os.linesep
-        return config
-
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
 
-- 
2.49.0


