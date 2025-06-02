Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9746C61DB2
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.44203.1748851050692146107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=GyU5vJFr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2025060207572898061583814125870a-nymyxb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025060207572898061583814125870a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=h/Bd8zPTI1XF7X/GZDI9eEVYKp1/RCJ+c0Jj/XLw7l4=;
 b=GyU5vJFrhApN2Mr1Y2KO/4KD739zlHkN6k+7Ft470c6URNfpW04npei6rqiRJwNM8i1NvV
 lmq0QN7Y4gW/xYYtHcsBJHgwN/3fk0HeDN7UwX6xVHQLq4Tz4vPF+eJ+vER5cgVWVSGfopTn
 o1+fl+5BWQnXJnaC06SRX9iI9D2tZdcCFqq34fIMW83YrSNcnIMiSRp7FkLHA222KiE5RgNg
 zO3rSGZsUlc6bbibRoHdmAkhNplraCI8Ev9H2mHue4/1n6CdFg/TLZ8IWvtiWuqeu8OqHj65
 U7TNVrGha4vMp7Z5HcP92hWmABRaDflUCCjx/fBfWWC+23yAjMLELEEg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 17/21] oe-selftest: fitimage refactor classes
Date: Mon,  2 Jun 2025 09:56:27 +0200
Message-ID: <20250602075714.32122-18-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217704

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Make the new KernelFitImageRecipeTests class the one that contains the
code, and keep the KernelFitImageTests class as the one that just adds
back the same tests. This will make it easier to delete the tests later,
which will hopefully become obsolete when the kernel-fitimage.bbclass
class is no longer needed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index bb88ac9444c..fc66f22f2d2 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -393,7 +393,7 @@ class FitImageTestCase(OESelftestTestCase):
         self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
 
 class KernelFitImageBase(FitImageTestCase):
-    """Test cases for the kernel-fitimage bbclass"""
+    """Test cases for the linux-yocto-fitimage recipe"""
 
     def _fit_get_bb_vars(self, additional_vars=[]):
         """Retrieve BitBake variables specific to the test case.
@@ -435,15 +435,13 @@ class KernelFitImageBase(FitImageTestCase):
         return bb_vars
 
     def _config_add_kernel_classes(self, config):
-        config += '# Use kernel-fitimage.bbclass for the creation of the fitImage' + os.linesep
-        config += 'KERNEL_IMAGETYPES += " fitImage "' + os.linesep
-        config += 'KERNEL_CLASSES = " kernel-fitimage "' + os.linesep
+        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
+        config += 'KERNEL_DEPLOYSUBDIR = "linux-yocto-fitimage"' + os.linesep
         return config
 
     @property
     def kernel_recipe(self):
-        # virtual/kernel does not work with SRC_URI:append:pn-%s
-        return "linux-yocto"
+        return "linux-yocto-fitimage"
 
     def _config_add_uboot_env(self, config):
         """Generate an u-boot environment
@@ -738,7 +736,7 @@ class KernelFitImageBase(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
-class KernelFitImageTests(KernelFitImageBase):
+class KernelFitImageRecipeTests(KernelFitImageBase):
     """Test cases for the kernel-fitimage bbclass"""
 
     def test_fit_image(self):
@@ -1022,16 +1020,18 @@ FIT_HASH_ALG = "sha256"
         self._gen_signing_key(bb_vars)
         self._test_fitimage(bb_vars)
 
-class KernelFitImageRecipeTests(KernelFitImageTests):
-    """Test cases for the linux-yocto-fitimage recipe"""
+class KernelFitImageTests(KernelFitImageRecipeTests):
+    """Test cases for the kernel-fitimage.bbclass"""
 
     @property
     def kernel_recipe(self):
-        return "linux-yocto-fitimage"
+        # virtual/kernel does not work with SRC_URI:append:pn-%s
+        return "linux-yocto"
 
     def _config_add_kernel_classes(self, config):
-        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
-        config += 'KERNEL_DEPLOYSUBDIR = "linux-yocto-fitimage"' + os.linesep
+        config += '# Use kernel-fitimage.bbclass for the creation of the fitImage' + os.linesep
+        config += 'KERNEL_IMAGETYPES += " fitImage "' + os.linesep
+        config += 'KERNEL_CLASSES = " kernel-fitimage "' + os.linesep
         return config
 
 class FitImagePyTests(KernelFitImageBase):
-- 
2.49.0


