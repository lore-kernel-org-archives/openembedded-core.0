Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9663BC54ED1
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:09:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.48713.1747652938844386768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=bbQHrJr6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250519110856ae7642f009fc75c8a5-ril3iq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250519110856ae7642f009fc75c8a5
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 May 2025 13:08:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/W0N/oY63mzGutoj8VWQ6TNOGlEGwALUa0m4cqAN1S0=;
 b=bbQHrJr6L/xow97bjj1+19GH7nN/aGZ7sn9hMCVsjwuChu1c71MpJnWFB0pdd2aQPfWNC/
 nNLfds66s13jpTOePqxj9v18tmjzMUgywld/8A8xoqUYMHQ2M7fxvcmykkoQj5xJxCpKxdd1
 sEq2MqwCyhDU6aumfNmtxDaWN6oHq9s3eIpVRSI/Usagj60mf6YLmbMo4ojl2+imN0RI/2qk
 D+FvUMqHVXB94sSykHHzZReG9oyMBjLHnjWETU6vG41rR3L0OGU9sQySEiBDLV2lszQ3CnAd
 C+MVCc7FEVGrnv0chZYRl2cqez23SoK5URtS9Eqe1eNkIdcIRHf5xpfw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 14/16] oe-selftest: fitimage: remove kernel-fitimage tests
Date: Mon, 19 May 2025 13:07:58 +0200
Message-ID: <20250519110838.82978-15-adrian.freihofer@siemens.com>
In-Reply-To: <20250519110838.82978-1-adrian.freihofer@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216845

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Remove the test cases for the kernel-fitimage.bbclass.

The _config_add_kernel_classes function is no longer needed since the
kernel-fitimage.bbclass is no longer handled.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 25 ------------------------
 1 file changed, 25 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index e96f8beb806..5d3ae2bb1f8 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -449,11 +449,6 @@ class KernelFitImageBase(FitImageTestCase):
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
@@ -772,7 +767,6 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
 """
-        config = self._config_add_kernel_classes(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
@@ -791,7 +785,6 @@ MACHINE = "beaglebone-yocto"
 # Add a devicetree overlay which does not need kernel sources
 PREFERRED_PROVIDER_virtual/dtb = "bborg-relay-00a2"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -821,7 +814,6 @@ UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "dev"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -874,7 +866,6 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
@@ -919,7 +910,6 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
-        config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
 
@@ -976,26 +966,11 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
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


