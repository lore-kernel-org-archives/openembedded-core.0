Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72344C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 17:23:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13923.1719509004496144876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 10:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9292367
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 10:23:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A49193F766
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 10:23:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] librsvg: don't try to run target code at build time
Date: Thu, 27 Jun 2024 17:23:21 +0000
Message-Id: <20240627172322.1600152-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 17:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201208

The rsvg-loader test binary isn't installed but building it causes a mix
of build host and target code to be executed.  As we don't install the
test, don't build it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../librsvg/disable-rsvg-loader-test.patch    | 40 +++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.57.1.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loade=
r-test.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.=
patch b/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
new file mode 100644
index 00000000000..e56772a7e2f
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
@@ -0,0 +1,40 @@
+From df94cfa4a637c229fef32c349b5c2dfee2dca3fc Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 27 Jun 2024 17:09:11 +0100
+Subject: [PATCH] Don't build rsvg-loader in cross builds
+
+This binary is a non-installed test binary that isn't any use in cross b=
uilds, and
+causes problems because it generates a gdk-pixbuf loader cache at build =
time using
+a mix of host and target libraries.
+
+As we don't install the binary, we can just not build it.
+
+Upstream-Status: Inappropriate [upstream has moved to Meson]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gdk-pixbuf-loader/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gdk-pixbuf-loader/Makefile.am b/gdk-pixbuf-loader/Makefile.=
am
+index 44df9c6c..fb417d24 100644
+--- a/gdk-pixbuf-loader/Makefile.am
++++ b/gdk-pixbuf-loader/Makefile.am
+@@ -30,6 +30,7 @@ if PLATFORM_WIN32
+ libpixbufloader_svg_la_LDFLAGS +=3D -no-undefined
+ endif
+=20
++if !CROSS_COMPILING
+ noinst_PROGRAMS =3D rsvg-loader
+=20
+ rsvg_loader_SOURCES =3D \
+@@ -52,6 +53,7 @@ EXTRA_rsvg_loader_DEPENDENCIES =3D libpixbufloader-svg=
.la gdk-pixbuf-loaders
+=20
+ gdk-pixbuf-loaders: Makefile
+ 	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && G=
DK_PIXBUF_MODULEDIR=3D$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS))=
 > gdk-pixbuf.loaders 2>/dev/null
++endif
+=20
+ if CROSS_COMPILING
+ RUN_QUERY_LOADER_TEST=3Dfalse
+--=20
+2.34.1
+
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.57.1.bb
index 4b52d4062bc..ceaf1dfc003 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
@@ -21,6 +21,7 @@ require ${BPN}-crates.inc
=20
 SRC_URI +=3D " \
            file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-n=
ot-.patch \
+           file://disable-rsvg-loader-test.patch \
            "
=20
 SRC_URI[archive.sha256sum] =3D "074671a3ed6fbcd67cae2a40e539107f4f097ca8=
a4ab1a894c05e2524ff340ef"
--=20
2.34.1


