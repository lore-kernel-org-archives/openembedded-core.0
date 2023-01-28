Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F86C27C76
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 06:48:43 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.8447.1674888518780997484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 22:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout10.t-online.de (Postfix) with SMTP id B912EBAF2
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 07:48:36 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.95]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pLf0u-0yLPQv0; Sat, 28 Jan 2023 07:48:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] libtiff: add PACKAGECONFIG for libdeflate and zstd
Date: Sat, 28 Jan 2023 07:48:27 +0100
Message-Id: <20230128064827.778501-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674888516-12796992-855E08D7/0/0 CLEAN NORMAL
X-TOI-MSGID: 80c1098f-bfb5-4d33-a7d8-2faaf5c81855
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 06:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176458

The main reason for this is an issue with latest libtiff update that caus=
es
gtk4-native configure to fail in finding libtiff (while it just builds
fine for target).
By comparing libtiff-4.pc for native and target it turned out, that
it links for native with zstd and libdeflate. Probably because those libs
were found on my host system.

Adding PACKAGECONFIGS for the libs prevents us from taking them from the =
host.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.5.0.bb
index 261cb52081..e2cb512892 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
@@ -37,6 +37,8 @@ PACKAGECONFIG[jpeg] =3D "--enable-jpeg,--disable-jpeg,j=
peg,"
 PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib,"
 PACKAGECONFIG[lzma] =3D "--enable-lzma,--disable-lzma,xz,"
 PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp,"
+PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd,"
+PACKAGECONFIG[libdeflate] =3D "--enable-libdeflate,--disable-libdeflate,=
libdeflate,"
=20
 # Convert single-strip uncompressed images to multiple strips of specifi=
ed
 # size (default: 8192) to reduce memory usage
--=20
2.34.1


