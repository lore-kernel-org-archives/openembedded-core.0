Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 79FC960017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 22:31:26 +0000 (UTC)
Received: by wiar9 with SMTP id r9so83236933wia.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 15:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lbkGp6vShS3CYRC+4sZCAWhFUQroZzijJVDRYJDfPA4=;
	b=jfK+Rl7BHGsoBw0a7E7P3udRnfn+u0baxkQYtSUHLK/MN5xgh0aQdymnQNUeqmg+sl
	+eooFC9xM6ZO4u0IV431SUPILIohXCzk179Dz64L/lcVW+F1vrlpM7bhH82TlLovITxZ
	tjDUpqRT5jWziZUQKgEUwm4Vk/l1yLwhW2FMgdBdOFQo89QPnu/QvK91AK0yMC93bZLm
	PbH98L86u8LXhkU+aLPgN1MnDhc7A6rpmxCede81dCqxtdGff4uLv+urXrxHG1H6ngdB
	u4Kj0yaQNj8R/3r7C117fKrtISuJ0n69bFV3GxiBnP2KKyG8dRTrdel/hLhcjwy7ktJe
	We7A==
X-Gm-Message-State: ALoCoQnj9/5vNjo2kWkSLBFw2rvmE8rSLWdVG/4ynE8TvhXNsTXWTgYmsKTFd+Aj1BNlepEoMlDe
X-Received: by 10.194.59.98 with SMTP id y2mr53579154wjq.42.1435789886747;
	Wed, 01 Jul 2015 15:31:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id a19sm24014590wiv.2.2015.07.01.15.31.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 15:31:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 23:26:02 +0100
Message-Id: <1435789563-9701-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] wayland: always build wayland-scanner
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
X-List-Received-Date: Wed, 01 Jul 2015 22:31:30 -0000

By passing --disable-scanner to use a native wayland-scanner binary a target
wayland-scanner binary isn't built, which is a problem if you want to use it on
the target or in a SDK.

Instead, always build a target wayland-scanner binary, and have an option to
control whether that binary or a host-provided binary is used at build time.

