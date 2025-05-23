Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29F5C5B541
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:28 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.44672.1747993341335703776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=N5tD178N;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20250523094219966a3bbd29b88c5bf9-efcduc@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250523094219966a3bbd29b88c5bf9
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=w4mkPFeRg5Zcd9msiPSkTdtvuipRk/dK13C984EaZgA=;
 b=N5tD178NeD1Cds553qbNmTQ6DVgm4uVF423WJlbeQwFT/A8AoZ/kD8n9ug9t41iaTqTamg
 MsPYtr/FVwbWOVe/2auI94UWYfVjmy02iNn4bNpMxry1dPypbhP+jre+Cq6v6r/n8cI8MnVZ
 ynZn2CbZKT+XuaubVpWJswU3fxvWfCJv7b7AFUb9Lda7WWTqUvduWj2iw7BHJt6NfOnGpQG4
 lxccRCtbJRdgxCZoTx8YQH04zSAd92G1bPwmF+CHjDehTz8eXj7PKh5zo5lCxarKg3lbjc1b
 j/hkEBkP6xkHO9Mj5uf0phtMJJ5LzOBolcB1HXTni/3QIWwjTLeHQjig==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 12/17] oe-selftest: fitimage: run all tests for both FIT implementations
Date: Fri, 23 May 2025 11:41:13 +0200
Message-ID: <20250523094152.727177-13-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217197

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Run all existing tests for kernel-fitimage.bbclass also with the new
linux-yocto-fitimage recipe.
Executing each test for both implementations helps ensure functional
compatibility and consistency between them.

This change will naturally double the test duration for FIT image-related
tests, as each test now runs against both implementations. However, the
goal is to eventually deprecate kernel-fitimage.bbclass, at which point
the duplicate tests can be removed.
Additionally, since the new implementation makes significantly more
efficient use of the sstate cache compared to the old one, the overall
test execution time may still be improved.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 693d48644af..b08e991607d 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -984,6 +984,17 @@ FIT_HASH_ALG = "sha256"
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
 
+class KernelFitImageRecipeTests(KernelFitImageTests):
+    """Test cases for the linux-yocto-fitimage recipe"""
+
+    @property
+    def kernel_recipe(self):
+        return "linux-yocto-fitimage"
+
+    def _config_add_kernel_classes(self, config):
+        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
+        config += 'KERNEL_DEPLOYSUBDIR = "linux-yocto-fitimage"' + os.linesep
+        return config
 
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
-- 
2.49.0


