Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B796C83F34
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 13:58:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21522.1752847125268550687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 06:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C96F176C
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 06:58:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 858CE3F694
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 06:58:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] harfbuzz: build with -Os
Date: Fri, 18 Jul 2025 14:58:40 +0100
Message-ID: <20250718135840.1969215-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718135840.1969215-1-ross.burton@arm.com>
References: <20250718135840.1969215-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 13:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220598

Upstream explicitly say in their CONFIG.md file to build with -Os:

  Make sure you build with your compiler's "optimize for size" option.
  On `gcc` this is `-Os` [ ... ] HarfBuzz heavily uses inline functions
  and the optimize-size flag can make the library smaller by 20% or
  more. Moreover, sometimes, based on the target CPU, the optimize-size
  builds perform *faster* as well, thanks to lower code footprint and
  caching effects

Drop the patch to build just hb-subset-plan-layout.cc with -Os (which
was a workaround for a GCC bug), and pass -Os globally.

This manages to reduce the duration to harfbuzz:do_compile on my machine
from 75s to 47s, and has a big impact on the library sizes:

  harfbuzz: PKGSIZE changed from 1769358 to 1237070 (-30%)
  harfbuzz-dbg: PKGSIZE changed from 84920168 to 71203208 (-16%)
  harfbuzz-subset: PKGSIZE changed from 1579247 to 940191 (-40%)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-to-compile-hb-subset-plan-layout.cc.patch | 72 -------------------
 .../harfbuzz/harfbuzz_11.2.1.bb               |  4 +-
 2 files changed, 3 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-t=
o-compile-hb-subset-plan-layout.cc.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compi=
le-hb-subset-plan-layout.cc.patch b/meta/recipes-graphics/harfbuzz/harfbu=
zz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
deleted file mode 100644
index 38ff58fce5e..00000000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-s=
ubset-plan-layout.cc.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From a4325b6f6ddbebf3ecaee8f3825a2f03096adb6d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 27 Apr 2025 15:26:09 -0700
-Subject: [PATCH] Use -Os to compile hb-subset-plan-layout.cc
-
-This helps compiling with GCC 15
-
-Reported upstream with GH Issues [1]
-
-[1] https://github.com/harfbuzz/harfbuzz/issues/5306
-
-Upstream-Status: Inappropriate [GCC-15 workaround]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/meson.build | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index cbe5d9e..d7fc764 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -398,7 +398,6 @@ hb_subset_sources =3D files(
-   'hb-subset-instancer-solver.hh',
-   'hb-subset-instancer-solver.cc',
-   'hb-subset-plan.cc',
--  'hb-subset-plan-layout.cc',
-   'hb-subset-plan-var.cc',
-   'hb-subset-plan.hh',
-   'hb-subset-plan-member-list.hh',
-@@ -415,6 +414,10 @@ hb_subset_sources =3D files(
-   'hb-subset.hh',
- )
-=20
-+hb_subset_sources_os =3D files(
-+  'hb-subset-plan-layout.cc',
-+)
-+
- hb_subset_headers =3D files(
-   'hb-subset.h',
-   'hb-subset-serialize.h'
-@@ -629,6 +632,12 @@ endif
-=20
- darwin_versions =3D [hb_version_int, '@0@.0.0'.format(hb_version_int)]
-=20
-+special_subset_layout_lib =3D static_library('special_subset_layout',
-+  'hb-subset-plan-layout.cc',
-+  include_directories: incconfig,
-+  cpp_args: cpp_args + extra_hb_cpp_args + ['-Os'], # <=3D=3D compile t=
his one with -Os
-+)
-+
- libharfbuzz =3D library('harfbuzz', hb_sources,
-   include_directories: incconfig,
-   dependencies: harfbuzz_deps,
-@@ -656,7 +665,7 @@ defs_list +=3D [harfbuzz_subset_def]
- libharfbuzz_subset =3D library('harfbuzz-subset', hb_subset_sources,
-   include_directories: incconfig,
-   dependencies: [m_dep],
--  link_with: [libharfbuzz],
-+  link_with: [libharfbuzz] + [special_subset_layout_lib],
-   cpp_args: cpp_args + extra_hb_cpp_args,
-   soversion: hb_so_version,
-   version: version,
-@@ -668,7 +677,7 @@ libharfbuzz_subset =3D library('harfbuzz-subset', hb=
_subset_sources,
- custom_target('harfbuzz-subset.cc',
-   build_by_default: true,
-   output: 'harfbuzz-subset.cc',
--  input: hb_base_sources + hb_subset_sources,
-+  input: hb_base_sources + hb_subset_sources + hb_subset_sources_os,
-   command: [find_program('gen-harfbuzzcc.py'),
-             '@OUTPUT@', meson.current_source_dir(), '@INPUT@'],
- )
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
index bc2c6acdaec..2c8a1363d0a 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2=
a67cfef01e99e4893d \
                     "
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI +=3D "file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.pat=
ch"
 SRC_URI[sha256sum] =3D "093714c8548a285094685f0bdc999e202d666b59eeb3df2f=
f921ab68b8336a49"
=20
 DEPENDS +=3D "glib-2.0-native"
@@ -21,6 +20,9 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
 GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
+# As per upstream CONFIG.md, it is recommended to always build with -Os.
+FULL_OPTIMIZATION =3D "-Os ${DEBUG_LEVELFLAG}"
+
 EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
=20
 PACKAGECONFIG ??=3D "cairo freetype glib icu"
--=20
2.43.0


