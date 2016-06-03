Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 02B87774F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440223"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:52 +0300
Message-Id: <39ae6602e9fe55a4fd4d641873982d49122ddf94.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/25] gobject-introspection: update to 1.48.0
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:24 -0000

Add a patch that reverts an incomplete upstream attempt at cross-compile support;
upstream has been notified:
https://bugzilla.gnome.org/show_bug.cgi?id=696773

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ncomplete-upstream-attempt-at-cross-compi.patch | 50 ++++++++++++++++++++++
 ...-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch} | 15 +++----
 ...-giscanner-add-use-binary-wrapper-option.patch} | 13 +++---
 ...4-giscanner-add-a-use-ldd-wrapper-option.patch} | 15 +++----
 ...onfig-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch} | 13 +++---
 ...n_1.46.0.bb => gobject-introspection_1.48.0.bb} | 15 ++++---
 6 files changed, 84 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 rename meta/recipes-gnome/gobject-introspection/gobject-introspection/{0001-configure.ac-add-host-gi-gi-cross-wrapper-and-gi-ldd.patch => 0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch} (95%)
 rename meta/recipes-gnome/gobject-introspection/gobject-introspection/{0001-giscanner-add-use-binary-wrapper-option.patch => 0003-giscanner-add-use-binary-wrapper-option.patch} (88%)
 rename meta/recipes-gnome/gobject-introspection/gobject-introspection/{0001-giscanner-add-a-use-ldd-wrapper-option.patch => 0004-giscanner-add-a-use-ldd-wrapper-option.patch} (85%)
 rename meta/recipes-gnome/gobject-introspection/gobject-introspection/{0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch => 0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch} (91%)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.46.0.bb => gobject-introspection_1.48.0.bb} (93%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
new file mode 100644
index 0000000..9abaea7
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
@@ -0,0 +1,50 @@
+From 3a9d1e5ee0aae56fafec0beba2014c19e4ff310c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 23 Mar 2016 17:07:28 +0200
+Subject: [PATCH 1/5] Revert an incomplete upstream attempt at cross-compile
+ support
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ common.mk                | 4 ----
+ giscanner/gdumpparser.py | 6 ------
+ 2 files changed, 10 deletions(-)
+
+diff --git a/common.mk b/common.mk
+index b778f7a..e26c637 100644
+--- a/common.mk
++++ b/common.mk
+@@ -24,12 +24,8 @@ INTROSPECTION_SCANNER_ARGS = \
+     --add-include-path=$(top_builddir) \
+     --add-include-path=$(top_builddir)/gir
+ 
+-# GI_CROSS_LAUNCHER is the command to use for executing g-ir-compiler.
+-# Normally will be undefined but can be set (e.g. to wine or qemu)
+-# when cross-compiling
+ INTROSPECTION_COMPILER = \
+     env PATH=".libs:$(PATH)" \
+-        $(GI_CROSS_LAUNCHER) \
+         $(top_builddir)/g-ir-compiler$(EXEEXT)
+ 
+ INTROSPECTION_COMPILER_ARGS = \
+diff --git a/giscanner/gdumpparser.py b/giscanner/gdumpparser.py
+index 1134f33..9bdc2bc 100644
+--- a/giscanner/gdumpparser.py
++++ b/giscanner/gdumpparser.py
+@@ -162,12 +162,6 @@ blob containing data gleaned from GObject's primitive introspection."""
+         out_path = os.path.join(self._binary.tmpdir, 'dump.xml')
+ 
+         args = []
+-
+-        # Prepend the launcher command and arguments, if defined
+-        launcher = os.environ.get('GI_CROSS_LAUNCHER')
+-        if launcher:
+-            args.extend(launcher.split())
+-
+         args.extend(self._binary.args)
+         args.append('--introspect-dump=%s,%s' % (in_path, out_path))
+ 
+-- 
+2.7.0
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-add-host-gi-gi-cross-wrapper-and-gi-ldd.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
similarity index 95%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-add-host-gi-gi-cross-wrapper-and-gi-ldd.patch
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
index 6afefab..48a0c85 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-add-host-gi-gi-cross-wrapper-and-gi-ldd.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
@@ -1,8 +1,8 @@
-From c6e4f83c373b577166a7e46130ce8ff025ee8515 Mon Sep 17 00:00:00 2001
+From b1503fe2693d602b3e24e4b832dc0934960d5d22 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Oct 2015 18:29:21 +0300
-Subject: [PATCH] configure.ac: add host-gi, gi-cross-wrapper, gi-ldd-wrapper
- and introspection-data options
+Subject: [PATCH 2/5] configure.ac: add host-gi, gi-cross-wrapper,
+ gi-ldd-wrapper and introspection-data options
 
 With the first option, gobject-introspection tools (g-ir-doc-tool and g-ir-scanner)
 that are already installed in the host system will be used for building the source tree.
@@ -25,7 +25,6 @@ These options are useful when cross-compiling for a different target architectur
 
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile.am       |  2 ++
  common.mk         | 39 +++++++++++++++++++++++++++++++++++++++
@@ -34,7 +33,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 87 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 437c673..1eb3545 100644
+index b080a89..ce8d29b 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -21,7 +21,9 @@ include Makefile-cmph.am
@@ -132,10 +131,10 @@ index e26c637..9f3a65f 100644
  INTROSPECTION_DOCTOOL_ARGS = \
      --add-include-path=$(srcdir) \
 diff --git a/configure.ac b/configure.ac
-index b11596b..d78ae52 100644
+index 6c91fa5..21340a5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -347,6 +347,48 @@ fi
+@@ -360,6 +360,48 @@ fi
  
  AC_SUBST(EXTRA_LINK_FLAGS)
  
@@ -200,5 +199,5 @@ index bdd0fa7..75dd3c9 100644
  EXTRA_DIST=
  BUILT_SOURCES=
 -- 
-2.6.2
+2.7.0
 
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
similarity index 88%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
index e1241a9..b0d098c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
@@ -1,7 +1,7 @@
-From 2322f36056265f809aaffb74fcf5ac0c83129752 Mon Sep 17 00:00:00 2001
+From 704b888d0abfb01067352c40156f49f655691c7c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Oct 2015 18:26:40 +0300
-Subject: [PATCH 2/4] giscanner: add --use-binary-wrapper option
+Subject: [PATCH 3/5] giscanner: add --use-binary-wrapper option
 
 With this option, giscanner will use a wrapper executable to run
 binaries it's producing, instead of running them directly. This
@@ -10,16 +10,15 @@ but they can be run using for example QEMU emulation.
 
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  giscanner/scannermain.py | 14 ++++++++++++++
  1 file changed, 14 insertions(+)
 
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index b36284d..e37d3e3 100755
+index 633496f..d684cd0 100755
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
-@@ -118,6 +118,9 @@ def _get_option_parser():
+@@ -124,6 +124,9 @@ def _get_option_parser():
      parser.add_option("", "--program",
                        action="store", dest="program", default=None,
                        help="program to execute")
@@ -29,7 +28,7 @@ index b36284d..e37d3e3 100755
      parser.add_option("", "--program-arg",
                        action="append", dest="program_args", default=[],
                        help="extra arguments to program")
-@@ -406,6 +409,17 @@ def create_binary(transformer, options, args):
+@@ -419,6 +422,17 @@ def create_binary(transformer, options, args):
                                                gdump_parser.get_error_quark_functions())
  
      shlibs = resolve_shlibs(options, binary, options.libraries)
