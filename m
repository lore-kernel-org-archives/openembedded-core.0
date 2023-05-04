Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF49DC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 13:10:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.49027.1683205814100492886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 06:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03B32C14;
	Thu,  4 May 2023 06:10:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 47D7D3F67D;
	Thu,  4 May 2023 06:10:13 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] Revert "ffmpeg: move ffmpeg config into packageconfig"
Date: Thu,  4 May 2023 14:10:09 +0100
Message-Id: <20230504131010.2182417-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504131010.2182417-1-ross.burton@arm.com>
References: <20230504131010.2182417-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 13:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180873

From: Ross Burton <ross.burton@arm.com>

There's very little reason to expose "build shared libraries", "build
position-independent code", or "enable threads" as recipe-specific
packageconfig options.  Revert the commit which did this and explicitly
set the relevant options in EXTRA_OECONF.

This reverts commit b6e67e3d287407c6f022bbe672d9d206d90a12a4.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_6.0.bb
index 7db43a82816..1cd98e63c37 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -40,8 +40,7 @@ DEPENDS =3D "nasm-native"
 inherit autotools pkgconfig
=20
 PACKAGECONFIG ??=3D "avdevice avfilter avcodec avformat swresample swsca=
le postproc \
-                   alsa bzlib lzma pic pthreads shared theora zlib \
-                   ${@bb.utils.contains('AVAILTUNES', 'mips32r2', 'mips3=
2r2', '', d)} \
+                   alsa bzlib lzma theora zlib \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xc=
b', '', d)}"
=20
 # libraries to build in addition to avutil
@@ -80,13 +79,6 @@ PACKAGECONFIG[xcb] =3D "--enable-libxcb,--disable-libx=
cb,libxcb"
 PACKAGECONFIG[xv] =3D "--enable-outdev=3Dxv,--disable-outdev=3Dxv,libxv"
 PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
=20
-# other configuration options
-PACKAGECONFIG[mips32r2] =3D ",--disable-mipsdsp --disable-mipsdspr2"
-PACKAGECONFIG[pic] =3D "--enable-pic"
-PACKAGECONFIG[pthreads] =3D "--enable-pthreads,--disable-pthreads"
-PACKAGECONFIG[shared] =3D "--enable-shared"
-PACKAGECONFIG[strip] =3D ",--disable-stripping"
-
 # Check codecs that require --enable-nonfree
 USE_NONFREE =3D "${@bb.utils.contains_any('PACKAGECONFIG', [ 'openssl' ]=
, 'yes', '', d)}"
=20
@@ -97,6 +89,10 @@ def cpu(d):
     return 'generic'
=20
 EXTRA_OECONF =3D " \
+    --disable-stripping \
+    --enable-pic \
+    --enable-shared \
+    --enable-pthreads \
     ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d=
)} \
     \
     --cross-prefix=3D${TARGET_PREFIX} \
@@ -114,6 +110,7 @@ EXTRA_OECONF =3D " \
     --libdir=3D${libdir} \
     --shlibdir=3D${libdir} \
     --datadir=3D${datadir}/ffmpeg \
+    ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsds=
p --disable-mipsdspr2', d)} \
     --cpu=3D${@cpu(d)} \
     --pkg-config=3Dpkg-config \
 "
--=20
2.34.1


