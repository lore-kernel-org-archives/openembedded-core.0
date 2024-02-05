Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C3DC48297
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:39:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.63970.1707143946267350720
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 06:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VxELarFO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AECF4C0002;
	Mon,  5 Feb 2024 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jPWG15VRB6VLgVlzixHauRlhPsIxYlR9MtuK4YnCpgk=;
	b=VxELarFO6E7sl9PZVYR92wj534OMPFEQxID/8wNRIJYTe08r4TWyTKLvaEEfRgQL2NMHdq
	YeVC7xnPiPgUgYClOeJl8h8dadipgo8CSau3Dkpv7p1IDnfJnkG70qx5mDgyPtHJ4S1w3r
	z8xA9GEoaedg/qrQpSVhc1F8ScUJMp3hfvdY8BL2sDmZ6LI4V8+CZ2As8ofV7rN0j+bp47
	R1mTNfN8NXdmjTtP+V2w6Y1L0h0RtO2hmgYeTMGQYjz3cDKBSSJuUhoOzQAuvc0V8wgWGD
	lh6EoYj+s927az9mhFObl+mDCEr/FnfjF86mw6i2YzJNL0HUHkiXcDdG1rfZ8w==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH v3 0/2] testimage: enable artifacts retrieval for failed tests
Date: Mon,  5 Feb 2024 15:37:55 +0100
Message-ID: <20240205143757.81826-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 14:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194941

Hello,
this small series is a new version of failed ptests artifacts retrieval
series.
The previous version can be found in [1]. This new version just fixes
commit message as well as a patchtest error (commit subject length).
With this series:
- "standard" images running tests leads to default artifact list being
  stored whenever a test fails
- if the image has ptest feature enabled, failed ptests directories will be
  retrieved
- artifacts lists can be customized: TESTIMAGE_FAILED_QA_ARTIFACTS:append =
  " <file1> <file2>..."

The feature has been tested with core-image-sato and core-image-ptest-fast
(running only a subtests of configured tests)

[1] https://lore.kernel.org/openembedded-core/20240203092538.5491-1-alexis.lothore@bootlin.com/

Alexis Lothoré (2):
  testimage: move TESTIMAGE_FAILED_QA_ARTIFACTS default to core-image
  core-image-ptest: retrieve ptests directory when ptests fail

 meta/classes-recipe/core-image.bbclass       | 8 ++++++++
 meta/classes-recipe/testimage.bbclass        | 9 ---------
 meta/recipes-core/images/core-image-ptest.bb | 2 ++
 3 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.43.0


