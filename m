Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC35FCD4F3C
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 13:54:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76370.1778594055762196109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 06:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nVF0M9zB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1E9B302A
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD3B23F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778594055; bh=z0/s85C1hRy89vGAQiJ1mIozdLKNS7qTwcu39yzHcP0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nVF0M9zB+BdJ0jBpXx5D8RYSBaRwqLete4ZOENd1iqSSm6s/SdnXnMG9w3DeX2fF3
	 yMtdSzyS6Uo/s5zLfS54TJ9L4kjEzzD2Ew/NPfqiQt3oCI7B8/GaGCaxa+nuN10LKc
	 4WDDg4doMOKJtmmQjhzdTkpENkwiSf/fSutkbYqU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] librsvg: rewrite cross gdk-pixbuf-query-loaders handling
Date: Tue, 12 May 2026 14:54:07 +0100
Message-ID: <20260512135407.3056055-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512135407.3056055-1-ross.burton@arm.com>
References: <20260512135407.3056055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 13:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236887

There's been a number of attempts at fixing the logic as to when to run
gdk-pixbuf-query-loaders in cross builds. Originally the build failed in
cross so we worked around that, then upstream changed it so that if exe
wrappers are enabled it will run those but our target sysroot doesn't
have binaries so that also fails.

This rework should be upstreamable once it's been shaken out in OE for a
while, and improves the logic so that in cross builds the existance of
gdk-pixbuf-query-loaders is an optional dependency, which is ideal for
our needs as we won't be running it at install-time anyway.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ld-do-not-force-disable-gdk-pixbuf-l.patch |  49 -------
 .../librsvg/librsvg/cross-query-loaders.patch | 128 ++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.61.3.bb  |   2 +-
 3 files changed, 129 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Revert-meson.=
build-do-not-force-disable-gdk-pixbuf-l.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/cross-query-loader=
s.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Revert-meson.build-d=
o-not-force-disable-gdk-pixbuf-l.patch b/meta/recipes-gnome/librsvg/librs=
vg/0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch
deleted file mode 100644
index b62f641d579..00000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0001-Revert-meson.build-do-not-f=
orce-disable-gdk-pixbuf-l.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 33ece256bf7c156a34ab1ee3709718e38829cc9e Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Wed, 6 Aug 2025 13:50:21 +0200
-Subject: [PATCH] Revert "meson.build: do not force-disable gdk-pixbuf-lo=
ader
- in cross builds"
-
-This reverts commit 994582cfa995d00f9472dc22f8237b6571b4c510.
-
-The commit that enabled gdk-pixbuf-loader for non-cross builds, referenc=
es
-a commit that enabled other binaries, claiming that they can be executed=
 with
