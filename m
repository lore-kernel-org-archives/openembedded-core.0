Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgDig-0004eA-HC
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 12:28:06 +0200
Received: by wwi14 with SMTP id 14so2049904wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 03:24:10 -0700 (PDT)
Received: by 10.216.62.203 with SMTP id y53mr3906871wec.108.1310379850311;
	Mon, 11 Jul 2011 03:24:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n17sm5467350wed.16.2011.07.11.03.24.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 03:24:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 12:24:02 +0200
Message-Id: <1310379842-14951-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC] webkit-gtk: update SRCREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2011 10:28:06 -0000

The layout of the repository has changed, so we need to account for that:

* fixed license checksums
* fixed SRC_URI
* fixed SRCREV_FORMAT

PCRE is gone, so no need for the dftables hack anymore

But most importantly, this fixes the crash issues when using javascript (e.g. github.com)

Tested on:

* usrp-e1xx/angstrom-2011.07

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-sato/webkit/files/GNUmakefile.am   |  107 +++---
 meta/recipes-sato/webkit/files/Makefile         |    2 +-
 meta/recipes-sato/webkit/files/Makefile.shared  |    2 +-
 meta/recipes-sato/webkit/files/autogen.sh       |   51 +---
 meta/recipes-sato/webkit/files/configure.ac     |  451 ++++++++++++++++++-----
 meta/recipes-sato/webkit/files/update-webkit.sh |    8 +
 meta/recipes-sato/webkit/webkit-gtk_svn.bb      |   53 +--
 7 files changed, 454 insertions(+), 220 deletions(-)
 create mode 100755 meta/recipes-sato/webkit/files/update-webkit.sh

diff --git a/meta/recipes-sato/webkit/files/GNUmakefile.am b/meta/recipes-sato/webkit/files/GNUmakefile.am
index 8884fcb..fb10790 100644
--- a/meta/recipes-sato/webkit/files/GNUmakefile.am
+++ b/meta/recipes-sato/webkit/files/GNUmakefile.am
@@ -34,10 +34,12 @@ GENSOURCES := $(top_builddir)/DerivedSources
 GENSOURCES_JAVASCRIPTCORE := $(top_builddir)/DerivedSources/JavaScriptCore
 GENSOURCES_WEBCORE := $(top_builddir)/DerivedSources/WebCore
 GENSOURCES_WEBKIT := $(top_builddir)/DerivedSources/webkit
+GENSOURCES_WEBKIT2 := $(top_builddir)/DerivedSources/WebKit2
 GENPROGRAMS := $(top_builddir)/Programs
 GENSOURCES_INSPECTOR := $(GENPROGRAMS)/resources/inspector
-WebCore := $(srcdir)/WebCore
-WebKit := $(srcdir)/WebKit/gtk
+WebCore := $(srcdir)/Source/WebCore
+WebKit := $(srcdir)/Source/WebKit/gtk
+WebKit2 := $(srcdir)/Source/WebKit2
 
 # Libraries and support components
 bin_PROGRAMS :=
@@ -51,6 +53,7 @@ POFILES :=
 MOFILES :=
 javascriptcore_h_api :=
 javascriptcore_cppflags:=
+javascriptcore_cflags :=
 javascriptcore_sources :=
 javascriptcore_built_sources :=
 javascriptcore_built_nosources :=
@@ -69,6 +72,8 @@ webkitgtk_cppflags :=
 webkitgtk_gdom_built_sources :=
 webkitgtk_built_sources :=
 webkitgtk_built_nosources :=
+webkit2_built_sources :=
+libwebcoreinternals_built_sources :=
 global_cppflags :=
 global_cflags :=
 global_cxxflags :=
@@ -83,6 +88,21 @@ CLEANFILES :=
 DISTCLEANFILES :=
 MAINTAINERCLEANFILES :=
 
+# We do not care at all about this implicit built-in make rules,
+# disable them to save some build time
+%: %.c
+%: %.cpp
+%: %.o
+(%): %
+%.out: %
+%.c: %.w %.ch
+%.tex: %.w %.ch
+%:: %,v
+%:: RCS/%,v
+%:: RCS/%
+%:: s.%
+%:: SCCS/s.%
+
 global_cppflags += \
 	-Wall -W -Wcast-align -Wchar-subscripts -Wreturn-type \
 	-Wformat -Wformat-security -Wno-format-y2k -Wundef \
@@ -92,7 +112,6 @@ global_cppflags += \
 
 
 global_cxxflags += \
-	$(SYMBOL_VISIBILITY_INLINES) \
 	-fno-rtti
 
 # -no-undefined required for building DLLs on Windows
@@ -103,51 +122,21 @@ version_script = -export-symbols-regex "^(webkit_|k?JS).*"
 endif
 
 if OS_GNU
-version_script = -Wl,--version-script,$(srcdir)/autotools/symbols.filter
+version_script = -Wl,--version-script,$(srcdir)/Source/autotools/symbols.filter
 endif
 
-# Convenience libraries
-noinst_LTLIBRARIES += \
-	libJavaScriptCore.la
-
-nodist_EXTRA_libJavaScriptCore_la_SOURCES = \
-	$(javascriptcore_built_nosources)
-
-nodist_libJavaScriptCore_la_SOURCES = \
-	$(javascriptcore_built_sources)
-
-libJavaScriptCore_ladir = $(prefix)/include/webkit-@WEBKITGTK_API_VERSION@/JavaScriptCore
-libJavaScriptCore_la_HEADERS = $(javascriptcore_h_api)
-
-libJavaScriptCore_la_SOURCES = \
-	$(javascriptcore_sources)
-
-libJavaScriptCore_la_LIBADD = \
-	$(UNICODE_LIBS) \
-	$(GLIB_LIBS) \
-	-lpthread
-
-libJavaScriptCore_la_CXXFLAGS = \
-	$(global_cxxflags) \
-	$(libJavaScriptCore_la_CFLAGS)
-
-libJavaScriptCore_la_CFLAGS = \
-	-fstrict-aliasing \
-	-O3 \
-	$(global_cflags) \
-	$(GLIB_CFLAGS) \
-	$(UNICODE_CFLAGS)
-
-libJavaScriptCore_la_CPPFLAGS = \
-	$(global_cppflags) \
-	$(javascriptcore_cppflags)
-
 # Extra checks and flags
 global_cppflags += \
 	-DBUILDING_CAIRO__=1 \
 	-DBUILDING_GTK__=1 \
 	-DWTF_CHANGES
 
+# For the Gtk port we want to use XP_UNIX both in X11 and Mac
+if !TARGET_WIN32
+global_cppflags += \
+	-DXP_UNIX
+endif
+
 if USE_ICU_UNICODE
 global_cppflags += \
 	-DWTF_USE_ICU_UNICODE=1
@@ -178,7 +167,6 @@ endif
 
 if !ENABLE_DEBUG
 global_cppflags += -DNDEBUG
-global_cflags += $(SYMBOL_VISIBILITY)
 else
 global_cppflags += \
 	-DG_DISABLE_DEPRECATED \
@@ -198,17 +186,26 @@ global_cppflags += \
 endif
 
 EXTRA_DIST += \
-	$(srcdir)/autotools/symbols.filter \
+	$(srcdir)/Source/autotools/symbols.filter \
 	$(srcdir)/gtk-doc.make \
-	$(srcdir)/WebKit/LICENSE
+	$(srcdir)/Source/WebKit/LICENSE
 
 # Include module makefiles
