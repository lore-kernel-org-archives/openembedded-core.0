Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R5QTV-00028g-Gr
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 01:08:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2011 16:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,402,1312182000"; d="scan'208";a="52989592"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.150])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2011 16:03:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 16:03:16 -0700
Message-Id: <4b395a9beb6c02f7b23266e7ee2ca3c08a9cbb70.1316386910.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
Subject: [RC3 FIXES 2/4] texinfo: several changes to build without zlib and ncurses headers on host
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
X-List-Received-Date: Sun, 18 Sep 2011 23:08:38 -0000

From: Joshua Lock <josh@linux.intel.com>

Texinfo very cleverly detects cross-compilation and builds host versions
of the texinfo binaries it requires to bootstrap the build, however this
was causing the host to require ncurses and zlib libraries and headers.

Instead, since we require texinfo to be installed on the host, remove this
feature from the texinfo configure.ac (disable-native-tools.patch).

Further, fix texinfo to link with newer binutils (link-zip.patch) and to
generate translations with newer gettext (gettext-macros.patch).

With this patch I am able to build texinfo on Fedora without ncurses-devel
and zlib-devel installed.

This fixes [YOCTO #1483]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../texinfo-4.13a/disable-native-tools.patch       |   43 ++++++++++++++++++++
 .../texinfo/texinfo-4.13a/gettext-macros.patch     |   34 +++++++++++++++
 .../texinfo/texinfo-4.13a/link-zip.patch           |   16 +++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   24 +++++-----
 4 files changed, 105 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch

diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch
new file mode 100644
index 0000000..ab6f165
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch
@@ -0,0 +1,43 @@
+We already DEPEND on the native texinfo being present before building so
+there isn't any need to try and build the required native texinfo binaries
+before cross-compiling. This simplifies the recipe somewhat!
+
+Upstream-Status: Inappropriate oe specific
+
+Signed-off-by: Joshua Lock <josh@linux.intel.com>
+
+Index: texinfo-4.13/configure.ac
+===================================================================
+--- texinfo-4.13.orig/configure.ac
++++ texinfo-4.13/configure.ac
+@@ -100,29 +100,7 @@ AC_CANONICAL_BUILD
+ # $native_tools is also added to SUBDIRS in the main Makefile.am,
+ # so that make compiles the native tools first.
+ #
+-if test "$cross_compiling" = no; then
+-  native_tools=
+-else
+-  native_tools=tools
+-  test -d "$native_tools" || mkdir "$native_tools"
+-  confdir=`(cd "$srcdir";pwd)`
+-  # Make sure the secondary configure won't fail with
+-  # "error: source directory already configured".
+-  rm -f config.status
+-  AC_MSG_NOTICE([[Doing configure of native tools (${build}).]])
+-  cd "$native_tools" || exit 1
+-  # Run secondary configure in alternate environment or
+-  # it gets the wrong CC etc.
+-  # env -i gives this build host configure a clean environment;
+-  # consequently, we have to re-initialize $PATH.
+-  env -i CC="$BUILD_CC" AR="$BUILD_AR" RANLIB="$BUILD_RANLIB" \
+-      PATH="$PATH" \
+-      tools_only=1 \
+-    ${confdir}/configure --build=${build} --host=${build} \
+-                         --disable-rpath --disable-nls
+-  cd .. || exit 1
+-  AC_MSG_NOTICE([[Continuing with main configure (${host}).]])
+-fi
++native_tools=
+ AC_SUBST(native_tools)
+ AM_CONDITIONAL(TOOLS_ONLY, [[test "x$tools_only" = x1]])
+ 
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch
new file mode 100644
index 0000000..0a2e491
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch
@@ -0,0 +1,34 @@
+Bump gettext macro numbers as required by newer gettext built by OE.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joshua Lock <josh@linux.intel.com>
+
+Index: texinfo-4.13/configure.ac
+===================================================================
+--- texinfo-4.13.orig/configure.ac
++++ texinfo-4.13/configure.ac
+@@ -193,7 +193,7 @@ AM_CONDITIONAL(INSTALL_WARNINGS,
+ 
+ # i18n support.  To update to a new version of gettext, run:
+ # gettextize -f -c
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.18])
+ AM_GNU_GETTEXT([external])
+ 
+ # The test suite.
+Index: texinfo-4.13/po/Makefile.in.in
+===================================================================
+--- texinfo-4.13.orig/po/Makefile.in.in
++++ texinfo-4.13/po/Makefile.in.in
+@@ -8,8 +8,8 @@
+ # Please note that the actual code of GNU gettext is covered by the GNU
+ # General Public License and is *not* in the public domain.
+ #
+-# Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++# Origin: gettext-0.18
++GETTEXT_MACRO_VERSION = 0.18
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch
new file mode 100644
index 0000000..629d329
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch
@@ -0,0 +1,16 @@
+install-info uses symbols from zlib so must link against it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joshua Lock <josh@linux.intel.com>
+
+Index: texinfo-4.13/install-info/Makefile.am
+===================================================================
+--- texinfo-4.13.orig/install-info/Makefile.am
++++ texinfo-4.13/install-info/Makefile.am
+@@ -28,4 +28,4 @@ AM_CPPFLAGS = 					\
+   -I$(top_srcdir)/gnulib/lib			\
+   -I$(top_builddir)/gnulib/lib			\
+   -DLOCALEDIR=\"$(localedir)\"
+-LDADD = ../lib/libtxi.a $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL)
++LDADD = ../lib/libtxi.a $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL) -lz
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index 450a623..9f1c04a 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -8,14 +8,18 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
 PR = "r1"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib ncurses texinfo-native"
+DEPENDS_virtclass-native = "zlib-native ncurses-native"
 
 SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
-           file://texinfo-4.12-zlib.patch; \
-           file://texinfo-4.13a-data_types.patch; \
-           file://texinfo-4.13a-mosdo-crash.patch; \
-           file://texinfo-4.13a-powerpc.patch; \
-           file://texinfo-4.13a-help-index-segfault.patch;"
+           file://texinfo-4.12-zlib.patch \
+           file://texinfo-4.13a-data_types.patch \
+           file://texinfo-4.13a-mosdo-crash.patch \
+           file://texinfo-4.13a-powerpc.patch \
+           file://texinfo-4.13a-help-index-segfault.patch \
+           file://disable-native-tools.patch \
+           file://link-zip.patch \
+           file://gettext-macros.patch"
 
 SRC_URI[md5sum] = "71ba711519209b5fb583fed2b3d86fcb"
 SRC_URI[sha256sum] = "1303e91a1c752b69a32666a407e9fbdd6e936def4b09bc7de30f416301530d68"
@@ -25,13 +29,9 @@ tex_texinfo = "texmf/tex/texinfo"
 
 inherit gettext autotools
 
-do_configure() {
-	oe_runconf
-}
-
-do_compile_prepend(){
+do_compile_prepend() {
 	if [ -d tools ];then
-		make -C tools/gnulib/lib
+		oe_runmake -C tools/gnulib/lib
 	fi
 }
 
-- 
1.7.6



