Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F5610775EA
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:14:55 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19751.1773854094963895700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=NWqs1Ah2;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=BvKs5y3z;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 567FDEC0113;
	Wed, 18 Mar 2026 13:14:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 13:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854094;
	 x=1773940494; bh=Fi/iqI2rlHzgC9rcD6w6NhNEZkpbQm/u/qODLLwZbrg=; b=
	NWqs1Ah2rLa487ALB4apGRW7ulkpVOMGt7i8Bu1VCfTBFkKwDFmGDWYYZZXqqD2w
	ScfZPCbT5Ge0SveZrWR8xKYbnHRIcXft236WZF1Pavidt6B/ZjL0rP437dY3228p
	YyuMrttRglgaC1N0k0SlK3B1FiqgRtuLRhqZk2XyMyAhS/YAgNDxhKowMiTXPIUC
	is32DfFk90OjJebj6pQTEXCt+eY1tDjJjPh32qlERoNiSQ2AZXLJe/1M3VPLFZ6M
	EpFAGc4YEG6jx7htT2oC6g+Krkc2u07slwq90y6RvoDATc/no//ZO7l1Ayd58o7d
	sJlGLsT7BbI/jOzKHh1vxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854094; x=
	1773940494; bh=Fi/iqI2rlHzgC9rcD6w6NhNEZkpbQm/u/qODLLwZbrg=; b=B
	vKs5y3z1n6kv1m4tLTEcCLtFOoFywucwnM0QWuwnoCltJVxfXNl5gvFvx1y8GZ/t
	A90L1b0pJrIGbqOcSHPmlWsmLyfTvmsTKP5Ljw12Hh+h76B/nRskQlrLFt7os3Sd
	702FmV1RBfUt80rjmrcVHySipcK6UI7AYhKXFVyYLM+4GaLF8mpv1Kvp1xhV3V85
	KpxZ6lMFpN0HH962QlQ2LuhEQiC+IwOr+3B1YVx8fdI5lEio8/ScRQMZAdwrJZ+P
	1lx+0BKZdlL11OzzhYF/lsmRzchDaVFf4ybScBT1xba1+nJOWiLEdmMxn/m1XqG6
	JPmHSn9ud1hZJOTziNy/g==
X-ME-Sender: <xms:jt26aYJOlmQ91fRRSP6R3xtTJVi0GrswgL9m6r60Hu2IfiAtDB9mkA>
    <xme:jt26aeLY89KQlLrh0lhmy7H0klhjBKgZWNAYVvgmkdcJ8PFCFanJKSM4rzPFC8QJi
    ryD58ks4pMAw9k2oIaTkvvbZPjrFCGXkuje0ONsGUdyxxLK3mZXhYU>
X-ME-Received: <xmr:jt26aWVaTwe9cPTtJSXdhItFBdeB8XKAUYZY3rBZoUQbmQQUbUuALMhasmDhYOGB8S-UGARCzihvB4pQli-a36ejCUrU0eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgepudenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:jt26aQiE9nor6ou05ZQMZgrOBrTjU8lc9A5XtNMS8IVhunC5nQxh-Q>
    <xmx:jt26aR_lu2b7g4SK5MYMfMUMMSMoiaWkCGMMmoBpmwTSNFeVxBGWiw>
    <xmx:jt26aaBTBkab45t30U4j8PxrTXwqcdYNpgTpRJ4G4JAIkqcuVCA8Ng>
    <xmx:jt26aeIN6DK_Jxd8j6Mwq96cz8Kd4TxV9_pKAnaweQnZA8dJw1YStQ>
    <xmx:jt26aesoXieh5IpYTjQ1-xVlmHKIF7kEhU6gTkYTmlpTMAuRpwvoEsDS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:53 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:47 +0000
Subject: [PATCH 04/12] libssh2: Drop arch dependent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-4-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=HzJnyENaDb2RY1DSMHpB7aBJLcIm/ZtNYN/R0kW6gmg=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuutv5WnPP3Zi7f2SnJmWYbO/cc/ZJMoPff67/1c2hO
 V9Mwid4dJSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAiAR2MDP2bps9+uER/vtni
 5SEufjGW/mlLHs4PnFid+LdR5ieDtwEjw1pPuaknv/KfeG3I9brzA4O+4kSVn3wBaaxeOWt36tz
 q4QYA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233421

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