@@ -48,5 +47,5 @@ index b36284d..e37d3e3 100755
      gdump_parser.parse()
      return shlibs
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
similarity index 85%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
index f923dcc..afb71e7 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
@@ -1,24 +1,23 @@
-From 291a92f200981a772b2d03739dffb5926a82c5a5 Mon Sep 17 00:00:00 2001
+From d4ad57fd4a32c4f0d2f0522a3090ef940746431b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Oct 2015 16:28:46 +0200
-Subject: [PATCH 1/2] giscanner: add a --use-ldd-wrapper option
+Subject: [PATCH 4/5] giscanner: add a --use-ldd-wrapper option
 
 This is useful in cross-compile environments where system's ldd
 command does not work on binaries built for a different architecture
 
 Upstream-Status: Pending [review in oe-core]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  giscanner/scannermain.py | 3 +++
  giscanner/shlibs.py      | 4 +++-
  2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index e37d3e3..b8fff5f 100755
+index d684cd0..1b3b369 100755
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
-@@ -121,6 +121,9 @@ def _get_option_parser():
+@@ -127,6 +127,9 @@ def _get_option_parser():
      parser.add_option("", "--use-binary-wrapper",
                        action="store", dest="wrapper", default=None,
                        help="wrapper to use for running programs (useful when cross-compiling)")
