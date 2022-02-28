Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6F4C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:40:01 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.20344.1646059200511346295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=bNiWIAZm;
 spf=pass (domain: aj.id.au, ip: 66.111.4.27, mailfrom: andrew@aj.id.au)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D0D085C02F4;
	Mon, 28 Feb 2022 09:39:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 28 Feb 2022 09:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; bh=tN3V15BN+BkIhbDKXHaSpyr/qnl5wsWbe98lNt985cs=; b=bNiWI
	AZmJ57njsAH8X65APpTE8nnW6+mf29E5DQjJ39C+RXxyQVueO3kgkdb6P5rV4JRX
	WM5A+34bd2MKTK5odlEZdQChDdalN0z9kAE9IH5sqZVn68Na8ZIvYCAQKiuj/Y/R
	Hs1KtQW1uq2hayYQXg97v0Djjq1lncFL+tXQBc63WuRloMWd3mtAEMAYqUOopBvp
	cv6GCu1QHWUh7Scg8ds+nSPnTkcARBlA7YSKRNshlGLuBWe9vckZWSj5b1wHhASV
	z8zA1yWm1t+ovgJauTzUj9TNOUUUswdmwOAE+hoedHeHgMtplJjmqdPV8LFFJ3CR
	D9jI1lY2D0F7nPOkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=tN3V15BN+BkIhbDKXHaSpyr/qnl5w
	sWbe98lNt985cs=; b=P8OB9qF9woQiGu5DmFzzzlIFvit2ZI/TyOyM63fmzKinI
	6kEZBTOZhQXGQpVkFxlolbzdVuBdvqTwr0ZeLcMovi9yMMH6LFZkHxx0w7rXykVZ
	JcixuiAuWPuE+xyYVkvcXwGGRT7LJHynIq/rlujV5r9IGjYMWQdO2tjCpIdsMzr6
	4vBfp81pDYq6/XVkyi0yEwrkFlz74wNMH2quVLKnexEehpsmxh9sQqXBndgIQxhw
	F8UAQkbtZaTPvzkfHET9d/LkF0QJhsM1ovPPFE5ccURylqCjCyUg6qS9aBLssoeb
	LipnWM1H3iJ1amEDvNo2JPl5VxLKanhVRCTBppReg==
X-ME-Sender: <xms:v94cYqjZpjRTcvjSiN0z30_6Xb-i5mGD-dqrHNiC-aDgEkOIi-pfQQ>
    <xme:v94cYrC4bfEbuc7VUsJhX2ON_wiOK9QCQlIaZreh9Mcij-glypVL2rRXlpGIfSgbA
    P2rQRrmpeEHVVHbaA>
X-ME-Received: 
 <xmr:v94cYiEbRjk3oEXcvk_i5uyj268oOd6buohn9wIayE3_gUAYl5XCtBQ6Rl1N-aAxp1c-Tz0WU2CYqZVKZaDpeDKNyOolXqrM_3CNX_vQc1HWBvSoz02Q4rXUqN0mJwxZ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
    ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
    gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:v94cYjSfiERKP5kdiMZKIQBvcokZITuLXfl_k3LxnGasSHAO82HgXQ>
    <xmx:v94cYnxFaAU92hdacNmhnRUm9zB0Om4K1fgqdnF4faRZzOu1VL_E7Q>
    <xmx:v94cYh6aCROvegcr5HqpsuaXeZm8Wb3U-LYqqzyC8szDDEw4LI3eSQ>
    <xmx:v94cYgrdWBqFo78fQ_-nU4F1qmRI8x3vdTabXXhCS6szp4dhkAW8TA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 09:39:57 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org
Subject: [PATCH v2 0/3] rust: Fix powerpc64le support
Date: Tue,  1 Mar 2022 01:09:45 +1030
Message-Id: <20220228143948.50809-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:40:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162501

Hello,

Here's v2 of what was previously an RFC series where I just slashed my
way through trying to get rust going out of the box on powerpc64le.

Thanks to some pointers from Alex that effort has been significantly
cleaned up.

v2 is no-longer RFC as I think I have a decent understanding of what's
going on now. The RFC series can be found here:

https://lore.kernel.org/openembedded-core/20220222035234.463162-1-andrew@aj.id.au/

The changes in v2 include:

* Drop the incorrect attempts at refactoring
* Drop the (now unnecessary) install hack for libstd-rs
* Drop the patch that tried to avoid duplicate toml sections by instead
  fixing the build configuration

The bits that survived since the RFC were:

* The introduction of RUST_BUILD_ARCH to handle the snapshot artifacts
* The introduction of arch_to_rust_arch() in a new python library for
  rust

arch_to_rust_arch() is not just a rename of arch_to_rust_target_arch()
as it was in the RFC. arch_to_rust_target_arch() stays for its existing
job - arch_to_rust_arch() appears alongside to do arch translations
earlier in the process. I'm not wedded to 'arch_to_rust_arch()' as a
name, if someone has a better color for the bikeshed then suggest away. 

Finally, I've re-posted the patch adding the snapshot checksums for
powerpc64le in case there is any enthusiasm for applying it. It's okay
if not, we can maintain that in e.g. OpenBMC in a bbappend if necessary.

Please review!

Andrew Jeffery (3):
  rust: Introduce arch_to_rust_arch()
  rust: Introduce RUST_BUILD_ARCH
  rust: Add snapshot checksums for powerpc64le

 meta/classes/base.bbclass                    |  2 +-
 meta/classes/rust-common.bbclass             |  6 +++++-
 meta/lib/oe/rust.py                          |  5 +++++
 meta/recipes-devtools/rust/rust-common.inc   |  8 +++++---
 meta/recipes-devtools/rust/rust-snapshot.inc | 16 ++++++++++------
 meta/recipes-devtools/rust/rust.inc          |  2 +-
 6 files changed, 27 insertions(+), 12 deletions(-)
 create mode 100644 meta/lib/oe/rust.py

-- 
2.32.0


