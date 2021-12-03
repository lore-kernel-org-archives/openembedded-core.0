Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576F5C43219
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 16:43:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13794.1638549826557827158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 08:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DE531435
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:43:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDC5C3F73B
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:43:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] xkbcommon: add option for xkbregistry
Date: Fri,  3 Dec 2021 16:43:40 +0000
Message-Id: <20211203164340.2963235-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203164340.2963235-1-ross.burton@arm.com>
References: <20211203164340.2963235-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 16:43:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159123

Enable by default, now that libraries are split into separate packages
this won't cause a change to existing setups.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb b/meta/=
recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
index 425c1f386d..b2717f61bc 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
@@ -15,14 +15,13 @@ UPSTREAM_CHECK_URI =3D "http://xkbcommon.org/"
=20
 inherit meson pkgconfig
=20
-EXTRA_OEMESON =3D "-Denable-xkbregistry=3Dfalse"
-
-PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland',=
 d)}"
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland',=
 d)} xkbregistry"
 PACKAGECONFIG:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEA=
TURES', 'api-documentation', 'docs', '', d)}"
=20
 PACKAGECONFIG[docs] =3D "-Denable-docs=3Dtrue,-Denable-docs=3Dfalse,doxy=
gen-native"
 PACKAGECONFIG[wayland] =3D "-Denable-wayland=3Dtrue,-Denable-wayland=3Df=
alse,wayland-native wayland wayland-protocols,"
 PACKAGECONFIG[x11] =3D "-Denable-x11=3Dtrue,-Denable-x11=3Dfalse,libxcb =
xkeyboard-config,"
+PACKAGECONFIG[xkbregistry] =3D "-Denable-xkbregistry=3Dtrue,-Denable-xkb=
registry=3Dfalse,libxml2"
=20
 PACKAGE_BEFORE_PN +=3D "xkbcli"
 FILES:${PN} =3D ""
--=20
2.25.1


