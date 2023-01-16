Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2D2C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 07:56:16 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.161654.1673855770027336211
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 23:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm3 header.b=SZyHlifY;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.25, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 250813200392;
	Mon, 16 Jan 2023 02:56:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 16 Jan 2023 02:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1673855768; x=1673942168; bh=Gkpcnr5M+ZVZZbtAYqLzURagw
	4LYZUNLNn/OUX+udUw=; b=SZyHlifYetuJgHbJfKOSmNeNXPWFfd4UwBliOTo9J
	FeJEmRE7YepN/eNN2T9+h6Rt4KxAAkVqBPH9/xNEFvQj8AORb+p97ivJToM1xBz+
	rw/6qKnmXcOxmQcpuM3xH46WwtgQyMSwvDtYrfdsACvpPqDjHXyq+RaG8SLlTlOk
	dqQ19wDWDVPamEL8l46ncyQi1zgRQ2a7y1EzSYgRgiAwFlJvV7RAmVrsAkqLaTrn
	D35cZ5Lkk85PLEyfS8nBVLqSukpwD4T+b/FNZ/TbWJtJRB5sRDG0CVplLSJVNPfB
	SqDplfcTelfUHDjEDgx8ZpYOO8kEz0PolOKd5YGb3oKog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1673855768; x=1673942168; bh=Gkpcnr5M+ZVZZbtAYqLzURagw4LYZUNLNn/
	OUX+udUw=; b=F+Cr3yLq9FdDpeb2QDBjlcynZMGBqXgrHs5lWJlzeFOYQnw87Ag
	bFyb4C6AEn23Rtoi/IPGnuLuIXBo/DPznAoMPLuB4pXaEqHB7orkt2bcMwJQiBew
	O8sNdAFy4SD37MUD0j210Rjbharo4p57d4dvBb1G5EDi8AhzS+19q2YqlMsei67s
	B6SC/8RiYAPR/y7I3g4/dydiT9uU0RFxpSztr0T0UqDzYjBheatRKvtYrrhwMSK0
	M7EovIMOZFhk4RSyLm31g5/bO5GIutA3rlhakrk9uzYe6Ub7l+FiWOUkWOR1kCQb
	gWnDmFGC4afM7YYhxxG9tJcj5Fo2tGRkFWg==
X-ME-Sender: <xms:GAPFY3QrA3TdrLvR5AokDrGdLR3iulq_meLR5rrQtq1wLErCHFMg0g>
    <xme:GAPFY4zUSS1aPGInZ9NSnCgl9O6ymIqyYoftONyKG3x1uA_7QIwvvj377L05fSyiY
    FSQfJgh0K8FbJa9DtM>
X-ME-Received: <xmr:GAPFY82f1e3hbYuvc5J1qkJwC2m00wq3jPm28axZcJ5HWBbKVMfDmtvyDtTuq1VZoFhPolb-Uu2Sj8SQeWyfWDoX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtfedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfe
    ejueffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:GAPFY3CkZo2pBou-NSJDYlQBOWGWOMYvIVn5F-HgvDX9kPdr8l8cmg>
    <xmx:GAPFYwho9F_4T4Zt6McgijdAskKtRYxlhSV4acYCd1NZ_IrodxjoQA>
    <xmx:GAPFY7oXzsiG2W2P63VMvpGmlN6UDNlfdtOCF83XdEcSun8Xv9vaUw>
    <xmx:GAPFYztuEenmpDBxXNEkEJP4RAQIQ-Nh-ycL5mwb6R5s3ZQJUh85nw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 02:56:07 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	raj.khem@gmail.com,
	Pavel Zhukov <pavel@zhukoff.net>
Subject: [kirkstone][PATCH 0/1] gcc: Refactor linker patches and fix linker on arm with usrmerg
Date: Mon, 16 Jan 2023 08:56:01 +0100
Message-Id: <20230116075602.28926-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175961

This is more complete (and more invasive) refactor of musl dynamic
linker patches in kirkstone branch. No changes have been made to
the master's version except removing of not yet existing loongarch. 

This obsoletes "gcc: Fix build with musl and usrmerge on arm" patch which has
been sent earlier and it's up to maintainer to decide which fix (or
none) to choose.   

Pavel Zhukov (1):
  gcc: Refactor linker patches and fix linker on arm with usrmerge

 meta/recipes-devtools/gcc/gcc-11.3.inc        |   1 -
 ...rm-add-armv9-a-architecture-to-march.patch |  89 +++---
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 269 +++++++++++++-----
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  10 +-
 ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 --
 5 files changed, 245 insertions(+), 149 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch

-- 
2.39.0


