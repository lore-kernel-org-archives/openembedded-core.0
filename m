Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121D1C3ABBA
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:07:09 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.28300.1746364019682033305
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=fn9pr/I4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202505041306575724bde05aed7e64ae-_polpm@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202505041306575724bde05aed7e64ae
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ba+doxPaw/UtZEqZPDrBtLGL4a/if/wupw2VaDVkoBU=;
 b=fn9pr/I4MOBhKqJCt6AQqoEJ6rUi9cqhzsEmL3nj2xlqHGR4rCId2As0K3T0JpRwFHUh48
 gAlbOEcK/Gg0jKWCaXKLuY3BH78gF1ZRG5ibBQShXMmlXQb2ZQ01sihe7KlYpK9ndEQ7P1eJ
 fIHgLNNDF840/zz/KbcBkoLjsA6qwTx+If9O5qvTFjRtluc/ODd7H0nc4gE5ldW4H+/sOqOa
 pJov11qJx186hyhydnccpTQFXdwBH4fxbXw8mOYvbhvK47sj+vWEWjEnHxHOXlrzkswcFMdC
 CVkZBP3LBdv9yJ3a1m2ve92T9mnQiLKhPQhhpK0YDbgbgS9T8krM5N1w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 13/20] oe-selftest: fitimage refactor classes
Date: Sun,  4 May 2025 15:05:00 +0200
Message-ID: <20250504130507.717954-13-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215960

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
index d6be17c63b0..47619539073 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -376,7 +376,7 @@ class FitImageTestCase(OESelftestTestCase):
         self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
 
 class KernelFitImageBase(FitImageTestCase):
-    """Test cases for the kernel-fitimage bbclass"""
+    """Test cases for the linux-yocto-fitimage recipe"""
 
     def _fit_get_bb_vars(self, additional_vars=[]):
         """Retrieve BitBake variables specific to the test case.
@@ -416,15 +416,13 @@ class KernelFitImageBase(FitImageTestCase):
         return bb_vars
 
     def _config_add_kernel_classes(self, config):
-        config += '# Use kernel-fitimage.bbclass for the creation of the fitImage' + os.linesep
-        config += 'KERNEL_IMAGETYPES += " fitImage "' + os.linesep
-        config += 'KERNEL_CLASSES = " kernel-fitimage "' + os.linesep
+        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
+        config += 'KERNEL_DEPLOYSUBDIR:pn-linux-yocto-fitimage = "linux-yocto-fitimage"' + os.linesep
         return config
 
     @property
     def kernel_recipe(self):
-        # virtual/kernel does not work with SRC_URI:append:pn-%s
-        return "linux-yocto"
+        return "linux-yocto-fitimage"
 
     def _config_add_uboot_env(self, config):
         """Generate an u-boot environment
@@ -701,7 +699,7 @@ class KernelFitImageBase(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
-class KernelFitImageTests(KernelFitImageBase):
+class KernelFitImageRecipeTests(KernelFitImageBase):
     """Test cases for the kernel-fitimage bbclass"""
 
     def test_fit_image(self):
@@ -941,16 +939,18 @@ FIT_HASH_ALG = "sha256"
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
-        config += 'KERNEL_DEPLOYSUBDIR:pn-linux-yocto-fitimage = "linux-yocto-fitimage"' + os.linesep
+        config += '# Use kernel-fitimage.bbclass for the creation of the fitImage' + os.linesep
+        config += 'KERNEL_IMAGETYPES += " fitImage "' + os.linesep
+        config += 'KERNEL_CLASSES = " kernel-fitimage "' + os.linesep
         return config
 
 class FitImagePyTests(KernelFitImageBase):
-- 
2.49.0


