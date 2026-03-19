Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B34109024E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:13 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14886.1773936304973716481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=BvWkQ7+I;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=laHrvrJA;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 1FC2BEC00FD;
	Thu, 19 Mar 2026 12:05:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 19 Mar 2026 12:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773936304;
	 x=1774022704; bh=Fi/iqI2rlHzgC9rcD6w6NhNEZkpbQm/u/qODLLwZbrg=; b=
	BvWkQ7+Ig7yEQdDvJxCjuR8/4mFaJy/WK6uJJQoK96Ff05kgf1jEMlVOlDTN5jaz
	m2GWQRX4SFoyGSG/m6ttHFLzQfse/O+ffWFTMq3L/pRs5C6EHWRiJsWJtvUIPjmG
	KgzIkk85284nmnZWemcTdHZVIrwOSvQTPFPFlPRXvzbM/0oPNt9KyThBTUgVPUMn
	qti5/VUg2eBprYy090JgkGwJlfgVEr1kgA1lwDoPdI6472xS8oPlj2UH0VeO14qb
	en1KLyjmhRhYuH4g4bboagyXOO6Fk6l+91GcAXk/ZKz4sUZxb2gHels/ofsW7RmQ
	uECjM3QTChcHT2PETDpLyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773936304; x=
	1774022704; bh=Fi/iqI2rlHzgC9rcD6w6NhNEZkpbQm/u/qODLLwZbrg=; b=l
	aHrvrJAkPfvDPvRmDqRotrx7op+90u7i5L9MKOvB8uh6dw5O6vpwF4as+3dcRoJ+
	Gan28KMrqGu6YqEdMdIMovLvbTca4aYD2S0wHVdHvxWj6LDbbtY7vSFCExZ4wpT+
	lecaRMtbSW7PcMPydZE+0QQe0wVGG9eJfRa4+mJejRGdUPOTPjv0BL80bHDFOurI
	b/jbPzMDmNM065kmIvY4F44483mCWRH3zH6DQg8jeQJcszpiqTxmnwSLQvj80KYa
	0aMxPjh5Dptsr/hONZHS+MpE8krKSnzpxL3Aq4PsQEi4hdSOGAxkMmMOrzL4gmfx
	XpbC2ULJg/ekgSQqd1hOw==
X-ME-Sender: <xms:rx68aagWfsGPxCjAS55WJjrV18zOimUmXeOIbMxUxrSU8FuxrEtWJA>
    <xme:rx68aRA1fhaNxB8ZYmvkXdP8GTmYlIU9zXnZD7rKnfGBSeRbEx0_TOUq1jUIwiky5
    oAmVGFKMIkzcqnn0h1E6u3hzK0UOD6i7ZlRK57_xAb4hegus7O_-6Q>
X-ME-Received: <xmr:rx68afvtcfbm45vTVvEeGtKXt9URMzE6_HnnlWpbM3P3vJLM3AXCyf6KZhaFX-N3WJ9YD15oTGcIrm6vXPFO6Y3OA0Pgvis>
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
X-ME-Proxy: <xmx:rx68aeYekH-IAEXfe6jxBQCiBdx5O3dDu3Pgx8IJJVWAKq8BLdgaMQ>
    <xmx:sB68aaVJ7qXtOE2E8bKCTh5vdvScblwEdJrQxxhr2jGYd0nBaWtJRA>
    <xmx:sB68aa6EU1S478I7RBZ5YWuy78nYgJhUUWMFRf27ge9yQISWIdZ4Yw>
    <xmx:sB68adiEwABKB9xkUGqpK9zEcZth5WkU1KHEZCQ66n7x_laFp1eb5Q>
    <xmx:sB68aXFIq7vZrZHWtTS3ssXehYdncb-GJIKguhzhbkC67QHfyYowWdg8>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:05:01 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 19 Mar 2026 16:04:42 +0000
Subject: [PATCH v2 4/8] libssh2: Drop arch dependent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fix-checklayer-2-v2-4-38ffe8df4c28@pbarker.dev>
References: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
In-Reply-To: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=HzJnyENaDb2RY1DSMHpB7aBJLcIm/ZtNYN/R0kW6gmg=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVvZk676evOiAn2XKub2UAnu2M+n90wRyFLVme9g9
 FXASca8o5SFQYyLQVZMkWVzz9f7T3sdeTNCbinAzGFlAhnCwMUpABOpYWFkWPGwWrfOkz/ebbFM
 Zpvatzfd9qIPtmQZhrRtt4pof3NAjZHh5pQkidC89d+db98JL1PW+SK87PSf5TO+2ghKtX7ojHv
 JBAA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233538

The value of STAGING_LIBDIR depends on baselib, which may be "lib" or
"lib64" depending on the target architecture. To avoid making
PACKAGECONFIG unnecessarily arch-dependent, we can use drop the search
prefix for libz and openssl as the configure script is capable of
finding them without this information.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-support/libssh2/libssh2_1.11.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 11d744868700..271bd14bed7f 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -18,14 +18,13 @@ inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += "\
                  --with-libz \
-                 --with-libz-prefix=${STAGING_LIBDIR} \
                  --disable-rpath \
                 "
 DISABLE_STATIC = ""
 
 # only one of openssl and gcrypt could be set
 PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_LIBDIR}, , openssl"
+PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl"
 PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
 
 BBCLASSEXTEND = "native nativesdk"

-- 
2.43.0


