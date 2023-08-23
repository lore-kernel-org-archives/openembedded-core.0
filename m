Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D350EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:35:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.8400.1692786899700978869
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hUK3z1yZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8AF5C0002;
	Wed, 23 Aug 2023 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692786897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6D+/0anOxxUc1LUpdI+WAYCTrJfPu/Aq6TUOE6QjCQk=;
	b=hUK3z1yZoXG+TiPJdWXrOlt4c1PK3+ooBkjFr4tgHceQtnF7sx6987McYFedem+5WVf5gq
	+41Dh2E6BLnCUliBP38gYoCis6cYLkVHifanSpChgWEJXxGUlLb39e+/yKfdkUwqiNwO25
	IaGA+FCkMyQXaXm7Ny510HiukIzD/ErAeIofdYhCnWrz90K5ELBjqlctPVvUjDridjCEQo
	BayMVlQyT/K/L9nvLVKfybag8Xzp5sjg8KdNuuxuPqQUSzOGPtqYSZDSwjP+I2/iVehR//
	2R7KSNXAysM4tuBsva2otyyk+rBF/8B1VOb80Rkgzgmld3ogk5xnayg9SouiRA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 0/2] oeqa/utils/gitarchive: put back local tags listing as third tag listing method
Date: Wed, 23 Aug 2023 12:35:18 +0200
Message-ID: <20230823103520.72792-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 10:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186567

Hello,
this is another attempt to properly fix tag computation in Autobuilder.

First attempt ([1]) completely replaced "git tag" with "git ls-remote" to
make sure to know about all tags when computing new tag name. It raised
some issue because oe-git-archive works with local repositories with no
remote configured (it uses explicit remote url in git calls), so a second
series introduced this provided url usage as a fallback ([2])

There are still scenarios which do not match the two above: [3] shows that
oe-build-perf-report works with directories with no remote configured (the
same directories as oe-git-archive, in fact), AND does not use urls (I
guess it uses accumulated result from previous run, but I got no access to
the AB machines to make sure about it). I feel that it may not be relevant
to try to force-propagate fallback urls to oe-build-perf-report, moreover
there may be other unidentified cases scattered in whole AB configuration
which would need the same fix. Hence this series proposes to reintroduce
the previous method to retrieve tags ("git tag") as last resort method,
with a warning when reached, to both fix current issues and allow to
diagnostic future issues if it makes the initial tagging issue appear
again.

[1] https://lore.kernel.org/openembedded-core/20230811125532.9427-1-alexis.lothore@bootlin.com/
[2] https://lore.kernel.org/openembedded-core/20230818141712.189294-1-alexis.lothore@bootlin.com/
[3] https://autobuilder.yoctoproject.org/typhoon/#/builders/133/builds/2125/steps/12/logs/stdio

Alexis Lothoré (2):
  oeqa/utils/gitarchive: allow to pass a logger to get_tags
  oeqa/utils/gitarchive: fall back to local tags when listing existing
    tags

 .../oeqa/selftest/cases/gitarchivetests.py    | 25 +++++++++-----
 meta/lib/oeqa/utils/gitarchive.py             | 34 ++++++++++++-------
 2 files changed, 38 insertions(+), 21 deletions(-)

-- 
2.41.0


