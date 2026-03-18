Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E073110775EF
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:14:56 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19749.1773854093667151958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=p3FfF6ju;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=E3ItOREx;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E06B9EC0113;
	Wed, 18 Mar 2026 13:14:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 13:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854092;
	 x=1773940492; bh=51KBwL079NlbnGlnkNwInxJJmbLq+RARPjh2u/9y5Ro=; b=
	p3FfF6julNPXneRnfgZXxc4mrjgtmdHjn7KvIrzEDhQi0IAS8ziVyhizoXW3bZsO
	r670hI49c4l26hJn2xb+xMgsAopc8shLHsSwB9KFv0u1CwuoVRNdoccBXyPhwBPE
	XH/t5QCeyv6jIZQTftOZpQedKnGn/tF3JpBU5VDaeoxOw9get2PizSXL8F4+WisF
	8liir+Gw3zghez1Zrw2ArhKYd4TmL2pnW0LCRxbi4yB1pFgSwuhdfMFu//B/eDsU
	MvVp/5ua5q54UsLIJKJ9PeKZmZpP/IsNr6rtebMzR16Kwst/I+CCLNf1iNCvfbri
	PBsppVubwVfKc9mSnlrPsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854092; x=
	1773940492; bh=51KBwL079NlbnGlnkNwInxJJmbLq+RARPjh2u/9y5Ro=; b=E
	3ItORExFXzN1/6+Bq+RPOIG1vc0H0OEndZmucFL9jn+Dc4ZB/pDeMi2bwVRZWkWn
	1cwu9eLTKJHsEzkXqZb/uqs81OJDw6jfDXrfSuLKlznH9MIaFTPO+HNpkaYcAPCP
	sAnCDYyGyhDurJq5f+dELlbH38zH9pBXGrfJhBijUIcWH/xBYgkQYe3QLvhTYssE
	tG0cMCcROuxjw/O4gdLxOovme/cfnG0C7VnLCjsyRnSjDfuH1a9zcBI6Afb1O1Qu
	Qzbr67/s/Mqn8ors3BQyHZcufbV9CLya1HbTa+u0gJkk0B6iRC4rrMMn/ymlGvdn
	KunkC0BKRjtllNLogNlvg==
X-ME-Sender: <xms:jN26aZPfPmTFqlGTcWqKT4iy_5vi72xiDnW18YIO0Xu7jrnkLat7jg>
    <xme:jN26aR_juplQ2XO6GhTYlFC00vTM00x3o6EFzAO6b2MO90c0FlOkLDBNNC162PxXG
    qtAPdMFNuGPah9bSACsr8W700o403B4cqhn-MgiwKJ7FAexsKT5eok>
X-ME-Received: <xmr:jN26aV6EfdPgNpOT466eQlpPbCG9mZQW2b3azw2KTQAqvyX-I-4WuUPiRvNVkLPfp2OmYTt1NGUHp2zIN6GwPrW3SyX3mXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:jN26aQ0Z4IMW-DuaEKqlQHApJdHRQMlRtTDJSnJ_XGUnlWLCYhT-yg>
    <xmx:jN26aUDWrsTXApoeoaratbvEosZipC6m06wlPOXlXkxE63mvNCPhmA>
    <xmx:jN26aa2khnMsRerN4kHmxdh_UN9Tpyd_4BjPGZyGVDMIi1JV4w6vmQ>
    <xmx:jN26aWs-WNlhUU1Bs6qTW1ywAzSpZCFoS7cG_8MmgpSWJ1hBDRinBQ>
    <xmx:jN26abVk7qtpYgPO_zoauG7sa98FLvBS9_VJUFYV8G2bMJme3mG52xXz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:52 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:45 +0000
Subject: [PATCH 02/12] curl: Drop arch dependent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-2-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=qHYEOh6UlhAPKZK9G+GraCJ1R0tShAi49WKQZiyNNRs=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuutt5cEbZJV8n7pS0tBDPuYwX3vsbFmXqXp1Ut5U5O
 6/mwjrejlIWBjEuBlkxRZbNPV/vP+115M0IuaUAM4eVCWQIAxenAEzkpynDf1ee3Loyy6INmkwn
 J3xqm2mw9vCq3ALHlkoDtTjfv83N0xn++xxJFLn4devPmD37Nm/0fJg+idnpItdWFuMDrZbly+X
 0uAA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233419

Since the creation of the curl recipe in this repo in 2010, the search
path has been specified relative to STAGING_LIBDIR. This causes the a
dependency from the task hash of do_recipe_qa on baselib, which may be
'lib' or 'lib64' depending on the target architecture. This dependency
trips up yocto-check-layer.

Somewhere between the depths of history and today, the need for this
search path has gone away. Simply using '--with-zlib' now works.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index ee9c90846d19..b9251336b8b3 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -73,7 +73,7 @@ PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
 PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[websockets] = "--enable-websockets,--disable-websockets"
-PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
 # Use host certificates for non-target builds. As libcurl doesn't honor any of the env vars (like

-- 
2.43.0