-include JavaScriptCore/GNUmakefile.am
-include WebCore/GNUmakefile.am
-include WebKit/gtk/GNUmakefile.am
-include WebCore/bindings/gobject/GNUmakefile.am
-include WebKitTools/GNUmakefile.am
-include WebKit/gtk/po/GNUmakefile.am
+include Source/JavaScriptCore/GNUmakefile.am
+include Source/WebCore/GNUmakefile.am
+include Source/WebKit/gtk/GNUmakefile.am
+include Source/WebCore/bindings/gobject/GNUmakefile.am
+include Tools/GNUmakefile.am
+include Source/WebKit/gtk/po/GNUmakefile.am
+include Tools/DumpRenderTree/gtk/GNUmakefile.ImageDiff.am
+
+if ENABLE_WEBKIT2
+include Source/WebKit2/GNUmakefile.am
+include Tools/MiniBrowser/gtk/GNUmakefile.am
+include Tools/WebKitTestRunner/GNUmakefile.am
+# [GTK] Refactor the translations now that we have webkit2
+# https://bugs.webkit.org/show_bug.cgi?id=55153
+endif
 
 # Autogenerated sources
 BUILT_SOURCES += \
@@ -229,11 +226,11 @@ MAINTAINERCLEANFILES += \
 	$(builddir)/doltcompile \
 	$(builddir)/doltlibtool \
 	$(srcdir)/aconfig.h.in \
-	$(srcdir)/autotools/config.* \
-	$(srcdir)/autotools/compile \
-	$(srcdir)/autotools/depcomp \
-	$(srcdir)/autotools/install-sh \
-	$(srcdir)/autotools/missing \
+	$(srcdir)/Source/autotools/config.* \
+	$(srcdir)/Source/autotools/compile \
+	$(srcdir)/Source/autotools/depcomp \
+	$(srcdir)/Source/autotools/install-sh \
+	$(srcdir)/Source/autotools/missing \
 	$(srcdir)/configure \
 	$(srcdir)/GNUmakefile.in \
 	$(srcdir)/INSTALL \
@@ -242,7 +239,7 @@ MAINTAINERCLEANFILES += \
 
 # Older automake versions (1.7) place Plo files in a different place so we need
 # to create the output directory manually.
-all-local:
+all-local: stamp-po
 	$(mkdir_p) $(top_builddir)/$(DEPDIR)/DerivedSources
 
 # remove built sources and program directories
diff --git a/meta/recipes-sato/webkit/files/Makefile b/meta/recipes-sato/webkit/files/Makefile
index cdee9da..065f88f 100644
--- a/meta/recipes-sato/webkit/files/Makefile
+++ b/meta/recipes-sato/webkit/files/Makefile
@@ -1,4 +1,4 @@
-MODULES = JavaScriptCore JavaScriptGlue ANGLE WebCore WebKit WebKit2 WebKitTools 
+MODULES = Source/JavaScriptCore Source/JavaScriptGlue Source/ThirdParty/ANGLE Source/WebCore Source/WebKit Source/WebKit2 Tools 
 
 all:
 	@for dir in $(MODULES); do ${MAKE} $@ -C $$dir; exit_status=$$?; \
diff --git a/meta/recipes-sato/webkit/files/Makefile.shared b/meta/recipes-sato/webkit/files/Makefile.shared
index aa9fa72..56ed978 100644
--- a/meta/recipes-sato/webkit/files/Makefile.shared
+++ b/meta/recipes-sato/webkit/files/Makefile.shared
@@ -1,4 +1,4 @@
-SCRIPTS_PATH ?= ../WebKitTools/Scripts
+SCRIPTS_PATH ?= ../Tools/Scripts
 XCODE_OPTIONS = `perl -I$(SCRIPTS_PATH) -Mwebkitdirs -e 'print XcodeOptionString()'` $(ARGS)
 
 all:
diff --git a/meta/recipes-sato/webkit/files/autogen.sh b/meta/recipes-sato/webkit/files/autogen.sh
index 60b163d..23639e8 100755
--- a/meta/recipes-sato/webkit/files/autogen.sh
+++ b/meta/recipes-sato/webkit/files/autogen.sh
@@ -8,55 +8,16 @@ test -z "$srcdir" && srcdir=.
 ORIGDIR=`pwd`
 cd $srcdir
 
-GTKDOCIZE_FLAGS="--copy"
-LIBTOOLIZE_FLAGS="--force --automake"
-ACLOCAL_FLAGS="-I autotools $ACLOCAL_FLAGS"
-AUTOMAKE_FLAGS="--foreign --add-missing"
+rm -f $top_srcdir/autom4te.cache
 
-DIE=0
-
-(autoconf --version) < /dev/null > /dev/null 2>&1 || {
-    echo
-    echo "You must have autoconf installed to compile $PROJECT."
-    echo "Install the appropriate package for your distribution,"
-    echo "or get the source tarball at http://ftp.gnu.org/gnu/autoconf/"
-    DIE=1
-}
-
-(automake --version) < /dev/null > /dev/null 2>&1 || {
-    echo
-    echo "You must have automake installed to compile $PROJECT."
-    echo "Install the appropriate package for your distribution,"
-    echo "or get the source tarball at http://ftp.gnu.org/gnu/automake/"
-    DIE=1
-}
-
-LIBTOOLIZE=libtoolize
-($LIBTOOLIZE --version) < /dev/null > /dev/null 2>&1 || {
-    LIBTOOLIZE=glibtoolize
-    ($LIBTOOLIZE --version) < /dev/null > /dev/null 2>&1 || {
-        echo
-        echo "You must have libtool installed to compile $PROJECT."
-        echo "Install the appropriate package for your distribution,"
-        echo "or get the source tarball at http://ftp.gnu.org/gnu/libtool/"
-        DIE=1
-    }
-}
+touch README INSTALL
 
-if test "$DIE" -eq 1; then
+gtkdocize --copy > /dev/null 2>&1 || echo "Warning: not running gtk-docize."
+if test -z `which autoreconf`; then
+    echo "Error: autoreconf not found, please install it."
     exit 1
 fi
-
-rm -rf $top_srcdir/autom4te.cache
-
-touch README INSTALL
-
-gtkdocize $GTKDOCIZE_FLAGS > /dev/null 2>&1 || echo "Warning: not running gtk-docize."
-aclocal $ACLOCAL_FLAGS || exit $?
-$LIBTOOLIZE $LIBTOOLIZE_FLAGS || exit $?
-autoheader || exit $?
-automake $AUTOMAKE_FLAGS || exit $?
-autoconf || exit $?
+autoreconf --verbose --install -I Source/autotools $ACLOCAL_FLAGS|| exit $?
 
 cd $ORIGDIR || exit 1
 
diff --git a/meta/recipes-sato/webkit/files/configure.ac b/meta/recipes-sato/webkit/files/configure.ac
index bb703b4..9d8ad90 100644
--- a/meta/recipes-sato/webkit/files/configure.ac
+++ b/meta/recipes-sato/webkit/files/configure.ac
@@ -1,21 +1,21 @@
 AC_PREREQ(2.59)
 
 m4_define([webkit_major_version], [1])
-m4_define([webkit_minor_version], [3])
-m4_define([webkit_micro_version], [7])
+m4_define([webkit_minor_version], [5])
+m4_define([webkit_micro_version], [1])
 
 # This is the version we'll be using as part of our User-Agent string
 # e.g., AppleWebKit/$(webkit_user_agent_version) ...
 #
-# Sourced from WebCore/Configurations/Version.xcconfig
+# Sourced from Source/WebCore/Configurations/Version.xcconfig
 m4_define([webkit_user_agent_major_version], [534])
