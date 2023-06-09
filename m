Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20168C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 06:47:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.7348.1686293270065029752
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 23:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=emkmhHUr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686293268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SQBgPS4vL5NIetujXYHHD5Nk27LgSkHoAkPXV5+aXrs=;
	b=emkmhHUr6fT1OIldJCTAxwIqS+M0s+bXOqt4C7wNqgMFyORWLt7pvpE+0QzTN3SJQ2I+jG
	QylzjIXygoBXcn5dGcKSVf+bUn91yRSG//gdksDV9o86btgxJ6u3L97QqmqAaOGsFiodcu
	Wmc/O3/oKl7sMBhhfw69u+pJ2ImMekHGU6ttjlc/9ewdrMLSbcPNxkxPdOPLk5XDJxr3cF
	3BTufqOLQ8o7lu6DLziAp/Y/TqVZPy6uVNHMAcxrv0wdB40iEU5VF+LW8ZZtK+q14qOIPC
	raBE8+K6X0DsjggXThffO2sjexcAIu5pDicLwB5M+iunR3LuTxNBXZ575sHsxQ==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B28FA60006;
	Fri,  9 Jun 2023 06:47:47 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [OE-Core][PATCH v3 0/4] add failed tests artifacts retriever
Date: Fri,  9 Jun 2023 08:47:58 +0200
Message-Id: <20230609064802.11777-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 06:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182533

From: Alexis Lothoré <alexis.lothore@bootlin.com>

This series is a proposal to bring in an "artifact retriever" to ease
debugging when some runtime tests fails. This is a follow-up to
the v2 ([1]) and its corresponding RFC ([2]), which in turn is
a proposal to address general debugging issues like [3]

The main change is based on Alexander's suggestion to defer ptests
artifacts list in core-image-ptest.bb, which as a consequence will
automatically filter out succeeding ptests artifacts.
For this new revision which now relies on multiconfig, I stumbled upon
issues because of PTEST_EXPECT_FAILURE = "1" in core-image-ptest.bb. From
my understanding, this is used with unittest.expectFailure to prevent
tests suffering from intermittent failures from making general test session
fail systematically. To keep this behaviour, a new helper is needed to know
about those failing tests which are not accounted.

Changes since v2:
- add helper to know about any tolerated ptest failure
- allow to retrieve ptests artifacts only for failing ptests, by benefiting
  from the multiconfig feature in ptest images

Changes since v1:
- remove legacy scp option
- put back target stop in 'finally' clause
- retrieve artifacts only in nominal target run (ie no exception from
  ssh/qemu target run)
- list artifacts directly in variable instead of using intermediate file
- use standard variables in artifacts paths
- allow glob patterns in artifacts paths
- expand artifacts path on target before tryiong to retrieve them

[1] https://lore.kernel.org/openembedded-core/20230607083015.20760-1-alexis.lothore@bootlin.com/
[2] https://lore.kernel.org/openembedded-core/20230523161619a8c871d9@mail.local/T/#t
[3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14901

Alexis Lothoré (4):
  oeqa/core/runner: add helper to know about expected failures
  oeqa/target/ssh: update options for SCP
  testimage: implement test artifacts retriever for failing tests
  core-image-ptest: append ptest directory to artifacts list

 meta/classes-recipe/testimage.bbclass        | 48 ++++++++++++++++++++
 meta/lib/oeqa/core/runner.py                 |  4 ++
 meta/lib/oeqa/core/target/ssh.py             |  5 +-
 meta/recipes-core/images/core-image-ptest.bb |  1 +
 4 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.40.1


