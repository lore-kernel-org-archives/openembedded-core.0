Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5B0C48277
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:29:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.23943.1706106582471563023
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aW7rXBEt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEBD4240004;
	Wed, 24 Jan 2024 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706106580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kLFT4sQIki1LY4dq39JD4IaGM4de+nQiqAC3LC2h61E=;
	b=aW7rXBEt1NL0mBg2vGrBJjH+dtuuZTgezsSULMuGaNru1G6hyastmT8gBNBx555aoPkDMl
	jFU26ljLMaqvfbbQGKm5mqwH+gc1hWkyP7h16DpfzcmIQUm6LLoMhJYz0ugA3BmEBEgzjE
	vy1kXzT8+lBt781Frop15OOJu3LEGvqJHJm6nudYjXIxy4s6Pdu7kdlRXTufewF1WACoL0
	NZSvGZ0XpaLqs8TPKPOl68H0924AZrnbR2BW1Io8BG2JDIGIIgr33VdOfP0xybYGSBcl8P
	R9n1j6CBwjCvNNrdBqnS1HD8VcOtY9dxGqf8gjs8T6USOCrj2GnLEvGlqhczRQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH 0/2] testimage: enable artifacts retrieval for failed tests
Date: Wed, 24 Jan 2024 15:29:28 +0100
Message-ID: <20240124142930.1038759-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194291

Hello,
this small series is a very late follow-up to my initial artifacts
retrieval series (sorry for the delay).
The initial series can be found in [1]. The goal is to retrieve some
specific files from target whenever some tests fail, to ease debugging. The
feature relies on a new TESTIMAGE_FAILED_QA_ARTIFACTS variable listing some
files, and the testimage class using this variable after failed tests to
save corresponding files in tmp/log/oeqa/artifacts.

Most of the initial series has been merged, except the part enriching
TESTIMAGE_FAILED_QA_ARTIFACTS with ptest files path from target to save
files specific to ptests ([2]), so the feature is currently not usable to
debug ptests. There was some discussions around how to properly set default
value and then enrich this variable. After wrapping my head around all the
ways to affect this variable (and mostly, struggling with recipes parsing
order), I came up with this new version, which:
- sets default TESTIMAGE_FAILED_QA_ARTIFACTS in core-image-minimal (because
  basically, testimage.bbclass is parsed too late, while we need to tune
  this variable in some core layers)
- uses += instead of append syntax in core layers (e.g: in ptest images),
  so the variable can still be tuned with append/prepend/remove syntax in downstream layers

[1] https://lore.kernel.org/openembedded-core/20230609064802.11777-1-alexis.lothore@bootlin.com/
[2] https://lore.kernel.org/openembedded-core/20230609064802.11777-5-alexis.lothore@bootlin.com/

Alexis Lothoré (2):
  testimage: move TESTIMAGE_FAILED_QA_ARTIFACTS default value to
    core-image-minimal
  core-image-ptest: retrieve ptests directory when ptests fail

 meta/classes-recipe/testimage.bbclass          | 9 ---------
 meta/recipes-core/images/core-image-minimal.bb | 8 ++++++++
 meta/recipes-core/images/core-image-ptest.bb   | 2 ++
 3 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.42.1


