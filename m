Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A828C001DF
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 17:49:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.103868.1697996934761306232
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 10:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i6Wsc0I4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC396E0002;
	Sun, 22 Oct 2023 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697996932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZdgRyfeV1LJNTAHABtdmWM4KNd45q1SqsekSsHTi7iE=;
	b=i6Wsc0I459DUNCoZihZUt+ZvxIylRTGPkdkbeBlQQp6vTlACTguxjyls0XCdS3WhvGfgIc
	f41X2GTOGOXRXFlKs5bfUlLQGcLAqLZKoUneDKVpGr3AXcEOX77nwtXYfK0fAty6GRFRz2
	4Uk30JvDL1502rFM36r8GlsqjiQHVtLCXsV/1gsjB8WWjIU5xnaucXuC6bQK+2Bcuy+Ns5
	qEIsRWIMoRVYntHfKuPod6JUUkS6sgBpAXAH6QzmWlHQQ6uSBw/OUHv+6ENMBnpD+RE0Ws
	XDse02Nc3DUH2jufiC5KdA1FiIivnbqg6XVtsQ47afDsioZdPdVO+liFpeo9Ig==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 0/4] Add a display limit for regression report generation
Date: Sun, 22 Oct 2023 19:49:34 +0200
Message-ID: <20231022174938.7012-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 17:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189606

It has been observed that useful information in regression report can be
drowned in huge regression lists which are often false-positives (for
example, a whole set of tests has been temporarily disabled). Additionally,
the regression report usually starts with not-so-useful information when
searching for regressions (basically, big lists of tests which have not
regressed).

This series aims to improve regression display by rearranging info order as
well as bringing a default limit to how many changes are displayed per
base/target comparison. This new version follows up suggestions discussed
in [1].

One consequence of this series is the new available option for
yocto_testresults_query:
- yocto_testresults_query 4.3_M1 4.3_M2
  -> will display at most 50 regressions per test type
- yocto_testresults_query -l 10 4.3_M1 4.3_M2
  -> override the display limit and reduce it to 10 regressions per test
     type
- yocto_testresults_query -l 0 4.3_M1 4.3_M2
  -> disable the display limit, print all regressions

An example of regression report with those modifications can be found at
[2]

Note: this series does not take care yet of improving base/target pairs
selection based on machine/distro (issue raised by Ross  in [1]),
because I still need to have a better look at this before tweaking anything
there.

Changes in v2:
- use the display limit for each test type instead of using it as a global
  limit
- display regressions summaries before detailed list
- display regressions first, display matched/improved tests after, as
  "additional data"
- Reduce less useful info size
- fix testresult selftests

[1] https://lore.kernel.org/yocto/90D7FE40-32EB-4D67-B099-9E0C764FC258@arm.com/
[2] https://pastebin.com/JHFLF0sK

Alexis Lothoré (4):
  scripts/resulttool: limit the number of changes displayed per test
  scripts/resulttool: rearrange regressions report order
  scripts/resulttool: make additional info more compact
  scripts/yocto_testresults_query: add option to change display limit

 scripts/lib/resulttool/regression.py | 60 +++++++++++++++++++++++-----
 scripts/yocto_testresults_query.py   | 13 ++++--
 2 files changed, 60 insertions(+), 13 deletions(-)

-- 
2.42.0


