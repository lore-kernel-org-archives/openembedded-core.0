Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58131C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 16:43:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13843.1638549831318595037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 08:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A289A14BF
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:43:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E45F3F73B
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:43:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] libxkbcommon: allow building of API documentation
Date: Fri,  3 Dec 2021 16:43:37 +0000
Message-Id: <20211203164340.2963235-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203164340.2963235-1-ross.burton@arm.com>
References: <20211203164340.2963235-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 16:43:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159124

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb b/meta/=
recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
index 95accfc184..725fcf009e 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
@@ -15,11 +15,14 @@ UPSTREAM_CHECK_URI =3D "http://xkbcommon.org/"
=20
 inherit meson pkgconfig
=20
-EXTRA_OEMESON =3D "-Denable-docs=3Dfalse -Denable-xkbregistry=3Dfalse"
+EXTRA_OEMESON =3D "-Denable-xkbregistry=3Dfalse"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland',=
 d)}"
-PACKAGECONFIG[x11] =3D "-Denable-x11=3Dtrue,-Denable-x11=3Dfalse,libxcb =
xkeyboard-config,"
+PACKAGECONFIG:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEA=
TURES', 'api-documentation', 'docs', '', d)}"
+
+PACKAGECONFIG[docs] =3D "-Denable-docs=3Dtrue,-Denable-docs=3Dfalse,doxy=
gen-native"
 PACKAGECONFIG[wayland] =3D "-Denable-wayland=3Dtrue,-Denable-wayland=3Df=
alse,wayland-native wayland wayland-protocols,"
+PACKAGECONFIG[x11] =3D "-Denable-x11=3Dtrue,-Denable-x11=3Dfalse,libxcb =
xkeyboard-config,"
=20
 # Fix a following runtime error:
 # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
--=20
2.25.1


