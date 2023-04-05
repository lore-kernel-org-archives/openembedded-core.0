Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BF8C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 05:13:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.123385.1680671581386061949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 22:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id A2D757D1D
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Apr 2023 07:12:58 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.164.72]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pjvS6-05tRzt0; Wed, 5 Apr 2023 07:12:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] at-spi2-core: update 2.46.0 -> 2.48.0
Date: Wed,  5 Apr 2023 07:12:48 +0200
Message-Id: <20230405051248.53605-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1680671578-AF7FDC11-EBEA025C/0/0 CLEAN NORMAL
X-TOI-MSGID: 81fa1e2f-0dfe-49cf-996e-17fc561887d3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 05:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179722

What's new in at-spi2-core 2.48.0:

* Add a "atk-only" build option. This allows atk to be built without libd=
bus
  installed, but it does not build libatspi or the atk bridge.

* Fix some typos in the documentation.

What's new in at-spi2-core 2.47.90:

* Downgrade meson requirement to 0.63.

*  at-spi-dbus-bus service: set stop timeout to 5s

* Fix possible crash in screen_reader_signal_watcher.

What's new in at-spi2-core 2.47.1:
* The meson options -Dx11 and -Dintrospection are now implemented with
  meson features - https://mesonbuild.com/Build-options.html#features

  Instead of accepting values of "yes/no/auto", they take
  "enabled/disabled/auto".  Please change your build scripts
  accordingly if you use these options.

* Use gi-docgen to generate documentation.

* Register key grabs using the focused window, rather than the root windo=
w.
  This should prevent the window from losing focus when a key grab is use=
d.

* atk-adaptor: Handle sockets in GetChildren.

* Improve documentation of the dbus interfaces.

* Various code clean-ups. Some unused code has been removed.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-core_2.46.0.bb =3D> at-spi2-core_2.48.0.bb} | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.46.0.bb =3D> at-spi2-cor=
e_2.48.0.bb} (70%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.46.0.bb b/meta/recip=
es-support/atk/at-spi2-core_2.48.0.bb
similarity index 70%
rename from meta/recipes-support/atk/at-spi2-core_2.46.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.48.0.bb
index 90313467d0..e9648ffe07 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.48.0.bb
@@ -11,29 +11,32 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "aa0c86c79f7a8d67bae49a5b7a5ab08430c608cffe6e33bf=
47a72f41ab03c3d0"
+SRC_URI[sha256sum] =3D "905a5b6f1790b68ee803bffa9f5fab4ceb591fb4fae0b2f8=
c612c54f1d4e8a30"
=20
-DEPENDS =3D "dbus glib-2.0 glib-2.0-native libxml2"
+DEPENDS =3D " \
+	dbus \
+	glib-2.0 \
+	glib-2.0-native \
+	libxml2 \
+	${@'python3-sphinx-native' if d.getVar('GIDOCGEN_ENABLED') =3D=3D 'True=
' else ''} \
+"
=20
 # For backwards compatibility
 PROVIDES +=3D "atk at-spi2-atk"
 RPROVIDES:${PN} +=3D "atk at-spi2-atk"
=20
-inherit meson gtk-doc gettext systemd pkgconfig upstream-version-is-even=
 gobject-introspection
+inherit meson gi-docgen gettext systemd pkgconfig upstream-version-is-ev=
en gobject-introspection
=20
 EXTRA_OEMESON =3D " -Dsystemd_user_dir=3D${systemd_user_unitdir} \
                   -Ddbus_daemon=3D${bindir}/dbus-daemon"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[x11] =3D "-Dx11=3Dyes,-Dx11=3Dno,virtual/libx11 libxi libx=
tst"
-
-GTKDOC_MESON_OPTION =3D "docs"
-# The documentation doesn't build if X11 is disabled. Appears to be fixe=
d post 2.46.0.
-EXTRA_OEMESON +=3D "${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "=
-Ddocs=3Dfalse", d)}"
+PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 =
libxi libxtst"
=20
+GIDOCGEN_MESON_OPTION =3D "docs"
 GIR_MESON_OPTION =3D 'introspection'
-GIR_MESON_ENABLE_FLAG =3D 'yes'
-GIR_MESON_DISABLE_FLAG =3D 'no'
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 FILES:${PN} +=3D "${libdir}/gnome-settings-daemon-3.0/gtk-modules/at-spi=
2-atk.desktop \
                 ${libdir}/gtk-2.0/modules/libatk-bridge.so \
--=20
2.34.1


