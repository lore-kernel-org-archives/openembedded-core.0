Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8470.1611038797016909098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ybv/XCyoKqkPB16CtXg72wITzGHMTjh537szv3W9DIITv0Glu6RjhKs+4fAVIB7RxPy44vJcET
 Kc9VGDS3PR1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035644"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035644"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:21 -0800
IronPort-SDR: m4smSBrNxq1anRf/RMxMLR2mVYp6l9G5GzHuh02AZYerw0AAC8gEAma4cmLtxoGVhf/yi9afr+
 gwnUqSnrYu+g==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441684"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/30] harfbuzz: upgrade 2.7.2 -> 2.7.4
Date: Tue, 19 Jan 2021 14:45:40 +0800
Message-Id: <20210119064552.115692-18-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove backported patches and remove the introspection patch as that is
no longer needed.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...isable-introspection-in-cross-builds.patch | 27 ------
 ...nums.cc.tmpl-write-out-only-the-file.patch | 28 ------
 .../harfbuzz/harfbuzz/version-race.patch      | 97 -------------------
 .../{harfbuzz_2.7.2.bb => harfbuzz_2.7.4.bb}  |  5 +-
 4 files changed, 1 insertion(+), 156 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Do-not-disable-introspection-in-cross-builds.patch
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.7.2.bb => harfbuzz_2.7.4.bb} (87%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Do-not-disable-introspection-in-cross-builds.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Do-not-disable-introspection-in-cross-builds.patch
deleted file mode 100644
index d00656fc88..0000000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Do-not-disable-introspection-in-cross-builds.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From df5848f423ec0f4b3e519900014349a0c00b1969 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 17 Aug 2020 16:36:03 +0200
-Subject: [PATCH] Do not disable introspection in cross builds.
-
-Yocto can and does support introspection cross builds, through
-running target binaries under qemu emulation.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 1865633..5e1787c 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -634,7 +634,7 @@ if have_gobject
-   gir = find_program('g-ir-scanner', required: get_option('introspection'))
-   build_gir = gir.found()
- 
--  build_gir = build_gir and not meson.is_cross_build()
-+  build_gir = build_gir
-   if not build_gir and get_option('introspection').enabled()
-     error('Introspection support is requested but it isn\'t available in cross builds')
-   endif
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch
deleted file mode 100644
index d9fccfac0e..0000000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f316b794265f28e89821dfab0772caac1bb6b056 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 18 Aug 2020 10:31:47 +0000
-Subject: [PATCH] src/hb-gobject-enums.cc.tmpl: write out only the filename,
- not the full path
-
-This is beneficial for reproducible builds, as build paths can vary
-between builds.
-
-Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/e876886d1e877ad90b6f02badefd6ebee1bc0b09]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/hb-gobject-enums.cc.tmpl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hb-gobject-enums.cc.tmpl b/src/hb-gobject-enums.cc.tmpl
-index 2ffd1c9..87a11dd 100644
---- a/src/hb-gobject-enums.cc.tmpl
-+++ b/src/hb-gobject-enums.cc.tmpl
-@@ -43,7 +43,7 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN file-tail ***/
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch
deleted file mode 100644
index a8b8f0353c..0000000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 6ccadec1fae6a73749b7dfe2311f71d0e610e812 Mon Sep 17 00:00:00 2001
-From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
-Date: Wed, 30 Sep 2020 10:30:08 +0900
-Subject: [PATCH] No need to pass source directory to gen-hb-version
-
-The input file is by definition in the source directory, so dirname()
-that instead of needing the directory to be passed.
-
-Needed because a follow-up commit will change when this is called, and the
-source directory isn't trivially available at that point.
-
-generate hb-version.h once at configure time with Meson
-
-Currently with Meson hb-version.h is generated during the build without
-any explicit dependencies which can result in build failures due races
-over the file.
-
-Change this to be generated at configure time, so that the file is always
-generated once before the build itself.
-
-Closes #2667
-
-Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/5aff83104e03d6d2617987d24a51e490ab7a5cd1]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
----
- src/gen-hb-version.py |  6 +++---
- src/meson.build       | 17 ++++++++---------
- 2 files changed, 11 insertions(+), 12 deletions(-)
-
-diff --git a/src/gen-hb-version.py b/src/gen-hb-version.py
-index 15e56b9..bf16f88 100755
---- a/src/gen-hb-version.py
-+++ b/src/gen-hb-version.py
-@@ -4,15 +4,15 @@
- 
- import os, sys, shutil
- 
--if len (sys.argv) < 5:
-+if len (sys.argv) < 4:
- 	sys.exit(__doc__)
- 
- version = sys.argv[1]
- major, minor, micro = version.split (".")
- 
- OUTPUT = sys.argv[2]
--CURRENT_SOURCE_DIR = sys.argv[3]
--INPUT = sys.argv[4]
-+INPUT = sys.argv[3]
-+CURRENT_SOURCE_DIR = os.path.dirname(INPUT)
- 
- with open (INPUT, "r", encoding='utf-8') as template:
- 	with open (OUTPUT, "wb") as output:
-diff --git a/src/meson.build b/src/meson.build
-index 5e1787c..56d8ae2 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -1,3 +1,10 @@
-+hb_version_h = configure_file(
-+               command: [find_program('gen-hb-version.py'), meson.project_version(), '@OUTPUT@', '@INPUT@'],
-+               input: 'hb-version.h.in',
-+               output: 'hb-version.h',
-+               install: true,
-+               install_dir: join_paths(get_option('includedir'), meson.project_name()))
-+
- # Base and default-included sources and headers
- hb_base_sources = files(
-   'hb-aat-layout-ankr-table.hh',
-@@ -214,9 +221,9 @@ hb_base_headers = files(
-   'hb-shape.h',
-   'hb-style.h',
-   'hb-unicode.h',
--  'hb-version.h',
-   'hb.h',
- )
-+hb_base_headers += hb_version_h
- 
- # Optional Sources and Headers with external deps
- 
-@@ -281,14 +288,6 @@ hb_gobject_headers = files(
-   'hb-gobject-structs.h',
- )
- 
--custom_target('hb-version.h',
--  build_by_default: true,
--  input: 'hb-version.h.in',
--  output: 'hb-version.h',
--  command: [find_program('gen-hb-version.py'), meson.project_version(),
--            '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
--)
--
- ragel = find_program('ragel', required: false)
- if not ragel.found()
-   warning('You have to install ragel if you are going to develop HarfBuzz itself')
--- 
-2.25.1
-
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb
similarity index 87%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb
index f95273f686..b08f60255e 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb
@@ -11,11 +11,8 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
-           file://0001-Do-not-disable-introspection-in-cross-builds.patch \
-           file://0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch \
-           file://version-race.patch \
            "
-SRC_URI[sha256sum] = "b8c048d7c2964a12f2c80deb6634dfc836b603dd12bf0d0a3df1627698e220ce"
+SRC_URI[sha256sum] = "6ad11d653347bd25d8317589df4e431a2de372c0cf9be3543368e07ec23bb8e7"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.29.2

