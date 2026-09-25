Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B18C9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 06:43:18 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2642.1790318589902829129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 23:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=J//GBPS8;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout09.t-online.de (Postfix) with SMTP id 8848F37D6A
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 08:43:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.226.236]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9zeC-3DO6gC0; Fri, 25 Sep 2026 08:43:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libx11: stage the X11 locale data in the native sysroot
Date: Fri, 25 Sep 2026 08:42:55 +0200
Message-ID: <20260925064255.1835508-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790318584-D67FB86D-5A928D77/0/0 CLEAN NORMAL
X-TOI-MSGID: 150568f7-6a19-4844-8aae-3d1c804a90ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790318587; i=f_l_k@t-online.de;
	bh=UOPW7Rq+RVqOIEvhCoF9msYnbcIGQDs15ZQWn3oEG0M=;
	h=From:To:Subject:Date;
	b=J//GBPS86u8q/DVxZzauMoYu3yyGq6xFcW8AbujUAbY7U6fUClHLXOXJvnFbEkfxR
	 Z06aFBsH15B8Lyh2r32Wrz88KVJSKqSR+9SSx01LPsiAZOw3lrIdejrFWX2PT7CPXz
	 NLTJo7mGApujJsle5mkiksnEA5Q6M8HDS7BqWPbWQYnrJPc4v+46xE/RGeXs/Hb5ar
	 IThf/NwiV04QMrkIJ1vCgO20J6Ak4sDzlgwiWmqh8Kq7VqMam7BszME1oznP5Zzj1T
	 DPk1hadtDViCXRZFF01rJueP30oEwBP9AV0hy36azCHuNvdQeNsE2b7jGzI0PaBnw1
	 oNRZPiHDuTnzg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246598

staging.bbclass keeps ${datadir}/X11/locale out of every sysroot. ibus
1.5.34 builds its internal compose table at build time from
en_US.UTF-8/Compose and would otherwise read the build host's copy, so
libx11-native keeps the directory in its sysroot, as font-util does
with the fonts. Tested by building ibus against it.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb b/meta/recip=
es-graphics/xorg-lib/libx11_1.8.13.bb
index c06832e35e..db176efede 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
@@ -39,4 +39,6 @@ FILES:${PN} +=3D "${datadir}/X11/XKeysymDB ${datadir}/X=
11/XErrorDB ${datadir}/X11/
 FILES:${PN}-xcb +=3D "${libdir}/libX11-xcb.so.*"
 FILES:${PN}-locale +=3D "${datadir}/X11/locale ${libdir}/X11/locale"
=20
+SYSROOT_DIRS_IGNORE:remove:class-native =3D "${datadir}/X11/locale"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.55.0


