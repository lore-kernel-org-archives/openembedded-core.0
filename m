Return-Path: <denis@denix.org>
X-Greylist: delayed 3601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Jan 2016 03:49:16 UTC
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 943886011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 03:49:16 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O180023QD63P891@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 19 Jan 2016 20:49:15 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=QyXUC8HyAAAA:8 a=6ohNodAXAAAA:8	a=e5mUnYsNAAAA:8
	a=a9kjj81HjlkexrJ9X8wA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DDAAF161E01;	Tue,
	19 Jan 2016 21:49:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:49:05 -0500
Message-id: <1453258146-7654-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] wayland: upgrade 1.8.1 -> 1.9.0
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
X-List-Received-Date: Wed, 20 Jan 2016 03:49:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

* The license was updated from MIT X11 to MIT Expat.
* always-build-scanner.patch was accepted upstream.
* disable-macro-checks-not-used-for-scanner.patch is no longer needed with
  the new --disable-libraries flag.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/wayland/always-build-scanner.patch     | 105 ---------------------
 ...disable-macro-checks-not-used-for-scanner.patch |  50 ----------
 .../wayland/{wayland_1.8.1.bb => wayland_1.9.0.bb} |  20 ++--
 3 files changed, 8 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/always-build-scanner.patch
 delete mode 100644 meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
 rename meta/recipes-graphics/wayland/{wayland_1.8.1.bb => wayland_1.9.0.bb} (72%)

