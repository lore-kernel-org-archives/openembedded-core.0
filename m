Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.765.1610694015907161277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 23:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,348,1602518400"; 
   d="scan'208";a="103508295"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jan 2021 15:00:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E5EF64CE6036
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 14:59:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 15 Jan 2021 14:59:57 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gdk-pixbuf: upgrade 2.40.0 -> 2.42.2
Date: Fri, 15 Jan 2021 14:59:52 +0800
Message-ID: <1610693992-27561-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: E5EF64CE6036.A6393
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh the following patches:
0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch

remove the following patches since they are included in 2.42.2:
0004-Do-not-run-tests-when-building.patch
missing-test-data.patch
CVE-2020-29385.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-around-thumbnailer-cross-compile-fa.patch | 70 ++++++++++---------
 .../0004-Do-not-run-tests-when-building.patch | 39 -----------
 ...ailer-and-tests-also-in-cross-builds.patch |  9 ++-
 .../gdk-pixbuf/CVE-2020-29385.patch           | 55 ---------------
 .../gdk-pixbuf/missing-test-data.patch        | 30 --------
 ...-pixbuf_2.40.0.bb => gdk-pixbuf_2.42.2.bb} | 14 ++--
 6 files changed, 48 insertions(+), 169 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.40.0.bb => gdk-pixbuf_2.42.2.bb} (91%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
index a9c7600eb3..f12c178696 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
@@ -18,9 +18,9 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
  build-aux/gen-thumbnailer.py |  2 --
- tests/meson.build            | 11 +++++++++--
+ tests/meson.build            | 10 ++++++++--
  thumbnailer/meson.build      |  5 +----
- 3 files changed, 10 insertions(+), 8 deletions(-)
+ 3 files changed, 9 insertions(+), 8 deletions(-)
 
 diff --git a/build-aux/gen-thumbnailer.py b/build-aux/gen-thumbnailer.py
 index 05ac821..c5b99ab 100644
@@ -36,41 +36,40 @@ index 05ac821..c5b99ab 100644
  if os.name == 'nt':
      gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
 diff --git a/tests/meson.build b/tests/meson.build
-index 8ed7cc1..e011b77 100644
+index c9cf25c..c82d9f7 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -1,12 +1,19 @@
- # Resources; we cannot use gnome.compile_resources() here, because we need to
- # override the environment in order to use the utilities we just built instead
- # of the system ones
+@@ -4,12 +4,18 @@ if enabled_loaders.contains('png') and enabled_loaders.contains('bmp')
+   # Resources; we cannot use gnome.compile_resources() here, because we need to
+   # override the environment in order to use the utilities we just built instead
+   # of the system ones
++  if not meson.is_cross_build()
++  pixdata_binary = gdk_pixbuf_pixdata.full_path()
++  else
++  pixdata_binary = 'gdk-pixbuf-pixdata'
++  endif
 +
-+if not meson.is_cross_build()
-+pixdata_binary = gdk_pixbuf_pixdata.full_path()
-+else
-+pixdata_binary = 'gdk-pixbuf-pixdata'
-+endif
-+
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
+-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++      '--pixdata=@0@'.format(pixdata_binary),
+       '--loaders=@0@'.format(loaders_cache.full_path()),
+       '--sourcedir=@0@'.format(meson.current_source_dir()),
+       '--source',
+@@ -27,7 +33,7 @@ if enabled_loaders.contains('png') and enabled_loaders.contains('bmp')
+     output: 'resources.h',
+     command: [
+       gen_resources,
+-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++      '--pixdata=@0@'.format(pixdata_binary),
+       '--loaders=@0@'.format(loaders_cache.full_path()),
+       '--sourcedir=@0@'.format(meson.current_source_dir()),
+       '--header',
 diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
-index aaafec8..71bd61b 100644
+index aaafec8..6abfda4 100644
 --- a/thumbnailer/meson.build
 +++ b/thumbnailer/meson.build
 @@ -18,9 +18,7 @@ custom_target('thumbnailer',
@@ -80,7 +79,7 @@ index aaafec8..71bd61b 100644
 -                '--printer=@0@'.format(gdk_pixbuf_print_mime_types.full_path()),
 -                '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
 -                '--loaders=@0@'.format(loaders_cache.full_path()),
-+                '--printer=gdk-pixbuf-print-mime-types',
++		'--printer=gdk-pixbuf-print-mime-types',
                  '--bindir=@0@'.format(gdk_pixbuf_bindir),
                  '@INPUT@',
                  '@OUTPUT@',
@@ -92,3 +91,6 @@ index aaafec8..71bd61b 100644
                ],
                install: true,
                install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
+-- 
+2.25.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
deleted file mode 100644
index 96c546f271..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3c4a6c147ae8a0962ba9194373d8a41d14eed44f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 22 Feb 2019 13:23:55 +0100
-Subject: [PATCH] Do not run tests when building
-
-Upstream-Status: Inappropriate [cross-compile specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/meson.build | 17 -----------------
- 1 file changed, 17 deletions(-)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 4fa3fbc..6ef7884 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -138,23 +138,6 @@ foreach t: installed_tests
-     install_dir: installed_test_bindir,
-   )
- 
--  # Two particularly slow tests
--  if test_suites.contains('slow')
--    timeout = 300
--  else
--    timeout = 30
--  endif
--
--  test(test_name, test_bin,
--    suite: test_suites,
--    args: [ '-k', '--tap' ],
--    env: [
--      'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
--      'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
--      'GDK_PIXBUF_MODULE_FILE=@0@'.format(loaders_cache.full_path()),
--    ],
--    timeout: timeout,
--  )
- endforeach
- 
- executable('pixbuf-read',
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
index 0fe13a387a..6a7fd02501 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index d104cea..7acb88a 100644
+index c386070..15f16a6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -397,10 +397,8 @@ endif
+@@ -378,10 +378,8 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -25,4 +25,7 @@ index d104cea..7acb88a 100644
 +subdir('thumbnailer')
  
  # Documentation
- subdir('docs')
+ build_docs = get_option('gtk_doc') or get_option('docs')
+-- 
+2.25.1
+
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
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.2.bb
similarity index 91%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.2.bb
index 16708fd581..bcdd8f0526 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.2.bb
@@ -21,10 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
            file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
-           file://0004-Do-not-run-tests-when-building.patch \
            file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
-           file://missing-test-data.patch \
-           file://CVE-2020-29385.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -34,12 +31,15 @@ SRC_URI_append_class-nativesdk = " \
            file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
            "
 
-SRC_URI[md5sum] = "05eb1ebc258ba905f1c8644ef49de064"
-SRC_URI[sha256sum] = "1582595099537ca8ff3b99c6804350b4c058bb8ad67411bbaae024ee7cead4e6"
+SRC_URI[md5sum] = "7d7617db8dae8ce313160384ab0a71db"
+SRC_URI[sha256sum] = "83c66a1cfd591d7680c144d2922c5955d38b4db336d7cd3ee109f7bcf9afef15"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-GIR_MESON_OPTION = 'gir'
+GIR_MESON_ENABLE_FLAG = "enabled"
+GIR_MESON_DISABLE_FLAG = "disabled"
+
+GIR_MESON_OPTION = 'introspection'
 
 LIBV = "2.10.0"
 
@@ -53,9 +53,7 @@ PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
 PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
 PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
 PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
-PACKAGECONFIG[jpeg2000] = "-Djasper=true,-Djasper=false,jasper"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
-PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
 
 PACKAGES =+ "${PN}-xlib"
 
-- 
2.25.1



