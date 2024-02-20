Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AF3C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 20:02:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.23173.1708459329389031921
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 12:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UY3eOWQw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 341B620002;
	Tue, 20 Feb 2024 20:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708459327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NyK34NKgNNu7L9Pgev5j35OL/99jWasSlv0BKujLoto=;
	b=UY3eOWQwOERLg1WVX4ymfvdTn9pobmVFLuYUUphoEoCdzPZxpiEB1MvewkH8Tg6j470cvZ
	o6YmGqOSBbMbn//rDw38lfp/Apt5cFTKSv5c3TGNlGzQ08gqfg0vo+ubu5uldtRTfG3pFp
	t6tW1GSa6N+0LkmxzFtc2h+wdnfvot4XZ3A/zlZzlaGQhXIV7pf/dJHoWLWUA0eWlm6X3M
	L3mv3quva/c81wzI+m5EqpvoKjfIzJjnmOSoBp57+q6t4nfVEHRb3fiTxM5vLGsKzBFyVY
	GaS6eL78XdwSf6FsGpED0zJl5IjsDx2oJ7UWJp0ipqI+lGPHBYjbvURuqrknHw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 0/4] testimage: add failed test post actions and fetch more data
Date: Tue, 20 Feb 2024 21:01:55 +0100
Message-ID: <20240220200159.13419-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 20:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195925

Hello,
this small series is related to some disk space issue observed by the SWAT
team (see [1]) which eventually leads to tests failure. In order to help
diagnose those issues, I propose to enrich the retrieved artifacts with
some additional data, like disk usage on target and on host (in case the
target is a virtualized guest)

To do so, this series first reworks a bit actions executed on failed tests
to allow declaring a sequence of actions. It then introduces two small
actions which basically run "df" on target and host. I chose to store
those stats in dedicated files, thinking it is better than "contaminating"
tests steps logs with those very specific data.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15220

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>

Alexis Lothoré (4):
  testimage: create a list of failed test post actions
  testimage: isolate artifacts directory creation in dedicated post
    action
  testimage: add target disk usage stat as post action
  testimage: add host disk usage stat as post action

 .../failed-tests-post-actions.bbclass         | 94 +++++++++++++++++++
 meta/classes-recipe/testimage.bbclass         | 42 +--------
 2 files changed, 96 insertions(+), 40 deletions(-)
 create mode 100644 meta/classes-recipe/failed-tests-post-actions.bbclass

-- 
2.43.1