diff --git a/meta/recipes-graphics/wayland/wayland/always-build-scanner.patch b/meta/recipes-graphics/wayland/wayland/always-build-scanner.patch
deleted file mode 100644
index 5e0e6bf..0000000
--- a/meta/recipes-graphics/wayland/wayland/always-build-scanner.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-build: always build wayland-scanner
-
-The previous idiom for building a cross-compiled Wayland is to build once for
-the build host (with --enable-scanner --disable-libraries) to get a
-wayland-scanner binary that can then be used in a cross-compile (with
---disable-scanner).  The problem with this is that the cross wayland is missing
-a wayland-scanner binary, which means you then can't do any Wayland development
-on the target.
-
-Instead, always build wayland-scanner for the target and change
---enable/disable-scanner to --with/without-host-scanner.  Normal builds use the
-default of --without-host-scanner and run the wayland-scanner it just built, and
-cross-compiled builds pass --with-host-scanner to use a previously built host
-scanner but still get a wayland-scanner to install.
-
-(a theoretically neater solution would be to build two scanners if required (one
-to run and one to install), but automake makes this overly complicated)
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Submitted
-
-diff --git a/Makefile.am b/Makefile.am
-index c19494f..c2d929b 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -64,16 +64,17 @@ nodist_libwayland_client_la_SOURCES =		\
- 
- pkgconfig_DATA += src/wayland-client.pc src/wayland-server.pc
- 
--if ENABLE_SCANNER
--wayland_scanner = $(top_builddir)/wayland-scanner
- bin_PROGRAMS = wayland-scanner
- wayland_scanner_SOURCES = src/scanner.c
- wayland_scanner_CFLAGS = $(EXPAT_CFLAGS) $(AM_CFLAGS)
- wayland_scanner_LDADD = $(EXPAT_LIBS) libwayland-util.la
--$(BUILT_SOURCES) : wayland-scanner
- pkgconfig_DATA += src/wayland-scanner.pc
--else
-+
-+if HOST_SCANNER
- wayland_scanner = wayland-scanner
-+else
-+$(BUILT_SOURCES) : wayland-scanner
-+wayland_scanner = $(top_builddir)/wayland-scanner
- endif
- 
- protocol/%-protocol.c : $(top_srcdir)/protocol/%.xml
-diff --git a/configure.ac b/configure.ac
-index c2a804e..de0b02f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -65,11 +65,11 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
- 	      [[#include <time.h>]])
- AC_CHECK_HEADERS([execinfo.h])
- 
--AC_ARG_ENABLE([scanner],
--              [AC_HELP_STRING([--disable-scanner],
--                              [Disable compilation of wayland-scanner])],
--              [],
--              [enable_scanner=yes])
-+AC_ARG_WITH([host-scanner],
-+            [AC_HELP_STRING([--with-host-scanner],
-+                            [Use a host wayland-scanner])],
-+            [],
-+            [with_host_scanner=no])
- 
- AC_ARG_ENABLE([documentation],
- 	      [AC_HELP_STRING([--disable-documentation],
-@@ -77,25 +77,23 @@ AC_ARG_ENABLE([documentation],
- 	      [],
- 	      [enable_documentation=yes])
- 
--AM_CONDITIONAL(ENABLE_SCANNER, test "x$enable_scanner" = xyes)
-+AM_CONDITIONAL(HOST_SCANNER, test "x$with_host_scanner" = xyes)
- 
- AC_ARG_WITH(icondir, [  --with-icondir=<dir>    Look for cursor icons here],
- 		     [  ICONDIR=$withval],
- 		     [  ICONDIR=${datadir}/icons])
- AC_SUBST([ICONDIR])
- 
--if test "x$enable_scanner" = "xyes"; then
--	PKG_CHECK_MODULES(EXPAT, [expat], [],
--		[AC_CHECK_HEADERS(expat.h, [],
--			[AC_MSG_ERROR([Can't find expat.h. Please install expat.])])
--		 SAVE_LIBS="$LIBS"
--		 AC_SEARCH_LIBS(XML_ParserCreate, expat, [],
--			[AC_MSG_ERROR([Can't find expat library. Please install expat.])])
--		 EXPAT_LIBS="$LIBS"
--		 LIBS="$SAVE_LIBS"
--		 AC_SUBST(EXPAT_LIBS)
--		])
--fi
-+PKG_CHECK_MODULES(EXPAT, [expat], [],
-+	[AC_CHECK_HEADERS(expat.h, [],
-+		[AC_MSG_ERROR([Can't find expat.h. Please install expat.])])
-+	 SAVE_LIBS="$LIBS"
-+	 AC_SEARCH_LIBS(XML_ParserCreate, expat, [],
-+		[AC_MSG_ERROR([Can't find expat library. Please install expat.])])
-+	 EXPAT_LIBS="$LIBS"
-+	 LIBS="$SAVE_LIBS"
-+	 AC_SUBST(EXPAT_LIBS)
-+	])
- 
- AC_PATH_PROG(XSLTPROC, xsltproc)
- AM_CONDITIONAL([HAVE_XSLTPROC], [test "x$XSLTPROC" != "x"])
diff --git a/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
deleted file mode 100644
index cd8bc55..0000000
--- a/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-disable macro checks not used for scanner
-
-We only build wayland-native for the scanner, so disable the bits we don't
-actually need. This avoid build issue on older distro such as Centos 5.x:
-| error: 'O_CLOEXEC' undeclared (first use in this function)
-| error: sys/timerfd.h: No such file or directory
-| error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
-| error: 'TFD_CLOEXEC' undeclared (first use in this function)
-| error: 'SFD_CLOEXEC' undeclared (first use in this function)
-
-Upstream-Status: Pending
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
----
- configure.ac | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -41,16 +41,16 @@ AC_SUBST(GCC_CFLAGS)
- 
- AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate])
- 
--AC_CHECK_DECL(SFD_CLOEXEC,[],
--	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
--	      [[#include <sys/signalfd.h>]])
--AC_CHECK_DECL(TFD_CLOEXEC,[],
--	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
--	      [[#include <sys/timerfd.h>]])
--AC_CHECK_DECL(CLOCK_MONOTONIC,[],
--	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
--	      [[#include <time.h>]])
--AC_CHECK_HEADERS([execinfo.h])
-+##AC_CHECK_DECL(SFD_CLOEXEC,[],
-+#	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
-+#	      [[#include <sys/signalfd.h>]])
-+#AC_CHECK_DECL(TFD_CLOEXEC,[],
-+#	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
-+#	      [[#include <sys/timerfd.h>]])
-+#AC_CHECK_DECL(CLOCK_MONOTONIC,[],
-+#	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
-+#	      [[#include <time.h>]])
-+#AC_CHECK_HEADERS([execinfo.h])
- 
- AC_ARG_ENABLE([scanner],
-               [AC_HELP_STRING([--disable-scanner],
--- 
-1.8.3.2
-
diff --git a/meta/recipes-graphics/wayland/wayland_1.8.1.bb b/meta/recipes-graphics/wayland/wayland_1.9.0.bb
similarity index 72%
rename from meta/recipes-graphics/wayland/wayland_1.8.1.bb
rename to meta/recipes-graphics/wayland/wayland_1.9.0.bb
index 0f9a0aa..d12ac18 100644
--- a/meta/recipes-graphics/wayland/wayland_1.8.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.9.0.bb
@@ -7,18 +7,14 @@ be traditional applications, X servers (rootless or fullscreen) or other \
 display servers."
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
-                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://always-build-scanner.patch"
-SRC_URI[md5sum] = "6e877877c3e04cfb865cfcd0733c9ab1"
-SRC_URI[sha256sum] = "f17c938d1c24fd0a10f650a623a2775d329db3168b5732e498b08388ec776fc8"
-
-SRC_URI_append_class-native = " \
-    file://disable-macro-checks-not-used-for-scanner.patch \
-    "
-EXTRA_OECONF_class-native = "--disable-documentation"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
+                    file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "5e141b3f2a7005d6c89d6f233c87c317"
+SRC_URI[sha256sum] = "9c8770720aa0034479735f58a4dc4ca9b172ecfede28f5134312e135b7301efa"
+
+EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
 inherit autotools pkgconfig
 
-- 
2.2.0