@@ -29,10 +28,10 @@ index e37d3e3..b8fff5f 100755
                        action="append", dest="program_args", default=[],
                        help="extra arguments to program")
 diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index 1ad75ee..41117c6 100644
+index c93d20c..c5b5942 100644
 --- a/giscanner/shlibs.py
 +++ b/giscanner/shlibs.py
-@@ -100,7 +100,9 @@ def _resolve_non_libtool(options, binary, libraries):
+@@ -105,7 +105,9 @@ def _resolve_non_libtool(options, binary, libraries):
              args.extend(libtool)
              args.append('--mode=execute')
          platform_system = platform.system()
@@ -44,5 +43,5 @@ index 1ad75ee..41117c6 100644
          else:
              args.extend(['ldd', binary.args[0]])
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
similarity index 91%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
index 5026d81..47a18ec 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
@@ -1,7 +1,7 @@
-From a57604e205e6535acd9989444ad1f5f5038f4fba Mon Sep 17 00:00:00 2001
+From e08b3677dd04d6ec407ba8f74f601b2d51310eff Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 8 Oct 2015 18:30:35 +0300
-Subject: [PATCH 1/4] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
+Subject: [PATCH 5/5] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
  environment variable
 
 This environment variable sets the location of sysroot directory in cross-compilation
@@ -9,14 +9,13 @@ environments; if the variable is not set, the prefix will be empty.
 
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile-gir.am     | 18 +++++++++---------
  m4/introspection.m4 |  8 ++++----
  2 files changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/Makefile-gir.am b/Makefile-gir.am
-index 9aca664..09b9360 100644
+index a09260a..ba6e89e 100644
 --- a/Makefile-gir.am
 +++ b/Makefile-gir.am
 @@ -55,8 +55,8 @@ else
@@ -64,11 +63,11 @@ index 9aca664..09b9360 100644
  GIO_LIBRARY=gio-2.0
  
  if HAVE_GIO_UNIX
--GIO_UNIX_HDRS=$(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0/gio/*.h
-+GIO_UNIX_HDRS=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0/gio/*.h
+-GIO_UNIX_INCLUDEDIR = $(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0
++GIO_UNIX_INCLUDEDIR = $(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0
+ GIO_UNIX_HDRS = $(GIO_UNIX_INCLUDEDIR)/gio/*.h
  GIO_UNIX_PACKAGES = gio-unix-2.0
  else
- GIO_UNIX_HDRS=
 diff --git a/m4/introspection.m4 b/m4/introspection.m4
 index d89c3d9..b562266 100644
 --- a/m4/introspection.m4
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
similarity index 93%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
index 1937626..f368814 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
@@ -8,14 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
                     file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
                     file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.46/${BPN}-${PV}.tar.xz \
-           file://0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
-           file://0001-giscanner-add-use-binary-wrapper-option.patch \
-           file://0001-giscanner-add-a-use-ldd-wrapper-option.patch \
-           file://0001-configure.ac-add-host-gi-gi-cross-wrapper-and-gi-ldd.patch \
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.48/${BPN}-${PV}.tar.xz \
+           file://0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch \
+           file://0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch \
+           file://0003-giscanner-add-use-binary-wrapper-option.patch \
+           file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
+           file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            "
-SRC_URI[md5sum] = "adb40a31c7c80b65b0f4c8fd71b493dc"
-SRC_URI[sha256sum] = "6658bd3c2b8813eb3e2511ee153238d09ace9d309e4574af27443d87423e4233"
+SRC_URI[md5sum] = "01301fa9019667d48e927353e08bc218"
+SRC_URI[sha256sum] = "fa275aaccdbfc91ec0bc9a6fd0562051acdba731e7d584b64a277fec60e75877"
 
 inherit autotools pkgconfig gtk-doc pythonnative qemu gobject-introspection-data
 BBCLASSEXTEND = "native"
-- 
2.8.1


