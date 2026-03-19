Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A6E109024C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:02 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14703.1773936301065224878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=ivpENhB5;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Ul4cOo9o;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6F51A1400161;
	Thu, 19 Mar 2026 12:05:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 19 Mar 2026 12:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773936300;
	 x=1774022700; bh=51KBwL079NlbnGlnkNwInxJJmbLq+RARPjh2u/9y5Ro=; b=
	ivpENhB546O9qShqipN8xFpPgDP3nAC/ZSgHFca082uPsAvfcimEAhLMG+gSLwvF
	BP87COfuKwAC4NfGsoIgJpEX++U1YUUbyg0HdMnFd3q0NipNqoQFhXDdTk4SnYwk
	Qyf3sESzP9DBamQIgAAz83ae3tVmcOxNYINaTYYpgkfoGQyZFd2+YI1+g2nhFYXT
	UMuraHGvYp0j6cbmnaLm10622TVaKCtgM2fjD2hVBotX5bgobejUnl0deUs075gn
	+YpwVB4rfWAyq5udcsTrX4baNf2AidQHFq3vQ3nlRTk95K8ECGNHVD6oawrRkHrv
	FriUBttCosQFgowBAVXyPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773936300; x=
	1774022700; bh=51KBwL079NlbnGlnkNwInxJJmbLq+RARPjh2u/9y5Ro=; b=U
	l4cOo9oX6dyNNlTQSCqj6lUqnErowQmpzRkZ5brMeg2FGXNGXwweq1qJeYvFgB9L
	u+i5tHs+nrPgInsXmL7O6OfSZDDWpXiqXT+R35R8K0z01arphneq+TNx8SyLnRA3
	irEW5laq560LgwzvXJQqXKYeH0cufZJXi3oksJ/Gt2V7Zz3nhcbZJnYUpUGZ4PI9
	wcnA4EdfXCTRzGKUwoECqCvA0O3fF93vkH2+U3lA8Gc6np/lZJtyFQbm49C3gBtR
	Si7FRgSj9JOmrK6+Yxn0oD624n5BOQl9IKeN3Tm8/90ApwDKKNG2ySvbR9FU8y5Y
	azM4JQJ/uW2hGnapX+Oow==
X-ME-Sender: <xms:rB68aQ01U9iqcWf9SuhKGShLQFq9BthkVsY746e2pRsHcmP2QbFnlg>
    <xme:rB68aRHkpuMOdaGnLHoaXzMWU-hfmkzi_mMzNfQuBXL2vjdVPPPTFmtII6qEwG4iu
    _KkwJnF_WO7G8Z4-s-CX2VXfQ-THrreqMK8ZZA1CsinVKpsIuzYbXxm>
X-ME-Received: <xmr:rB68aWhX6xBvv-7dNMe661SQRuPchlw78rjoJJFnnw7OVPWIEhAAzIgYAYLXSRj0apHcyrB7UcQXtuyrcLbiNMDv_iQsCNs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:rB68aU_wdZA1NCY34kEdjK8HA1iEobQ7A8L6-qfbYHvzpxciyhJfwA>
    <xmx:rB68aVrJuGwYTO4OnD8GlxdpmnImB47QtjNdV3JekHewrDPp6gj8Ew>
    <xmx:rB68ab-CJJi5rzsIJupVANCAxPvjh3m9p_zcjbHDItZ_dx1nwpTI2w>
    <xmx:rB68aRX4q5q6qcPofYTuAhA9OkcCPjJcX6QYcTvFAYYa5Api4ACvVw>
    <xmx:rB68aabGQMaC8jvKZ-rZzH_aF9Nf7naXgnzs72jum56y4ODhjz761n6G>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:04:59 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 19 Mar 2026 16:04:40 +0000
Subject: [PATCH v2 2/8] curl: Drop arch dependent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fix-checklayer-2-v2-2-38ffe8df4c28@pbarker.dev>
References: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
In-Reply-To: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=qHYEOh6UlhAPKZK9G+GraCJ1R0tShAi49WKQZiyNNRs=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVv5o4hX8eyLvE92OXprzNknzHlj6/BsxdM9H2a8V
 /fnkamM6ShlYRDjYpAVU2TZ3PP1/tNeR96MkFsKMHNYmUCGMHBxCsBEfhkw/HdfIDSzmt/9zOwM
 1iKmcqVdM3g3Lzadcu5O6yElY+lCHwmG/znxHr8TXu/5EL7tHYvs9tlPLn9m2XjcoNjq0j89hcc
 vdjMDAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233536

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


