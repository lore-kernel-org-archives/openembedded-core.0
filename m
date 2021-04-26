Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.920.1619398523834054279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13Q0tMPc006708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 17:55:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 25 Apr 2021 17:55:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Sun, 25 Apr 2021 17:55:21 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gdk-pixbuf: upgrade from 2.40.0 -> 2.42.6
Date: Mon, 26 Apr 2021 08:55:17 +0800
Message-ID: <20210426005517.17904-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-around-thumbnailer-cross-compile-fa.patch | 61 ++++++++++---------
 .../0004-Do-not-run-tests-when-building.patch | 21 +++----
 ...ailer-and-tests-also-in-cross-builds.patch |  4 +-
 .../gdk-pixbuf/CVE-2020-29385.patch           | 55 -----------------
 .../gdk-pixbuf/missing-test-data.patch        | 30 ---------
 ...-pixbuf_2.40.0.bb => gdk-pixbuf_2.42.6.bb} | 14 ++---
 6 files changed, 49 insertions(+), 136 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.40.0.bb => gdk-pixbuf_2.42.6.bb} (91%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
index a9c7600eb3..342c47cca3 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
@@ -1,4 +1,4 @@
-From 2d1b65bd1272ad63b7fbd4babd9a8e8c296d15b5 Mon Sep 17 00:00:00 2001
+From 483e6818e9aebc5637f41856e327995ef967c451 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 22 Feb 2019 13:22:06 +0100
 Subject: [PATCH] (target only) Work-around thumbnailer and pixdata
@@ -15,7 +15,6 @@ The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
 
 Upstream-Status: Inappropriate [workaround]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  build-aux/gen-thumbnailer.py |  2 --
  tests/meson.build            | 11 +++++++++--
@@ -36,13 +35,13 @@ index 05ac821..c5b99ab 100644
  if os.name == 'nt':
      gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
 diff --git a/tests/meson.build b/tests/meson.build
-index 8ed7cc1..e011b77 100644
+index 3f3ee54..4100520 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -1,12 +1,19 @@
- # Resources; we cannot use gnome.compile_resources() here, because we need to
- # override the environment in order to use the utilities we just built instead
- # of the system ones
+@@ -8,13 +8,20 @@ if enabled_loaders.contains('png') and host_system != 'windows'
+   # Resources; we cannot use gnome.compile_resources() here, because we need to
+   # override the environment in order to use the utilities we just built instead
+   # of the system ones
 +
 +if not meson.is_cross_build()
 +pixdata_binary = gdk_pixbuf_pixdata.full_path()
@@ -50,30 +49,31 @@ index 8ed7cc1..e011b77 100644
 +pixdata_binary = 'gdk-pixbuf-pixdata'
 +endif
 +
- resources_c = custom_target('resources.c',
-   input: 'resources.gresource.xml',
-   output: 'resources.c',
-   command: [
-     gen_resources,
--    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
-+    '--pixdata=@0@'.format(pixdata_binary),
-     '--loaders=@0@'.format(loaders_cache.full_path()),
-     '--sourcedir=@0@'.format(meson.current_source_dir()),
-     '--source',
-@@ -24,7 +31,7 @@ resources_h = custom_target('resources.h',
-   output: 'resources.h',
-   command: [
-     gen_resources,
--    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
-+    '--pixdata=@0@'.format(pixdata_binary),
-     '--loaders=@0@'.format(loaders_cache.full_path()),
-     '--sourcedir=@0@'.format(meson.current_source_dir()),
-     '--header',
+   resources_c = custom_target('resources.c',
+     input: 'resources.gresource.xml',
+     output: 'resources.c',
+     command: [
+       gen_resources,
+       '--glib-compile-resources=@0@'.format(glib_compile_resources.full_path()),
+-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++      '--pixdata=@0@'.format(pixdata_binary),
+       '--loaders=@0@'.format(loaders_cache.full_path()),
+       '--sourcedir=@0@'.format(meson.current_source_dir()),
+       '--source',
+@@ -33,7 +40,7 @@ if enabled_loaders.contains('png') and host_system != 'windows'
+     command: [
+       gen_resources,
+       '--glib-compile-resources=@0@'.format(glib_compile_resources.full_path()),
+-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++      '--pixdata=@0@'.format(pixdata_binary),
+       '--loaders=@0@'.format(loaders_cache.full_path()),
+       '--sourcedir=@0@'.format(meson.current_source_dir()),
+       '--header',
 diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
-index aaafec8..71bd61b 100644
+index 8c741e0..4d98841 100644
 --- a/thumbnailer/meson.build
 +++ b/thumbnailer/meson.build
-@@ -18,9 +18,7 @@ custom_target('thumbnailer',
+@@ -19,9 +19,7 @@ custom_target('thumbnailer',
                output: 'gdk-pixbuf-thumbnailer.thumbnailer',
                command: [
                  gen_thumbnailer,
@@ -84,7 +84,7 @@ index aaafec8..71bd61b 100644
                  '--bindir=@0@'.format(gdk_pixbuf_bindir),
                  '@INPUT@',
                  '@OUTPUT@',
-@@ -28,7 +26,6 @@ custom_target('thumbnailer',
+@@ -29,7 +27,6 @@ custom_target('thumbnailer',
                depends: [
                  gdk_pixbuf_print_mime_types,
                  gdk_pixbuf_pixdata,
@@ -92,3 +92,6 @@ index aaafec8..71bd61b 100644
                ],
                install: true,
                install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
+-- 
+2.17.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
index 96c546f271..9b41b77124 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
@@ -1,4 +1,4 @@
-From 3c4a6c147ae8a0962ba9194373d8a41d14eed44f Mon Sep 17 00:00:00 2001
+From c26a775a8e8efe5f9cf3e666cd51707fe69da203 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 22 Feb 2019 13:23:55 +0100
 Subject: [PATCH] Do not run tests when building
@@ -6,14 +6,14 @@ Subject: [PATCH] Do not run tests when building
 Upstream-Status: Inappropriate [cross-compile specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- tests/meson.build | 17 -----------------
- 1 file changed, 17 deletions(-)
+ tests/meson.build | 13 -------------
+ 1 file changed, 13 deletions(-)
 
 diff --git a/tests/meson.build b/tests/meson.build
-index 4fa3fbc..6ef7884 100644
+index 7c6cb11..3f3ee54 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -138,23 +138,6 @@ foreach t: installed_tests
+@@ -201,19 +201,6 @@ foreach test_name, test_data: installed_tests
      install_dir: installed_test_bindir,
    )
  
@@ -26,14 +26,13 @@ index 4fa3fbc..6ef7884 100644
 -
 -  test(test_name, test_bin,
 -    suite: test_suites,
--    args: [ '-k', '--tap' ],
--    env: [
--      'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
--      'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
--      'GDK_PIXBUF_MODULE_FILE=@0@'.format(loaders_cache.full_path()),
--    ],
+-    args: test_args,
+-    env: test_env,
 -    timeout: timeout,
 -  )
  endforeach
  
  executable('pixbuf-read',
+-- 
+2.17.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
index 0fe13a387a..db4b039bd9 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
@@ -13,7 +13,7 @@ diff --git a/meson.build b/meson.build
 index d104cea..7acb88a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -397,10 +397,8 @@ endif
+@@ -403,10 +403,8 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -25,4 +25,4 @@ index d104cea..7acb88a 100644
 +subdir('thumbnailer')
  
  # Documentation
- subdir('docs')
+ build_docs = get_option('gtk_doc') or get_option('docs')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
deleted file mode 100644
index 3fef2bc1eb..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81 Mon Sep 17 00:00:00 2001
-From: Robert Ancell <robert.ancell@canonical.com>
-Date: Mon, 30 Nov 2020 12:26:12 +1300
-Subject: [PATCH 02/13] gif: Fix LZW decoder accepting invalid LZW code.
-
-The code value after a reset wasn't being validated, which means we would
-accept invalid codes. This could cause an infinite loop in the decoder.
-
-Fixes CVE-2020-29385
-
-Fixes https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/164
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81]
-CVE: CVE-2020-29385
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- gdk-pixbuf/lzw.c                    |  13 +++++++------
- 1 files changed, 7 insertions(+), 6 deletions(-)
- create mode 100644 tests/test-images/fail/hang_114.gif
-
-diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
-index 9e052a6f7..105daf2b1 100644
---- a/gdk-pixbuf/lzw.c
-+++ b/gdk-pixbuf/lzw.c
-@@ -195,19 +195,20 @@ lzw_decoder_feed (LZWDecoder *self,
-                                 if (self->last_code != self->clear_code && self->code_table_size < MAX_CODES) {
-                                         if (self->code < self->code_table_size)
-                                                 add_code (self, self->code);
--                                        else if (self->code == self->code_table_size)
-+                                        else
-                                                 add_code (self, self->last_code);
--                                        else {
--                                                /* Invalid code received - just stop here */
--                                                self->last_code = self->eoi_code;
--                                                return output_length;
--                                        }
- 
-                                         /* When table is full increase code size */
-                                         if (self->code_table_size == (1 << self->code_size) && self->code_size < LZW_CODE_MAX)
-                                                 self->code_size++;
-                                 }
- 
-+                                /* Invalid code received - just stop here */
-+                                if (self->code >= self->code_table_size) {
-+                                        self->last_code = self->eoi_code;
-+                                        return output_length;
-+                                }
-+
-                                 /* Convert codeword into indexes */
-                                 n_written += write_indexes (self, output + n_written, output_length - n_written);
-                         }
--- 
-2.25.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
deleted file mode 100644
index 6c758fd61c..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From d8d231c01ef2e59856da8a5c26ace955e5f29370 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 25 Nov 2019 17:05:46 +0000
-Subject: [PATCH] tests: install circular-table.gif
-
-This test data was added for the pixbuf-gif-circular-table test (added October
-2018 in 0b9d004) but because the file was never actually installed the installed
-test suite never passes.
----
- tests/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 5116fc2b9..80ed3e8b2 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -97,6 +97,7 @@ test_data = [
-   'bug775693.pixdata',
-   'bug775229.pixdata',
-   'aero.gif',
-+  'circular-table.gif'
- ]
- 
- installed_test_bindir = join_paths(gdk_pixbuf_libexecdir, 'installed-tests', meson.project_name())
--- 
-2.20.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
similarity index 91%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
index 226e1c7b89..17213bb7f0 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
@@ -24,8 +24,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
            file://0004-Do-not-run-tests-when-building.patch \
            file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
-           file://missing-test-data.patch \
-           file://CVE-2020-29385.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -35,28 +33,26 @@ SRC_URI_append_class-nativesdk = " \
            file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
            "
 
-SRC_URI[md5sum] = "05eb1ebc258ba905f1c8644ef49de064"
-SRC_URI[sha256sum] = "1582595099537ca8ff3b99c6804350b4c058bb8ad67411bbaae024ee7cead4e6"
+SRC_URI[md5sum] = "7cd2fdaa3c55e2302316fe36968f7425"
+SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-GIR_MESON_OPTION = 'gir'
-
 LIBV = "2.10.0"
 
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
 GDK_PIXBUF_LOADERS ?= "png jpeg"
 
 PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
-                 ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
 
 PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
 PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
 PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
-PACKAGECONFIG[jpeg2000] = "-Djasper=true,-Djasper=false,jasper"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
-PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
 
 PACKAGES =+ "${PN}-xlib"
 
-- 
2.17.1

