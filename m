Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28137C3ABBE
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:07:09 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.28207.1746364019203323448
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=JTh/MqTZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20250504130657c320ff091a81bd0db9-zvghl0@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250504130657c320ff091a81bd0db9
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NmwXkPmCjAStou+gV/9NdvFfxGVxx/qLq+N1/860jXU=;
 b=JTh/MqTZMAXKAorjBef1yADEINEthprG/+XrWetuZgZD+2RVwYYW9d3m66i/vSgnjl9O/I
 z5qxNbWxAvOR+TF3LQ7xSeO2R7bRUx6kgrSM1PVVK/QCTUN7m5zneYD5onnTFoyLIyjIUD2q
 09nl8SvhZJpS2YeULyVzGL8DBa49wahFRmIizTKpGObShVRMVuX7YZKqGMOcvl6x8RFwWqlZ
 KPO4nifoAGfgSoX/YFhb4x2Oa0zfQe802LOVL/1h9dXgVxKlckLJnZRbWtO92IM2FNSlczKV
 ilM29wi+HkV9AfuHz1/XwiJUkmD5MxQTG0ShBXiRovrjeH9MpQ0iti1g==;
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
Subject: [PATCH 12/20] oe-selftest: fitimage: run all tests for the FIT image recipe
Date: Sun,  4 May 2025 15:04:59 +0200
Message-ID: <20250504130507.717954-12-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215957

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
index 3a1d263eb9e..d6be17c63b0 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -941,6 +941,17 @@ FIT_HASH_ALG = "sha256"
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


