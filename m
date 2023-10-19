Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A775C41513
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:52:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.23635.1697709162512801549
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 02:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AqFYGCRH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B38564000C;
	Thu, 19 Oct 2023 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697709160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vPmW4/yUiUbSjHKYGtDc5kbpdXbx1CezrzOnpF1iyTg=;
	b=AqFYGCRHn9Jn9c1QwJ0uC79KcL4f3cuQgkHfj99U58V5XeP110Leb9099+wkIp8L7iKcc1
	Jb9mmZ3uH0kNfyVZtthRqkEHGV9ymJGBNC4VZNuV3qw2BCQBSfTGmKJEI5QlKsI4Mh2u7u
	uiqx+qP/K9reex3Hv/FuqRNzt8vRRploBD1hfLGeuCU3vVNkYQNlQOQqFWuslQaR14LTbQ
	Y0xagcYxmI49kM1t6qePX4bxIlcv9qclIz8GCvo7y2KICxpwxRa7ltFKFgWGYQ8Blu/cb2
	DPsGZTFxBQoMS08VubuVkl3cnAimTr2pMHVCZ1V49CxiFmd1X6ArkeD4hvtJXg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 0/2] Add a display limit for regression report generation
Date: Thu, 19 Oct 2023 11:53:50 +0200
Message-ID: <20231019095352.25923-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 09:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189440

It has been observed that useful information in regression report can be
drowned in huge regression lists which are often false-positives (for
example, a whole set of tests has been temporarily disabled).

This series brings a default limit to how many changes are displayed per
base/target comparison. This default can still be overriden on commandline,
for example to have a better look at the whole regression list when trying
to debug an issue (i.e. by disabling the limit)

First commit implement the limit, its default value and the corresponding
commandline option in resulttool.
Second commit allow yocto_testresults_query.py to drive this value.

As a result, one can for example do the following:
- yocto_testresults_query 4.3_M1 4.3_M2
  -> will display at most 50 regressions per test
- yocto_testresults_query -l 10 4.3_M1 4.3_M2
  -> override the display limit and reduce it to 10 regressions per pair.
- yocto_testresults_query -l 0 4.3_M1 4.3_M2
  -> disable the display limit, print all regressions

An example of regression report with display limit can be found here:
https://pastebin.com/6QbfGstR

Alexis Lothoré (2):
  scripts/resulttool: limit the number of changes displayed per test
  scripts/yocto_testresults_query: add option to change display limit

 scripts/lib/resulttool/regression.py | 23 +++++++++++++++++++----
 scripts/yocto_testresults_query.py   | 13 ++++++++++---
 2 files changed, 29 insertions(+), 7 deletions(-)

-- 
2.42.0


