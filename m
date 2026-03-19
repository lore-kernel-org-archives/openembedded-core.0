Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE6A109024E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:03 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14882.1773936301815333230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Ec5nMFS+;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Q2uIK+VM;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 322A4140013A;
	Thu, 19 Mar 2026 12:05:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 19 Mar 2026 12:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773936301;
	 x=1774022701; bh=8UtHRRtSss4MeThBKtlynCBJ5MeDdHs/ajUeLWYbZgY=; b=
	Ec5nMFS+/g8rB9q9NLHOmg9e6vzMrAwZihKFhUqL+24H/m2w3xjMw99m3h8lIwo5
	1Hkn0t1mwuLAF1pKpG6hDpPkizsVrkHV6nztECGuBW9Wt0VptFs9o5W2TlzxPoo4
	i3orSdPZLtECIq0UL3GElU21SasFkiaCX96uoKZiPhawhKMlP5WNKPhW249XcW2T
	SEb0ML4EpNkGkfblrWBtE/mGSYAlqpFG2b4Op/RUARFPEGnR087b7yLXuityuDkz
	a6zkhyEzYidBefmagCXK+D1zKh846QznDTOXQ7JyXaHMwuplTe6e1XP5vjcBGnch
	4CSgt0WkVaPD7FXPKpPn7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773936301; x=
	1774022701; bh=8UtHRRtSss4MeThBKtlynCBJ5MeDdHs/ajUeLWYbZgY=; b=Q
	2uIK+VMrwZYGBK9nOn+uorHJjkMFHymmKZeKTz9nb5QMGxdbr4DzfOmaiZFoGnJy
	WhcqoOwbhf07/CsUtho2k0Zrnyg25BXo8TkgzSqKfyPMQD6dKz0OqEirDyHDh5b1
	RYsv7DHwRU/MI3NkXlkzsbsWEGHtXoSDojSHTLz34gVnuZl764gdv6T3CLttBEiq
	2hTCv1tMM310B+LsObPdmtDyEQ88Ey2H1ziE7qopjS5eAh26EWbeCoSMOwJKc8Hj
	KyF3C2jjCxpccABxDZp/wduJHio3zzs5TkPe3eZiovX0nefEr7MhubhL6S2cx4cW
	9SE/zk1Ax9VieKcxaAMJg==
X-ME-Sender: <xms:rR68aYCHdA_yaO-1KJbiSFkbDnpm-9h9TEh_QnUX6YzbXnNiylXHaQ>
    <xme:rR68aQhR7ghFcXrgtVZvI1R3SsemeG2nn9utfjfB4aWvgHdheIkSmNqc-cWAxHswK
    isLk_6ASxvIJzV6LkzlOSqreStfj7Up9Qo4Ftfa9G2LFjU8KbCkxHEr>
X-ME-Received: <xmr:rR68aZOm7sGjlRbj4o1oAwENGO_xVNr_1aKfdukmY2tu-8xv7ceN1n96iD4DhM3GK-mx0wS-e9agcexvS5TrJHG-3aiiBAY>
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
X-ME-Proxy: <xmx:rR68aZ5Hoy2ja4R4aUc06_ns63sFzgFx722DCycAC26nfEuYBgAeng>
    <xmx:rR68af3vSxQdHtMGGUXHjz2Na9-11D8Kdw-AaYCEaMXSas67ee3AFg>
    <xmx:rR68aSZoxh4Eqtlv9zlG4GZJo-wGnktNf0YQ7duFSuGUMU3X9503yA>
    <xmx:rR68afAuqS4LBNMssHpBDWRyVs5-JfRKmD_ShzhMs4f9DtInnWqnnA>
    <xmx:rR68acn6UhmreUi_F2Q8QAJbEoecovWn-mY7cElE_EI_f6nt_IMOcseR>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:05:00 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 19 Mar 2026 16:04:41 +0000
Subject: [PATCH v2 3/8] ghostscript: Drop arch dependent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fix-checklayer-2-v2-3-38ffe8df4c28@pbarker.dev>
References: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
In-Reply-To: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=JrFe1SEDCx078xu48Eaxtbyc5jYJkgRswOA6cZDQbFo=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVs5a+fuiC0JDr+KpCUXrbG6qJhqe2jKx369bYnCc
 /+X32uq6yhlYRDjYpAVU2TZ3PP1/tNeR96MkFsKMHNYmUCGMHBxCsBE+EIYGSa3Vsw2eG6+Zv7/
 bazRdRvEJjWwebJNKPibUrZO9aJulTIjw3EB7+35k3NXdu098ZKpYaIxQ1RkremnQ2tltp0rKWl
 kZQAA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233537

The value of STAGING_LIBDIR depends on baselib, which may be "lib" or
"lib64" depending on the target architecture. To avoid making
PACKAGECONFIG unnecessarily arch-dependent, we can use drop the search
prefix for x11 libraries as the configure script is capable of finding
them without this information.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index 4cea89843283..b0951d79f5f4 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -33,8 +33,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
 PACKAGECONFIG[libidn] = "--with-libidn,--without-libidn,libidn"
 PACKAGECONFIG[libpaper] = "--with-libpaper,--without-libpaper,libpaper"
-PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}, \
-                      --without-x, virtual/libx11 libxext libxt"
+PACKAGECONFIG[x11] = "--with-x, --without-x, virtual/libx11 libxext libxt"
 
 EXTRA_OECONF = "--with-jbig2dec \
                 --with-fontpath=${datadir}/fonts \

-- 
2.43.0


