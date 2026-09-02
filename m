Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42331C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:11:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15058.1788361860674835423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=kKp6bDHj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6913E165C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BFFAA3F673
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788361860; bh=7YUke8n3eYHggDWJDEza3hsbi/WLbsrRpSAYnQU4Af0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kKp6bDHjmS+PNfY7TVxhgViRqimubNTBplmaLE1V9N0xYbJogB848Rq4IsHGGIBfG
	 4rXGjnOlLAtSwkf0DCT/55QubzUx987sn2PWP5bnku9iCk9CHBmX54I0rlbhYHba+v
	 2wlJNPMQm+LrzxlCuOFVJ2I1g52m/xAelf2+YDDU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] xorg-lib: remove redundant util-macros dependencies
Date: Wed,  2 Sep 2026 16:10:50 +0100
Message-ID: <20260902151051.159953-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902151051.159953-1-ross.burton@arm.com>
References: <20260902151051.159953-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244971

These recipes use meson to build, so no longer need util-macros (which
provides xorg-specific autoconf macros).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb     | 2 --
 meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb      | 2 +-
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb b/meta/r=
ecipes-graphics/xorg-lib/libpciaccess_0.19.bb
index 428dffad81b..9eac2f467b8 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb
@@ -9,8 +9,6 @@ SECTION =3D "x11/libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D54c978968e565218eea36cf03ef24=
352"
=20
-DEPENDS =3D "util-macros"
-
 SRC_URI =3D "${XORG_MIRROR}/individual/lib/${BP}.tar.xz"
 SRC_URI[sha256sum] =3D "3c55aa86c82e54a4e3109786f0463530d53b36b6d1cfd146=
16454f985dd2aa43"
=20
diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb b/meta/re=
cipes-graphics/xorg-lib/libxkbfile_1.2.0.bb
index 40d2ab11882..dee0a2b2946 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb
@@ -9,7 +9,7 @@ SECTION =3D "x11/libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8be7367f7e5d605a426f76bb37d4d=
61f"
=20
-DEPENDS +=3D "util-macros virtual/libx11 xorgproto"
+DEPENDS +=3D "virtual/libx11 xorgproto"
=20
 XORG_PN =3D "${BPN}"
 XORG_EXT ?=3D "tar.xz"
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb b/me=
ta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
index ef3579464df..962198fbaea 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/data/xkeyboard-c=
onfig/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "b77041324f0109f77161ee43743fe04baa485866af8460d3=
1e476ad3f7648fd5"
=20
 SECTION =3D "x11/libs"
-DEPENDS =3D "util-macros libxslt-native"
+DEPENDS =3D "libxslt-native"
=20
 FILES:${PN} +=3D "${datadir}/X11/xkb ${datadir}/xkeyboard-config-2"
=20
--=20
2.43.0


