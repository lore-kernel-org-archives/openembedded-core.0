Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0182C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:28 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.44673.1747993341417411424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=I/2mhlOz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20250523094219605aee8e876b1b0e6b-tq_xjl@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250523094219605aee8e876b1b0e6b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qXcbTlL79kE7PS7CvJzhaUCoGK5Kg1s0rVzR6cTGYoQ=;
 b=I/2mhlOzFv4UcbP3JJhQ9RUKq3dsQDMy8slFW5Ifo1MzeIKxg6RArDOp2uba9qQN9Po+HH
 TEPnpinn1QNPnQzOjySpdslJANChwTGykIGmUC9jQYks3t1lA7RV9E4x4599m4xXeDOz82ff
 3x+NeBJMr752U+gjsZJ1VTXJvd2JpXGmNkluBx937TUMEo5h/BPpL3pkdKd0TzJOyNTbLBwX
 aQyWv2YxR6xyaTOpa9oRMSqLAaRgaeEB86p4I6fMcuqhX7rOCSnZtpo0BYgfBN4V2BY0Jban
 +l+y74FKQS9n9NLLxsz9rAyEQcQHimL+p4lvvc9x2k2ljLwZQhoEHuqg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 13/17] oe-selftest: fitimage refactor classes
Date: Fri, 23 May 2025 11:41:14 +0200
Message-ID: <20250523094152.727177-14-adrian.freihofer@siemens.com>
In-Reply-To: <20250523094152.727177-1-adrian.freihofer@siemens.com>
References: <20250523094152.727177-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217186

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
index b08e991607d..e96f8beb806 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -410,7 +410,7 @@ class FitImageTestCase(OESelftestTestCase):
         self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
 
 class KernelFitImageBase(FitImageTestCase):
-    """Test cases for the kernel-fitimage bbclass"""
+    """Test cases for the linux-yocto-fitimage recipe"""
 
     def _fit_get_bb_vars(self, additional_vars=[]):
         """Retrieve BitBake variables specific to the test case.
@@ -450,15 +450,13 @@ class KernelFitImageBase(FitImageTestCase):
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
@@ -744,7 +742,7 @@ class KernelFitImageBase(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
-class KernelFitImageTests(KernelFitImageBase):
+class KernelFitImageRecipeTests(KernelFitImageBase):
     """Test cases for the kernel-fitimage bbclass"""
 
     def test_fit_image(self):
@@ -984,16 +982,18 @@ FIT_HASH_ALG = "sha256"
         bb_vars = self._fit_get_bb_vars()
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


