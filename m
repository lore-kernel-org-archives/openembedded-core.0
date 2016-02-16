Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E6F5A65CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 20:56:14 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b205so127859664wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 12:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=U1+DE78xP4b1lVHw1+hz4nq5W8YKgDdaGldZXCY7b9M=;
	b=gEKRdN2Nyub3XNkVGOd9ZeJKv7TnaFz5ElHe+9BEKyg1jx7Gn1PGepJpz7BL1+CUbI
	LHn5jWk6QXqyi6JN6t93BrBHLalgjJjzBwrU0PjA/f1fiMsZvSb21qYLnzI2HH7wjJWj
	96EGfkX1+9RLCq6V0ynHBZ6MoHGhcsmdd5vsBLJ4ztK2oxRq2NFQiOdPklkncxRVGbfy
	n4KJ/HJwZkUrz3BlBDaVK5nz6rfQYRhOsXpzmZ25Z+1BsqTTenFL9FgJrKUkPnaC+xum
	jCkmpvhooT6YmUeqizgmzGJhqpyC3yO7lONB8fOHu6hg6eE3deBjAbEyfUoh+c0FUkk5
	1KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U1+DE78xP4b1lVHw1+hz4nq5W8YKgDdaGldZXCY7b9M=;
	b=VmU/olhrZGDABXHz4PGAfj+0pF6PR7lLkVSSHhVdA1kjUgh6np4Db0BKxTvFG7ui9m
	n6i9RT5uxz8aAkJWCKv3O672oqA6zrirWEdnxSl7swikmINr/7Jb3fltqnSp3OfRLBRs
	WZwOMB8Zop9bwfuX8zE1C5HqKy6E900NM490Avbpj8i+o2bEHLGh++B57D7fFZzUdVV/
	7jvR9mAms5B2w9OCLvEL0rxwg+0TFiWsZw5Db+qY0pFFyP0kB5KCx2RfxquVUeMXccrJ
	l/p+6WBH5JqV96dbET0fmlYCXo+xIiwBYBuBHQcLHWhP0OQuGJ5hPqJItWK2yG3V3Y6N
	fS9A==
X-Gm-Message-State: AG10YORpQCFH4tQ5q/kaJu8weGETomjJjeLstgZ5QOeV1LZDSgS38nxeIuA02uL7AON7Maw+
X-Received: by 10.194.52.8 with SMTP id p8mr23826253wjo.62.1455656174957;
	Tue, 16 Feb 2016 12:56:14 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m67sm22113221wma.10.2016.02.16.12.56.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Feb 2016 12:56:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 20:56:08 +0000
Message-Id: <1455656169-17396-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] glew: rewrite to use upstream build system
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
X-List-Received-Date: Tue, 16 Feb 2016 20:56:15 -0000

Instead of patching in a whole new build system using autotools, use the
makefile-based system in upstream with careful variable assignments so that it
cross-compiles correctly.  One small patch was required to stop an unavoidable
strip.

Upstream does have a cmake-based build but it's not used or supported by the
maintainer, and is quite buggy (for example: doesn't version the libraries,
fails to link to required libraries).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/glew/glew/autotools.patch    | 149 ---------------------
 .../glew/glew/fix-glew.pc-install.patch            |  46 -------
 .../glew/glew/glew_fix_for_automake-1.12.patch     |  25 ----
 meta/recipes-graphics/glew/glew/no-strip.patch     |  12 ++
 meta/recipes-graphics/glew/glew_1.12.0.bb          |  28 +++-
 5 files changed, 33 insertions(+), 227 deletions(-)
 delete mode 100644 meta/recipes-graphics/glew/glew/autotools.patch
 delete mode 100644 meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
 delete mode 100644 meta/recipes-graphics/glew/glew/glew_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-graphics/glew/glew/no-strip.patch