[ YOCTO #7931 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/wayland/always-build-scanner.patch     | 105 +++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.8.1.bb     |  10 +-
 2 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland/always-build-scanner.patch

diff --git a/meta/recipes-graphics/wayland/wayland/always-build-scanner.patch b/meta/recipes-graphics/wayland/wayland/always-build-scanner.patch
new file mode 100644
index 0000000..5e0e6bf
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/always-build-scanner.patch
@@ -0,0 +1,105 @@
+build: always build wayland-scanner
+
+The previous idiom for building a cross-compiled Wayland is to build once for
+the build host (with --enable-scanner --disable-libraries) to get a
+wayland-scanner binary that can then be used in a cross-compile (with
+--disable-scanner).  The problem with this is that the cross wayland is missing
+a wayland-scanner binary, which means you then can't do any Wayland development
+on the target.
+
+Instead, always build wayland-scanner for the target and change
+--enable/disable-scanner to --with/without-host-scanner.  Normal builds use the
+default of --without-host-scanner and run the wayland-scanner it just built, and
+cross-compiled builds pass --with-host-scanner to use a previously built host
+scanner but still get a wayland-scanner to install.
+
+(a theoretically neater solution would be to build two scanners if required (one
+to run and one to install), but automake makes this overly complicated)
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Submitted
+
+diff --git a/Makefile.am b/Makefile.am
+index c19494f..c2d929b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -64,16 +64,17 @@ nodist_libwayland_client_la_SOURCES =		\
+ 
+ pkgconfig_DATA += src/wayland-client.pc src/wayland-server.pc
+ 
+-if ENABLE_SCANNER
+-wayland_scanner = $(top_builddir)/wayland-scanner
+ bin_PROGRAMS = wayland-scanner
+ wayland_scanner_SOURCES = src/scanner.c
+ wayland_scanner_CFLAGS = $(EXPAT_CFLAGS) $(AM_CFLAGS)
+ wayland_scanner_LDADD = $(EXPAT_LIBS) libwayland-util.la
+-$(BUILT_SOURCES) : wayland-scanner
+ pkgconfig_DATA += src/wayland-scanner.pc
+-else
++
++if HOST_SCANNER
+ wayland_scanner = wayland-scanner
++else
++$(BUILT_SOURCES) : wayland-scanner
++wayland_scanner = $(top_builddir)/wayland-scanner
+ endif
+ 
+ protocol/%-protocol.c : $(top_srcdir)/protocol/%.xml
+diff --git a/configure.ac b/configure.ac
+index c2a804e..de0b02f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,11 +65,11 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+ 	      [[#include <time.h>]])
+ AC_CHECK_HEADERS([execinfo.h])
+ 
+-AC_ARG_ENABLE([scanner],
+-              [AC_HELP_STRING([--disable-scanner],
+-                              [Disable compilation of wayland-scanner])],
+-              [],
+-              [enable_scanner=yes])
++AC_ARG_WITH([host-scanner],
++            [AC_HELP_STRING([--with-host-scanner],
++                            [Use a host wayland-scanner])],
++            [],
++            [with_host_scanner=no])
+ 
+ AC_ARG_ENABLE([documentation],
+ 	      [AC_HELP_STRING([--disable-documentation],
+@@ -77,25 +77,23 @@ AC_ARG_ENABLE([documentation],
+ 	      [],
+ 	      [enable_documentation=yes])
+ 
+-AM_CONDITIONAL(ENABLE_SCANNER, test "x$enable_scanner" = xyes)
++AM_CONDITIONAL(HOST_SCANNER, test "x$with_host_scanner" = xyes)
+ 
+ AC_ARG_WITH(icondir, [  --with-icondir=<dir>    Look for cursor icons here],
+ 		     [  ICONDIR=$withval],
+ 		     [  ICONDIR=${datadir}/icons])
+ AC_SUBST([ICONDIR])
+ 
+-if test "x$enable_scanner" = "xyes"; then
+-	PKG_CHECK_MODULES(EXPAT, [expat], [],
+-		[AC_CHECK_HEADERS(expat.h, [],
+-			[AC_MSG_ERROR([Can't find expat.h. Please install expat.])])
+-		 SAVE_LIBS="$LIBS"
+-		 AC_SEARCH_LIBS(XML_ParserCreate, expat, [],
+-			[AC_MSG_ERROR([Can't find expat library. Please install expat.])])
+-		 EXPAT_LIBS="$LIBS"
+-		 LIBS="$SAVE_LIBS"
+-		 AC_SUBST(EXPAT_LIBS)
+-		])
+-fi
++PKG_CHECK_MODULES(EXPAT, [expat], [],
++	[AC_CHECK_HEADERS(expat.h, [],
++		[AC_MSG_ERROR([Can't find expat.h. Please install expat.])])
++	 SAVE_LIBS="$LIBS"
++	 AC_SEARCH_LIBS(XML_ParserCreate, expat, [],
++		[AC_MSG_ERROR([Can't find expat library. Please install expat.])])
++	 EXPAT_LIBS="$LIBS"
++	 LIBS="$SAVE_LIBS"
++	 AC_SUBST(EXPAT_LIBS)
++	])
+ 
+ AC_PATH_PROG(XSLTPROC, xsltproc)
+ AM_CONDITIONAL([HAVE_XSLTPROC], [test "x$XSLTPROC" != "x"])
diff --git a/meta/recipes-graphics/wayland/wayland_1.8.1.bb b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
index 5b36745..ac631af 100644
--- a/meta/recipes-graphics/wayland/wayland_1.8.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
@@ -10,14 +10,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://always-build-scanner.patch"
 SRC_URI[md5sum] = "6e877877c3e04cfb865cfcd0733c9ab1"
 SRC_URI[sha256sum] = "f17c938d1c24fd0a10f650a623a2775d329db3168b5732e498b08388ec776fc8"
 
 SRC_URI_append_class-native = " \
     file://disable-macro-checks-not-used-for-scanner.patch \
     "
-EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
+EXTRA_OECONF_class-native = "--disable-documentation"
 
 inherit autotools pkgconfig
 
@@ -26,7 +27,7 @@ BBCLASSEXTEND = "native"
 
 DEPENDS = "expat libffi wayland-native"
 
-EXTRA_OECONF = "--disable-documentation --disable-scanner"
+EXTRA_OECONF = "--disable-documentation --with-host-scanner"
 
 # Wayland installs a M4 macro for other projects to use, which uses the target
 # pkg-config to find files.  Replace pkg-config with pkg-config-native.
@@ -40,3 +41,6 @@ sysroot_stage_all_append_class-target () {
 	rm ${SYSROOT_DESTDIR}/${datadir}/aclocal/wayland-scanner.m4
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
 }
+
+FILES_${PN} = "${libdir}/*${SOLIBS}"
+FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
-- 
2.1.4


