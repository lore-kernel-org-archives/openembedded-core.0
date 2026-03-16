Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA03F506EC
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 14:59:34 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52750.1773673169110598305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 07:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=BgRwaFbl;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=PhAcq2HH;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C2D4EC057A;
	Mon, 16 Mar 2026 10:59:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 16 Mar 2026 10:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773673168;
	 x=1773759568; bh=S1T+ZKnHRDbpqZWdArU5tUGmlVAa55lMD1n8LEjT2FI=; b=
	BgRwaFblBerQQovWYZCOppI8KJfUcz/lOapppV0RdB5m+h+ht3AH5psoU17rFbM+
	Bl2eDKt02+dQsTZciyJ58fWERfm6PxrCLxccHtBREHws1MMnXjP38ZiA2kCx8wy/
	Vy7xtaAFSTissTnD0BS6XwA4g3ZUhaJyrYzYUTE4XG25+H82WUkU0TDXEPaSxBE9
	jsajeBK/KKnNhXUDBNTzthcvenoKxsAxDiU81TigkLfCoN4DABYWBHUuUIOJsNFJ
	kAMm2tnX8lyhGfGlOgRHfu56+vSfPQlEonOgi90GO2oVDAeFHv/2HmWRQ8Kib28P
	1LhVt3bfM5c3lG06YbWmRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773673168; x=
	1773759568; bh=S1T+ZKnHRDbpqZWdArU5tUGmlVAa55lMD1n8LEjT2FI=; b=P
	hAcq2HHBAgreuJeIMU9mn8+qROD4LszQ6xofT5GnlEvUFikhKWAeHibIDseKYh0q
	p4f7t7DpyReZQLJ/VmKS2k73lIZIC/I7MLkeZNRRbMZzcC/m1YmfIao6pdV5vClr
	dYGk8bLUDhVgcU902gRHwmM5z2g2H+cP/iWI4LmvIvHJXAZtsyddVesMAMM2RxWL
	6wlN/rwwX01NWQcSnRmZNrrk/u/yhUVmAKjVdMMDhlfnyv1xWbMdsu/1LI5lyHhd
	iS+RsZtXAegUxxD0Q78ebCZKxaW7L5jQMnyrqNv3DRDY0s63dau3khpxbesIH5h3
	KkSlpn0hTJgrtBq/YEVUw==
X-ME-Sender: <xms:0Bq4aTgxmMLBO0ZpkCmBXftY0gqnCXGTPNOzoLXyXMQtIfe_nr4hng>
    <xme:0Bq4aWDkOF9NBVagAQaq6i1JONiDr39i78imOgN6mUGCK1RP503EtTZ30iPpX9si8
    SWRo_Py53YIoNZjjGXfyxEeUNjP7grzQn34w5LdTu7GHlplQ1zUkHg>
X-ME-Received: <xmr:0Bq4aQtzMKUeXFS96Hh3GHy3ZX3Yohy1BWBVMMlv2FhueKURukDMLbMknduu_PlpURRGukMO6IE1PmRbim0byd01mSebNSY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleekieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:0Bq4abYm-5wB4aLecebD5gMtT1owR__XqBvTsvkAUM3ucznVkry69A>
    <xmx:0Bq4aTV9Relg2i3H1wA_w2wzi1UEMrU_uY3it8yGMNJgtobc_3Qxpg>
    <xmx:0Bq4af7Yh8F-38mNPpMTP0r5YKzWOUj0XPz3fiwjbqpvA3ulFOSqNQ>
    <xmx:0Bq4aehKiJ2E4HQ63bKzA-k0ndlQfZ4oJpRXfxdiuLodnBnwUWw8Ew>
    <xmx:0Bq4aQGE89aGy88NKpt1PHK_Gf49IlrTLq8FTas32h_yRZIFor0kmk-_>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Mar 2026 10:59:27 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 16 Mar 2026 14:59:17 +0000
Subject: [PATCH 2/2] packagegroup-core-tools-profile: Avoid dependency on
 systemtap for loongarch64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-fix-checklayer-v1-2-f3bcaa60e93c@pbarker.dev>
References: <20260316-fix-checklayer-v1-0-f3bcaa60e93c@pbarker.dev>
In-Reply-To: <20260316-fix-checklayer-v1-0-f3bcaa60e93c@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=KWE4wl+XNhKiDshp5EQVGPAPA1AsWgUYXOiEFVRbwEs=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukDqb4B7Fe8Fc3ubzgsjFHis9bZ+1b3ldvdxZ+PCB/
 H+zpntld5SyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAidfIM/3S/37zUKjznf9dX
 s51HMz6uusZ959Lef69UrylPConPEohk+Cv54fWS87dnyOlmsSbf4A+f2CSy02vj6rVTvn5fd3n
 iVDFOAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 14:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233257

Trying to build systemtap for qemuloongarch64 gives the error:

    systemtap was skipped: incompatible with host loongarch64-oe-linux (not in COMPATIBLE_HOST)

Drop this dependency from packagegroup-core-tools-profile to avoid the
error.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 9c09f5ab4430..c57669f1d74b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -30,6 +30,7 @@ SYSTEMTAP = "systemtap"
 SYSTEMTAP:libc-musl = ""
 SYSTEMTAP:nios2 = ""
 SYSTEMTAP:riscv32 = ""
+SYSTEMTAP:loongarch64 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS:arc = ""

-- 
2.43.0


