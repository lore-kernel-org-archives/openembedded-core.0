Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA279C10F1D
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 16:17:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.77804.1670948260298278284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 08:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F06211655;
	Tue, 13 Dec 2022 08:18:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC51F3F71E;
	Tue, 13 Dec 2022 08:17:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/4] at-spi2-core: clean up x11 enabling
Date: Tue, 13 Dec 2022 16:17:30 +0000
Message-Id: <20221213161732.865885-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213161732.865885-1-ross.burton@arm.com>
References: <20221213161732.865885-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 16:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174541

Use a single PACKAGECONFIG instead of a number of location conditionals.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/atk/at-spi2-core_2.46.0.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.46.0.bb b/meta/recip=
es-support/atk/at-spi2-core_2.46.0.bb
index 5ab501908d5..f815a5eeb21 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
@@ -13,10 +13,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-=
${PV}.tar.xz"
=20
 SRC_URI[sha256sum] =3D "aa0c86c79f7a8d67bae49a5b7a5ab08430c608cffe6e33bf=
47a72f41ab03c3d0"
=20
-X11DEPENDS =3D "virtual/libx11 libxi libxtst"
-
 DEPENDS =3D "dbus glib-2.0 libxml2"
-DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPEN=
DS}', '', d)}"
=20
 # For backwards compatibility
 PROVIDES +=3D "atk at-spi2-atk"
@@ -25,9 +22,10 @@ RPROVIDES:${PN} +=3D "atk at-spi2-atk"
 inherit meson gtk-doc gettext systemd pkgconfig upstream-version-is-even=
 gobject-introspection
=20
 EXTRA_OEMESON =3D " -Dsystemd_user_dir=3D${systemd_user_unitdir} \
-                  -Ddbus_daemon=3D${bindir}/dbus-daemon \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '-Dx11=3D=
yes', '-Dx11=3Dno', d)} \
-"
+                  -Ddbus_daemon=3D${bindir}/dbus-daemon"
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG[x11] =3D "-Dx11=3Dyes,-Dx11=3Dno,virtual/libx11 libxi libx=
tst"
=20
 GTKDOC_MESON_OPTION =3D "docs"
=20
--=20
2.34.1


