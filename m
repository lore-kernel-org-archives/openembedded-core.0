Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF84C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:40:45 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.88516.1747172437504533192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 14:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=YykPHWMC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20250513214035cb6d4657df6d9bfe77-clz450@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250513214035cb6d4657df6d9bfe77
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 23:40:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yoXnNJc7I6oAAI/w5nlPs9t2I7W8tZE0iR95DWRh1BA=;
 b=YykPHWMCobTAKkqpS0YkpGQVDxdVGELGFS5GYvnjDkggm+SeX0MkLTyZrUCW/x6gdfSkII
 03zo+zIIci0qWy2XywHSumXBp3JnPWvLOkB1697TyZfg+bjV6HpmSm2Z/hB4HDLdvP6sBB1l
 NT7wIeJdD75w+C3aiToFSM9U77DbY/BtQl9eaOFCKIC4Fj1BYBC8tNtK8mBudedUmOGxRnuo
 XmulbfkoTHvWQFq+x/E8odcjRMVujFk/R6wTD3u4WODv0PG1i69K8TWD0AR/GNWLc/1aUwIj
 hgrQTPIgRCxkvs9o1cmla3sfvOaOBB8F5GTh3eBC4y0qOZYaFNynn0Tg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 18/22] oe-selftest: fitimage: remove kernel-fitimage tests
Date: Tue, 13 May 2025 23:37:00 +0200
Message-ID: <20250513213834.87830-19-adrian.freihofer@siemens.com>
In-Reply-To: <20250513213834.87830-1-adrian.freihofer@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 21:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216469

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Remove the test cases for the kernel-fitimage.bbclass.

The _config_add_kernel_classes function is no longer needed since the
kernel-fitimage.bbclass is no longer handled.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 25 ------------------------
 1 file changed, 25 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 4d0712b6f01..d204a07bf0c 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -449,11 +449,6 @@ class KernelFitImageBase(FitImageTestCase):
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
-    def _config_add_kernel_classes(self, config):
-        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
-        config += 'KERNEL_DEPLOYSUBDIR:pn-linux-yocto-fitimage = "linux-yocto-fitimage"' + os.linesep
-        return config
-
     @property
     def kernel_recipe(self):
         return "linux-yocto-fitimage"
@@ -769,7 +764,6 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
 """
-        config = self._config_add_kernel_classes(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
@@ -788,7 +782,6 @@ MACHINE = "beaglebone-yocto"
 # Add a devicetree overlay which does not need kernel sources
 PREFERRED_PROVIDER_virtual/dtb = "bborg-relay-00a2"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -818,7 +811,6 @@ UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "dev"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -871,7 +863,6 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -916,7 +907,6 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -973,26 +963,11 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
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