-m4_define([webkit_user_agent_minor_version], [7])
+m4_define([webkit_user_agent_minor_version], [26])
 
 AC_INIT([WebKit],[webkit_major_version.webkit_minor_version.webkit_micro_version],[http://bugs.webkit.org/])
 
-AC_CONFIG_MACRO_DIR([autotools])
-AC_CONFIG_AUX_DIR([autotools])
-AC_SUBST(ACLOCAL_AMFLAGS, "-I autotools")
+AC_CONFIG_MACRO_DIR([Source/autotools])
+AC_CONFIG_AUX_DIR([Source/autotools])
+AC_SUBST(ACLOCAL_AMFLAGS, "-I Source/autotools")
 
 AC_CONFIG_HEADERS([autotoolsconfig.h])
 AC_CANONICAL_HOST
@@ -31,11 +31,11 @@ AC_SUBST(WEBKIT_MICRO_VERSION)
 AC_SUBST(WEBKIT_USER_AGENT_MAJOR_VERSION)
 AC_SUBST(WEBKIT_USER_AGENT_MINOR_VERSION)
 
-AC_CONFIG_SRCDIR([WebCore/config.h])
+AC_CONFIG_SRCDIR([Source/WebCore/config.h])
 
 dnl # Libtool library version, not to confuse with API version
 dnl # see http://www.gnu.org/software/libtool/manual/html_node/Libtool-versioning.html
-LIBWEBKITGTK_VERSION=4:0:4
+LIBWEBKITGTK_VERSION=8:0:8
 AC_SUBST([LIBWEBKITGTK_VERSION])
 
 AM_INIT_AUTOMAKE([foreign subdir-objects tar-ustar])
@@ -99,6 +99,13 @@ if test -z "$GPERF"; then
    AC_MSG_ERROR([You need the 'gperf' hash function generator to compile WebKit])
 fi
 
+# Disable C++0x compat warnings for GCC >= 4.6.0 until we build
+# cleanly with that.
+if test "$CXX" = "g++"; then
+   CXX_VERSION=`$CXX -dumpversion`
+   AX_COMPARE_VERSION([$CXX_VERSION],[ge],[4.6.0],CXXFLAGS="$CXXFLAGS -Wno-c++0x-compat")
+fi
+
 # pthread (not needed on Windows)
 if test "$os_win32" = "no"; then
 AC_CHECK_HEADERS([pthread.h],
@@ -199,14 +206,14 @@ case "$with_gtk" in
           GAIL_PC_NAME=gail
           GAIL_REQUIRED_VERSION=1.8
           ;;
-     3.0) GTK_REQUIRED_VERSION=2.91
+     3.0) GTK_REQUIRED_VERSION=3.0
           GTK_API_VERSION=3.0
           WEBKITGTK_API_MAJOR_VERSION=3
           WEBKITGTK_API_MINOR_VERSION=0
           WEBKITGTK_API_VERSION=3.0
           WEBKITGTK_PC_NAME=webkitgtk
           GAIL_PC_NAME=gail-3.0
-          GAIL_REQUIRED_VERSION=2.90.4
+          GAIL_REQUIRED_VERSION=3.0
           ;;
 esac
 
@@ -247,8 +254,8 @@ if test "$with_hildon" = "yes"; then
 fi
 
 # minimum base dependencies
-LIBSOUP_REQUIRED_VERSION=2.28.2
-CAIRO_REQUIRED_VERSION=1.6
+LIBSOUP_REQUIRED_VERSION=2.33.6
+CAIRO_REQUIRED_VERSION=1.10
 FONTCONFIG_REQUIRED_VERSION=2.4
 FREETYPE2_REQUIRED_VERSION=9.0
 LIBXML_REQUIRED_VERSION=2.6
@@ -271,16 +278,6 @@ ENCHANT_REQUIRED_VERSION=0.22
 # todo: webcore gtk
 WEBKIT_CHECK_DEPENDENCIES([glib unicode])
 
-# Check if we can use GSettings
-PKG_CHECK_MODULES([GSETTINGS],
-                  [gio-2.0 >= 2.25.0],
-                  [have_gsettings=yes],
-                  [have_gsettings=no])
-if test "$have_gsettings" = "yes"; then
-   AC_DEFINE([HAVE_GSETTINGS], 1, [Whether we can use GSettings])
-   GLIB_GSETTINGS
-fi
-
 GETTEXT_PACKAGE=$PACKAGE-$GTK_API_VERSION
 AC_SUBST(GETTEXT_PACKAGE)
 AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE",
@@ -296,9 +293,17 @@ PKG_CHECK_MODULES(PANGO,
 AC_SUBST(PANGO_CFLAGS)
 AC_SUBST(PANGO_LIBS)
 
-PKG_CHECK_MODULES(ENCHANT, enchant >= $ENCHANT_REQUIRED_VERSION)
+AC_MSG_CHECKING([whether to enable spellcheck support])
+AC_ARG_ENABLE([spellcheck],
+  [AS_HELP_STRING([--enable-spellcheck],[enable support for spellcheck])],
+  [],[enable_spellcheck="yes"])
+AC_MSG_RESULT([$enable_spellcheck])
+
+if test "$enable_spellcheck" = "yes"; then
+PKG_CHECK_MODULES(ENCHANT, enchant >= $ENCHANT_REQUIRED_VERSION, [], [enable_spellcheck="no"])
 AC_SUBST(ENCHANT_CFLAGS)
 AC_SUBST(ENCHANT_LIBS)
+fi
 
 PKG_CHECK_MODULES(GAIL, $GAIL_PC_NAME >= $GAIL_REQUIRED_VERSION)
 AC_SUBST(GAIL_CFLAGS)
@@ -357,13 +362,28 @@ AC_ARG_ENABLE(optimizations,
               [if test "$enable_debug" = "yes"; then enable_optimizations="no"; else enable_optimizations="yes"; fi])
 AC_MSG_RESULT([$enable_optimizations])
 
-# check whether to enable 3D transforms support
-AC_MSG_CHECKING([whether to enable support for 3D Transforms])
-AC_ARG_ENABLE(3D_transforms,
-              AC_HELP_STRING([--enable-3D-transforms],
-                             [enable support for 3D transforms [default=no]]),
-              [],[enable_3D_transforms="no"])
-AC_MSG_RESULT([$enable_3D_transforms])
+# check whether to enable 3D rendering support
+AC_MSG_CHECKING([whether to enable support for 3D Rendering])
+AC_ARG_ENABLE(3d_rendering,
+              AC_HELP_STRING([--enable-3d-rendering],
+                             [enable support for 3D Rendering (experimental) [default=no]]),
+              [],[enable_3d_rendering="no"])
+AC_MSG_RESULT([$enable_3d_rendering])
+
+# check whether to enable WebGL support
+AC_MSG_CHECKING([whether to enable WebGL support])
+AC_ARG_ENABLE(webgl,
+              AC_HELP_STRING([--enable-webgl],
+                             [enable support for WebGL (experimental) [default=no]]),
+              [], [enable_webgl="no"])
+AC_MSG_RESULT([$enable_webgl])
+
+if test "$enable_webgl" = "yes"; then
+    AC_CHECK_HEADERS([GL/gl.h], [], AC_MSG_ERROR([OpenGL header not found]))
+    AC_CHECK_HEADERS([GL/glx.h], [], AC_MSG_ERROR([GLX header not found]))
+    OPENGL_LIBS=-lGL
+fi
+AC_SUBST([OPENGL_LIBS])
 
 # check whether to enable channel messaging support
 AC_MSG_CHECKING([whether to enable HTML5 Channel Messaging support])
@@ -373,6 +393,38 @@ AC_ARG_ENABLE(channel_messaging,
               [],[enable_channel_messaging="yes"])
 AC_MSG_RESULT([$enable_channel_messaging])
 
+# check whether to enable notifications
+AC_MSG_CHECKING([whether to enable notifications])
+AC_ARG_ENABLE(notifications,
+              AC_HELP_STRING([--enable-notifications],
+                             [enable notifications [default=no]]),
+              [],[enable_notifications="no"])
+AC_MSG_RESULT([$enable_notifications])
+
+# check whether to enable the meter tag
+AC_MSG_CHECKING([whether to enable HTML5 meter tag])
+AC_ARG_ENABLE(meter_tag,
+              AC_HELP_STRING([--enable-meter-tag],
+                             [enable HTML5 meter [default=yes]]),
+              [],[enable_meter_tag="yes"])
+AC_MSG_RESULT([$enable_meter_tag])
+
+# check whether to enable page visibility API.
+AC_MSG_CHECKING([whether to enable Page Visibility API support])
+AC_ARG_ENABLE(page_visibility_api,
+              AC_HELP_STRING([--enable-page-visibility-api],
+                             [enable page visibility api[default=no]]),
+              [],[enable_page_visibility_api="no"])
+AC_MSG_RESULT([$enable_page_visibility_api])
+
+# check whether to enable the progress tag
+AC_MSG_CHECKING([whether to enable HTML5 progress tag])
+AC_ARG_ENABLE(progress_tag,
+              AC_HELP_STRING([--enable-progress-tag],
+                             [enable HTML5 progress [default=yes]]),
+              [],[enable_progress_tag="yes"])
+AC_MSG_RESULT([$enable_progress_tag])
+
 # check whether to enable JavaScript debugger/profiler support
 AC_MSG_CHECKING([whether to enable JavaScript debugger/profiler support])
 AC_ARG_ENABLE(javascript_debugger,
@@ -381,6 +433,22 @@ AC_ARG_ENABLE(javascript_debugger,
               [],[enable_javascript_debugger="yes"])
 AC_MSG_RESULT([$enable_javascript_debugger])
 
+# check whether to build with datagrid support
+AC_MSG_CHECKING([whether to enable HTML5 datagrid support])
+AC_ARG_ENABLE(datagrid,
+              AC_HELP_STRING([--enable-datagrid],
+                             [enable HTML5 datagrid support [default=no]]),
+              [],[enable_datagrid="no"])
+AC_MSG_RESULT([$enable_datagrid])
+
+# check whether to build with data transfer items support
+AC_MSG_CHECKING([whether to enable HTML5 data transfer items support])
+AC_ARG_ENABLE(data_transfer_items,
+              AC_HELP_STRING([--enable-data-transfer-items],
+                             [enable HTML5 data transfer items support [default=no]]),
+              [],[enable_data_transfer_items="no"])
+AC_MSG_RESULT([$enable_data_transfer_items])
+
 # check whether to enable HTML5 Offline Web Applications support
 AC_MSG_CHECKING([whether to enable HTML5 offline web applications support])
 AC_ARG_ENABLE(offline_web_applications,
@@ -400,11 +468,19 @@ AC_MSG_RESULT([$enable_dom_storage])
 # check whether to enable the indexed database API
 AC_MSG_CHECKING([whether to enable the indexed database API])
 AC_ARG_ENABLE(indexed_database,
-              AC_HELP_STRING([--enable-indexeddb],
+              AC_HELP_STRING([--enable-indexed-database],
                              [enable the indexed database API [default=no]]),
               [],[enable_indexed_database="no"])
 AC_MSG_RESULT([$enable_indexed_database])
 
+# check whether to enable the color input
+AC_MSG_CHECKING([whether to enable the color input])
+AC_ARG_ENABLE(input_color,
+              AC_HELP_STRING([--enable-input-color],
+                             [enable the color input [default=no]]),
+              [],[enable_input_color="no"])
+AC_MSG_RESULT([$enable_input_color])
+
 # check whether to enable the speech input API
 AC_MSG_CHECKING([whether to enable the speech input API])
 AC_ARG_ENABLE(input_speech,
@@ -469,6 +545,43 @@ AC_ARG_ENABLE(video,
               [],[enable_video="yes"])
 AC_MSG_RESULT([$enable_video])
 
+# turn off video features if --disable-video is requested
+if test "$enable_video" = "no"; then
+   enable_video_track=no
+fi
+
+# check whether to enable HTML5 video track support
+AC_MSG_CHECKING([whether to enable HTML5 video track support])
+AC_ARG_ENABLE(video_track,
+              AC_HELP_STRING([--enable-video-track],
+                             [enable HTML5 video track support [default=yes]]),
+              [],[enable_video_track="yes"])
+AC_MSG_RESULT([$enable_video_track])
+
+# check whether to enable media statistics support
+AC_MSG_CHECKING([whether to enable media statistics support])
+AC_ARG_ENABLE(media_statistics,
+              AC_HELP_STRING([--enable-media-statistics],
+                             [enable support for media statistics [default=no]]),
+              [], [enable_media_statistics="no"])
+AC_MSG_RESULT([$enable_media_statistics])
+
+# check whether to enable Javascript Fullscreen API support
+AC_MSG_CHECKING([whether to enable Fullscreen API support])
+AC_ARG_ENABLE(fullscreen_api,
+              AC_HELP_STRING([--enable-fullscreen-api],
+                             [enable the Fullscreen API support [default=yes]]),
+              [],[enable_fullscreen_api="yes"])
+AC_MSG_RESULT([$enable_fullscreen_api])
+
+# check whether to enable media stream support
+AC_MSG_CHECKING([whether to enable media stream support])
+AC_ARG_ENABLE(media_stream,
+              AC_HELP_STRING([--enable-media-stream],
+                             [enable media stream support (incomplete) [default=no]]),
+              [],[enable_media_stream="no"])
+AC_MSG_RESULT([$enable_media_stream])
+
 # check whether to enable XHTML-MP support
 AC_MSG_CHECKING([whether to enable XHTML-MP support])
 AC_ARG_ENABLE(xhtmlmp,
@@ -501,6 +614,14 @@ AC_ARG_ENABLE(geolocation,
               [],[enable_geolocation="no"])
 AC_MSG_RESULT([$enable_geolocation])
 
+# check whether to enable client-based geolocation support
+AC_MSG_CHECKING([whether to enable client-based geolocation support])
+AC_ARG_ENABLE(client_based_geolocation,
+              AC_HELP_STRING([--enable-client-based-geolocation],
+                             [enable support for client-based geolocation [default=no]]),
+              [],[enable_client_based_geolocation="no"])
+AC_MSG_RESULT([$enable_client_based_geolocation])
+
 # check whether to enable MathML support
 AC_MSG_CHECKING([whether to enable MathML support])
 AC_ARG_ENABLE(mathml,
@@ -517,13 +638,13 @@ AC_ARG_ENABLE(svg,
               [],[enable_svg="yes"])
 AC_MSG_RESULT([$enable_svg])
 
-# check whether to enable WML support
-AC_MSG_CHECKING([whether to enable WML support])
-AC_ARG_ENABLE(wml,
-              AC_HELP_STRING([--enable-wml],
-                             [enable support for WML [default=no]]),
-              [],[enable_wml="no"])
-AC_MSG_RESULT([$enable_wml])
+# check whether to enable WCSS support
+AC_MSG_CHECKING([whether to enable WCSS support])
+AC_ARG_ENABLE(wcss,
+              AC_HELP_STRING([--enable-wcss],
+                             [enable support for WCSS [default=no]]),
+              [],[enable_wcss="no"])
+AC_MSG_RESULT([$enable_wcss])
 
 # check whether to enable SharedWorkers support
 AC_MSG_CHECKING([whether to enable SharedWorkers support])
@@ -557,6 +678,14 @@ AC_ARG_ENABLE(file_system,
               [], [enable_file_system="no"])
 AC_MSG_RESULT([$enable_file_system])
 
+# check whether to enable Quota API support
+AC_MSG_CHECKING([whether to enable Quota API support])
+AC_ARG_ENABLE(quota,
+              AC_HELP_STRING([--enable-quota],
+                             [enable support for Quota API [default=no]]),
+              [], [enable_quota="no"])
+AC_MSG_RESULT([$enable_quota])
+
 # turn off svg features if --disable-svg is requested
 if test "$enable_svg" = "no"; then
    enable_svg_animation=no
@@ -635,6 +764,14 @@ AC_ARG_ENABLE(web_sockets,
               [],[enable_web_sockets="yes"])
 AC_MSG_RESULT([$enable_web_sockets])
 
+# check whether to enable Web Audio support
+AC_MSG_CHECKING([whether to enable Web Audio support])
+AC_ARG_ENABLE(web_audio,
+              AC_HELP_STRING([--enable-web-audio],
+                             [enable support for Web Audio [default=no]]),
+              [],[enable_web_audio="no"])
+AC_MSG_RESULT([$enable_web_audio])
+
 # check whether to enable Web Timing support
 AC_MSG_CHECKING([whether to enable Web Timing support])
 AC_ARG_ENABLE(web_timing,
@@ -647,8 +784,8 @@ AC_MSG_RESULT([$enable_web_timing])
 AC_MSG_CHECKING([whether to enable Blob support])
 AC_ARG_ENABLE(blob,
               AC_HELP_STRING([--enable-blob],
-                             [enable support for Blob [default=no]]),
-              [],[enable_blob="no"])
+                             [enable support for Blob [default=yes]]),
+              [],[enable_blob="yes"])
 AC_MSG_RESULT([$enable_blob])
 
 # check whether to enable Fast Mobile Scrolling support
@@ -675,6 +812,22 @@ AC_ARG_ENABLE(fast_malloc,
               [],[if test "$enable_debug" = "yes"; then enable_fast_malloc="no"; else enable_fast_malloc="yes"; fi])
 AC_MSG_RESULT([$enable_fast_malloc])
 
+# check whether to enable debug symbols
+AC_MSG_CHECKING([whether to enable debug symbols])
+AC_ARG_ENABLE(debug_symbols,
+              AC_HELP_STRING([--enable-debug-symbols],
+                             [enable debug symbols default=no, default=yes for debug builds]),
+              [],[if test "$enable_debug" = "yes"; then enable_debug_symbols="yes"; else enable_debug_symbols="no"; fi])
+AC_MSG_RESULT([$enable_debug_symbols])
+
+# check whether to enable debug features
+AC_MSG_CHECKING([whether to enable debug features])
+AC_ARG_ENABLE(debug_features,
+              AC_HELP_STRING([--enable-debug-features],
+                             [enable debug features default=no, default=yes for debug builds]),
+              [],[if test "$enable_debug" = "yes"; then enable_debug_features="yes"; else enable_debug_features="no"; fi])
+AC_MSG_RESULT([$enable_debug_features])
+
 AC_MSG_CHECKING([whether to enable JIT compilation])
 AC_ARG_ENABLE([jit],
               AC_HELP_STRING([--enable-jit],
@@ -704,6 +857,12 @@ if test "$enable_jit" = "yes"; then
                 ;;
             esac
         ;;
+        sh4)
+            AC_DEFINE([ENABLE_YARR], [1], [Define to enable YARR])
+            AC_DEFINE([ENABLE_YARR_JIT], [1], [Define to enable YARR JIT])
+            AC_DEFINE([ENABLE_JIT], [1], [Define to enable JIT])
+            AC_DEFINE([WTF_USE_JIT_STUB_ARGUMENT_REGISTER], [1], [Use stub register])
+        ;;
         *)
             enable_jit="no (CPU '$host_cpu' not supported)"
         ;;
@@ -745,6 +904,38 @@ AC_ARG_ENABLE([introspection],
   [],[enable_introspection=no])
 AC_MSG_RESULT([$enable_introspection])
 
+# check whether to enable animation API
+AC_MSG_CHECKING([whether to enable Animation API support])
+AC_ARG_ENABLE(animation_api,
+              AC_HELP_STRING([--enable-animation-api],
+                             [enable support for Animation API (experimental) [default=no]]),
+              [], [enable_animation_api="no"])
+AC_MSG_RESULT([$enable_animation_api])
+
+# check whether to enable touch icon loading 
+AC_MSG_CHECKING([whether to enable touch icon loading])
+AC_ARG_ENABLE(touch_icon_loading,
+              AC_HELP_STRING([--enable-touch-icon-loading],
+                             [enable support for loading touch icons [default=no]]),
+              [], [enable_touch_icon_loading="no"])
+AC_MSG_RESULT([$enable_touch_icon_loading])
+
+# check whether to enable Register Protocol Handler support
+AC_MSG_CHECKING([whether to enable Register Protocol Handler])
+AC_ARG_ENABLE(register_protocol_handler,
+              AC_HELP_STRING([--enable-register-protocol-handler],
+                             [enable support for Register Protocol Handler (experimental) [default=no]]),
+              [],[enable_register_protocol_handler="no"])
+AC_MSG_RESULT([$enable_register_protocol_handler])
+
+# check whether to enable DeviceOrientation support
+AC_MSG_CHECKING([whether to enable DeviceOrientation])
+AC_ARG_ENABLE(device_orientation,
+              AC_HELP_STRING([--enable-device-orientation],
+                             [enable support for DeviceOrientation (experimental and incomplete) [default=no]]),
+              [],[enable_device_orientation="no"])
+AC_MSG_RESULT([$enable_device_orientation])
+
 G_IR_SCANNER=
 G_IR_COMPILER=
 G_IR_GENERATE=
@@ -778,11 +969,18 @@ case "$with_font_backend" in
 esac
 AC_MSG_RESULT([$with_font_backend])
 
-# Add '-g' flag to gcc if it's debug build
-if test "$enable_debug" = "yes"; then
+if test "$host_cpu" = "sh4"; then
+   CXXFLAGS="$CXXFLAGS -mieee -w"
+   CFLAGS="$CFLAGS -mieee -w"
+fi
+
+# Add '-g' flag to gcc to build with debug symbols
+if test "$enable_debug_symbols" = "yes"; then
    CXXFLAGS="$CXXFLAGS -g"
    CFLAGS="$CFLAGS -g"
-else
+fi
+
+if test "$enable_debug_features" = "no"; then
    AC_DEFINE([NDEBUG], [1], [Define to disable debugging features])
 fi
 
@@ -800,15 +998,6 @@ PKG_CHECK_MODULES([LIBSOUP],
 AC_SUBST([LIBSOUP_CFLAGS])
 AC_SUBST([LIBSOUP_LIBS])
 
-# check if we can use libSoup 2.29.90 features
-PKG_CHECK_MODULES([LIBSOUP_2_29_90],
-                  [libsoup-2.4 >= 2.29.90],
-                  [have_libsoup_2_29_90=yes],
-                  [have_libsoup_2_29_90=no])
-if test "$have_libsoup_2_29_90" = "yes"; then
-   AC_DEFINE([HAVE_LIBSOUP_2_29_90], 1, [Whether libSoup 2.29.90 features are available])
-fi
-
 # check if FreeType/FontConfig are available
 if test "$with_font_backend" = "freetype"; then
    if test "$with_target" = "directfb"; then
@@ -825,22 +1014,26 @@ if test "$with_font_backend" = "freetype"; then
    AC_SUBST([FREETYPE_LIBS])
 fi
 
-# check if sqlite 3 is available
-if test "$enable_icon_database" = "yes" || \
+# check if SQLite3 is available. Error out only if one of the
+# features hard-depending on it is enabled while SQLite3 is
+# unavailable.
+PKG_CHECK_MODULES([SQLITE3],
+                  [sqlite3 >= $SQLITE_REQUIRED_VERSION],
+                  [sqlite3_has_pkg_config=yes],
+                  [sqlite3_has_pkg_config=no])
+if test "$sqlite3_has_pkg_config" = "no"; then
+   AC_SEARCH_LIBS([sqlite3_open16], [sqlite3],
+                  [sqlite3_found=yes;SQLITE3_LIBS="$LIBS";SQLITE3_CFLAGS="-I $srcdir/WebKitLibraries/WebCoreSQLite3"],
+                  [sqlite3_found=no])
+fi
+AC_SUBST([SQLITE3_CFLAGS])
+AC_SUBST([SQLITE3_LIBS])
+
+if (test "$sqlite3_found" = "no") && (test "$enable_icon_database" = "yes" || \
    test "$enable_database" = "yes" || \
    test "$enable_offline_web_applications" = "yes" || \
-   test "$enable_dom_storage" = "yes"; then
-   PKG_CHECK_MODULES([SQLITE3],
-                     [sqlite3 >= $SQLITE_REQUIRED_VERSION],
-                     [sqlite3_has_pkg_config=yes],
-                     [sqlite3_has_pkg_config=no])
-   if test "$sqlite3_has_pkg_config" = "no"; then
-      AC_SEARCH_LIBS([sqlite3_open16], [sqlite3],
-                     [SQLITE3_LIBS="$LIBS";SQLITE3_CFLAGS="-I $srcdir/WebKitLibraries/WebCoreSQLite3"],
-                     [AC_MSG_ERROR([SQLite3 is required to enable Database support])])
-   fi
-   AC_SUBST([SQLITE3_CFLAGS])
-   AC_SUBST([SQLITE3_LIBS])
+   test "$enable_dom_storage" = "yes"); then
+   AC_MSG_ERROR([SQLite3 is required for the Database related features])
 fi
 
 # check if libxslt is available
@@ -857,6 +1050,14 @@ if test "$enable_geolocation" = "yes"; then
     AC_SUBST([GEOCLUE_LIBS])
 fi
 
+# check for XRender under Linux/Unix. Some linkers require explicit
+# linkage (like GNU Gold), so we cannot rely on GTK+ pulling XRender
+if test "$os_win32" = "no"; then
+   PKG_CHECK_MODULES([XRENDER], [xrender])
+   AC_SUBST([XRENDER_CFLAGS])
+   AC_SUBST([XRENDER_LIBS])
+fi
+
 # check if gstreamer is available
 if test "$enable_video" = "yes"; then
    PKG_CHECK_MODULES([GSTREAMER],
@@ -867,8 +1068,7 @@ if test "$enable_video" = "yes"; then
                      gstreamer-pbutils-0.10
                      gstreamer-plugins-base-0.10 >= $GSTREAMER_PLUGINS_BASE_REQUIRED_VERSION
                      gstreamer-video-0.10],
-                     [have_gstreamer=yes],
-                     [have_gstreamer=no])
+                     [have_gstreamer=yes])
 
    AC_SUBST([GSTREAMER_CFLAGS])
    AC_SUBST([GSTREAMER_LIBS])
@@ -887,6 +1087,31 @@ if test "$enable_video" = "yes"; then
     html_flags=yes
 fi
 
+# WebKit2
+AC_MSG_CHECKING([whether to build Webkit2])
+AC_ARG_ENABLE(webkit2,
+            AC_HELP_STRING([--enable-webkit2],
+                [build webkit2 [default=no]]),
+                [], [enable_webkit2="no"])
+AC_MSG_RESULT([$enable_webkit2])
+if test "$enable_webkit2" = "yes"; then
+   if test "$GTK_API_VERSION" = "2.0"; then
+      AC_MSG_ERROR([WebKit2 requires GTK+ 3.x, use --with-gtk=3.0])
+   fi
+fi
+
+# Plugin Process
+AC_MSG_CHECKING([whether to build plugin process for WebKit2])
+AC_ARG_ENABLE(plugin_process,
+            AC_HELP_STRING([--enable-plugin-process],
+                           [build plugin process for WebKit2 [default=yes]]),
+                           [], [enable_plugin_process="no"])
+# Build the plugin process only when building webkit2.
+if test "$enable_webkit2" = "no"; then
+    enable_plugin_process=no
+fi
+AC_MSG_RESULT([$enable_plugin_process])
+
 GTK_DOC_CHECK([1.10])
 
 # OS conditionals
@@ -910,37 +1135,49 @@ AM_CONDITIONAL([USE_GLIB_UNICODE], [test "$with_unicode_backend" = "glib"])
 AM_CONDITIONAL([USE_FREETYPE], [test "$with_font_backend" = "freetype"])
 AM_CONDITIONAL([USE_PANGO], [test "$with_font_backend" = "pango"])
 
-# GLib/GIO feature conditionals
-AM_CONDITIONAL([USE_GSETTINGS], [test "$have_gsettings" = "yes"])
-
 # GStreamer feature conditional
 AM_CONDITIONAL([USE_GSTREAMER], [test "$have_gstreamer" = "yes"])
 
 # WebKit feature conditionals
-AM_CONDITIONAL([ENABLE_DEBUG],[test "$enable_debug" = "yes"])
-AM_CONDITIONAL([ENABLE_3D_TRANSFORMS],[test "$enable_3D_transforms" = "yes"])
+AM_CONDITIONAL([ENABLE_DEBUG],[test "$enable_debug_features" = "yes"])
+AM_CONDITIONAL([ENABLE_3D_RENDERING],[test "$enable_3d_rendering" = "yes"])
+AM_CONDITIONAL([ENABLE_WEBGL],[test "$enable_webgl" = "yes"])
 AM_CONDITIONAL([ENABLE_BLOB],[test "$enable_blob" = "yes"])
+AM_CONDITIONAL([ENABLE_METER_TAG],[test "$enable_meter_tag" = "yes"])
+AM_CONDITIONAL([ENABLE_PAGE_VISIBILITY_API],[test "$enable_page_visibility_api" = "yes"])
+AM_CONDITIONAL([ENABLE_PROGRESS_TAG],[test "$enable_progress_tag" = "yes"])
 AM_CONDITIONAL([ENABLE_CHANNEL_MESSAGING],[test "$enable_channel_messaging" = "yes"])
 AM_CONDITIONAL([ENABLE_JAVASCRIPT_DEBUGGER],[test "$enable_javascript_debugger" = "yes"])
 AM_CONDITIONAL([ENABLE_OFFLINE_WEB_APPLICATIONS],[test "$enable_offline_web_applications" = "yes"])
 AM_CONDITIONAL([ENABLE_DIRECTORY_UPLOAD],[test "$enable_directory_upload" = "yes"])
+AM_CONDITIONAL([ENABLE_DATAGRID],[test "$enable_datagrid" = "yes"])
+AM_CONDITIONAL([ENABLE_DATA_TRANSFER_ITEMS],[test "$enable_data_transfer_items" = "yes"])
 AM_CONDITIONAL([ENABLE_DOM_STORAGE],[test "$enable_dom_storage" = "yes"])
 AM_CONDITIONAL([ENABLE_DATABASE],[test "$enable_database" = "yes"])
 AM_CONDITIONAL([ENABLE_DATALIST],[test "$enable_datalist" = "yes"])
+AM_CONDITIONAL([ENABLE_DETAILS],[test "$enable_details" = "yes"])
 AM_CONDITIONAL([ENABLE_EVENTSOURCE],[test "$enable_eventsource" = "yes"])
 AM_CONDITIONAL([ENABLE_FAST_MOBILE_SCROLLING],[test "$enable_fast_mobile_scrolling" = "yes"])
 AM_CONDITIONAL([ENABLE_FILE_SYSTEM],[test "$enable_file_system" = "yes"])
+AM_CONDITIONAL([ENABLE_QUOTA],[test "$enable_quota" = "yes"])
 AM_CONDITIONAL([ENABLE_ICONDATABASE],[test "$enable_icon_database" = "yes"])
 AM_CONDITIONAL([ENABLE_IMAGE_RESIZER],[test "$enable_image_resizer" = "yes"])
 AM_CONDITIONAL([ENABLE_INDEXED_DATABASE],[test "$enable_indexed_database" = "yes"])
+AM_CONDITIONAL([ENABLE_INPUT_COLOR],[test "$enable_input_color" = "yes"])
 AM_CONDITIONAL([ENABLE_INPUT_SPEECH],[test "$enable_input_speech" = "yes"])
 AM_CONDITIONAL([ENABLE_XHTMLMP],[test "$enable_xhtmlmp" = "yes"])
 AM_CONDITIONAL([ENABLE_XPATH],[test "$enable_xpath" = "yes"])
 AM_CONDITIONAL([ENABLE_XSLT],[test "$enable_xslt" = "yes"])
 AM_CONDITIONAL([ENABLE_FILTERS],[test "$enable_filters" = "yes"])
 AM_CONDITIONAL([ENABLE_GEOLOCATION], [test "$enable_geolocation" = "yes"])
+AM_CONDITIONAL([ENABLE_CLIENT_BASED_GEOLOCATION], [test "$enable_client_based_geolocation" = "yes"])
 AM_CONDITIONAL([ENABLE_MATHML], [test "$enable_mathml" = "yes"])
+AM_CONDITIONAL([ENABLE_MHTML], [test "$enable_mhtml" = "yes"])
 AM_CONDITIONAL([ENABLE_VIDEO],[test "$enable_video" = "yes"])
+AM_CONDITIONAL([ENABLE_MEDIA_STATISTICS],[test "$enable_media_statistics" = "yes"])
+AM_CONDITIONAL([ENABLE_VIDEO_TRACK],[test "$enable_video_track" = "yes"])
+AM_CONDITIONAL([ENABLE_FULLSCREEN_API],[test "$enable_fullscreen_api" = "yes"])
+AM_CONDITIONAL([ENABLE_MEDIA_STREAM],[test "$enable_media_stream" = "yes"])
 AM_CONDITIONAL([ENABLE_NOTIFICATIONS],[test "$enable_notifications" = "yes"])
 AM_CONDITIONAL([ENABLE_ORIENTATION_EVENTS],[test "$enable_orientation_events" = "yes"])
 AM_CONDITIONAL([ENABLE_SVG],[test "$enable_svg" = "yes"])
@@ -951,35 +1188,54 @@ AM_CONDITIONAL([ENABLE_SVG_AS_IMAGE],[test "$enable_svg_as_image" = "yes"])
 AM_CONDITIONAL([ENABLE_SVG_USE],[test "$enable_svg_use" = "yes"])
 AM_CONDITIONAL([ENABLE_COVERAGE],[test "$enable_coverage" = "yes"])
 AM_CONDITIONAL([ENABLE_FAST_MALLOC],[test "$enable_fast_malloc" = "yes"])
-AM_CONDITIONAL([ENABLE_WML],[test "$enable_wml" = "yes"])
+AM_CONDITIONAL([ENABLE_WCSS],[test "$enable_wcss" = "yes"])
 AM_CONDITIONAL([ENABLE_WORKERS],[test "$enable_workers" = "yes"])
 AM_CONDITIONAL([ENABLE_SHARED_WORKERS],[test "$enable_shared_workers" = "yes"])
 AM_CONDITIONAL([SVG_FLAGS],[test "$svg_flags" = "yes"])
 AM_CONDITIONAL([HTML_FLAGS],[test "$html_flags" = "yes"])
 AM_CONDITIONAL([ENABLE_WEB_SOCKETS],[test "$enable_web_sockets" = "yes"])
+AM_CONDITIONAL([ENABLE_WEB_AUDIO],[test "$enable_web_audio" = "yes"])
 AM_CONDITIONAL([ENABLE_WEB_TIMING],[test "$enable_web_timing" = "yes"])
 AM_CONDITIONAL([ENABLE_OPCODE_STATS],[test "$enable_opcode_stats" = "yes"])
+AM_CONDITIONAL([ENABLE_WEBKIT2],[test "$enable_webkit2" = "yes"])
+AM_CONDITIONAL([ENABLE_PLUGIN_PROCESS],[test "$enable_plugin_process" = "yes"])
+AM_CONDITIONAL([ENABLE_SPELLCHECK],[test "$enable_spellcheck" = "yes"])
+AM_CONDITIONAL([ENABLE_ANIMATION_API],[test "$enable_animation_api" = "yes"])
+AM_CONDITIONAL([ENABLE_TOUCH_ICON_LOADING],[test "$enable_touch_icon_loading" = "yes"])
+AM_CONDITIONAL([ENABLE_REGISTER_PROTOCOL_HANDLER],[test "$enable_register_protocol_handler" = "yes"])
+AM_CONDITIONAL([ENABLE_DEVICE_ORIENTATION],[test "$enable_device_orientation" = "yes"])
 
 # Gtk conditionals
 AM_CONDITIONAL([ENABLE_INTROSPECTION],[test "$enable_introspection" = "yes"])
 
-
 AC_CONFIG_FILES([
 GNUmakefile
-WebKit/gtk/webkit/webkitversion.h
-WebKit/gtk/docs/GNUmakefile
-WebKit/gtk/docs/version.xml
-]
-)
+])
+ 
+
+AC_CONFIG_FILES([
+Source/WebKit/gtk/webkit/webkitversion.h
+Source/WebKit/gtk/docs/GNUmakefile
+Source/WebKit/gtk/docs/version.xml
+])
 
 AC_CONFIG_FILES([
-WebKit/gtk/${WEBKITGTK_PC_NAME}-${WEBKITGTK_API_VERSION}.pc:WebKit/gtk/webkit.pc.in
-WebKit/gtk/JSCore-${WEBKITGTK_API_VERSION}.gir:WebKit/gtk/JSCore.gir.in
-WebKit/gtk/org.webkitgtk-${WEBKITGTK_API_VERSION}.gschema.xml:WebKit/gtk/org.webkitgtk.gschema.xml.in
+Source/WebKit/gtk/${WEBKITGTK_PC_NAME}-${WEBKITGTK_API_VERSION}.pc:Source/WebKit/gtk/webkit.pc.in
+Source/WebKit/gtk/JSCore-${WEBKITGTK_API_VERSION}.gir:Source/WebKit/gtk/JSCore.gir.in
+Source/WebKit/gtk/org.webkitgtk-${WEBKITGTK_API_VERSION}.gschema.xml:Source/WebKit/gtk/org.webkitgtk.gschema.xml.in
+Source/WebKit/gtk/javascriptcoregtk-${WEBKITGTK_API_VERSION}.pc:Source/WebKit/gtk/javascriptcoregtk.pc.in
 ]
 ,[WEBKITGTK_API_VERSION=$WEBKITGTK_API_VERSION,WEBKITGTK_PC_NAME=$WEBKITGTK_PC_NAME]
 )
 
+if test "$enable_webkit2" = "yes"; then
+    AC_CONFIG_FILES([
+    Source/WebKit2/gtk/${WEBKITGTK_PC_NAME}2-${WEBKITGTK_API_VERSION}.pc:Source/WebKit2/gtk/webkit2.pc.in
+    ]
+    ,[WEBKITGTK_API_VERSION=$WEBKITGTK_API_VERSION,WEBKITGTK_PC_NAME=$WEBKITGTK_PC_NAME]
+    )
+fi
+
 AC_OUTPUT
 
 echo "
@@ -987,34 +1243,50 @@ WebKit was configured with the following options:
 
 Build configuration:
  Enable debugging (slow)                                  : $enable_debug
+ Compile with debug symbols (slow)                        : $enable_debug_symbols
+ Enable debug features (slow)                             : $enable_debug_features
  Enable GCC build optimization                            : $enable_optimizations
  Code coverage support                                    : $enable_coverage
  Unicode backend                                          : $with_unicode_backend
  Font backend                                             : $with_font_backend
  Optimized memory allocator                               : $enable_fast_malloc
 Features:
- 3D Transforms                                            : $enable_3D_transforms
+ 3D Rendering                                             : $enable_3d_rendering
+ WebGL                                                    : $enable_webgl
  Blob support                                             : $enable_blob
+ DeviceOrientation support                                : $enable_device_orientation
  Directory upload                                         : $enable_directory_upload
  Fast Mobile Scrolling                                    : $enable_fast_mobile_scrolling
  JIT compilation                                          : $enable_jit
  Filters support                                          : $enable_filters
  Geolocation support                                      : $enable_geolocation
+ Client-based geolocation support                         : $enable_client_based_geolocation
  JavaScript debugger/profiler support                     : $enable_javascript_debugger
  MathML support                                           : $enable_mathml
+ Media statistics                                         : $enable_media_statistics
  HTML5 offline web applications support                   : $enable_offline_web_applications
  HTML5 channel messaging support                          : $enable_channel_messaging
+ HTML5 meter element support                              : $enable_meter_tag
+ Page Visibility API support                              : $enable_page_visibility_api
+ HTML5 progress element support                           : $enable_progress_tag
  HTML5 client-side session and persistent storage support : $enable_dom_storage
  HTML5 client-side database storage support               : $enable_database
+ HTML5 datagrid support                                   : $enable_datagrid
+ HTML5 data transfer items support                        : $enable_data_transfer_items
  HTML5 FileSystem API support                             : $enable_file_system
+ Quota API support                                        : $enable_quota
  HTML5 sandboxed iframe support                           : $enable_sandbox
  HTML5 server-sent events support                         : $enable_eventsource
  HTML5 video element support                              : $enable_video
+ HTML5 track element support                              : $enable_video_track
+ Fullscreen API support                                   : $enable_fullscreen_api
+ Media stream support                                     : $enable_media_stream
  Icon database support                                    : $enable_icon_database
  Image resizer support                                    : $enable_image_resizer
  Link prefetch support                                    : $enable_link_prefetch
  Opcode stats                                             : $enable_opcode_stats
  SharedWorkers support                                    : $enable_shared_workers
+ Color input support                                      : $enable_input_color
  Speech input support                                     : $enable_input_speech
  SVG support                                              : $enable_svg
  SVG animation support                                    : $enable_svg_animation
@@ -1022,19 +1294,26 @@ Features:
  SVG foreign object support                               : $enable_svg_foreign_object
  SVG as image support                                     : $enable_svg_as_image
  SVG use element support                                  : $enable_svg_use
- WML support                                              : $enable_wml
+ WCSS support                                             : $enable_wcss
+ Web Audio support                                        : $enable_web_audio
  Web Sockets support                                      : $enable_web_sockets
  Web Timing support                                       : $enable_web_timing
  Web Workers support                                      : $enable_workers
  XHTML-MP support                                         : $enable_xhtmlmp
  XPATH support                                            : $enable_xpath
  XSLT support                                             : $enable_xslt
+ Spellcheck support                                       : $enable_spellcheck
+ Animation API                                            : $enable_animation_api
+ Touch Icon Loading support                               : $enable_touch_icon_loading
+ Register Protocol Handler support                        : $enable_register_protocol_handler
 
 GTK+ configuration:
  GTK+ version                                             : $with_gtk
  GDK target                                               : $with_target
  Hildon UI extensions                                     : $with_hildon
  Introspection support                                    : $enable_introspection
+ WebKit2 support                                          : $enable_webkit2
+ WebKit2 plugin process                                   : $enable_plugin_process
 "
 if test "$with_unicode_backend" = "glib"; then
    echo "     >> WARNING: the glib-based unicode backend is slow and incomplete <<"
diff --git a/meta/recipes-sato/webkit/files/update-webkit.sh b/meta/recipes-sato/webkit/files/update-webkit.sh
new file mode 100755
index 0000000..723c45a
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/update-webkit.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+# usage: sh update-webkit.sh <revision>
+
+export rev=$1
+
+for i in autogen.sh configure.ac GNUmakefile.am Makefile Makefile.shared  ; do
+	wget "http://trac.webkit.org/browser/trunk/$i?rev=$rev&format=raw" -O $i
+done
diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index af43ae8..5eb9b2e 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -3,27 +3,23 @@ HOMEPAGE = "http://www.webkitgtk.org/"
 BUGTRACKER = "http://bugs.webkit.org/"
 
 LICENSE = "BSD & LGPLv2+"
-LIC_FILES_CHKSUM = "file://WebCore/rendering/RenderApplet.h;endline=22;md5=fb9694013ad71b78f8913af7a5959680 \
-                    file://WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
-                    file://JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
+LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md5=fb9694013ad71b78f8913af7a5959680 \
+                    file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
+                    file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
 
 DEPENDS = "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
 DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
 
-SRCREV_FORMAT = "webcore-rwebkit"
+SRCREV_FORMAT = "source"
 
-SRCREV = "72836"
-PV = "1.3.7+svnr${SRCPV}"
-PR = "r2"
+SRCREV = "90727"
+PV = "1.5.1+svnr${SRCPV}"
+PR = "r0"
 
 SRC_URI = "\
-  svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptGlue;proto=http \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebCore;proto=http;name=webcore \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKit;proto=http;name=webkit \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
   svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitTools;proto=http \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=autotools;proto=http \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http \
   file://Makefile \
   file://Makefile.shared \
   file://autogen.sh \
@@ -41,36 +37,29 @@ EXTRA_OECONF = "\
                 --enable-debug=no \
                 --enable-svg \
                 --enable-icon-database=yes \
-		--disable-fast-malloc \
+                --enable-fullscreen-api \
+                --enable-image-resizer \
+                --enable-link-prefetch \
+                UNICODE_CFLAGS=-D_REENTRANT \
                "
 
-EXTRA_AUTORECONF = " -I autotools "
+EXTRA_AUTORECONF = " -I Source/autotools "
 
-do_compile_prepend() {
-        mkdir -p ${S}/WebKitBuilds/Debug/JavaScriptCore/pcre/tmp/
-        mkdir -p ${S}/Programs/
-	cd ${S}/JavaScriptCore/pcre
-        if test -e dftables.c
-        then
-            ${BUILD_CC} dftables.c -o dftables -I. -I../wtf
-        elif test -e dftables.cpp
-        then
-            ${BUILD_CXX} dftables.cpp -o dftables -I. -I../wtf
-        fi
-        cp dftables ${S}/WebKitBuilds/Debug/JavaScriptCore/pcre/tmp/
-        cp dftables ${S}/Programs/        
-	cd ${S}
+do_configure_append() {
+	# somethings wrong with icu, fix it up manually
+	for makefile in $(find ${S} -name "GNUmakefile") ; do
+		sed -i s:-I/usr/include::g $makefile
+	done
 }
 
 do_install_prepend() {
-        cp ${S}/Programs/.libs/jsc ${S}/Programs/jsc-1 || true
+	cp ${S}/Programs/.libs/jsc ${S}/Programs/jsc-1 || true
 }
 
-
 PACKAGES =+ "${PN}-webinspector ${PN}launcher-dbg ${PN}launcher libjavascriptcore"
 FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
-FILES_libjavascriptcore = "${libdir}/libJavaScriptCore.so.*"
+FILES_libjavascriptcore = "${libdir}/libjavascriptcoregtk-1.0.so.*"
 FILES_${PN}-webinspector = "${datadir}/webkitgtk-*/webinspector/"
 FILES_${PN} += "${datadir}/webkit-*/resources/error.html \
                 ${datadir}/webkitgtk-*/images \
-- 
1.6.6.1



