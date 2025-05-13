Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3B8C3ABD9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:40:45 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.87969.1747172437261161618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 14:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Eh3cfuf8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20250513214034cf52e5fa11485596aa-0nwdg3@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250513214034cf52e5fa11485596aa
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 23:40:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JDU8pjxsBlfA45+CQjhC/j2ZvCR/eQWZyN5YnwjI8LQ=;
 b=Eh3cfuf87Uam88FiLH5kX+hOLwnzIJWoLCbLOBzvVkiIDCn0Lj/hVAWvuhuuS8f8WQj5x3
 2P2j5qJmgodnyoME5Ndro+NOOWQZrJqBLzMAxE94Xjnz2+UeoRJJYP7kGtiT+BsHc/y71ReI
 vrW7J24JxDWE55c9atNZCyfxd+E+H2KoZIr0jSVJIhl2uXdXCdEXDNQc/2xRr77zn3adqz6R
 LgDAmHMEEGkIq57P4gC0xNpOiQ6rTv0xy/FPET+zwwfxJlYDL1YGWOWFgRSb4qNL/Ti1HRgC
 hmR0mrJ+lCa7sJ12SGP0ubO6r3m0dESKhFQgd/26ZN9MfEQbhXqPZFrg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 14/22] oe-selftest: fitimage: run all tests for the FIT image recipe
Date: Tue, 13 May 2025 23:36:56 +0200
Message-ID: <20250513213834.87830-15-adrian.freihofer@siemens.com>
In-Reply-To: <20250513213834.87830-1-adrian.freihofer@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 21:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216468

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Run all existing tests for the kernel-fitimage.bbclass also for the new
linux-yocto-fitimage recipe. This also ensures that both implementations
are compatible with each other.

Note: The vmlinux kernel artifacts required by the new
linux-yocto-fitimage recipe are exported by the kernel-uboot.bbclass,
which is inherited from the kernel-uimage.bbclass, which in turn is
inherited by default from the kernel.bbclass as follows:
 KERNEL_CLASSES = " kernel-uboot "
It is therefore no longer necessary to add anything to KERNEL_CLASSES
when creating a fitImage.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index b001339b73b..aadec58c30e 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -981,6 +981,17 @@ FIT_HASH_ALG = "sha256"
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
+        config += 'KERNEL_DEPLOYSUBDIR:pn-linux-yocto-fitimage = "linux-yocto-fitimage"' + os.linesep
+        return config
 
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
-- 
2.49.0


