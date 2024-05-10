Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D53C25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 15:45:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17191.1715355939499459503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 08:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3004D106F
	for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 08:46:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71CCD3F641
	for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 08:45:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libportal: fix rare build race
Date: Fri, 10 May 2024 15:45:35 +0000
Message-Id: <20240510154535.1409497-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 15:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199198

There is a build race where the libportal.vapi is not always generated
before it is needed to build libportal-gtk*.vapi. Backport the fix from
upstream.

[ YOCTO #15479 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...build-race-when-building-GTK-vapi-fi.patch | 49 +++++++++++++++++++
 .../libportal/libportal_0.7.1.bb              |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/libportal/files/0001-meson.build-f=
ix-build-race-when-building-GTK-vapi-fi.patch

diff --git a/meta/recipes-gnome/libportal/files/0001-meson.build-fix-buil=
d-race-when-building-GTK-vapi-fi.patch b/meta/recipes-gnome/libportal/fil=
es/0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch
new file mode 100644
index 00000000000..fb015d36326
--- /dev/null
+++ b/meta/recipes-gnome/libportal/files/0001-meson.build-fix-build-race-=
when-building-GTK-vapi-fi.patch
@@ -0,0 +1,49 @@
+From 26f96a178f8a0afded00bdd7238728c0b6e42a6b Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 9 May 2024 18:44:41 +0000
+Subject: [PATCH] meson.build: fix build race when building GTK vapi file=
s
+
+There's a build race when building the GTK vapi files:
+
+FAILED: libportal/libportal-gtk4.vapi
+error: Package `libportal' not found in specified Vala API directories o=
r GObject-Introspection GIR directories
+
+This can be verified by adding "sleep 10;" to the command for the
+libportal/libportal.vapi target in the generated build.ninja file.
+
+The GTK vapi files need to have access to the generic libportal.vapi fil=
e,
+but there is no explicit dependency.  Switch the dependency name 'libpor=
tal'
+to the dependency object libportal_vapi so that Meson generates the
+dependency correctly.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libportal/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libportal/meson.build b/libportal/meson.build
+index fff7603..4e67f40 100644
+--- a/libportal/meson.build
++++ b/libportal/meson.build
+@@ -168,7 +168,7 @@ if gtk3_dep.found()
+     if vapi
+       libportal_gtk3_vapi =3D gnome.generate_vapi('libportal-gtk3',
+         sources: libportal_gtk3_gir[0],
+-        packages: ['gio-2.0', 'gtk+-3.0', 'libportal'],
++        packages: ['gio-2.0', 'gtk+-3.0', libportal_vapi],
+         gir_dirs: [meson.current_build_dir()],
+         vapi_dirs: [meson.current_build_dir()],
+         install: true,
+@@ -227,7 +227,7 @@ if gtk4_dep.found()
+     if vapi
+       libportal_gtk4_vapi =3D gnome.generate_vapi('libportal-gtk4',
+         sources: libportal_gtk4_gir[0],
+-        packages: ['gio-2.0', 'gtk4', 'libportal'],
++        packages: ['gio-2.0', 'gtk4', libportal_vapi],
+         gir_dirs: [meson.current_build_dir()],
+         vapi_dirs: [meson.current_build_dir()],
+         install: true,
+--=20
+2.34.1
+
diff --git a/meta/recipes-gnome/libportal/libportal_0.7.1.bb b/meta/recip=
es-gnome/libportal/libportal_0.7.1.bb
index 22e45559c96..6ddfef76d34 100644
--- a/meta/recipes-gnome/libportal/libportal_0.7.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.7.1.bb
@@ -6,7 +6,8 @@ BUGTRACKER =3D "https://github.com/flatpak/libportal/issu=
es"
 LICENSE =3D "LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce9=
404"
=20
-SRC_URI =3D "git://github.com/flatpak/${BPN}.git;protocol=3Dhttps;branch=
=3Dmain"
+SRC_URI =3D "git://github.com/flatpak/${BPN}.git;protocol=3Dhttps;branch=
=3Dmain \
+           file://0001-meson.build-fix-build-race-when-building-GTK-vapi=
-fi.patch"
 SRCREV =3D "e9ed3a50cdde321eaf42361212480a66eb94a57a"
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


