Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD690C73C66
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 14:16:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12487.1692368202220063365
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 07:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JNs+yzUd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85296FF80B;
	Fri, 18 Aug 2023 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692368199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bfl7cJuIxd5n/zkSHuYWA2RezpNql7XOOeeqnXYLe+o=;
	b=JNs+yzUd7pmlXKjMaxzvBHTnLK52IXnmtL1mh+k2358rlqlPPriqDvJPZ/qmL4tNlyl0TQ
	UdjTRu8X3wGwS6qmniApDazRcpVGb5hR/nRSpFLvzLaXDTKqZ1jkP7r6JCmjLaz9BKfk9L
	AftW96UAXOjCG5PxGkie/mnrQppoPHXeml8gtZ1jLVkUAx/nkdTV/c1WCNZkaOHUZmtQpY
	ait+Ec1mDZvCawc6PoVbfaKNxq9K0efTnFOhmA+HXPnhGfU33PasqGzRaxvAANiaGVeM5Z
	jxdVVYxkvNavEXDY9ZvA+9pYn+PgouEkTH85Y4wGEg54fIft+ry5Z1fgQAAxeA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 0/3] oeqa/utils/gitarchive: fix tag name computation
Date: Fri, 18 Aug 2023 16:17:09 +0200
Message-ID: <20230818141712.189294-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 14:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186371

Hello,
this series brings a fix to a sporadic tag push issue observed in
autobuilder. The bug is documented in bugzilla #15140 ([1]). Basically,
whenever the autobuilder creates a new tag on test results, it is only
aware of "local" tags, which is kind of faulty since used repository is a
shallow clone.
A first attempt has been merged a few days ago, but quickly reverted
because of a new issue linked to the fact that some use cases involve git
repositories without any remote configured, which makes the new git-ls
remote strategy fail (detected by Richard, see [2])

V2:
- mutualize ls-remote usage in a "get_tags" helper
- add a fallback case in the helper if no remote is configured (use push
  url if provided

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15140
[2] https://lore.kernel.org/openembedded-core/16b82ce9979d4a09ad3dc42ebef2cbb85c1729c3.camel@linuxfoundation.org/

Alexis Lothoré (3):
  oeqa/selftest: introduce gitarchive tests
  oeqa/utils/gitarchive: fix tag computation when creating archive
  oeqa/selftest/gitarchive: add tests about tags lisiting when no remote
    is configured

 .../oeqa/selftest/cases/gitarchivetests.py    | 127 ++++++++++++++++++
 meta/lib/oeqa/utils/gitarchive.py             |  36 ++++-
 2 files changed, 159 insertions(+), 4 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/gitarchivetests.py

-- 
2.41.0


