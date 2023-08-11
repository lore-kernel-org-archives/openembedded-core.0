Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB61C001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 12:55:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.42035.1691758499841298378
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 05:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=npeHKAoB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F8A1E000B;
	Fri, 11 Aug 2023 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691758497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4L+tuIZDGdWNymHZDHwMzqLLJDiqUx8IpLBkOj398tc=;
	b=npeHKAoB2072sapJCUgt4WVPT5hLRCCE9e7g+JMmMQKcF3clBIBuwbT9gooWG2xU0BemVW
	0ncG4h7Vy1oteT3bXQ9c3eplXcpz8fCeB5ntTlQ5S0j2rJ4CQgOz8VXi1nVUvZfzHBMaZd
	HU22Hfr9IElq+5+a85pB9FtGf1de4ohejd0aXHTaVqybh1ZqYScTcTJuPxZE72cVrG2Ku9
	xDI7S1ab5ZfnxN01ns20+/H18+lPL0HN7iFDtx116vwj9w1ZfqMe5LuWuMhSKBroOXt5fR
	TlDMns3IcZQYlnv3pPlwDCia0qjNOVv+ER9A2DpyURkt+6hXj14Ui/0F9tiNgA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 0/2] oeqa/utils/gitarchive: fix tag name computation
Date: Fri, 11 Aug 2023 14:55:30 +0200
Message-ID: <20230811125532.9427-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 12:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185838

Hello,
this series brings a fix to a sporadic tag push issue observed in
autobuilder. The bug is documented in bugzilla #15140 ([1]). Basically,
whenever the autobuilder creates a new tag on test results, it is only
aware of "local" tags, which is kind of faulty since used repository is a
shallow clone.

This series then brings two patches:
- a first one to introduce gitarchive tests as a safety net
- a second one to implement the fix by replacing "git tag" calls by "git
  ls-remote" calls where appropriate

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15140

Alexis Lothoré (2):
  oeqa/selftest: introduce gitarchive tests
  oeqa/utils/gitarchive: fix tag computation when creating archive

 .../oeqa/selftest/cases/gitarchivetests.py    | 96 +++++++++++++++++++
 meta/lib/oeqa/utils/gitarchive.py             |  6 +-
 2 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/gitarchivetests.py

-- 
2.41.0


