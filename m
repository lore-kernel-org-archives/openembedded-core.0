Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA01C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 14:03:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.11141.1708697032171496138
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 06:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PffyHB3x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 234FA2000F;
	Fri, 23 Feb 2024 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708697030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AFDHPSW87cdWZC/ESXUnN2D1uOsfYunpo99cHXZwEig=;
	b=PffyHB3xMRmu+jHgDvQpj1qGDMrkYELQmGlhd72d6wGdtJkWwwZYnSFPn6ULheqjUcAWJx
	eHeEri8y+qv+DQBDEYuO/xNqh27KcipxrZqwdtI3VfDRsF5VSddJn8cvuquw5TW9jPpxY6
	iP9PeE1MbbOfI9JAQtBNz7RXJYAjSFOofKx0jKygnKNCGXSeMpJZN0SlhJYrqMnhY/LwtD
	2DD76uH1alQRLwxsxdZYH97JYqFnNdq+x+3nJ6dUdlwjaOzr3OMGyCBbqKxEkcNuaa34I7
	Vzfv6l9/86/HrCQ8nQffYJZ7mdxnvhMZywwRD4lARZcbO25nsVQiLbwmQbwjQQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 0/5] testimage: add failed test post actions and fetch more data
Date: Fri, 23 Feb 2024 15:03:40 +0100
Message-ID: <20240223140345.1362972-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 14:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196085

Hello,
this small series is related to some disk space issue observed by the SWAT
team (see [1]) which eventually leads to tests failure. In order to help
diagnose those issues, I propose to enrich the retrieved artifacts with
some additional data, like disk usage on target and on host (in case the
target is a virtualized guest)

This v2 is mostly about creating a python module instead of a bbclass.
Link to v1: [2]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15220
[2] https://lore.kernel.org/openembedded-core/20240220200159.13419-1-alexis.lothore@bootlin.com/

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>

Alexis Lothoré (5):
  lib/oeqa: share get_json_result_dir helper
  testimage: create a list of failed test post actions
  oeqa/utils/postactions: isolate directory creation in dedicated action
  oeqa/utils/postactions: add target disk usage stat as post action
  oeqa/utils/postactions: testimage: add host disk usage stat as post
    action

 meta/classes-recipe/testimage.bbclass | 54 ++-------------
 meta/lib/oeqa/sdk/testsdk.py          | 11 +--
 meta/lib/oeqa/utils/__init__.py       |  7 ++
 meta/lib/oeqa/utils/postactions.py    | 98 +++++++++++++++++++++++++++
 4 files changed, 112 insertions(+), 58 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/postactions.py

-- 
2.43.1


