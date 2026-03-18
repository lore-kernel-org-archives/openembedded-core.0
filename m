Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5FB10775FA
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:15:07 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19688.1773854100809143082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=cdP+dvhR;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=TGWm/nWK;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 307A614001B8;
	Wed, 18 Mar 2026 13:15:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 13:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854100;
	 x=1773940500; bh=q+l83XWXMMyNaP0nPhv9d1ZaGicNl0vjLGzg9n674QQ=; b=
	cdP+dvhRelnkvNAOvH6viFjshjshmYrBBG52RWYZZ1TDxwgUGtsbush5o2jBlGrH
	oTvfoX6dC6U8UQpq+n4bcl1DduL+N3XuMKXzdtcaF7rTRP5hnEgH2vjQav9acHlG
	b6lmkh52WxQrV3TRjbTIwJcm7pzFV4hkjehExqxnbJk9uCPKdq00x6C0cZaB7NBd
	MRFtgjQmx8XjYQXaWDFaZ5Bz7uoNTYx6nNuF6Yfxv2rUqwaRtCKBUWPT+OIsDHGC
	GxPk51zm+FQeu0eJ6sa0aSUDYZCkXZ8k8RV3pIFA6zyf8Q93rpb/ulXAM2ON+N5q
	pE6N7wHK4mde+BrSPg/3GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854100; x=
	1773940500; bh=q+l83XWXMMyNaP0nPhv9d1ZaGicNl0vjLGzg9n674QQ=; b=T
	GWm/nWKZwISljOVw2YEgmiMvuCbTzMSXnVUI92GWGVU8cdbu23OpfM332DlzA219
	OcUbufdsp6nKdtiSlzsEzQsXroEoVnkfKnQKyBHAMl8lgpmGHSH/P8xMK5q86vJW
	cf8KrENs73vfZkcf8gIGbzSL9UuEWgVnHaDe8W+jpJhQmFZAZBTxjfdh4NP3TGG4
	0BUXkhyB3/+JwXV8eAVxPS9okcCCHbLD5JNhIgNdNT95t6FmRsm+r0XAl5bQ1soj
	kmbCP+p3Sq46jp3sjcNuM4oPrWXxgT5vSZ1ddvUZOCbDBBj99oyUWaWxghhSA7J/
	rEckR1SFe2gHk3a55JMJA==
X-ME-Sender: <xms:lN26afhQpQhzCnZ5_BxeHSgwE8JGWrmWW23txZU-yD3jcWQ9V0vGeQ>
    <xme:lN26aSDpVcJM8MyBErJyK0ZMmKtG0YEmiq_9dzoR8XtLzmXKp3illfvrlTShA-tc_
    Bo8uMu2YZX0_NKWWCEy6LY5kBas0jucACHGyXZrjPaJ5Q_z8Gk2csE>
X-ME-Received: <xmr:lN26acv4z8st8kfIhBoov6W5yBsH_thF3Au1h_dN6QUoM1h-fX5CVab5eP1Vbj7G0_D3h2-_IvirTOpOaiPC1OgsiB72wt4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:lN26aXaZES41CU9VOkZuwU306vZeXImak36qM7MazUvc070ncKdEig>
    <xmx:lN26afXY7CMebuZF7t0YAHtyWFEpUnocRPZ8Y3KZiqclnFQ-DxxWjA>
    <xmx:lN26ab5pOCzMy-8NDVarEEP91hem9KutMC9A001Ys-9izlWXDTYiug>
    <xmx:lN26aahswp3-LUJw8tBR76LBVY0-lgBF5e5eo5KMcSd_aUMSs-VgVg>
    <xmx:lN26acG_M-lzF2wXyz7t6-q8kDzVkR4WQi6yiPSsTZqEaC4flD47fmB1>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:59 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:55 +0000
Subject: [PATCH 12/12] gstreamer1.0-plugins-good: Explicitly set
 PACKAGECONFIG vardeps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-12-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=cJhY7wLbq1jj7m/gdI0YIpiI6NJfF3lnIEN8hYvgdug=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuutv1WWWbY258TM1Pzu/3v9pOTX3mepxPsqVck+WqZ
 cief+9Od5SyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAilrkM/33PL223lT+32PLK
 WjOzN1sCZE/VbLCxYD1Z6Bz7Zv3J0+aMDCvXfXJW47yq9f7U7Ye/N/3bvpH5+VJV34KZfxb9Fgy
 q/8AJAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233429

The variable dependencies are discarded for PACKAGECONFIG, which may
cause tasks which use the value of PACKAGECONFIG to be considered
arch-independent, even when the value is actually different depending on
the target architecture.

In this case, we use the value of TUNE_FEATURES in PACKAGECONFIG, which
is obviously arch-dependent so we should explicitly list this
dependency.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
index e7ca26406d96..3959a5aec2df 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
@@ -27,6 +27,9 @@ PACKAGECONFIG ??= " \
     bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 speex taglib v4l2 \
 "
 
+# PACKAGECONFIG dependencies are not automatically carried forwards
+PACKAGECONFIG[vardeps] += "TUNE_FEATURES"
+
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
 X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled"
 X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"

-- 
2.43.0


