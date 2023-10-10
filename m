Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E852ECD6914
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:29:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.87197.1696930157099513551
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vl3H1Q0I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28D8DE0006;
	Tue, 10 Oct 2023 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696930154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=32dkkEb3/kyBAePf60ou62HwDCTiizXGv1P7ksLZb9Q=;
	b=Vl3H1Q0IPaGtitChs1L613zrfC7Tf6LGGyqci7j0RlvhXZ41HQ6yLrlJzp2cFT1KW4oBJe
	frfj2EH/sN0x3+tHzLuUAv2cT2GrM4n6dZUoq/DGydtfbid35xopu6262YVs56IK+Lya9s
	HbFhVkJajQ+xE2U09Lwy0ukXj8l3UkLhRE75jtxMTHIdX+AHUuJsxe/1RMgy0JofE7hKuf
	/svYkw1FUYHrnL7LPdoJi9WOFldizZUc8gXAgpishh546XZjffTXFmhckQi9IQ7GqQLF04
	SGnii3CeSYdyEHAUOcvm2g8ef97ngPYlk0F6cXB0kw05cbhHHiy8i2gEDPT8Xw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 0/2] Fix regression reporting for master-next
Date: Tue, 10 Oct 2023 11:30:11 +0200
Message-ID: <20231010093013.16922-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188876

There are still issues in Autobuilder when trying to generate regression
reports on master-next branch, as visible in [1]. This issue makes build
status as failed

After being finally able to replicate the issue locally (which is quite
difficult since master-next is a force-pushed branch), I observed that the
issue lies within tag searching/management in tests results repository: we
execute a "two-step" search, first with git ls-remote + glob patterns, and
then filtered with a regex. The second step may fail because some
additional tags retrieved from first step do not match exactly what is
expected by the regex. For example, tag
abelloni/master-next/69846-g01903ca0b1f7e120abd5135fb8554216ae7059c6/0
will be returned when searching for master-next tags

The two small patches in this series aim to:
1. restrict list of returned tags
2. make sure that once regex is used, the tag has matched before trying to
parse its fields

With those two patches, I have been able to properly generate the
regression report from [1] with the following command:

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6025/steps/29/logs/stdio

Alexis Lothoré (2):
  oeqa/utils/gitarchive: fix tag pattern searching
  oeqa/utils/gitarchive: ensure tag matches regex before getting its
    fields

 meta/lib/oeqa/utils/gitarchive.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.42.0


