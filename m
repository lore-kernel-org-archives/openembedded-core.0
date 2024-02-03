Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84088C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 09:30:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.14162.1706952610904350498
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 01:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B2xF5eeq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2121E0004;
	Sat,  3 Feb 2024 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706952608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2640yxHJ/C9QHXFRZS6Uy7S/pMu+h7TPaiWduWU9+Q=;
	b=B2xF5eeq5kzj9+fIYZSFQJ/pfyJ2URcAjy04nzob+dgvBAixTNgz2zAkTwxVahXke0XxzY
	11WusV+f4ULfxpKAwIWFlWhVHcG5LcVFe0xsZ1s6RTpGLeE2m7o9DEDoCG9h/FufnSPUxO
	+M2QggSOgmehoFOoiT/StX1Ui/xKsxshEVLvpYWRO+vC3vbHY3qan415w+UWKy9CItDRQQ
	Yah2w07x1vWLbACVQgzlWxVmf5+dV+ymO0LhPUlmkmt1cstxvUwNv3oTgJfiDb6YSYC5/7
	shsO/5ahphnUOXCDpzYnrFVDccqkPFAfRZGRjELsaXIVuNOZhO8RRIYsFCnHPA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH v2 2/2] core-image-ptest: retrieve ptests directory when ptests fail
Date: Sat,  3 Feb 2024 10:29:58 +0100
Message-ID: <20240203092958.6321-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203092538.5491-1-alexis.lothore@bootlin.com>
References: <20240203092538.5491-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 09:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194841

From: Alexis Lothoré <alexis.lothore@bootlin.com>

TESTIMAGE_FAILED_QA_ARTIFACTS is defined in core-image-minimal with a
minimal list of files to retrieve whenever a runtime test fails. By
appending the ptest directory only in core-image-ptest.bb, thanks to
multiconfig feature used in the recipe, only failing ptests will lead to
corresponding ptest artifacts retrieval, instead of all ptests artifacts
retrieval.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
This patch was present in the original artifacts series ([1])

Changes since previous series:
- use += instead of append syntax

[1] https://lore.kernel.org/openembedded-core/20230609064802.11777-4-alexis.lothore@bootlin.com/
---
 meta/recipes-core/images/core-image-ptest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index b6f5c2fd6049..fb96c542c0a3 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -43,3 +43,5 @@ python () {
         raise bb.parse.SkipRecipe("No class extension set")
 }
 
+# Include ptest directory in artifacts to retrieve if there is a failed test
+TESTIMAGE_FAILED_QA_ARTIFACTS += "${libdir}/${MCNAME}/ptest"
-- 
2.43.0


