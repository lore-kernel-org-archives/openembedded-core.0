Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F60C47422
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:29:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.23786.1706106582221849676
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jai7IN7F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAB53240002;
	Wed, 24 Jan 2024 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706106580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwbgj6tEtUfWbiNvFr/S5bU6j410wxVP1KtgbuPCI5w=;
	b=Jai7IN7FQs5FRZJm8COyqL3nOE2vzSTUiqMK9muWlNX3nfi7/LJeg32axNGtFP3y6K4Gln
	unJbnE02P/p+gmaB/QCE3lWre5Bo/atfbmWnnoNoKgra9nYpwWby2VHukayhkzASb+LntC
	8OFxe/xFAPF3qjCU8eDUZmoKFafTwqfiiO7Tof5OkQ5MjNOPjhW9m9W0ob2/4o3FjPZaUQ
	opAaf/hDbIMJinkPtCJH89M3xzgWa3E8XvoK+qr9cUn4/u++OgYZ7VNdM88+72DChun9Xw
	sf4frlPXLx3t0cXDXeYOQmpt9mz1/AU1UsyzlODT6fWF63GSgb7CeDahgIf3vQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH 2/2] core-image-ptest: retrieve ptests directory when ptests fail
Date: Wed, 24 Jan 2024 15:29:30 +0100
Message-ID: <20240124142930.1038759-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20240124142930.1038759-1-alexis.lothore@bootlin.com>
References: <20240124142930.1038759-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194289

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
2.42.1


