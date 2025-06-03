Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2431DC61CE8
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:36 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.6265.1748939069234195791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=kegXbfFL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202506030824338db94726fbb13ab59a-aukftd@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202506030824338db94726fbb13ab59a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=C9vKRFddAw15P4sx59btPQjM79O4Q9HtdW1n4tM0P4I=;
 b=kegXbfFLJUhz9Tc0GrUJDK5F7tIPbiYJVghQPnel1lew2RnqYQ3SLOeKiGzRDQ+1U3sLE2
 3B+mNFxEfo3zEwfek6u86D6+KorTYwggfFkA+z2b8jUuyHm9ZxFbk9OmGEARs/yt2Ae83ly+
 +hvzGt1qjcO8fXPnu5CsoehffmDbcboxPAdtKNn7kPE8zPk7SNqE7sgXDsnym2w61/fYxFGb
 gy3Ypw85ij+fGUGquzlsTsJn//WLj/W3IOD3Nq49FjMpn/7jMIqTRC2bDZatExQ7sxVy/K0v
 IlLJjdqiCrHLXUnyGjqdEwJ323hvU+Nmt+Dv4VqwUGoxmaKwf/exCVxA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 15/20] oe-selftest: fitimage: run all tests for both FIT implementations
Date: Tue,  3 Jun 2025 10:23:26 +0200
Message-ID: <20250603082419.409564-16-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217776

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
 meta/lib/oeqa/selftest/cases/fitimage.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 20fedee18bf..7a8b8cc49fd 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1022,6 +1022,19 @@ FIT_HASH_ALG = "sha256"
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
+        config += '# Use kernel-fit-extra-artifacts.bbclass for the creation of the vmlinux artifact' + os.linesep
+        config += 'KERNEL_CLASSES = "kernel-fit-extra-artifacts"' + os.linesep
+        config += '# Avoid naming clashes in the deploy folder with kernel-fitimage.bbclass artifacts' + os.linesep
+        config += 'KERNEL_DEPLOYSUBDIR = "linux-yocto-fitimage"' + os.linesep
+        return config
 
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
-- 
2.49.0