-a qemu wrapper.
-
-There is one difference - the projects that were enabled by that commit =
support such
-wrappers officially (see `gi_cross_binary_wrapper` and related build opt=
ions for g-i).
-However such support is missing from gdk-pixbuf-loader unfortunately, wh=
ich can cause
-build failures when cross compiling.
-
-To avoid this, revert back to disable gdk-pixbuf-loader for cross-builds
-(until it gains a similar feature).
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/librsvg/-/mer=
ge_requests/1123]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- gdk-pixbuf-loader/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gdk-pixbuf-loader/meson.build b/gdk-pixbuf-loader/meson.bui=
ld
-index 6fa10a6..c51d803 100644
---- a/gdk-pixbuf-loader/meson.build
-+++ b/gdk-pixbuf-loader/meson.build
-@@ -36,7 +36,7 @@ pixbuf_thumbnailer =3D configure_file(
-   install_dir: get_option('datadir') / 'thumbnailers'
- )
-=20
--if meson.can_run_host_binaries()
-+if not meson.is_cross_build()
-   gdk_pixbuf_query_loaders =3D find_program(pixbuf_dep.get_variable(pkg=
config: 'gdk_pixbuf_query_loaders', default_value: 'gdk-pixbuf-query-load=
ers'))
- endif
-=20
-@@ -48,7 +48,7 @@ pixbufloader_svg_install_args =3D [
- ]
-=20
- # Tell people to run gdk-pixbuf-query-loaders manually for cross builds
--if not meson.can_run_host_binaries()
-+if meson.is_cross_build()
-   pixbufloader_svg_install_args +=3D '--show-cross-message'
- endif
-=20
diff --git a/meta/recipes-gnome/librsvg/librsvg/cross-query-loaders.patch=
 b/meta/recipes-gnome/librsvg/librsvg/cross-query-loaders.patch
new file mode 100644
index 00000000000..ab0ca2bf1eb
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/cross-query-loaders.patch
@@ -0,0 +1,128 @@
+gdk-pixbuf-loader/meson_install: improve argument parsing and logic
+
+Make the arguments more explicit by changing the path arguments to be
+specified with options, such as --queryloaders <path>. Previously one of
+the paths had an option, but the others were order-based.
+
+Check that either all of the paths have been set or --show-cross-message
+has been passed. If this is not the case, print the usage and exit.
+
+Clean up Path usage, as the options are using pathlib.Path types in the
+parser another Path instance does not need to be created.
+
+None of this changes the underlying logic, just makes it more consistent
+and explicit.
+
+
+gdk-pixbuf-loader: fix install logic in cross builds
+
+The logic in this install rule was getting complicated, but it should be
+quite simple really:
+
+- In native builds we can run host binaries.  Look for the
+  gdk-pixbuf-query-loaders tool and run it when installing.
+- In cross builds we might be able to run host binaries, if an executabl=
e
+  wrapper has been set _and_ if the target sysroot contains executables.
+
+The presence of target executables isn't a given, as some systems (such
+as OpenEmbedded) strip the target sysroot down to headers are libraries.
+
+So the logic should be:
+
+- In native builds, look for query-loaders and fail if not found.
+- In cross builds where you can run host binaries, look for query-loader=
s
+  but allow it to be missing.
+- In cross builds where you cannot run host binaries, there's no use in
+  looking for query-loaders.
+
+Then either pass the paths or --show-cross-message to meson_install.py,
+depending on whether query-loaders was found or not.
+
+This fixes the case where Meson can run host executables, but the target
+sysroot does not actually contain gdk-pixbuf-query-loaders.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/gdk-pixbuf-loader/meson.build w/gdk-pixbuf-loader/meson.bui=
ld
+index 6fa10a68b..4f88ba037 100644
+--- i/gdk-pixbuf-loader/meson.build
++++ w/gdk-pixbuf-loader/meson.build
+@@ -37,19 +37,21 @@ pixbuf_thumbnailer =3D configure_file(
+ )
+=20
+ if meson.can_run_host_binaries()
+-  gdk_pixbuf_query_loaders =3D find_program(pixbuf_dep.get_variable(pkg=
config: 'gdk_pixbuf_query_loaders', default_value: 'gdk-pixbuf-query-load=
ers'))
++  gdk_pixbuf_query_loaders =3D find_program(pixbuf_dep.get_variable(pkg=
config: 'gdk_pixbuf_query_loaders', default_value: 'gdk-pixbuf-query-load=
ers'), required: not meson.is_cross_build())
+ endif
+=20
+-pixbufloader_svg_install_args =3D [
+-  '--gdk-pixbuf-moduledir',
+-  pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_moduledir', pkgconfig_=
define: ['prefix', prefix]),
+-  pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_query_loaders', pkgcon=
fig_define: ['prefix', prefix]),
+-  pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_cache_file', pkgconfig=
_define: ['prefix', prefix])
+-]
+-
+-# Tell people to run gdk-pixbuf-query-loaders manually for cross builds
+-if not meson.can_run_host_binaries()
+-  pixbufloader_svg_install_args +=3D '--show-cross-message'
++if meson.can_run_host_binaries() and gdk_pixbuf_query_loaders.found()
++  pixbufloader_svg_install_args =3D [
++    '--moduledir',
++    pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_moduledir', pkgconfi=
g_define: ['prefix', prefix]),
++    '--queryloaders',
++    gdk_pixbuf_query_loaders.full_path(),
++    '--cache-file',
++    pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_cache_file', pkgconf=
ig_define: ['prefix', prefix])
++  ]
++else
++  # Tell people to run gdk-pixbuf-query-loaders manually for cross buil=
ds
++  pixbufloader_svg_install_args =3D ['--show-cross-message']
+ endif
+=20
+ meson.add_install_script(
+diff --git i/gdk-pixbuf-loader/meson_install.py w/gdk-pixbuf-loader/meso=
n_install.py
+index ff003350f..d9bbbe433 100644
+--- i/gdk-pixbuf-loader/meson_install.py
++++ w/gdk-pixbuf-loader/meson_install.py
+@@ -6,29 +6,28 @@ import os
+ import subprocess
+ import sys
+=20
+-argparse =3D ArgumentParser('Deploy loaders.cache')
+-
+-argparse.add_argument('--gdk-pixbuf-moduledir', type=3DPath)
+-argparse.add_argument('gdk_pixbuf_queryloaders', type=3DPath)
+-argparse.add_argument('gdk_pixbuf_cache_file', type=3DPath)
+-argparse.add_argument('--show-cross-message', action=3D'store_true')
+-
+ if __name__ =3D=3D '__main__':
++    argparse =3D ArgumentParser(description=3D'Deploy loaders.cache. Pa=
ss required paths, or --show-cross-message.')
++    argparse.add_argument('--queryloaders', type=3DPath, metavar=3D"PAT=
H", help=3D"gdk-pixbuf-queryloaders to run")
++    argparse.add_argument('--moduledir', type=3DPath, metavar=3D"PATH",=
 help=3D"installed gdk-pixbuf module directory")
++    argparse.add_argument('--cache-file', type=3DPath, metavar=3D"PATH"=
, help=3D"module cache file to write")
++    argparse.add_argument('--show-cross-message', action=3D'store_true'=
, help=3D"tell the user to run query-loaders manually")
+     args =3D argparse.parse_args()
+=20
+-    cache_file: Path =3D args.gdk_pixbuf_cache_file
++    if not(args.show_cross_message or (args.queryloaders and args.modul=
edir and args.cache_file)):
++        argparse.print_help()
++        sys.exit(1)
+=20
+     if args.show_cross_message or os.environ.get("DESTDIR"):
+         print('*** Note: Please run gdk-pixbuf-queryloaders manually ' =
+
+               'against the newly-built gdkpixbuf-svg loader', file=3Dsy=
s.stderr)
+     else:
+         env =3D os.environ.copy()
+-        env['GDK_PIXBUF_MODULEDIR'] =3D Path(args.gdk_pixbuf_moduledir)=
.as_posix()
+-        with cache_file.open('w', encoding=3D'utf-8') as f:
++        env['GDK_PIXBUF_MODULEDIR'] =3D args.moduledir.as_posix()
++        with args.cache_file.open('w', encoding=3D'utf-8') as f:
+             subprocess.run(
+-                [Path(args.gdk_pixbuf_queryloaders).as_posix()],
++                [args.queryloaders.as_posix()],
+                 env=3Denv,
+                 stdout=3Df,
+                 check=3DTrue
+             )
+-
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.61.3.bb
index 0b82ae14523..69bbc27c68c 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
@@ -24,8 +24,8 @@ GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
 require ${BPN}-crates.inc
=20
 SRC_URI +=3D "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executab=
le.patch \
-            file://0001-Revert-meson.build-do-not-force-disable-gdk-pixb=
uf-l.patch \
             file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-=
Comm.patch \
+            file://cross-query-loaders.patch \
             file://run-ptest"
 SRC_URI[archive.sha256sum] =3D "a56d2c80d744ad2f2718f85df466fe71d24ff1f9=
bc3e5ef588bde4d7e87815f2"
=20
--=20
2.43.0


