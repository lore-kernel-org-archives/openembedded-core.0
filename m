Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9F310775F5
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:14:57 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19754.1773854096455737919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=PvTpku7C;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=mVfXA+dK;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id CD8EFEC017E;
	Wed, 18 Mar 2026 13:14:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 18 Mar 2026 13:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854095;
	 x=1773940495; bh=s3Boz2FTAj2p883fZGf/Flvt1bZG70+9OVeYmPmInv0=; b=
	PvTpku7CC96fXP5Xi3eLufVtl6Ek/ealscnv7gFNmLf374ELnvwf/tNPlYGvkyjT
	wJ/YY4qxOTDw0RMwbyyToiRxWsSVWy9sZcVo1W6UP8hM3m8sYhViIr++69jWCVga
	/0MTueKMFSKHo2YkVIVWHqo/3p4LGq7S+Yt/K9yiAgErZbkiiEzzefkZDhvj2Exm
	0nDOXMH60Cc4V96BKVsWclm+mxd5tui0xJYwhiYbfy/S/St6qGnoPOgcKWZKG3lr
	XBfdG7Q0dcA/XLArA3JHZk5CsUT/RF4PwlfebHPZKFcSIRh9EeLOlwOi5Jld21V1
	U3DnRaojImv6bkjXf/QTHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854095; x=
	1773940495; bh=s3Boz2FTAj2p883fZGf/Flvt1bZG70+9OVeYmPmInv0=; b=m
	VfXA+dK2u5nh8V6d5Y8nuQiLG3q/m4rprWX3i6qFY5aUfq+cX4boa62iqhCaKplD
	qNB6ma7uFc+r/JBHC4mTUwAjksmG/GGD51CiUTDk9LRDm/Clm1Zq2hj4573U2bYT
	2V9oNr4T3FVxBKPL7OONh8x1OmHkymZfU11sfi57y8TJqI0pS4h9U2gdxtJ3d5Ec
	xdFHVzeiRXJmNIzWMrOzKk2a6UfMg87wPFeMiuCfjcAvhFgX8xvVD8LuUL+QWVow
	ipRlGFS0HZF6nzmjeWUr5juYC2E+O0L75I9rfyRYRFJml0utwQzUdzIrSAArWlCb
	bX2Mbd4jq+/6Z2mFmJPtg==
X-ME-Sender: <xms:j926aaNCy-sKA5XRB1s-j6iAIS7wJcftW3pTKBEDbKgZUSsnr_dQkw>
    <xme:j926ae9wQaTvG-pO3_UgNkHNXi-qSLpdHert-OCP0rse2eooGplBYBn4cgmTBr-7U
    nTgXwnRyjkMRjKvaCUVC2mTMTHzCh73bjl2Hh-qy_Z9uKAEKJJrh6E>
X-ME-Received: <xmr:j926ae7F8E0-8bwm_R2DeWpBokDZ1eoZSP-28J_oMspp8jBOsqPwDYryTvK0t09NTUcRlaFaqYf21juDzhdWZhjdRGoN4LE>
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
X-ME-Proxy: <xmx:j926aV1jmoTw-LB0Ssc-nmQPc3nSjeVdcUTZi3m3UFMsRV7GFkZjEQ>
    <xmx:j926aVBahFSVZ79CWqaElrgJ4oxNPdsYCPyR7ijTLH01TfOzQ9uLrA>
    <xmx:j926aX0_1iSqkkN7yOBbjfud8QrHpfJ30AzGB58EZUNKS-Hp79wgAA>
    <xmx:j926afsIFPU9GEZ8HSPqsDuSn00jNBCfJiK6BRzf5mQ28qICGzlbUw>
    <xmx:j926aZwK5spEL0gPX70g49DVhyDhSg8Ysbqt7iAG_GnvMYhLrswSRlG_>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:55 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:49 +0000
Subject: [PATCH 06/12] gettext: Use arch independent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-6-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=BAaD4PlnAEoNqXsBA/s5qaJiqYwrNO8d6FJx6I9VsDk=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuutv56uDZdKY9PxdmM9acTHr7fIaXbWXEVYG7G14av
 9vuubeUr6OUhUGMi0FWTJFlc8/X+097HXkzQm4pwMxhZQIZwsDFKQATEdzG8IevvPj2c4HTTps3
 MJ13PL5wRdkcjj2rJZoEu7xbZiy5e6aI4X+WSNnxkNX1mx9sN21+VLbN1kvwc/USxXMKP15d9RP
 dqMICAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233423

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


