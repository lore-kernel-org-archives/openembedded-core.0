Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11E6D609BA
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:10:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26648.1765901408516231772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 08:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0E011516
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:10:00 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80D143F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:10:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gdk-pixbuf: upgrade 2.42.12 -> 2.44.4
Date: Tue, 16 Dec 2025 16:10:01 +0000
Message-ID: <20251216161001.352088-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216161001.352088-1-ross.burton@arm.com>
References: <20251216161001.352088-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 16:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227978

Upstream changes (subset):
- Add glycin loader (a sandboxed rust image loading framework)
- Deprecate the XPM-related API
- The animation-related APIs have been deprecated
- jpeg: Fix a crash related to icc data (CVE-2025-7345)
- Prefer builtin modules

Explicitly disable the glycin plugin for now, as we don't have a recipe
for glycin yet.

Explicitly disable the thumbnailer for now, this hasn't been built since
2.38[2] and would need more integration to work in cross builds.

Use 'documentation' for the gi-docgen option[1].

[1] gdk-pixbuf ee5a35665 ("build: Add "documentation" configuration optio=
n")
[2] gdk-pixbuf fc3770831 ("meson: don't build tests or the thumbnailer if=
 cross building")
since 2.38

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...on.build-allow-a-subset-of-tests-in-cross-compile.patch | 6 +++---
 .../{gdk-pixbuf_2.42.12.bb =3D> gdk-pixbuf_2.44.4.bb}        | 7 ++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.12.bb =3D> gdk-pix=
buf_2.44.4.bb} (93%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-al=
low-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pix=
buf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.=
patch
index 24edda81021..534f4e00765 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-s=
ubset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-s=
ubset-of-tests-in-cross-compile.patch
@@ -33,9 +33,9 @@ index 3eb3fcc..dc7e790 100644
 -  if get_option('tests')
 -    subdir('tests')
 -  endif
-   subdir('thumbnailer')
- endif
-=20
+   thumbnailer_opt =3D get_option('thumbnailer').disable_auto_if(glycin_=
dep.found())
+   if not thumbnailer_opt.disabled()
+     subdir('thumbnailer')
 diff --git a/tests/meson.build b/tests/meson.build
 index 3781066..911b5fb 100644
 --- a/tests/meson.build
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/r=
ecipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb
similarity index 93%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb
index 750098ba022..0c06bdda096 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb
@@ -14,7 +14,7 @@ SECTION =3D "libs"
=20
 DEPENDS =3D "glib-2.0 shared-mime-info"
=20
-SRC_URI[archive.sha256sum] =3D "b9505b3445b9a7e48ced34760c3bcb73e966df3a=
c94c95a148cb669ab748e3c7"
+SRC_URI[archive.sha256sum] =3D "93a1aac3f1427ae73457397582a2c38d049638a8=
01788ccbd5f48ca607bdbd17"
=20
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-ev=
en gobject-introspection gi-docgen lib_package manpages
=20
@@ -27,6 +27,7 @@ SRC_URI +=3D "\
 GIR_MESON_OPTION =3D "introspection"
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
+GIDOCGEN_MESON_OPTION =3D "documentation"
=20
 LIBV =3D "2.10.0"
=20
@@ -41,6 +42,10 @@ PACKAGECONFIG[others] =3D "-Dothers=3Denabled,-Dothers=
=3Ddisabled"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,python3-docutils=
-native"
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstalled_tests=3Dtrue,-Dtest=
s=3Dfalse -Dinstalled_tests=3Dfalse"
=20
+# Disable glycin whilst we have no recipe yet
+# Disable the thumbnailers as they don't build in cross
+EXTRA_OEMESON =3D "-Dglycin=3Ddisabled -Dthumbnailer=3Ddisabled"
+
 # For GIO image type sniffing
 RDEPENDS:${PN} =3D "shared-mime-info"
=20
--=20
2.43.0


