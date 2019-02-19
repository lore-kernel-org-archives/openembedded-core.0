Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id EEB0D7C8D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 13:58:29 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r5so8719834wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 05:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6LXR2Pj38d/4blUZ1L7Ary/LqxSffTnM1LQiyZqEvf4=;
	b=DVWZTUVH0zVs3GjyTgE7WfajnzPNsH7LrPkqnqeEd/4brHA1xZ5rqBjG82sUnGSVXX
	o1rBnW2HyYqv8QvHwANRzdvKZsURP7GcKd7ZC7YIPG3ukTjiIwHsmzG/Z2amKFIkQSIG
	Rd2wFLEPeJaVii7D+UnYnR021wW9pUJJNkMvusIhd5jaLeiCuiVEgTEsHT0/kAQlwDvX
	e35eEO9mWIbbmKZZ953W5rEqiXnbjoNg9Xb8s6i2npgsgluTldpJNCZU/jfNkYx91+gu
	N/9R64UYL6+fkBgG5895UC3sZByy9aKCWjvTawbV4dWwgiHujLJ1VnDwdM3389sv2g17
	d+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6LXR2Pj38d/4blUZ1L7Ary/LqxSffTnM1LQiyZqEvf4=;
	b=cl+CfomSBCpfMDYY73Mbfc8ieShUPH6JCSdbeiTgKElJVi0xtA7AonuFFiAmYHJXLI
	CB6cuNMCII+/x+YEj6I95vehozLXtOxrdE9CCsgyDTKlBlWPPJItptzt6XMJ0ajSmkIK
	jcysAlK9IY2hlMRTqe92HhuAx0dFxL9ZiokWKPGmmnyNN16tEUfF33RCCWn/taShPiLy
	sB9ImizYjBW6apVhnz35uBjecprUwP8k38NvywveWY8bf09UGwE+eIlvt3H1vLFThPM8
	IQbx3Wr5xXyHkCy1SNhN+ZwR4lnyhp6g5N8wSpUH1OYzeQmnbnSmaA/3Y/uWthezO5vK
	nDIQ==
X-Gm-Message-State: AHQUAuZ0c5lcSnysCFQ7AyeYjTUV0u48y2ucyAbeNJ/2TMMzOm7FHNFt
	81q5QovOEX95wGGnE9ao6SRA+/U9
X-Google-Smtp-Source: AHgI3IbL4ULYA3C/+Qc+tK2qPc0M4/kBt6baBb6lmyhfPHX1Q+RKPA/Ma2fnANI0LFKpcMNWERWUYA==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr22890009wrp.42.1550584709913; 
	Tue, 19 Feb 2019 05:58:29 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q24sm1959656wmq.16.2019.02.19.05.58.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 05:58:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 14:58:14 +0100
Message-Id: <20190219135815.18177-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219135815.18177-1-alex.kanavin@gmail.com>
References: <20190219135815.18177-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/8] gdk-pixbuf: convert from autotools to meson
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2019 13:58:30 -0000

Drop autotools-specific patches.

Rework jku's thumbnailer patch into meson configuration.

Add a patch to disable tests in native builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Disable-tests-in-native-builds.patch |  30 ++++
 ...f-decisions-around-cross-compilation.patch |  38 +++++
 ...without-libtiff-not-having-an-effect.patch |  27 ----
 ...nd-thumbnailer-cross-compile-failure.patch |  53 +++----
 ...nd-thumbnailer-cross-compile-failure.patch | 131 ++++++++++++++++++
 .../extending-libinstall-dependencies.patch   |  42 ------
 .../gdk-pixbuf/hardcoded_libtool.patch        |  33 -----
 .../gdk-pixbuf/gdk-pixbuf_2.36.11.bb          |  41 ++++--
 8 files changed, 248 insertions(+), 147 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Disable-tests-in-native-builds.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0002-Work-around-thumbnailer-cross-compile-failure.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/extending-libinstall-dependencies.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/hardcoded_libtool.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Disable-tests-in-native-builds.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Disable-tests-in-native-builds.patch
