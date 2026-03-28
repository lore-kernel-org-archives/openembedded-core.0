Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7D810F3DDF
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 09:50:10 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8105.1774691407878289220
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 02:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=HZnbaoJp;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=wEd9083M;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 116A614001D3;
	Sat, 28 Mar 2026 05:50:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 28 Mar 2026 05:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774691407;
	 x=1774777807; bh=h30ZHDEX0z73JSyKArlBOLn757r/TT1nggU6076LYUM=; b=
	HZnbaoJpATzw91gmDK4MSqy9fZe/Qifa2OfGF0A4VX/76FMajbWjktWHl0LejK/3
	X6sk2moI0sOwIHJC6QT2C8XCx9boIz8eJsqYEB7VJOtrr6a/9fLE8ko8Uzu863ph
	X8hB/bc3RU1dqyWXCSYhRe3W5F1EXXvEo28eyzUkX2NxOIcxotDvCM1etuUGTA+N
	OXbDgd5jbLesv/+qK9iBFlszMwbU+uVgwIyNQheTwY+R+vocg+j8NG/2yfuZQsP4
	CFuu5a0vEoB0HWbrsrseVwZ4yDFL1VuiLHUPqNe3NxX5Gw4zYQ+1BdzaH7YsO8hb
	1t+wbEbBA9dbM8C6nxVehA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774691407; x=
	1774777807; bh=h30ZHDEX0z73JSyKArlBOLn757r/TT1nggU6076LYUM=; b=w
	Ed9083Mdq4ZYo6GbTboG7m/dFw0t2AgxmmTF5jntaKrvFUuImIbIYmpg+M/i7ZB7
	V3MA54nGvAMXp6/+LEziVAOm0/plb4jVAQMqpbhd1XfR+JB6DMrNQhyLwNZkrsq4
	YezOii1lMWo+VheoMfSOEBKD6dfomHxkE/7GGufxyv7g+7/eJ0AoyKTqseSF0ERz
	FVlWeJT1ho48Kv7aKnCuH9XdIqh64LSOZ4O31QEFR9kLVJ70JfOUfGuTL8wAdjJ0
	8w40xtugE+T7CeSs3nrFveDDjIBFzt4Qeityqo4N1YOHF1q7DeiU7pvSEcIHrH4H
	VWp9B9FuWgUkFdY576vCg==
X-ME-Sender: <xms:TqTHaTmDXb2iloKtjErxcWKr40vfPYQbyJ3FN0DDe5ARg7PC9zvD3Q>
    <xme:TqTHac201eMrAUV4UqMReF5ARn06WyNSJ9QxoYL5oi33z-AZR811-T6qAyC2hAV3u
    p-5P1_rrDzyp99D3pt986TNTTtyiJyExnRm3WiSE6Orn9SJ-BTJEJ4>
X-ME-Received: <xmr:TqTHaXQfs6l2zf10qOlEDPgaDI3bKFi8NMRWlmt1hn5MQtBy3Rx17J5T-O-lVb08mcdng1uOidgCpPZMiHicz20AWHjp0ic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:TqTHaWvlUO7lN74YxkTPRhKo7pAGxWTkvn8QJ41m9FZQ3j4kYj3n_g>
    <xmx:TqTHaUZO-likzFcjXX8wf5-oU56OEzUaiYtKUPR0OQMFOPWKmh6m0Q>
    <xmx:TqTHaTsjBj_JuZ8BTB695yWPkRYr36fQm0DtV-YINUhbuK8F-tR65g>
    <xmx:TqTHaeG0PNnUK5usucT05dvvzJlQyVA8A5Dh5fu_hqIbQ7_ntqGKvg>
    <xmx:T6THaZIxIzh2k4datKGSnjw7uuEhV_Lz2vUNZSB1wYOpumlKxyg6jmoP>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 05:50:06 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Sat, 28 Mar 2026 09:49:59 +0000
Subject: [PATCH 2/2] meson: Disable exe_wrapper for allarch recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-fix-checklayer-3-v1-2-53da29ef5c35@pbarker.dev>
References: <20260328-fix-checklayer-3-v1-0-53da29ef5c35@pbarker.dev>
In-Reply-To: <20260328-fix-checklayer-3-v1-0-53da29ef5c35@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=826VL5/8t92j5BYE0s8tvxI1P/CQune+hS+A3c3E7Ho=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQeX+KTU3/n8I3Vk1gnBtZJ3zNr0G0zV5/8eoGA27eUR
 N6lq5hNOkpZGMS4GGTFFFk293y9/7TXkTcj5JYCzBxWJpAhDFycAjARy3WMDNMuBD7faO+XeXrt
 oW8rAueeb5jDH7Hh9L19Hj1PciwrnIMYGfb97z7x6OJn55zqbylTC9P1M66F5cuGhEZujV8x23H
 Nak4A
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 09:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234129

Arch-independent recipes should not require execution of programs
compiled for the target during the build, as there shouldn't be anything
compiled for the target.

Removing the dependency on MACHINE_FEATURES for allarch recipes which
use meson fixes several signature conflicts reported by
yocto-check-layer.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 2c098771fec2..9bed293603c2 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -9,6 +9,7 @@ inherit python3native meson-routines qemu
 DEPENDS:append = " meson-native ninja-native"
 
 EXEWRAPPER_ENABLED:class-native = "False"
+EXEWRAPPER_ENABLED:allarch = "False"
 EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
 DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
 

-- 
2.43.0


