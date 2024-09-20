Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1BECE8D47
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 09:57:48 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.14665.1726826261311667381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 02:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id BC5B323A18
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 11:57:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sraOE-0C1kdW0; Fri, 20 Sep 2024 11:57:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/4] libportal: update 0.7.1 -> 0.8.1
Date: Fri, 20 Sep 2024 11:58:14 +0200
Message-ID: <20240920095816.261281-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920095816.261281-1-f_l_k@t-online.de>
References: <20240920095816.261281-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726826247-4E7FA5A0-260F05E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 80f83c06-7135-4f96-a8c2-b913b02d49b2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 09:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204731

Changes in 0.8.1, 04-09-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

- Fix a regression in the Remote Desktop where it wouldn't work with the
  ScreenCast portal correctly.
- Use non-deprecated functions in the GTK4 code
- Run tests in CI so we catch regressions earlier
- Make Qt tests use QTEST_GUILESS_MAIN
- Fix an Input Capture test

Changes in 0.8.0, 02-09-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

- Add API to allow for persistence on RemoteDesktop sessions
- Implement support for the Input Capture portal
- Add support for Qt 6
- Support xdg-foreign with Qt 6
- Fix screencasting on wlroots-based compositors

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...build-race-when-building-GTK-vapi-fi.patch | 49 -------------------
 ...{libportal_0.7.1.bb =3D> libportal_0.8.1.bb} |  5 +-
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-gnome/libportal/files/0001-meson.build-f=
ix-build-race-when-building-GTK-vapi-fi.patch
 rename meta/recipes-gnome/libportal/{libportal_0.7.1.bb =3D> libportal_0=
.8.1.bb} (86%)

diff --git a/meta/recipes-gnome/libportal/files/0001-meson.build-fix-buil=
d-race-when-building-GTK-vapi-fi.patch b/meta/recipes-gnome/libportal/fil=
es/0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch
deleted file mode 100644
index fb015d3632..0000000000
--- a/meta/recipes-gnome/libportal/files/0001-meson.build-fix-build-race-=
when-building-GTK-vapi-fi.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 26f96a178f8a0afded00bdd7238728c0b6e42a6b Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 9 May 2024 18:44:41 +0000
-Subject: [PATCH] meson.build: fix build race when building GTK vapi file=
s
-
-There's a build race when building the GTK vapi files:
-
-FAILED: libportal/libportal-gtk4.vapi
-error: Package `libportal' not found in specified Vala API directories o=
r GObject-Introspection GIR directories
-
-This can be verified by adding "sleep 10;" to the command for the
-libportal/libportal.vapi target in the generated build.ninja file.
-
-The GTK vapi files need to have access to the generic libportal.vapi fil=
e,
-but there is no explicit dependency.  Switch the dependency name 'libpor=
tal'
-to the dependency object libportal_vapi so that Meson generates the
-dependency correctly.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libportal/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libportal/meson.build b/libportal/meson.build
-index fff7603..4e67f40 100644
---- a/libportal/meson.build
-+++ b/libportal/meson.build
-@@ -168,7 +168,7 @@ if gtk3_dep.found()
-     if vapi
-       libportal_gtk3_vapi =3D gnome.generate_vapi('libportal-gtk3',
-         sources: libportal_gtk3_gir[0],
--        packages: ['gio-2.0', 'gtk+-3.0', 'libportal'],
-+        packages: ['gio-2.0', 'gtk+-3.0', libportal_vapi],
-         gir_dirs: [meson.current_build_dir()],
-         vapi_dirs: [meson.current_build_dir()],
-         install: true,
-@@ -227,7 +227,7 @@ if gtk4_dep.found()
-     if vapi
-       libportal_gtk4_vapi =3D gnome.generate_vapi('libportal-gtk4',
-         sources: libportal_gtk4_gir[0],
--        packages: ['gio-2.0', 'gtk4', 'libportal'],
-+        packages: ['gio-2.0', 'gtk4', libportal_vapi],
-         gir_dirs: [meson.current_build_dir()],
-         vapi_dirs: [meson.current_build_dir()],
-         install: true,
---=20
-2.34.1
-
diff --git a/meta/recipes-gnome/libportal/libportal_0.7.1.bb b/meta/recip=
es-gnome/libportal/libportal_0.8.1.bb
similarity index 86%
rename from meta/recipes-gnome/libportal/libportal_0.7.1.bb
rename to meta/recipes-gnome/libportal/libportal_0.8.1.bb
index 6ddfef76d3..0b88de4224 100644
--- a/meta/recipes-gnome/libportal/libportal_0.7.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.8.1.bb
@@ -6,9 +6,8 @@ BUGTRACKER =3D "https://github.com/flatpak/libportal/issu=
es"
 LICENSE =3D "LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce9=
404"
=20
-SRC_URI =3D "git://github.com/flatpak/${BPN}.git;protocol=3Dhttps;branch=
=3Dmain \
-           file://0001-meson.build-fix-build-race-when-building-GTK-vapi=
-fi.patch"
-SRCREV =3D "e9ed3a50cdde321eaf42361212480a66eb94a57a"
+SRC_URI =3D "git://github.com/flatpak/${BPN}.git;protocol=3Dhttps;branch=
=3Dmain"
+SRCREV =3D "26c15008cbe579f57f89468384f8efc033f25f6f"
 S =3D "${WORKDIR}/git"
=20
 inherit meson gi-docgen gobject-introspection vala features_check pkgcon=
fig
--=20
2.46.0