diff --git a/meta/recipes-graphics/glew/glew/autotools.patch b/meta/recipes-graphics/glew/glew/autotools.patch
deleted file mode 100644
index 7dfe087..0000000
--- a/meta/recipes-graphics/glew/glew/autotools.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: glew/Makefile.am
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/Makefile.am	2009-12-02 00:30:23.296641663 +0100
-@@ -0,0 +1,5 @@
-+
-+ACLOCAL_AMFLAGS = -I m4 --install
-+
-+SUBDIRS = include src
-+
-Index: glew/configure.ac
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/configure.ac	2009-12-02 00:30:23.296641663 +0100
-@@ -0,0 +1,67 @@
-+#                                               -*- Autoconf -*-
-+# Process this file with autoconf to produce a configure script.
-+
-+AC_PREREQ([2.62])
-+AC_INIT([glew], [1.9.0], [BUG-REPORT-ADDRESS])
-+AC_CONFIG_SRCDIR([src/glew.c])
-+AC_CONFIG_HEADERS([config.h])
-+AM_INIT_AUTOMAKE([-Wall -Werror foreign])
-+AC_CONFIG_MACRO_DIR([m4])
-+
-+LT_INIT
-+
-+# Checks for programs.
-+AC_PROG_CC
-+AC_PROG_INSTALL
-+AC_PROG_LN_S
-+
-+# Checks for libraries.
-+
-+# Checks for header files.
-+AC_CHECK_HEADERS([inttypes.h stddef.h stdint.h stdlib.h string.h])
-+
-+# Checks for typedefs, structures, and compiler characteristics.
-+AC_TYPE_INT32_T
-+AC_TYPE_INT64_T
-+AC_TYPE_UINT64_T
-+AC_CHECK_TYPES([ptrdiff_t])
-+
-+# Checks for library functions.
-+AC_FUNC_MALLOC
-+AC_CHECK_FUNCS([strtol])
-+
-+# Check for pkgconfig libs
-+
-+PKG_CHECK_MODULES([X11], [x11])
-+AC_SUBST([X11_LIBS])
-+AC_SUBST([X11_CFLAGS])
-+
-+PKG_CHECK_MODULES([XMU], [xmu])
-+AC_SUBST([XMU_LIBS])
-+AC_SUBST([XMU_CFLAGS])
-+
-+PKG_CHECK_MODULES([XI], [xi])
-+AC_SUBST([XI_LIBS])
-+AC_SUBST([XI_CFLAGS])
-+
-+PKG_CHECK_MODULES([XEXT], [xext])
-+AC_SUBST([XEXT_LIBS])
-+AC_SUBST([XEXT_CFLAGS])
-+
-+# Check for GLU is enough and imples gl so no doubled -lGL in LDFLAGS
-+PKG_CHECK_MODULES([GLU], [glu])
-+AC_SUBST([GLU_LIBS])
-+AC_SUBST([GLU_CFLAGS])
-+
-+# ENABLE option for Multiple Rendering Contexts support
-+AC_CHECK_ENABLE_GLEWMX
-+
-+# for now we use the same version as the package, but that should be avoided
-+# in the future
-+
-+AC_SUBST([LIBGLEW_SO_VERSION], [1:9:0])
-+
-+AC_CONFIG_FILES([Makefile
-+                 include/Makefile
-+                 src/Makefile])
-+AC_OUTPUT
-Index: glew/src/Makefile.am
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/src/Makefile.am	2009-12-02 00:33:48.690786110 +0100
-@@ -0,0 +1,35 @@
-+
-+AM_CPPFLAGS = -I$(top_srcdir)/include
-+
-+if ENABLE_GLEWMX
-+AM_CPPFLAGS += -DGLEW_MX
-+endif
-+
-+AM_CFLAGS = @X11_CFLAGS@ \
-+            @XMU_CFLAGS@ \
-+            @XI_CFLAGS@ \
-+            @XEXT_CFLAGS@ \
-+            @GLU_CFLAGS@
-+
-+lib_LTLIBRARIES = libGLEW.la
-+
-+libGLEW_la_SOURCES = glew.c
-+
-+libGLEW_la_LIBADD = @X11_LIBS@ \
-+                    @XMU_LIBS@ \
-+                    @XI_LIBS@ \
-+                    @XEXT_LIBS@ \
-+                    @GLU_LIBS@
-+
-+libGLEW_la_LDFLAGS = -version-number @LIBGLEW_SO_VERSION@
-+
-+bin_PROGRAMS = glewinfo visualinfo
-+
-+glewinfo_SOURCES = glewinfo.c
-+
-+glewinfo_LDADD = libGLEW.la
-+
-+visualinfo_SOURCES =  visualinfo.c
-+
-+visualinfo_LDADD = libGLEW.la
-+
-Index: glew/m4/glewmx.m4
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/m4/glewmx.m4	2009-12-02 00:30:23.296641663 +0100
-@@ -0,0 +1,11 @@
-+
-+AC_DEFUN([AC_CHECK_ENABLE_GLEWMX],[
-+AC_MSG_CHECKING([whether to include Multiple Rendering Contexts support])
-+AC_ARG_ENABLE([glewmx],
-+   [AS_HELP_STRING([--enable-glewmx], [enable GLEW Multiple Rendering Contexts (default is no)])],
-+   [ENABLE_GLEWMX="$enableval"],
-+   [ENABLE_GLEWMX="no"])
-+AC_MSG_RESULT([${ENABLE_GLEWMX}])
-+AM_CONDITIONAL([ENABLE_GLEWMX], [test x"${ENABLE_GLEWMX}" = "xyes"])
-+])
-+
-Index: glew/include/Makefile.am
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/include/Makefile.am	2009-12-02 00:30:23.296641663 +0100
-@@ -0,0 +1,3 @@
-+
-+nobase_include_HEADERS = GL/glew.h  GL/glxew.h  GL/wglew.h
-+
diff --git a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
deleted file mode 100644
index fea071d..0000000
--- a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-
-We maintain the autotools configure.ac and Makefile.am, to correctly
-provide the glew.pc, the following patch is needed.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: glew-1.11.0/Makefile.am
-===================================================================
---- glew-1.11.0.orig/Makefile.am
-+++ glew-1.11.0/Makefile.am
-@@ -3,3 +3,5 @@ ACLOCAL_AMFLAGS = -I m4 --install
- 
- SUBDIRS = include src
- 
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = glew.pc
-Index: glew-1.11.0/configure.ac
-===================================================================
---- glew-1.11.0.orig/configure.ac
-+++ glew-1.11.0/configure.ac
-@@ -66,5 +66,6 @@ AC_SUBST([LIBGLEW_SO_VERSION], [1:9:0])
- 
- AC_CONFIG_FILES([Makefile
-                  include/Makefile
--                 src/Makefile])
-+                 src/Makefile
-+                 glew.pc])
- AC_OUTPUT
-Index: glew-1.11.0/glew.pc.in
-===================================================================
---- glew-1.11.0.orig/glew.pc.in
-+++ glew-1.11.0/glew.pc.in
-@@ -5,7 +5,7 @@ includedir=${prefix}/include/GL
- 
- Name: glew
- Description: The OpenGL Extension Wrangler library
--Version: @version@
--Cflags: -I${includedir} @cflags@
--Libs: -L${libdir} -l@libname@
--Requires: @requireslib@
-+Version: @VERSION@
-+Cflags: -I${includedir}
-+Libs: -L${libdir} -lGLEW
-+Requires: glu
diff --git a/meta/recipes-graphics/glew/glew/glew_fix_for_automake-1.12.patch b/meta/recipes-graphics/glew/glew/glew_fix_for_automake-1.12.patch
deleted file mode 100644
index 0707efb..0000000
--- a/meta/recipes-graphics/glew/glew/glew_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-This patch fixes following issue with automake 1.12
-
-| automake: warnings are treated as errors
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libGLEW.la': linking libtool libraries using a non-POSIX
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/03
-
-Index: glew-1.7.0/configure.ac
-===================================================================
---- glew-1.7.0.orig/configure.ac
-+++ glew-1.7.0/configure.ac
-@@ -14,6 +14,9 @@ LT_INIT
- AC_PROG_CC
- AC_PROG_INSTALL
- AC_PROG_LN_S
-+# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
-+m4_pattern_allow([AM_PROG_AR])
-+AM_PROG_AR
- 
- # Checks for libraries.
- 
diff --git a/meta/recipes-graphics/glew/glew/no-strip.patch b/meta/recipes-graphics/glew/glew/no-strip.patch
new file mode 100644
index 0000000..e411f11
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/no-strip.patch
@@ -0,0 +1,12 @@
+Don't forcibly strip the binaries.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Pending
+
+diff --git a/Makefile b/Makefile
+index 6a9803c..170c0ce 100644
+--- a/Makefile
++++ b/Makefile
+@@ -285 +285 @@ install.bin: glew.bin
+-	$(INSTALL) -s -m 0755 bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN) "$(DESTDIR)$(BINDIR)/"
++	$(INSTALL) -m 0755 bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN) "$(DESTDIR)$(BINDIR)/"
diff --git a/meta/recipes-graphics/glew/glew_1.12.0.bb b/meta/recipes-graphics/glew/glew_1.12.0.bb
index ef416ec..f1707d6 100644
--- a/meta/recipes-graphics/glew/glew_1.12.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.12.0.bb
@@ -8,12 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
 
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
-           file://autotools.patch \
-           file://glew_fix_for_automake-1.12.patch \
-           file://fix-glew.pc-install.patch \
-          "
+           file://no-strip.patch"
 
 SRC_URI[md5sum] = "01246c7ecd135d99be031aa63f86dca1"
 SRC_URI[sha256sum] = "af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b30911edbc7344f48e4bf"
@@ -21,6 +17,24 @@ SRC_URI[sha256sum] = "af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b30911edbc7344f
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
 UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
 
-inherit autotools lib_package pkgconfig distro_features_check
-# depends on virtual/libx11
+inherit lib_package pkgconfig distro_features_check
+
 REQUIRED_DISTRO_FEATURES = "x11"
+
+# Override SYSTEM to avoid calling config.guess, we're cross-compiling.  Pass
+# our CFLAGS via POPT as that's the optimisation variable and safely
+# overwritten.
+EXTRA_OEMAKE = "SYSTEM='linux' \
+                CC='${CC}' LD='${CC}' STRIP='' \
+                LDFLAGS.EXTRA='${LDFLAGS}' \
+                POPT='${CFLAGS}' \
+                GLEW_PREFIX='${prefix}' BINDIR='${bindir}' \
+                LIBDIR='${libdir}' INCDIR='${includedir}/GL'"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install.all
+}
-- 
2.7.0


