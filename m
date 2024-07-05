Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95749C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 14:47:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18860.1720190845899712258
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 07:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b7pYJLq/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D602240005;
	Fri,  5 Jul 2024 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720190844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gB7QMNWhX3DkoREZ6OiFUR+iILu4iBnjPYUtCNPVX4s=;
	b=b7pYJLq/Hbv5ffJMGCfC1v5ciRtG6GUyDefuoqFzvkAFTBHi9hh42qn3YrkBWWz2ZzlmMv
	AbY8fhjfbCAouQLcVCBe1n+izx+rjQeIM7LSF2+H5XQ6v91H+rsy3hqBtZMMFtdtIX28G4
	UcQTxoogltR/GeWzYO2SvcwTRU0as99poiSRxHvlS1D3gcRKrax22RZScbu/8H6M1IK7Sn
	6GojEnwhKQLPAbdaxL99TOLYZB3FgWxmzl5CjARSGzbgZZHGiw3zr4VKmHbW/a9kLqqLK1
	3I3YZMSCO4v6/qB+vqvTvvmqzTuhFoK1K1QEA6eevr7s7nFAhE3HFhEJXpC5WA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/2] oeqa/utils/postactions: fix disk storage consumption
Date: Fri,  5 Jul 2024 16:46:36 +0200
Message-ID: <20240705144638.441976-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 14:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201609

Hello,
this small series aims to fix Bugzilla issue 15536 [1], which results in a
big disk storage consumption and/or inode max count issue. The main root
cause is that in its current form, the artifacts retriever convert symlinks
to the targeted files. This series changes the way those files are
retrieved to make sure the symlinks are preserved. To do so, it replaces
the series of scp performed on each file by a single tar command which
output the generated compressed archive on its stdout. It is captured and
returned as part of an ssh process, and it it then fed to another tar
command run this time on host, to extract the artifacts, at the same place
as before (tmp/log/oeqa/artifacts)

The first commit is a small update to SSH target in ssh.py to allow to
retrieve raw output (ie raw bytes, without any decoding or formatting) from
a command run on the target. This allows to get the compressed archive
directly as an output from the remote command.
The second commit uses this new feature to generate, retrieve and extract
this archive on the fly, without ever storing it onto the target nor the
host.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15536

Alexis Lothoré (2):
  oeqa/ssh: allow to retrieve raw, unformatted ouput
  oeqa/utils/postactions: transfer whole archive over ssh instead of
    doing individual copies

 meta/lib/oeqa/core/target/ssh.py   | 16 ++++++++--------
 meta/lib/oeqa/utils/postactions.py | 19 +++++++++----------
 2 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.45.2


