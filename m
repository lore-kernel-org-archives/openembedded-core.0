Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBDBC678DA
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.6266.1748939069319010803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Z5ZV3g1J;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202506030824342c70e8c420df07366a-qwfmd3@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202506030824342c70e8c420df07366a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ld6242mj2Pl2JzS6Yh3on1o8WeRibpmIDwDYHWwkbRc=;
 b=Z5ZV3g1JRZksDdEoq5U/AT7SRBAGNwNZospQHblf1G9eZUdgcKYCEwqruxjGvvnpAANBVq
 V9zBjMeBYc968L++al80/+PtWXT7aNEEaBWGHL9W5b7zyrQXkbkW/m+9qOS9Q3hMmVbYqd97
 K0mv0nsogM9eM9uL3QeZeha7riw4fYBh7zq6Pb+VdpmeMa4DN55SQ6ICd+lKAVgXjDl9SACt
 BMzzoybvlfUp6U2GeQsqZ/GnfdxkBIinUhs+EFMqRqPqk7LpP/EehqkVRI3zDjJoJ3uBgWeH
 Glmrf7irKFM67h0WlZlZa9RTl46zlkRqJfeYp/oC1LpNyqn+GGqOxHyw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 16/20] oe-selftest: fitimage refactor classes
Date: Tue,  3 Jun 2025 10:23:27 +0200
Message-ID: <20250603082419.409564-17-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217778

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Make the new KernelFitImageRecipeTests class the one that contains the
code, and keep the KernelFitImageTests class as the one that just adds
back the same tests. This will make it easier to delete the tests later,
which will hopefully become obsolete when the kernel-fitimage.bbclass
class is no longer needed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 28 ++++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 7a8b8cc49fd..7b6cba1d066 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -393,7 +393,7 @@ class FitImageTestCase(OESelftestTestCase):
         self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
 
 class KernelFitImageBase(FitImageTestCase):
-    """Test cases for the kernel-fitimage bbclass"""
+    """Test cases for the linux-yocto-fitimage recipe"""
 
     def _fit_get_bb_vars(self, additional_vars=[]):
         """Retrieve BitBake variables specific to the test case.
@@ -435,15 +435,15 @@ class KernelFitImageBase(FitImageTestCase):
         return bb_vars
 
     def _config_add_kernel_classes(self, config):
-        config += '# Use kernel-fitimage.bbclass for the creation of the fitImage' + os.linesep
-        config += 'KERNEL_IMAGETYPES += " fitImage "' + os.linesep
-        config += 'KERNEL_CLASSES = " kernel-fitimage "' + os.linesep
+        config += '# Use kernel-fit-extra-artifacts.bbclass for the creation of the vmlinux artifact' + os.linesep
+        config += 'KERNEL_CLASSES = "kernel-fit-extra-artifacts"' + os.linesep
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
@@ -738,7 +738,7 @@ class KernelFitImageBase(FitImageTestCase):
             self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
                              (num_signatures, a_comment))
 
-class KernelFitImageTests(KernelFitImageBase):
+class KernelFitImageRecipeTests(KernelFitImageBase):
     """Test cases for the kernel-fitimage bbclass"""
 
     def test_fit_image(self):
@@ -1022,18 +1022,18 @@ FIT_HASH_ALG = "sha256"
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
-        config += '# Use kernel-fit-extra-artifacts.bbclass for the creation of the vmlinux artifact' + os.linesep
-        config += 'KERNEL_CLASSES = "kernel-fit-extra-artifacts"' + os.linesep
-        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
-        config += 'KERNEL_DEPLOYSUBDIR = "linux-yocto-fitimage"' + os.linesep
+        config += '# Use kernel-fitimage.bbclass for the creation of the fitImage' + os.linesep
+        config += 'KERNEL_IMAGETYPES += " fitImage "' + os.linesep
+        config += 'KERNEL_CLASSES = " kernel-fitimage "' + os.linesep
         return config
 
 class FitImagePyTests(KernelFitImageBase):
-- 
2.49.0


