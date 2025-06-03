Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633E6C71137
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.6266.1748939069319010803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=h21AYGly;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250603082435da87cb2eb0bc303989-brgplp@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250603082435da87cb2eb0bc303989
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pada+SmXKNghAoTE6+YXMBupozwDUS/7xpEcIKRVWJY=;
 b=h21AYGlyjA/1Vp4hYVVTShFi2r3iRx+r4tPJ+FJs7CSo8d8jgdAV3ff6bC8tGeAO/yyv0V
 3kdelKPp+34IhoSTgUHCyXwxNI+DEEyi3BjKL7rMDar6oyVg4ugx7dzru3KjylZYyxOn+8k8
 juZS85OGr41YVdmUyBPTsrH4lfqGr3hrjG0gMEBZI/OU4Bz727Anuia/N9qX1x1FnXMQjGNK
 3pdQ9KQ0tURjvsjUMLgSHjkemE0OT+8f2ucN6m1kwEl556DSx8Gqv32O8NrR5mrm41h2+hg3
 38C6mYpP3Xwv/hiDIHEfVTzO1KPMheEQzEgS/IOlXITFGFCsrcRLdycw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 18/20] oe-selftest: fitimage: remove kernel-fitimage tests
Date: Tue,  3 Jun 2025 10:23:29 +0200
Message-ID: <20250603082419.409564-19-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217780

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Remove the test cases for the kernel-fitimage.bbclass.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 7b6cba1d066..be291e4b0f4 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -437,8 +437,6 @@ class KernelFitImageBase(FitImageTestCase):
     def _config_add_kernel_classes(self, config):
         config += '# Use kernel-fit-extra-artifacts.bbclass for the creation of the vmlinux artifact' + os.linesep
         config += 'KERNEL_CLASSES = "kernel-fit-extra-artifacts"' + os.linesep
-        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
-        config += 'KERNEL_DEPLOYSUBDIR = "linux-yocto-fitimage"' + os.linesep
         return config
 
     @property
@@ -1022,20 +1020,6 @@ FIT_HASH_ALG = "sha256"
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


