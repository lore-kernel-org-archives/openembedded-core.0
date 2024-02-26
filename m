Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922E9C54E55
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 09:19:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.16877.1708939174945473606
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 01:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NGlak5lC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 837611C0018;
	Mon, 26 Feb 2024 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708939172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RjfANpZH1VBLlBxrMFXZGolRgZW4PFysGd4ogERwlV4=;
	b=NGlak5lCLbQTjA7Gtds3b8uUYVJsoVhwGa1uDuQMc8Zur1aMnmrDhV/LMI4OBsVXuwHYMQ
	u5kAmaNCZTdky57NFlrZ7A4XFNBDoY9FVReDhq6eFcmrG7jhI9adgmiA2JU7UVyIZx+dDR
	ElKr68vHIMo3/46tLyzpDthvCepmg9d4F6fWGM8SNn2H2HV4DcgosFBxcCD3nJAhBGFGGi
	LrLo0bX1o5wZmQYqMFFkbLxadt0uKyKi75fvlfcO0cmXVfTqNtIobD2IMkyD/uUrZle250
	Iu1GXVnpLlbgb4LITmbuEj7U06ySZvB98cGshviOXKA+2dMQWahUGTDcQQFaQA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v4 0/5] testimage: add failed test post actions and fetch more data
Date: Mon, 26 Feb 2024 10:19:17 +0100
Message-ID: <20240226091922.41801-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 09:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196194

Hello,
this small series is related to some disk space issue observed by the SWAT
team (see [1]) which eventually leads to tests failure. In order to help
diagnose those issues, I propose to enrich the retrieved artifacts with
some additional data, like disk usage on target and on host (in case the
target is a virtualized guest)

This v4 fixes missing replace in the first commit introducing a shared
helper. This miss led to a failure in buildbot ([2])
Link to v3: [3]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15220
[2] https://autobuilder.yoctoproject.org/typhoon/#/builders/136/builds/56/steps/14/logs/stdio
[3] https://lore.kernel.org/openembedded-core/20240223151648.1453027-1-alexis.lothore@bootlin.com/

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>

Alexis Lothoré (5):
  lib/oeqa: share get_json_result_dir helper
  testimage: create a list of failed test post actions
  oeqa/utils/postactions: isolate directory creation in dedicated action
  oeqa/utils/postactions: add target disk usage stat as post action
  oeqa/utils/postactions: testimage: add host disk usage stat as post
    action

 meta/classes-recipe/testimage.bbclass | 53 ++-------------
 meta/lib/oeqa/sdk/testsdk.py          | 11 +--
 meta/lib/oeqa/sdkext/testsdk.py       |  3 +-
 meta/lib/oeqa/utils/__init__.py       |  7 ++
 meta/lib/oeqa/utils/postactions.py    | 98 +++++++++++++++++++++++++++
 5 files changed, 114 insertions(+), 58 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/postactions.py

-- 
2.43.1


