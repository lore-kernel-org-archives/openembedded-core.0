Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7005A10775F8
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:15:07 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19686.1773854099408532849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=j2GWZPQ6;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=a7i6GuHF;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B8B1D14001B8;
	Wed, 18 Mar 2026 13:14:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 13:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854098;
	 x=1773940498; bh=/16kv5rupRPF9AljjS+DAMUL6tDxlYJhT52KPnXCoVQ=; b=
	j2GWZPQ6AZ4dpB04Xrdz8hAq56WPef5KM0C/c15fCh9YyYna70eJUy0XDijmxTSM
	expNiK79y09vO8qcd6JeooQgBAsZmXo/1FpxmZowYqizSfgi4W/QkmFcW1VP54ax
	8VhUqHBp8/wi9ZCEOdnr0Yyf5/OyAejgXiKerbKPdfpUyauohxZsbaj26UZDvFeQ
	N02V7aB1iVGFhMhduc//ilpOfdMxEgnAtjnoztRvijg0XvTy7b+LfNV0avgfl+4U
	TSzFC/fvqnaIlhJdfHj9qrg/q4e903tDtadAqXrclgGfCWxcSsjBgz6W4k5HgHIL
	s6mRt2mtUfbDAdUfgP27wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854098; x=
	1773940498; bh=/16kv5rupRPF9AljjS+DAMUL6tDxlYJhT52KPnXCoVQ=; b=a
	7i6GuHF0UcpcIZLjA3EYDrTcnEnB+FQkvt+vCsI71Sp4gqTxEUht+G1U1Wa0FA3j
	/o43l3gt1zKTjTd6tfcIdfGOMrwChQJ1hC0K3scdprUsy9kq2VrfMyRp7gjFZ1Kx
	0U1UQwOPGi0wXBwoJ/UiZbyw+3qvdocIsAgAwrpPLXUCCFZvhqfROICHTevHlqsU
	ZOHFG/c7+pP4hF8+SjZe3KgNgXoAP3il87JaUVYOxeP4ZmKSAODbU0RtewBV3n3E
	Yoo62OktdqqQEYQ37oe2JqLqqHMhuHja81tG0oix9VHAgT/RntQDPalgZxzx8+B0
	UxKNFsJHQDoe+jbpjDmWQ==
X-ME-Sender: <xms:kt26adG3zUWg8kc7hcgzVZzGEamSMkJX1NiKbHMpwlDa5hnlO_Fesg>
    <xme:kt26aYWp_BYgueyv-QOj-k5ZfCM0YSAE8xf34aMkNq-KXXzG18QJ2XrDgnSy09rcE
    HNz5bkh285-HuawwyInCkewJypp1K4CVvb3LEwH4ZOT8csUkwm9QD2s>
X-ME-Received: <xmr:kt26acyhxpqaFn6EdDchiIMHQAOQemkzjdEkBCO-xa8x9ey13ZS11XT13i3yPRlW0VKEK84FpjVkikFVxpI-cdzCm7M5hXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnhepheeftddvkeehkeekhfetfedvgeegtdffte
    fhudfhleevleduudduveetieeuvddtnecuffhomhgrihhnpedutddrsggsnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrh
    hkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmh
    gsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:kt26aeN02pNzc_aFVHl1CfktCf8h0Gr5XHuNqmPUItfTmZiT2i5MVQ>
    <xmx:kt26aV40Er5GboTBOm5epAX78iRIin-bkqgF2MIuTUzCcRQyoq8GAQ>
    <xmx:kt26aXOrDLEvr5_txHxpwn3zSWBrwoZ9xiULPY-2-zkZPpRBqi7PRA>
    <xmx:kt26abkEB2jevxotttUBQ75xSwATLIPsdR4ihEHoM_razjksLZNT6w>
    <xmx:kt26aaoDYPsuAxYtHnQDc7TVyFm9SfsmpgU70eREdw4EZMzDz5BXSr_4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:58 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:53 +0000
Subject: [PATCH 10/12] libsdl2: Explicitly set PACKAGECONFIG vardeps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-10-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=mxCvrcIue8j705HReTsOO9RNLUz+m4bp8cDKeM0b7po=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuuttV5dT6QFbuvYqQ7BV/peard7YvSt5yX/BHW7jW3
 4ZHbYXSHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZgIAxvDP93y/t+nirK4On0N
 X6zw3TDzUcQK5XKNlFvTbhbPEQmcN4mR4ffVb45H1ueZxMzUOqx+No/pmaGx69ma90fvHtjfeXZ
 NMhcA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233427

The variable dependencies are discarded for PACKAGECONFIG, which may
cause tasks which use the value of PACKAGECONFIG to be considered
arch-independent, even when the value is actually different depending on
the target architecture.

In this case, we use the value of TUNE_FEATURES in PACKAGECONFIG, which
is obviously arch-dependent so we should explicitly list this
dependency.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 834cf096b977..f7c292b6adb0 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -80,6 +80,9 @@ PACKAGECONFIG[vulkan]    = "-DSDL_VULKAN=ON,-DSDL_VULKAN=OFF"
 PACKAGECONFIG[wayland]    = "-DSDL_WAYLAND=ON,-DSDL_WAYLAND=OFF,wayland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext libxrandr libxrender"
 
+# PACKAGECONFIG dependencies are not automatically carried forwards
+PACKAGECONFIG[vardeps] += "TUNE_FEATURES"
+
 CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 
 FILES:${PN} += "${datadir}/licenses/SDL2/LICENSE.txt"

-- 
2.43.0


