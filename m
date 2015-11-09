Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 41BDF7714D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:49:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917412"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:49:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:25 +0200
Message-Id: <38a1113a325d3dd207dcfb071f33d8e77b39b52d.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/29] gobject-introspection: add the recipe
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:02 -0000

The recipe has comments that explain what is going on and why.

Also, there are three patches necessary to make it work in Yocto cross-compilation environment;
they will be submitted upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch |  99 +++++++++++++
 ...01-giscanner-add-a-use-ldd-wrapper-option.patch |  48 +++++++
 ...1-giscanner-add-use-binary-wrapper-option.patch |  52 +++++++
 ...c-add-host-gi-and-gi-cross-wrapper-option.patch | 158 +++++++++++++++++++++
 .../gobject-introspection_1.44.0.bb                | 146 +++++++++++++++++++
 5 files changed, 503 insertions(+)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-and-gi-cross-wrapper-option.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection_1.44.0.bb

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
new file mode 100644
index 0000000..4c374bd
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
@@ -0,0 +1,99 @@
+From bf63d603cdd38c88b7981918263bc0c1ddac8144 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 8 Oct 2015 18:30:35 +0300
+Subject: [PATCH 1/4] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
+ environment variable
+
+This environment variable sets the location of sysroot directory in cross-compilation
+environments; if the variable is not set, the prefix will be empty.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ Makefile-gir.am     | 18 +++++++++---------
+ m4/introspection.m4 | 12 ++++++------
+ 2 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/Makefile-gir.am b/Makefile-gir.am
+index 9aca664..09b9360 100644
+--- a/Makefile-gir.am
++++ b/Makefile-gir.am
+@@ -55,8 +55,8 @@ else
+ endif
+ 
+ # glib
+-GLIB_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir glib-2.0)/glib-2.0
+-GLIB_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir glib-2.0)
++GLIB_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir glib-2.0)/glib-2.0
++GLIB_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir glib-2.0)
+ 
+ GLIB_LIBRARY=glib-2.0
+ 
+@@ -92,8 +92,8 @@ GLib-2.0.gir: g-ir-scanner g-ir-compiler$(EXEEXT)
+ gir/DBusGLib-1.0.typelib: GObject-2.0.gir
+ 
+ # gobject
+-GOBJECT_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gobject-2.0)/glib-2.0
+-GOBJECT_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gobject-2.0)
++GOBJECT_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gobject-2.0)/glib-2.0
++GOBJECT_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gobject-2.0)
+ 
+ GOBJECT_LIBRARY=gobject-2.0
+ 
+@@ -120,8 +120,8 @@ GObject_2_0_gir_FILES = \
+ BUILT_GIRSOURCES += GObject-2.0.gir
+ 
+ # gmodule
+-GMODULE_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gmodule-2.0)/glib-2.0
+-GMODULE_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gmodule-2.0)
++GMODULE_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gmodule-2.0)/glib-2.0
++GMODULE_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gmodule-2.0)
+ 
+ GMODULE_LIBRARY=gmodule-2.0
+ 
+@@ -146,13 +146,13 @@ GModule_2_0_gir_FILES = $(GLIB_INCLUDEDIR)/gmodule.h \
+ BUILT_GIRSOURCES += GModule-2.0.gir
+ 
+ # gio
+-GIO_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gio-2.0)/glib-2.0
+-GIO_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gio-2.0)
++GIO_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-2.0)/glib-2.0
++GIO_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gio-2.0)
+ 
+ GIO_LIBRARY=gio-2.0
+ 
+ if HAVE_GIO_UNIX
+-GIO_UNIX_HDRS=$(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0/gio/*.h
++GIO_UNIX_HDRS=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0/gio/*.h
+ GIO_UNIX_PACKAGES = gio-unix-2.0
+ else
+ GIO_UNIX_HDRS=
+diff --git a/m4/introspection.m4 b/m4/introspection.m4
+index d89c3d9..d2c60de 100644
+--- a/m4/introspection.m4
++++ b/m4/introspection.m4
+@@ -56,14 +56,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
+     INTROSPECTION_GIRDIR=
+     INTROSPECTION_TYPELIBDIR=
+     if test "x$found_introspection" = "xyes"; then
+-       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+-       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+-       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
++       INTROSPECTION_GIRDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
++       INTROSPECTION_TYPELIBDIR=$PKG_CONFIG_SYSROOT_DIR"$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
+        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+        INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
++       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+     fi
+     AC_SUBST(INTROSPECTION_SCANNER)
+     AC_SUBST(INTROSPECTION_COMPILER)
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch
new file mode 100644
index 0000000..f923dcc
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch
@@ -0,0 +1,48 @@
+From 291a92f200981a772b2d03739dffb5926a82c5a5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Oct 2015 16:28:46 +0200
+Subject: [PATCH 1/2] giscanner: add a --use-ldd-wrapper option
+
+This is useful in cross-compile environments where system's ldd
+command does not work on binaries built for a different architecture
+
+Upstream-Status: Pending [review in oe-core]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ giscanner/scannermain.py | 3 +++
+ giscanner/shlibs.py      | 4 +++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
+index e37d3e3..b8fff5f 100755
+--- a/giscanner/scannermain.py
++++ b/giscanner/scannermain.py
+@@ -121,6 +121,9 @@ def _get_option_parser():
+     parser.add_option("", "--use-binary-wrapper",
+                       action="store", dest="wrapper", default=None,
+                       help="wrapper to use for running programs (useful when cross-compiling)")
++    parser.add_option("", "--use-ldd-wrapper",
++                      action="store", dest="ldd_wrapper", default=None,
++                      help="wrapper to use instead of ldd (useful when cross-compiling)")
+     parser.add_option("", "--program-arg",
+                       action="append", dest="program_args", default=[],
+                       help="extra arguments to program")
+diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
+index 1ad75ee..41117c6 100644
+--- a/giscanner/shlibs.py
++++ b/giscanner/shlibs.py
+@@ -100,7 +100,9 @@ def _resolve_non_libtool(options, binary, libraries):
+             args.extend(libtool)
+             args.append('--mode=execute')
+         platform_system = platform.system()
+-        if platform_system == 'Darwin':
++        if options.ldd_wrapper:
++            args.extend([options.ldd_wrapper, binary.args[0]])
++        elif platform_system == 'Darwin':
+             args.extend(['otool', '-L', binary.args[0]])
+         else:
+             args.extend(['ldd', binary.args[0]])
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch
new file mode 100644
index 0000000..e1241a9
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch
@@ -0,0 +1,52 @@
+From 2322f36056265f809aaffb74fcf5ac0c83129752 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 19 Oct 2015 18:26:40 +0300
+Subject: [PATCH 2/4] giscanner: add --use-binary-wrapper option
+
+With this option, giscanner will use a wrapper executable to run
+binaries it's producing, instead of running them directly. This
+is useful when binaries are cross-compiled and cannot be run directly,
+but they can be run using for example QEMU emulation.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ giscanner/scannermain.py | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
+index b36284d..e37d3e3 100755
+--- a/giscanner/scannermain.py
++++ b/giscanner/scannermain.py
+@@ -118,6 +118,9 @@ def _get_option_parser():
+     parser.add_option("", "--program",
+                       action="store", dest="program", default=None,
+                       help="program to execute")
++    parser.add_option("", "--use-binary-wrapper",
++                      action="store", dest="wrapper", default=None,
++                      help="wrapper to use for running programs (useful when cross-compiling)")
+     parser.add_option("", "--program-arg",
+                       action="append", dest="program_args", default=[],
+                       help="extra arguments to program")
+@@ -406,6 +409,17 @@ def create_binary(transformer, options, args):
+                                               gdump_parser.get_error_quark_functions())
+ 
+     shlibs = resolve_shlibs(options, binary, options.libraries)
++    if options.wrapper:
++        # The wrapper needs the binary itself, not the libtool wrapper script,
++        # so we check if libtool has sneaked the binary into .libs subdirectory
++        # and adjust the path accordingly
++	import os.path
++        dir_name, binary_name  = os.path.split(binary.args[0])
++        libtool_binary = os.path.join(dir_name, '.libs', binary_name)
++        if os.path.exists(libtool_binary):
++	    binary.args[0] = libtool_binary
++	# Then prepend the wrapper to the command line to execute
++        binary.args = [options.wrapper] + binary.args
+     gdump_parser.set_introspection_binary(binary)
+     gdump_parser.parse()
+     return shlibs
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-and-gi-cross-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-and-gi-cross-wrapper-option.patch
new file mode 100644
index 0000000..0a62bff
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-and-gi-cross-wrapper-option.patch
@@ -0,0 +1,158 @@
+From dc6e9cd73b68baa6d572b0a65df842f2d9fbe285 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 19 Oct 2015 18:29:21 +0300
+Subject: [PATCH 2/2] configure.ac: add host-gi, gi-cross-wrapper and
+ gi-ldd-wrapper options
+
+With the first option, gobject-introspection tools (g-ir-doc-tool and g-ir-scanner)
+that are already installed in the host system will be used for building the source tree.
+
+With the second option, g-ir-scanner will be instructed to use an executable
+wrapper to run binaries it's producing, and g-ir-compiler will be run
+through the same wrapper (host system's g-ir-compiler cannot be used because
+it's producing architecture-specific output).
+
+With the third option, giscanner will be instructed to use a special ldd
+command instead of system's ldd (which does not work when the binary to inspect
+is compiled for a different architecture).
+
+These options are useful when cross-compiling for a different target architecture.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ common.mk    | 39 +++++++++++++++++++++++++++++++++++++++
+ configure.ac | 33 +++++++++++++++++++++++++++++++++
+ 2 files changed, 72 insertions(+)
+
+diff --git a/common.mk b/common.mk
+index 303622f..d556655 100644
+--- a/common.mk
++++ b/common.mk
+@@ -6,6 +6,15 @@
+ # module itself.
+ #
+ 
++if USE_HOST_GI
++INTROSPECTION_SCANNER = \
++    env PATH="$(PATH)" \
++        LPATH=.libs \
++        CC="$(CC)" \
++        PYTHONPATH=$(top_builddir):$(top_srcdir) \
++        UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
++        g-ir-scanner
++else
+ INTROSPECTION_SCANNER = \
+     env PATH=".libs:$(PATH)" \
+         LPATH=.libs \
+@@ -14,18 +23,39 @@ INTROSPECTION_SCANNER = \
+         UNINSTALLED_INTROSPECTION_SRCDIR=$(top_srcdir) \
+         UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
+         $(top_builddir)/g-ir-scanner
++endif
++
++if USE_CROSS_WRAPPER
++CROSS_WRAPPER_ARG = --use-binary-wrapper=$(GI_CROSS_WRAPPER)
++else
++CROSS_WRAPPER_ARG =
++endif
++
++if USE_LDD_WRAPPER
++LDD_WRAPPER_ARG = --use-ldd-wrapper=$(GI_LDD_WRAPPER)
++else
++LDD_WRAPPER_ARG =
++endif
+ 
+ INTROSPECTION_SCANNER_ARGS = \
+     --verbose \
++    $(CROSS_WRAPPER_ARG) \
++    $(LDD_WRAPPER_ARG) \
+     -I$(top_srcdir) \
+     --add-include-path=$(srcdir) \
+     --add-include-path=$(top_srcdir)/gir \
+     --add-include-path=$(builddir) \
+     --add-include-path=$(top_builddir)
+ 
++if USE_CROSS_WRAPPER
++INTROSPECTION_COMPILER = \
++    env PATH=".libs:$(PATH)" \
++        $(GI_CROSS_WRAPPER) $(top_builddir)/.libs/g-ir-compiler$(EXEEXT)
++else
+ INTROSPECTION_COMPILER = \
+     env PATH=".libs:$(PATH)" \
+         $(top_builddir)/g-ir-compiler$(EXEEXT)
++endif
+ 
+ INTROSPECTION_COMPILER_ARGS = \
+     --includedir=$(srcdir) \
+@@ -33,6 +63,14 @@ INTROSPECTION_COMPILER_ARGS = \
+     --includedir=$(builddir) \
+     --includedir=$(top_builddir)
+ 
++if USE_HOST_GI
++INTROSPECTION_DOCTOOL = \
++    env PATH="$(PATH)" \
++        LPATH=.libs \
++        PYTHONPATH=$(top_builddir):$(top_srcdir) \
++        UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
++        g-ir-doc-tool
++else
+ INTROSPECTION_DOCTOOL = \
+     env PATH=".libs:$(PATH)" \
+         LPATH=.libs \
+@@ -40,6 +78,7 @@ INTROSPECTION_DOCTOOL = \
+         UNINSTALLED_INTROSPECTION_SRCDIR=$(top_srcdir) \
+         UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
+         $(top_builddir)/g-ir-doc-tool
++endif
+ 
+ INTROSPECTION_DOCTOOL_ARGS = \
+     --add-include-path=$(srcdir) \
+diff --git a/configure.ac b/configure.ac
+index de3edcc..8e4c5f5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -347,6 +347,39 @@ fi
+ 
+ AC_SUBST(EXTRA_LINK_FLAGS)
+ 
++AC_ARG_ENABLE([host-gi],
++[AS_HELP_STRING([--enable-host-gi],[Use gobject introspection tools installed in the host system (useful when cross-compiling)])],
++[case "${enableval}" in
++  yes) host_gi=true ;;
++  no)  host_gi=false ;;
++  *) AC_MSG_ERROR([bad value ${enableval} for --enable-host-gi]) ;;
++esac],[host_gi=false])
++AM_CONDITIONAL([USE_HOST_GI], [test x$host_gi = xtrue])
++
++AC_ARG_ENABLE([gi-cross-wrapper],
++[AS_HELP_STRING([--enable-gi-cross-wrapper=path],[Use a wrapper to run gicompiler and binaries produced by giscanner (useful when cross-compiling)])],
++[
++GI_CROSS_WRAPPER="${enableval}"
++use_wrapper=true
++],[
++GI_CROSS_WRAPPER=""
++use_wrapper=false
++])
++AC_SUBST(GI_CROSS_WRAPPER)
++AM_CONDITIONAL([USE_CROSS_WRAPPER], [test x$use_wrapper = xtrue])
++
++AC_ARG_ENABLE([gi-ldd-wrapper],
++[AS_HELP_STRING([--enable-gi-ldd-wrapper=path],[Use a ldd wrapper instead of system's ldd command in giscanner (useful when cross-compiling)])],
++[
++GI_LDD_WRAPPER="${enableval}"
++use_ldd_wrapper=true
++],[
++GI_LDD_WRAPPER=""
++use_ldd_wrapper=false
++])
++AC_SUBST(GI_LDD_WRAPPER)
++AM_CONDITIONAL([USE_LDD_WRAPPER], [test x$use_ldd_wrapper = xtrue])
++
+ AC_CONFIG_FILES([
+ Makefile
+ tests/Makefile
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.44.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.44.0.bb
new file mode 100644
index 0000000..7ff6140
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.44.0.bb
@@ -0,0 +1,146 @@
+HOMEPAGE = "http://gnome.org"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "libs"
+LICENSE = "LGPLv2+ & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
+                    file://tools/compiler.c;endline=20;md5=fc5007fc20022720e6c0b0cdde41fabd \
+                    file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
+                    file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.44/${BPN}-${PV}.tar.xz \
+           file://0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
+           file://0001-giscanner-add-use-binary-wrapper-option.patch \
+           file://0002-configure.ac-add-host-gi-and-gi-cross-wrapper-option.patch \
+           file://0001-giscanner-add-a-use-ldd-wrapper-option.patch \
+           "
+SRC_URI[md5sum] = "7ef8a1db7f74f4193a2397b1587eb913"
+SRC_URI[sha256sum] = "6f0c2c28aeaa37b5037acbf21558098c4f95029b666db755d3a12c2f1e1627ad"
+
+inherit autotools pkgconfig gtk-doc pythonnative qemu
+BBCLASSEXTEND = "native"
+
+# necessary to let the call for python-config from configure.ac succeed
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# needed for writing out the qemu wrapper script
+export STAGING_DIR_HOST
+export B
+
+DEPENDS_append = " libffi zlib glib-2.0"
+
+# target build needs qemu to run temporary introspection binaries created
+# on the fly by g-ir-scanner and a native version of itself to run
+# native versions of its own tools during build.
+DEPENDS_class-target_append = " gobject-introspection-native qemu-native"
+
+do_configure_prepend_class-target() {
+        # Write out a qemu wrapper that will be given to gi-scanner so that it
+        # can run target helper binaries through that.
+        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/lib','$STAGING_DIR_HOST/usr/lib'])}"
+        cat > ${B}/g-ir-scanner-qemuwrapper << EOF
+#!/bin/sh
+$qemu_binary "\$@"
+if [ \$? -ne 0 ]; then
+    echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the recipe should help."
+    echo "(typically like this: GIR_EXTRA_LIBS_PATH=\\\$B/something/.libs)"
+    exit 1
+fi
+EOF
+        chmod +x ${B}/g-ir-scanner-qemuwrapper
+
+        # Write out a wrapper for g-ir-scanner itself, which will be used when building introspection files
+        # for glib-based packages. This wrapper calls the native version of the scanner, and tells it to use
+        # a qemu wrapper for running transient target binaries produced by the scanner, and an include directory 
+        # from the target sysroot.
+        cat > ${B}/g-ir-scanner-wrapper << EOF
+#!/bin/sh
+# This prevents g-ir-scanner from writing cache data to $HOME
+export GI_SCANNER_DISABLE_CACHE=1
+
+${STAGING_BINDIR_NATIVE}/g-ir-scanner --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 "\$@"
+EOF
+        chmod +x ${B}/g-ir-scanner-wrapper
+
+        # Write out a wrapper for g-ir-compiler, which runs the target version of it through qemu.
+        # g-ir-compiler writes out the raw content of a C struct to disk, and therefore is architecture dependent.
+        cat > ${B}/g-ir-compiler-wrapper << EOF
+#!/bin/sh
+${STAGING_BINDIR}/g-ir-scanner-qemuwrapper ${STAGING_BINDIR}/g-ir-compiler "\$@"
+EOF
+        chmod +x ${B}/g-ir-compiler-wrapper
+
+        # Write out a wrapper to use instead of ldd, which does not work when a binary is built
+        # for a different architecture
+        cat > ${B}/g-ir-scanner-lddwrapper << EOF
+#!/bin/sh
+prelink-rtld --root=$STAGING_DIR_HOST "\$@"
+EOF
+        chmod +x ${B}/g-ir-scanner-lddwrapper
+
+        # Also tweak the target python scripts so that they don't refer to the
+        # native version of python binary (the solution is taken from glib-2.0 recipe)
+        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/tools/g-ir-scanner.in
+        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/tools/g-ir-doc-tool.in
+        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/tools/g-ir-annotation-tool.in
+}
+
+# Configure target build to use native tools of itself and to use a qemu wrapper
+EXTRA_OECONF_class-target += "--enable-host-gi \
+                              --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
+                              --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
+                             "
+
+
+do_compile_prepend_class-target() {
+        # This prevents g-ir-scanner from writing cache data to $HOME
+        export GI_SCANNER_DISABLE_CACHE=1
+
+        # Needed to run g-ir unit tests, which won't be able to find the built libraries otherwise
+        export GIR_EXTRA_LIBS_PATH=$B/.libs
+}
+
+# Our wrappers need to be available system-wide, because they will be used 
+# to build introspection files for all other gobject-based packages
+do_install_append_class-target() {
+        install -d ${D}${bindir}/
+        install ${B}/g-ir-scanner-qemuwrapper ${D}${bindir}/
+        install ${B}/g-ir-scanner-wrapper ${D}${bindir}/
+        install ${B}/g-ir-compiler-wrapper ${D}${bindir}/
+        install ${B}/g-ir-scanner-lddwrapper ${D}${bindir}/
+}
+
+# These are used by gobject-based packages
+FILES_${PN}_append = " ${datadir}/gobject-introspection-1.0/gdump.c \
+               ${datadir}/gobject-introspection-1.0/Makefile.introspection"
+
+# .typelib files are needed at runtime and so they go to the main package
+FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
+
+# .gir files go to dev package, as they're needed for developing (but not for running)
+# things that depends on introspection.
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+
+# No idea why these sources are installed by upstream and how they are meant to be used
+FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
+                   ${datadir}/gobject-introspection-1.0/tests/*.h"
+
+FILES_${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
+FILES_${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
+
+# we need target versions of introspection tools in sysroot so that they can be run via qemu
+# when building introspection files in other packages
+SYSROOT_PREPROCESS_FUNCS_append_class-target += "gi_binaries_sysroot_preprocess"
+
+gi_binaries_sysroot_preprocess() {
+        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
+
+        # Also, tweak the binary names in introspection pkgconfig file, so that it picks up our 
+        # wrappers which do the cross-compile and qemu magic.
+        sed -i \
+           -e "s|g_ir_scanner=.*|g_ir_scanner=${bindir}/g-ir-scanner-wrapper|" \
+           -e "s|g_ir_compiler=.*|g_ir_compiler=${bindir}/g-ir-compiler-wrapper|" \
+           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/gobject-introspection-1.0.pc
+}
-- 
2.1.4


