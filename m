Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A87B1090252
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:13 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14709.1773936306477153782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=e0kQ6JpR;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Sx0cnKfV;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AD14E14001C8;
	Thu, 19 Mar 2026 12:05:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 19 Mar 2026 12:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773936305;
	 x=1774022705; bh=s3Boz2FTAj2p883fZGf/Flvt1bZG70+9OVeYmPmInv0=; b=
	e0kQ6JpRws1uzDVq6zvqQS6IX20py+2JLoCW+p3SvkJxSWfN6a0fW24JYyjUG/BI
	KyNfeMR1a+IKxY/hdrFe76mLhwu351gAvMqngHxZIRObEGg2DqS4ZdnnmffjONHc
	wmVt5qmTJNBO8BJDqY7iPuS323diNO+oleXauKPu6hw+m6yy/DAVYT4F2xlZEb03
	lMqQ+K411wcPWhKNzul65wxXLzCEIugqQjOKhNHx65vKi2xtnKsGbrBxG1b3j3ng
	iVqGorciA71ilHilE5fbbRyqGxLBWzDupxM7KGURYLlJ6xn1I11GDjKTUa9gPVgE
	kHq4vN9w2cGeyr0pTBf5JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773936305; x=
	1774022705; bh=s3Boz2FTAj2p883fZGf/Flvt1bZG70+9OVeYmPmInv0=; b=S
	x0cnKfVnxc9/eZQYfjahV2Go2es6/2xDUJSw8m+cxBTGrfuoli8uyHUPlm/iOzyx
	yoj7DAnRT5TCPlNySSRTzPE6C6J+kJiUMzoGTBtN+pAzQbyBDrupniP1al9IzvmE
	0JPyzgldL/Z1/Tkhp2zjMaIgVklJyPSnYd6iODxJN6nIjYXF5yJlYAnvKoFpD/Vm
	ysx5+z/mlN0hISempL5BTvj82zXoJgZ9Vu4hQjiNrxZ7OOjjxATjYaAhE0+tAn28
	pLLtc1MvtvDChdmNgkNXDYdPzPyM6jrqh7qMXqAtaDqh6GAzKhfhFPj3DKkzKtEP
	6X0D62WQd5PW0U+AhBb3g==
X-ME-Sender: <xms:sR68aagAA02CoNde_a4rOCft8AVXAHyX9x4BZ1zS-3QGKsDfhWSNnw>
    <xme:sR68aRDXUaAQUbWgZPuOLTcp7LNBp8XyKXNV6k9pA_7dBteJfMOM9NexBakEEmOXj
    ykj7zp677qcYVWx66tP6WgE_ZAWi6mKE-uWwFY1wlTLU9olP-MUCFla>
X-ME-Received: <xmr:sR68afvnGSE3OjJcwsmPHsF2IzLfOMWSlbDfSbni55Hzp8C4rZvNP_M2kB_awXB20NH9bphc2xwvAu1CanSC47-YGwXmB00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:sR68aeaQsQtmRQL1KvUrvfocAIy0LhwwHzlhFDXt_UoDhqYAkkUu4Q>
    <xmx:sR68aaXTl3SKNxwOZKskNmn7jELSa_jMl7Ko4pBzaXxjTTVQ2j2dZA>
    <xmx:sR68aa5Gf9w1R3Q1rOezZFaQzqBfU6aoULIFYesOgQBVYwPn1iRfXw>
    <xmx:sR68adgeriM-ghzyOgqBIIg0Z6gwJlKF3UTRfMcrQZglYb6BuyOJdw>
    <xmx:sR68aXHS4d9cwVkOW4ybb-pte4G9ys49tqU15EtS90AHR_nqp6Rw2onZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:05:05 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 19 Mar 2026 16:04:44 +0000
Subject: [PATCH v2 6/8] gettext: Use arch independent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fix-checklayer-2-v2-6-38ffe8df4c28@pbarker.dev>
References: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
In-Reply-To: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=BAaD4PlnAEoNqXsBA/s5qaJiqYwrNO8d6FJx6I9VsDk=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVu58sCH1xv+X3CwWTk12HZ3VoT690lvrSfe2fr9z
 2+Vw0xP+TtKWRjEuBhkxRRZNvd8vf+015E3I+SWAswcViaQIQxcnAIwkdKJjAxnJCw2HX389CeX
 WzNLxXMmycjUN2yB9rcWfC9wLDI5K97MyLBjo0Zf7au0lIjsDGnltV8+WWgF/zshWMW+sV3HmL/
 nPjMA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233540

The value of STAGING_LIBDIR depends on baselib, which may be "lib" or
"lib64" depending on the target architecture. To avoid making
PACKAGECONFIG unnecessarily arch-dependent, we can use STAGING_DIR_HOST
as the search prefix for libunistring & ncurses instead.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-core/gettext/gettext_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/gettext/gettext_1.0.bb
index 37e46869a7b6..e20ad8807def 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -63,8 +63,8 @@ PACKAGECONFIG[glib] = "--without-included-glib,--with-included-glib,glib-2.0"
 PACKAGECONFIG[libxml] = "--without-included-libxml,--with-included-libxml,libxml2"
 # Need paths here to avoid host contamination but this can cause RPATH warnings
 # or problems if $libdir isn't $prefix/lib.
-PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_LIBDIR}/..,--with-included-libunistring,libunistring"
-PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
+PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_DIR_HOST},--with-included-libunistring,libunistring"
+PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_DIR_HOST},--disable-curses,ncurses,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux --disable-acl,attr libselinux"
 
 do_install:append:libc-musl () {

-- 
2.43.0


