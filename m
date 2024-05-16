Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DD8C41513
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:06:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10750.1715857601114556680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 128B11007
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:07:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6EC133F762
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:06:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] gdk-pixbuf: upgrade 2.42.11 -> 2.42.12
Date: Thu, 16 May 2024 11:06:36 +0000
Message-Id: <20240516110637.2239854-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516110637.2239854-1-ross.burton@arm.com>
References: <20240516110637.2239854-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199462

- Fix a build failure (Christian Heusel)
- Fix occasional build failures (Benjamin Gilbert)
- ani: Reject files with multiple INA or IART chunks (Benjamin Gilbert)
- ani: Reject files with multiple anih chunks (Benjamin Gilbert, CVE-2022=
-48622)
- ani: validate chunk size (Benjamin Gilbert)
- Translation updates

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...n.build-allow-a-subset-of-tests-in-cross-compile.patch | 8 ++++----
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch              | 2 +-
 .../{gdk-pixbuf_2.42.11.bb =3D> gdk-pixbuf_2.42.12.bb}      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.11.bb =3D> gdk-pix=
buf_2.42.12.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-al=
low-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pix=
buf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.=
patch
index 3d685db7742..24edda81021 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-s=
ubset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-s=
ubset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 4bfb696fd125f044e3df9f6983c4ad518d9552c7 Mon Sep 17 00:00:00 2001
+From 325a4cde99a00b84116ab7111d27e6973f3c5026 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 9 insertions(+), 7 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 78f3683..e0feaee 100644
+index 3eb3fcc..dc7e790 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -390,10 +390,10 @@ subdir('gdk-pixbuf')
@@ -37,7 +37,7 @@ index 78f3683..e0feaee 100644
  endif
 =20
 diff --git a/tests/meson.build b/tests/meson.build
-index 78d0ad9..0c9e64e 100644
+index 3781066..911b5fb 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -4,7 +4,7 @@
@@ -49,7 +49,7 @@ index 78d0ad9..0c9e64e 100644
    # Resources; we cannot use gnome.compile_resources() here, because we=
 need to
    # override the environment in order to use the utilities we just buil=
t instead
    # of the system ones
-@@ -172,9 +172,11 @@ endif
+@@ -164,9 +164,11 @@ endif
  test_deps =3D gdk_pixbuf_deps + [ gdkpixbuf_dep, ]
  test_args =3D [ '-k' ]
  test_env =3D environment()
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch =
b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 80c93e2166f..3b4bf628614 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From 9b4f5738f8ac30f393b6163dcc84757976683d9b Mon Sep 17 00:00:00 2001
+From f78ab4edaee5f62663a9a4bcfa56e5c524da4474 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fat=
al
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb b/meta/r=
ecipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index ef0f23f8f7e..9f825a68efb 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-$=
{PV}.tar.xz \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-comp=
ile.patch \
            "
=20
-SRC_URI[sha256sum] =3D "49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a9=
42268d23052a2f00"
+SRC_URI[sha256sum] =3D "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a1=
48cb669ab748e3c7"
=20
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version=
-is-even gobject-introspection gi-docgen lib_package
=20
--=20
2.34.1


