Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C389C54E90
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:09:03 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.48593.1747652938203955123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Pv21yK/6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2025051911085645870ab3294c22058d-nizaen@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025051911085645870ab3294c22058d
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 May 2025 13:08:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=w4mkPFeRg5Zcd9msiPSkTdtvuipRk/dK13C984EaZgA=;
 b=Pv21yK/6hiE7teojHFH5TSf3jacV9bABDr2WvphZzKr0eAvNqsGBXzaWv6OmLeA76638n/
 qajAKCiHZVcQlboL76NkMHrK+oIbZEGKnZz8IX4Zg5DSMPPcE14YPMab/K0kg18dBjrjLulg
 +Y7Zsm1/MsccaL3wkf6kMLd4CwJs4NYaY2petrTgKTo/rmVWOAXmR8QBCh3dvoJUrSSHX6Y3
 gn1rg/1eVQO+1FKVdzeTE1fwCzM4+MA4oauN4tIPffOW1CZ9/kwgj1v3MylyBgc6jQOgCpS1
 5eyrSKiChzv/KztJwzlzsrqYswu8BbtJI0jscrsP6zgmXJ7E6ibAh4Uw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 11/16] oe-selftest: fitimage: run all tests for both FIT implementations
Date: Mon, 19 May 2025 13:07:55 +0200
Message-ID: <20250519110838.82978-12-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216851

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