new file mode 100644
index 00000000000..c991635bb95
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Disable-tests-in-native-builds.patch
@@ -0,0 +1,30 @@
+From d44aad1858c9c0da74f389d3de4dabade28b56c3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 18 Feb 2019 16:00:12 +0100
+Subject: [PATCH] Disable tests in native builds.
+
+They have found to be problematic at least on Centos 7:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/296/steps/7/logs/step1b
+
+With autotools this was not a problem because it had a configuration
+switch for disabling test, which was used. Meson has no such facility :(
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 92c4049..0871c84 100644
+--- a/meson.build
++++ b/meson.build
+@@ -397,7 +397,7 @@ endif
+ # i18n
+ subdir('po')
+ 
+-subdir('tests')
++#subdir('tests')
+ subdir('thumbnailer')
+ 
+ # Documentation
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
new file mode 100644
index 00000000000..90d4830df50
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
@@ -0,0 +1,38 @@
+From 48cbdd56036728ffea431ad63cf5e2ad05cef69c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 14 Feb 2019 18:06:25 +0100
+Subject: [PATCH] Fix a couple of decisions around cross-compilation
+
+1. gobject-introspection can be build when cross compiling
+2. generating loaders.cache requires running a target binary which
+we do elsewhere (in postinsts)
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gdk-pixbuf/meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
+index 77c162b..fc3eb33 100644
+--- a/gdk-pixbuf/meson.build
++++ b/gdk-pixbuf/meson.build
+@@ -230,6 +230,7 @@ foreach bin: gdkpixbuf_bin
+   set_variable(bin_name.underscorify(), bin)
+ endforeach
+ 
++if not meson.is_cross_build()
+ # The 'loaders.cache' used for testing, so we don't accidentally
+ # load the installed cache; we always build it by default
+ loaders_cache = custom_target('loaders.cache',
+@@ -241,8 +242,9 @@ loaders_cache = custom_target('loaders.cache',
+                               ],
+                               build_by_default: true)
+ loaders_dep = declare_dependency(sources: [ loaders_cache ])
++endif
+ 
+-build_gir = get_option('with_gir') and not meson.is_cross_build()
++build_gir = get_option('with_gir')
+ if build_gir
+   gir_args = [
+     '--quiet',
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch
deleted file mode 100644
index 2a54d8ed763..00000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 460befc992adb32434b0408b453be39a6866ccf8 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 10 Oct 2017 14:33:18 +0300
-Subject: [PATCH] Fix --without-libtiff not having an effect.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=788770]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 315e0cc..98e780c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -676,7 +676,7 @@ if test x$gio_can_sniff = x; then
-   AC_DEFINE(GDK_PIXBUF_USE_GIO_MIME, 1, [Define if gio can sniff image data])
- fi
- 
--AM_CONDITIONAL(HAVE_TIFF, test "x$libtiff_found" != x)
-+AM_CONDITIONAL(HAVE_TIFF, test "x$libtiff_found" != xno)
- AM_CONDITIONAL(HAVE_PNG, test "x$LIBPNG" != x)
- AM_CONDITIONAL(HAVE_JPEG, test "x$LIBJPEG" != x)
- AM_CONDITIONAL(HAVE_JASPER, test "x$LIBJASPER" != x)
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
index 31ed988f32b..110b32a4907 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
@@ -1,47 +1,28 @@
-From 6646e8aadc4030d891ac27c25494e5793d59dc85 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 22 Feb 2017 11:24:39 +0200
+From 8c7ced988def52654946458a3779e383b27f14f7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 14 Feb 2019 17:56:10 +0100
 Subject: [PATCH] Work-around thumbnailer cross-compile failure
 
 Install gdk-pixbuf-print-mime-types that's needed for thumbnail
 metadata generation.
 
-Use native gdk-pixbuf-print-mime-types when generating the thumbnail
-metadata. This works but the mime types will come from native
-loader.cache (which will only contain in-tree loaders), not from the
-target loader.cache.
-
 The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
 
 Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- thumbnailer/Makefile.am | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
+ thumbnailer/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
 
-diff --git a/thumbnailer/Makefile.am b/thumbnailer/Makefile.am
-index c9fe123..b0c6c70 100644
---- a/thumbnailer/Makefile.am
-+++ b/thumbnailer/Makefile.am
-@@ -1,5 +1,4 @@
--bin_PROGRAMS = gdk-pixbuf-thumbnailer
--noinst_PROGRAMS = gdk-pixbuf-print-mime-types
-+bin_PROGRAMS = gdk-pixbuf-thumbnailer gdk-pixbuf-print-mime-types
- 
- gdk_pixbuf_thumbnailer_SOURCES = gdk-pixbuf-thumbnailer.c gnome-thumbnailer-skeleton.c gnome-thumbnailer-skeleton.h
- gdk_pixbuf_thumbnailer_CPPFLAGS =			\
-@@ -25,9 +24,9 @@ gdk_pixbuf_print_mime_types_LDADD =			\
+diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
+index e801144..aaafec8 100644
+--- a/thumbnailer/meson.build
++++ b/thumbnailer/meson.build
+@@ -10,6 +10,7 @@ executable('gdk-pixbuf-thumbnailer',
+ gdk_pixbuf_print_mime_types = executable('gdk-pixbuf-print-mime-types',
+                                          'gdk-pixbuf-print-mime-types.c',
+                                          c_args: common_cflags,
++                                         install: true,
+                                          dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ])
  
- thumbnailerdir = $(datadir)/thumbnailers/
- thumbnailer_DATA = gdk-pixbuf-thumbnailer.thumbnailer
--gdk-pixbuf-thumbnailer.thumbnailer: gdk-pixbuf-thumbnailer.thumbnailer.in Makefile gdk-pixbuf-print-mime-types$(EXEEXT) $(top_builddir)/gdk-pixbuf/loaders.cache
-+gdk-pixbuf-thumbnailer.thumbnailer: gdk-pixbuf-thumbnailer.thumbnailer.in Makefile gdk-pixbuf-print-mime-types$(EXEEXT)
- 	$(AM_V_GEN) $(SED) -e "s|\@bindir\@|$(bindir)|"						\
--	-e "s|\@mimetypes\@|`GDK_PIXBUF_MODULE_FILE=$(top_builddir)/gdk-pixbuf/loaders.cache GDK_PIXBUF_PIXDATA=$(top_builddir)/gdk-pixbuf/gdk-pixbuf-pixdata $(builddir)/gdk-pixbuf-print-mime-types`|" \
-+	-e "s|\@mimetypes\@|`gdk-pixbuf-print-mime-types`|" \
- 	$< > $@
- 
- EXTRA_DIST = gdk-pixbuf-thumbnailer.thumbnailer.in
--- 
-2.1.4
-
+ custom_target('thumbnailer',
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0002-Work-around-thumbnailer-cross-compile-failure.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0002-Work-around-thumbnailer-cross-compile-failure.patch
new file mode 100644
index 00000000000..b0cd838a8fd
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0002-Work-around-thumbnailer-cross-compile-failure.patch
@@ -0,0 +1,131 @@
+From a184e6bfdd7761ad9807f3de9e873d49aff79e6d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 14 Feb 2019 17:56:34 +0100
+Subject: [PATCH] (target only) Work-around thumbnailer cross-compile failure
+
+Use native gdk-pixbuf-print-mime-types when generating the thumbnail
+metadata. This works but the mime types will come from native
+loader.cache (which will only contain in-tree loaders), not from the
+target loader.cache.
+
+The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
+
+Upstream-Status: Inappropriate [workaround]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ build-aux/gen-thumbnailer.py |  2 --
+ tests/meson.build            | 49 +-----------------------------------
+ thumbnailer/meson.build      |  5 +---
+ 3 files changed, 2 insertions(+), 54 deletions(-)
+
+diff --git a/build-aux/gen-thumbnailer.py b/build-aux/gen-thumbnailer.py
+index 05ac821..c5b99ab 100644
+--- a/build-aux/gen-thumbnailer.py
++++ b/build-aux/gen-thumbnailer.py
+@@ -20,8 +20,6 @@ argparser.add_argument('output', help='Output file')
+ args = argparser.parse_args()
+ 
+ newenv = os.environ.copy()
+-newenv['GDK_PIXBUF_PIXDATA'] = args.pixdata
+-newenv['GDK_PIXBUF_MODULE_FILE'] = args.loaders
+ # 'nt': NT-based Windows, see https://docs.python.org/3/library/os.html
+ if os.name == 'nt':
+     gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
+diff --git a/tests/meson.build b/tests/meson.build
+index 77a427a..467f5b2 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -1,38 +1,6 @@
+ # Resources; we cannot use gnome.compile_resources() here, because we need to
+ # override the environment in order to use the utilities we just built instead
+ # of the system ones
+-resources_c = custom_target('resources.c',
+-                            input: 'resources.gresource.xml',
+-                            output: 'resources.c',
+-                            command: [
+-                              gen_resources,
+-                              '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
+-                              '--loaders=@0@'.format(loaders_cache.full_path()),
+-                              '--sourcedir=@0@'.format(meson.current_source_dir()),
+-                              '--source',
+-                              '@INPUT@',
+-                              '@OUTPUT@',
+-                            ],
+-                            depends: [
+-                              gdk_pixbuf_pixdata,
+-                              loaders_cache,
+-                            ])
+-resources_h = custom_target('resources.h',
+-                            input: 'resources.gresource.xml',
+-                            output: 'resources.h',
+-                            command: [
+-                              gen_resources,
+-                              '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
+-                              '--loaders=@0@'.format(loaders_cache.full_path()),
+-                              '--sourcedir=@0@'.format(meson.current_source_dir()),
+-                              '--header',
+-                              '@INPUT@',
+-                              '@OUTPUT@',
+-                            ],
+-                            depends: [
+-                              gdk_pixbuf_pixdata,
+-                              loaders_cache,
+-                            ])
+ 
+ installed_tests = [
+   [ 'animation' ],
+@@ -94,7 +62,7 @@ foreach t: installed_tests
+   test_sources = [ test_name + '.c', 'test-common.c' ]
+   needs_resources = t.get(1, false)
+   if needs_resources
+-    test_sources += [ resources_c, resources_h ]
++    test_sources += [ 'resources.c', 'resources.h' ]
+   endif
+ 
+   custom_target(test_name + '.test',
+@@ -116,21 +84,6 @@ foreach t: installed_tests
+                         ],
+                         c_args: common_cflags)
+ 
+-  # Two particularly slow tests
+-  if test_name == 'pixbuf-area-updated' or test_name == 'pixbuf-randomly-modified'
+-    timeout = 300
+-  else
+-    timeout = 30
+-  endif
+-
+-  test(test_name, test_bin,
+-       args: [ '-k', '--tap' ],
+-       env: [
+-         'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
+-         'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
+-         'GDK_PIXBUF_MODULE_FILE=@0@'.format(loaders_cache.full_path()),
+-       ],
+-       timeout: timeout)
+ endforeach
+ 
+ executable('pixbuf-read',
+diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
+index aaafec8..71bd61b 100644
+--- a/thumbnailer/meson.build
++++ b/thumbnailer/meson.build
+@@ -18,9 +18,7 @@ custom_target('thumbnailer',
+               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
+               command: [
+                 gen_thumbnailer,
+-                '--printer=@0@'.format(gdk_pixbuf_print_mime_types.full_path()),
+-                '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
+-                '--loaders=@0@'.format(loaders_cache.full_path()),
++                '--printer=gdk-pixbuf-print-mime-types',
+                 '--bindir=@0@'.format(gdk_pixbuf_bindir),
+                 '@INPUT@',
+                 '@OUTPUT@',
+@@ -28,7 +26,6 @@ custom_target('thumbnailer',
+               depends: [
+                 gdk_pixbuf_print_mime_types,
+                 gdk_pixbuf_pixdata,
+-                loaders_cache,
+               ],
+               install: true,
+               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/extending-libinstall-dependencies.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/extending-libinstall-dependencies.patch
deleted file mode 100644
index edbdced43a4..00000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/extending-libinstall-dependencies.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending
-
-This patch fixes parallel install issue that lib libpixbufloader-png.la
-depends on libgdk_pixbuf-2.0.la which will be regenerated during insta-
-llation, if libgdk_pixbuf-2.0.la is regenerating and at the same time
-libpixbufloader-png.la links it, the error will happen.
-
-Error message is:
-* usr/bin/ld: cannot find -lgdk_pixbuf-2.0
-* collect2: ld returned 1 exit status
-
-Make an explicit dependency to the libs install targets would fix this
-issue.
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- gdk-pixbuf/Makefile.am |    1 +
- libdeps.mk             |    3 +++
- 2 files changed, 4 insertions(+), 0 deletions(-)
- create mode 100644 libdeps.mk
-
-diff --git a/gdk-pixbuf/Makefile.am b/gdk-pixbuf/Makefile.am
-index 95a93a8..db44cae 100644
---- a/gdk-pixbuf/Makefile.am
-+++ b/gdk-pixbuf/Makefile.am
-@@ -783,3 +783,4 @@ loaders.cache:
- endif
- 
- -include $(top_srcdir)/git.mk
-+-include $(top_srcdir)/libdeps.mk
-diff --git a/libdeps.mk b/libdeps.mk
-new file mode 100644
-index 0000000..d7a10a8
---- /dev/null
-+++ b/libdeps.mk
-@@ -0,0 +1,3 @@
-+# Extending dependencies of install-loaderLTLIBRARIES:
-+# The $(lib-LTLIBRARIES) is needed by relinking $(loader_LTLIBRARIES)
-+install-loaderLTLIBRARIES: install-libLTLIBRARIES
--- 
-1.7.6.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/hardcoded_libtool.patch
deleted file mode 100644
index ecca62a7129..00000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/hardcoded_libtool.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: gdk-pixbuf-2.22.1/configure.ac
-===================================================================
---- gdk-pixbuf-2.22.1.orig/configure.ac	2010-11-26 09:06:34.000000000 +0800
-+++ gdk-pixbuf-2.22.1/configure.ac	2010-11-26 09:07:33.000000000 +0800
-@@ -287,7 +287,7 @@
- case $enable_explicit_deps in
-   auto)
-     export SED
--    deplibs_check_method=`(./libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
-+    deplibs_check_method=`(./$host_alias-libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
-     if test "x$deplibs_check_method" '!=' xpass_all || test "x$enable_static" = xyes ; then
-       enable_explicit_deps=yes
-     else
-@@ -484,7 +484,7 @@
-     dnl Now we check to see if our libtool supports shared lib deps
-     dnl (in a rather ugly way even)
-     if $dynworks; then
--        pixbuf_libtool_config="${CONFIG_SHELL-/bin/sh} ./libtool --config"
-+        pixbuf_libtool_config="${CONFIG_SHELL-/bin/sh} ./$host_alias-libtool --config"
-         pixbuf_deplibs_check=`$pixbuf_libtool_config | \
-             grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
-             sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
-@@ -957,7 +957,7 @@
- # We are using gmodule-no-export now, but I'm leaving the stripping
- # code in place for now, since pango and atk still require gmodule.
- export SED
--export_dynamic=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
-+export_dynamic=`(./$host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
- if test -n "$export_dynamic"; then
-   GDK_PIXBUF_DEP_LIBS=`echo $GDK_PIXBUF_DEP_LIBS | sed -e "s/$export_dynamic//"`
- fi
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
index a7d3884d1fb..708c1f77391 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
@@ -13,18 +13,41 @@ DEPENDS = "glib-2.0 gdk-pixbuf-native shared-mime-info"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://hardcoded_libtool.patch \
-           file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
-           file://0001-Fix-without-libtiff-not-having-an-effect.patch \
+           file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
+           "
+
+SRC_URI_append_class-target = " \
+           file://0002-Work-around-thumbnailer-cross-compile-failure.patch \
+           "
+SRC_URI_append_class-nativesdk = " \
+           file://0002-Work-around-thumbnailer-cross-compile-failure.patch \
+           file://0001-Disable-tests-in-native-builds.patch \
+           "
+SRC_URI_append_class-native = " \
+           file://0001-Disable-tests-in-native-builds.patch \
            "
 
 SRC_URI[md5sum] = "6e84e5485c17ce7c25df77fe76eb2d6a"
 SRC_URI[sha256sum] = "ae62ab87250413156ed72ef756347b10208c00e76b222d82d9ed361ed9dde2f3"
 
-inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
+inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
+
+GTKDOC_ENABLE_FLAG = "-Dwith_docs=true"
+GTKDOC_DISABLE_FLAG = "-Dwith_docs=false"
+
+GI_ENABLE_FLAG = "-Dwith_gir=true"
+GI_DISABLE_FLAG = "-Dwith_gir=false"
+
+EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
+                                                                                       '${GI_DISABLE_FLAG}', d)} "
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
+                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
 
 LIBV = "2.10.0"
 
@@ -34,12 +57,12 @@ PACKAGECONFIG ??= "${GDK_PIXBUF_LOADERS}"
 PACKAGECONFIG_linuxstdbase = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${GDK_PIXBUF_LOADERS}"
 PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
 
-PACKAGECONFIG[png] = "--with-libpng,--without-libpng,libpng"
-PACKAGECONFIG[jpeg] = "--with-libjpeg,--without-libjpeg,jpeg"
-PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
-PACKAGECONFIG[jpeg2000] = "--with-libjasper,--without-libjasper,jasper"
+PACKAGECONFIG[png] = "-Denable_png=true,-Denable_png=false,libpng"
+PACKAGECONFIG[jpeg] = "-Denable_jpeg=true,-Denable_jpeg=false,jpeg"
+PACKAGECONFIG[tiff] = "-Denable_tiff=true,-Denable_tiff=false,tiff"
+PACKAGECONFIG[jpeg2000] = "-Denable_jasper=true,-Denable_jasper=false,jasper"
 
-PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
+PACKAGECONFIG[x11] = ",,virtual/libx11"
 
 PACKAGES =+ "${PN}-xlib"
 
-- 
2.17.1


