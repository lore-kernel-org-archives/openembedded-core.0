Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9C6C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 15:16:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14998.1708701415203787652
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 07:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DKJMRFXr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B1E11BF207;
	Fri, 23 Feb 2024 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708701413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pGRmQCV/Qoi0+cMfByf+5eJAn4yGwJJFvyGx+370R74=;
	b=DKJMRFXrw49/RKK6p6WWKzIMPYl4/G6YR6AGZiE5yoTM7QH7toUzG/Ku6u9MfGvsKOl0II
	virkxCGtO7cc5m1vdnbST2w2vPvTP0aYUo+NQCuKHqtIku3afRtWRQ+kRZqIIb4sqMluB5
	/taQ7a7lr09gJDd4/LAlx8IIEaRU3tmvr9zi7IUhPlorLFu3GxeRHsAcEZxTvOC2PY9KP1
	DE5RiiCCtd0S9mgTfO8ipKW8H1wuZhc2EW99RNLWG1mX2XcRGIPpgO6sz0BMrmEsMrkw0b
	Wmxg0zJGtee92Yf+bhOtba4rz89xdn/+CJIcEFO4RY1778P0+x1tHmU+mdIV/Q==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v3 0/5] testimage: add failed test post actions and fetch more data
Date: Fri, 23 Feb 2024 16:16:43 +0100
Message-ID: <20240223151648.1453027-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 15:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196096

Hello,
this small series is related to some disk space issue observed by the SWAT
team (see [1]) which eventually leads to tests failure. In order to help
diagnose those issues, I propose to enrich the retrieved artifacts with
some additional data, like disk usage on target and on host (in case the
target is a virtualized guest)

This v3 fixes apply issue with the series
Link to v2: [2]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15220
[2] https://lore.kernel.org/openembedded-core/20240223140345.1362972-1-alexis.lothore@bootlin.com/

Alexis Lothoré (5):
  lib/oeqa: share get_json_result_dir helper
  testimage: create a list of failed test post actions
  oeqa/utils/postactions: isolate directory creation in dedicated action
  oeqa/utils/postactions: add target disk usage stat as post action
  oeqa/utils/postactions: testimage: add host disk usage stat as post
    action

 meta/classes-recipe/testimage.bbclass | 53 ++-------------
 meta/lib/oeqa/sdk/testsdk.py          | 11 +--
 meta/lib/oeqa/utils/__init__.py       |  7 ++
 meta/lib/oeqa/utils/postactions.py    | 98 +++++++++++++++++++++++++++
 4 files changed, 112 insertions(+), 57 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/postactions.py

-- 
2.43.1


