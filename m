Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359DBC5479B
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.110596.1747248815037622799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=W+aTq119;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20250514185333a36d90d0dad40f163a-f_habg@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250514185333a36d90d0dad40f163a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9xWH8sIT9TBRjaRbRaGgLAJYrXhLwPSEwfjJNNkktdA=;
 b=W+aTq119D+XOeRQmYCUMQRc8PHQWAUixiOZ5Cl3Xl8+TGTzTAzRGMAu1b0NrmNsPItjbNK
 xQVhCcQ4mqsWQtpHrbGhjogHW4OBmju4RUxz/357QPLgOsBOs5+H5rAWmSqYGDUm6qTQ21cS
 sI8JH++pMT1zhFhZVHZhkuVq7Q9Yvixl1lEhTenvm3AJuh8hd431XKZuHG2uPhIQKpmNU7jw
 DieW0mJxw6hAvYz/rPy0jebCpqW+VC+WELc9T4/1olA/Ns3hBShycduKdDpgmMDOXntT9Pvg
 nldlfGVMY0UostM7nEDc9hy0QNOryC8dRcQxgeo+2MVyp0Wv6tmBBdSg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 13/22] oe-selftest: fitimage refactor classes
Date: Wed, 14 May 2025 20:50:57 +0200
Message-ID: <20250514185225.162998-14-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216540

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
index aadec58c30e..4d0712b6f01 100644
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
+        config += 'KERNEL_DEPLOYSUBDIR:pn-linux-yocto-fitimage = "linux-yocto-fitimage"' + os.linesep
         return config
 
     @property
     def kernel_recipe(self):
-        # virtual/kernel does not work with SRC_URI:append:pn-%s
-        return "linux-yocto"
+        return "linux-yocto-fitimage"
 
     def _config_add_uboot_env(self, config):
         """Generate an u-boot environment
@@ -741,7 +739,7 @@ class KernelFitImageBase(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
-class KernelFitImageTests(KernelFitImageBase):
+class KernelFitImageRecipeTests(KernelFitImageBase):
     """Test cases for the kernel-fitimage bbclass"""
 
     def test_fit_image(self):
@@ -981,16 +979,18 @@ FIT_HASH_ALG = "sha256"
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


