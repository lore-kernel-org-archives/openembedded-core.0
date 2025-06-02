Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E43C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:33 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.44078.1748851051222539994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Y4gSOdeL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202506020757286e19e12f694cf6e248-uumwew@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202506020757286e19e12f694cf6e248
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bgSEYPBSJpSyyK3zjsaaDjZiZCiIVS/mLjUFVvGUB94=;
 b=Y4gSOdeLuN/ZUTHzrftDgo4ryLLtlTGUN1TvBm75BIHzXff9mQZMMapp1vdsKlkZuTwbtu
 T2aViOR6zNSZ38SOdZuCEPpxGfpxLUBuC1tnkzEIIv7jLHgid3asw3mLQQU3PCpMj9W2dDeB
 6fSBX8kQgCwe1ecx9t2EQBqviBY+B4I5+5YfGYjwT5G4fo+rQmbC70x5AYSwMqTVzgSld96o
 /kSpqwxCAT6n6Uuwg0TuQ0pNC5YsbMar2P4sYsvSenGxSjp8xS15mxxFB9/70SIer5vBrkCS
 ISfBu1Sci9fazFfdM3yb3GLM8WSKMzoi8HRUt6o6fCUz16PF+76V6ktA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 16/21] oe-selftest: fitimage: run all tests for both FIT implementations
Date: Mon,  2 Jun 2025 09:56:26 +0200
Message-ID: <20250602075714.32122-17-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217709

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
index 20fedee18bf..bb88ac9444c 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1022,6 +1022,17 @@ FIT_HASH_ALG = "sha256"
         self._gen_signing_key(bb_vars)
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


