Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86460C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:39:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.63971.1707143946299173287
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 06:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JfhIkk2K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B138C0006;
	Mon,  5 Feb 2024 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7UgbIh8eEsxPElFFhB/9Kq7ofjqT6zVPGQEzTc05lY=;
	b=JfhIkk2KFfnoCB19IuEFWmicesNsJk3gV4snczYOteOH00XEEGafnpYYkPq9TWGdRmtm1R
	Ti99x1sL8Lki4NhJGKnsbaXscfXsRibdxJT53xKZqYSVvRh/zYw5duvSCmce3p8qcIEI3n
	5sr1d7ejRQzBrr1tzmTKSjIi9HkZv9DeTFMK8i0WuRwbjfqNKH6JEG/A39AIvgKCZXmPWM
	/c0Tiy3Sse3iliiYGmCMBqPb85+pfOjwIe33I1nLfS8RkkStmq45MgyPRdotQ/vaS0kdCG
	3lvbdTY+30TS7g713E56/ageZdJ6e3thjHEQYVd8xYrC3AgIh9YU4l8aXhQLRg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH v3 2/2] core-image-ptest: retrieve ptests directory when ptests fail
Date: Mon,  5 Feb 2024 15:37:57 +0100
Message-ID: <20240205143757.81826-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205143757.81826-1-alexis.lothore@bootlin.com>
References: <20240205143757.81826-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 14:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194942

From: Alexis Lothoré <alexis.lothore@bootlin.com>

TESTIMAGE_FAILED_QA_ARTIFACTS is set with a default, minimal list of files
to retrieve whenever a runtime test fails. By appending the ptest directory
only in core-image-ptest.bb, thanks to multiconfig feature used in the
recipe, only failing ptests will lead to corresponding ptest artifacts
retrieval, instead of all ptests artifacts retrieval.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
This patch was present in the original artifacts series ([1])

Changes in v3:
- slightly reword commit message body

Changes in v1 (since being picked in new series)
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


