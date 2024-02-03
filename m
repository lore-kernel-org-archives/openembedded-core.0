Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86590C48297
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 09:26:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.14131.1706952351431024643
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 01:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cdkPZApU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB87140002;
	Sat,  3 Feb 2024 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706952349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RReHKXrb/3iz651t9Kouh+yhyNfa83BNC/e4wQRSrXY=;
	b=cdkPZApUThpDI0ZHcibxUSk+wzp1GSIseWdpV/pMgaJIwVZQmSZ2GFJz5v0dEfh1b7Jxdn
	m+Xnyj4S1+SSExajAZMN3x5wV12sRIPWsQYGWvkCCCTrxYfGbNNBajXu9VyMKKUjcThy2c
	UIS7GzcTZH4lC6xl5x4BibhPQxNJt7sffF2PyYVPSS8OXAT7c1LLziDqyM/TZq1hXtLQ1A
	tCfLzNwuavPJ6Tbd+wWy8qqj4RWQ0yh0qy2fqVA/3pQ3VwNd5pNKtjG3mvsGIQis+6rttt
	UUKg1VzlSdB6NOXRL04vZnZMyrkGweXCSc2FUoiSxU70pXReoFApoh0YzGwdVA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH v2 0/2] testimage: enable artifacts retrieval for failed tests
Date: Sat,  3 Feb 2024 10:25:36 +0100
Message-ID: <20240203092538.5491-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 09:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194839

Hello,
this small series is a new version of failed ptests artifacts retrieval
series.
The first version can be found in [1].

This new version moves default TESTIMAGE_FAILED_QA_ARTIFACTS
in core-image class to make sure all CI images get this default value. With
this setup:
- "standard" images running tests leads to default artifact list to be
  stored
- if the image has ptest feature enabled, failed ptests directories will be
  retrieved
- artifacts lists can be customized: TESTIMAGE_FAILED_QA_ARTIFACTS:append =
  " <file1> <file2>..."

The feature has been tested with core-image-sato and core-image-ptest-fast
(running only a subtests of configured tests)

[1] https://lore.kernel.org/openembedded-core/20240124142930.1038759-1-alexis.lothore@bootlin.com/
[2] https://lore.kernel.org/openembedded-core/20230609064802.11777-5-alexis.lothore@bootlin.com/

Alexis Lothoré (2):
  testimage: move TESTIMAGE_FAILED_QA_ARTIFACTS default value to
    core-image-minimal
  core-image-ptest: retrieve ptests directory when ptests fail

 meta/classes-recipe/core-image.bbclass       | 8 ++++++++
 meta/classes-recipe/testimage.bbclass        | 9 ---------
 meta/recipes-core/images/core-image-ptest.bb | 2 ++
 3 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.43.0


