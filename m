Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TEnz9-0003A4-Hd
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 23:08:35 +0200
Received: by pbcwy7 with SMTP id wy7so5785813pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 13:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hyDDIz0PYlVDSYK66uzJeGYli8SeaJ5NxH9tXRKey14=;
	b=R2PbtJl5XdPrcWdQCvUvPOXxrKI4Nvqty9vlPRqvQK/WlQZob/vUqV+N7XLiAkFXBT
	pl9BYsYsqxQcGJJBu6+7UKk8c672olG6DVV9kY6hivpUmMT1PyoykiEX7sVtULOwwme0
	61dquZfAVRII5WKoT2zcfKihpipNo2M79VMwM3fNwVJBQ1Upk71F9FQqf4GmG00PL3HL
	eIkwHXmwQksEnrf+xSLNPwlvFkEJ33v6nGddKY2677lH1aZYU5AlBFKi143HVK04omlk
	S6kUt+mDGzJGxdxmetWlQSkT0CLu4/lQAu/IjKPzFpO0r1lmO33nu6LobxcU9yHKx2Gv
	Snjg==
Received: by 10.68.190.8 with SMTP id gm8mr10034876pbc.74.1348174551856;
	Thu, 20 Sep 2012 13:55:51 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id e8sm2953124pay.13.2012.09.20.13.55.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Sep 2012 13:55:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 13:54:35 -0700
Message-Id: <1348174475-7563-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc: Use 4.7.2 release tarball
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 21:08:35 -0000

This avoids the SVN or git fetcher issues for gcc
and the tar is mirrored around the world so it will
not be slow

Fixes [YOCTO #2908]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   15 ++---
 .../gcc/gcc-4.7/fix-g++-sysroot.patch              |   24 +++----
 .../gcc-4.7/gcc-poison-system-directories.patch    |   66 ++++++++++----------
 meta/recipes-devtools/gcc/gcc-common.inc           |    9 +--
 4 files changed, 56 insertions(+), 58 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 7a731db..1a3e09b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -8,10 +8,7 @@ PR = "r13"
 # on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
 # to reflect that change
 
-# using 4.7.1.0 for upgrade path when we move past 4.7.2 release
-# then we should drop the last 0 as well.
-
-PV = "4.7.1.0+git${SRCPV}"
+PV = "4.7.2"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
@@ -21,8 +18,6 @@ PV = "4.7.1.0+git${SRCPV}"
 
 BINV = "4.7.2"
 
-SRCREV = "d07e24f4ab59f264d68d21838795349faab5dede"
-BRANCH = "gcc-4_7-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 
 DEPENDS =+ "mpfr gmp libmpc"
@@ -36,7 +31,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
-SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
@@ -80,9 +75,11 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
 	   file://0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch \
 	   file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
 	  "
+SRC_URI[md5sum] = "cc308a0891e778cfda7a151ab8a6e762"
+SRC_URI[sha256sum] = "8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
-B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
 FORTRAN = ""
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
index 116f137..aad234c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
@@ -6,10 +6,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: gcc-4_7-branch/gcc/configure.ac
+Index: gcc-4.7.2/gcc/configure.ac
 ===================================================================
---- gcc-4_7-branch.orig/gcc/configure.ac	2012-06-20 00:21:52.182955919 -0700
-+++ gcc-4_7-branch/gcc/configure.ac	2012-06-20 00:28:01.386973785 -0700
+--- gcc-4.7.2.orig/gcc/configure.ac	2012-09-20 07:42:30.284941174 -0700
++++ gcc-4.7.2/gcc/configure.ac	2012-09-20 07:55:23.148970564 -0700
 @@ -118,6 +118,72 @@
  	local_prefix=/usr/local
  fi
@@ -163,10 +163,10 @@ Index: gcc-4_7-branch/gcc/configure.ac
  AC_ARG_WITH(specs,
    [AS_HELP_STRING([--with-specs=SPECS],
                    [add SPECS to driver command-line processing])],
-Index: gcc-4_7-branch/gcc/configure
+Index: gcc-4.7.2/gcc/configure
 ===================================================================
---- gcc-4_7-branch.orig/gcc/configure	2012-06-20 00:27:18.778971725 -0700
-+++ gcc-4_7-branch/gcc/configure	2012-06-20 00:28:06.634974041 -0700
+--- gcc-4.7.2.orig/gcc/configure	2012-09-20 07:42:30.284941174 -0700
++++ gcc-4.7.2/gcc/configure	2012-09-20 07:55:31.788970893 -0700
 @@ -757,10 +757,6 @@
  REPORT_BUGS_TO
  PKGVERSION
@@ -408,21 +408,21 @@ Index: gcc-4_7-branch/gcc/configure
  # Check whether --with-specs was given.
  if test "${with_specs+set}" = set; then :
    withval=$with_specs; CONFIGURE_SPECS=$withval
-@@ -17973,7 +17979,7 @@
+@@ -18013,7 +18019,7 @@
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 17976 "configure"
-+#line 17982 "configure"
+-#line 18016 "configure"
++#line 18022 "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -18079,7 +18085,7 @@
+@@ -18119,7 +18125,7 @@
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 18082 "configure"
-+#line 18088 "configure"
+-#line 18122 "configure"
++#line 18128 "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch
index b66b23b..82a55c9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch
@@ -27,10 +27,10 @@ Upstream-Status: Inappropriate [distribution: codesourcery]
        ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of
        /usr/include, /usr/local/include or /usr/X11R6/include.
 
-Index: gcc-4_7-branch/gcc/common.opt
+Index: gcc-4.7.2/gcc/common.opt
 ===================================================================
---- gcc-4_7-branch.orig/gcc/common.opt	2012-04-10 10:54:04.000000000 -0700
-+++ gcc-4_7-branch/gcc/common.opt	2012-04-10 10:56:02.259442274 -0700
+--- gcc-4.7.2.orig/gcc/common.opt	2012-08-06 07:34:27.000000000 -0700
++++ gcc-4.7.2/gcc/common.opt	2012-09-20 07:40:54.708937540 -0700
 @@ -582,6 +582,10 @@
  Common Var(warn_padded) Warning
  Warn when padding is required to align structure members
@@ -42,10 +42,10 @@ Index: gcc-4_7-branch/gcc/common.opt
  Wshadow
  Common Var(warn_shadow) Warning
  Warn when one local variable shadows another
-Index: gcc-4_7-branch/gcc/config.in
+Index: gcc-4.7.2/gcc/config.in
 ===================================================================
---- gcc-4_7-branch.orig/gcc/config.in	2012-04-10 10:54:04.000000000 -0700
-+++ gcc-4_7-branch/gcc/config.in	2012-04-10 10:56:02.259442274 -0700
+--- gcc-4.7.2.orig/gcc/config.in	2012-09-20 00:23:55.000000000 -0700
++++ gcc-4.7.2/gcc/config.in	2012-09-20 07:40:54.708937540 -0700
 @@ -144,6 +144,12 @@
  #endif
  
@@ -59,11 +59,11 @@ Index: gcc-4_7-branch/gcc/config.in
  /* Define if you want all operations on RTL (the basic data structure of the
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
-Index: gcc-4_7-branch/gcc/configure.ac
+Index: gcc-4.7.2/gcc/configure.ac
 ===================================================================
---- gcc-4_7-branch.orig/gcc/configure.ac	2012-04-10 10:55:32.000000000 -0700
-+++ gcc-4_7-branch/gcc/configure.ac	2012-04-10 10:56:02.259442274 -0700
-@@ -4959,6 +4959,16 @@
+--- gcc-4.7.2.orig/gcc/configure.ac	2012-09-20 07:30:27.000000000 -0700
++++ gcc-4.7.2/gcc/configure.ac	2012-09-20 07:40:54.708937540 -0700
+@@ -4989,6 +4989,16 @@
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -80,10 +80,10 @@ Index: gcc-4_7-branch/gcc/configure.ac
  # Substitute configuration variables
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
-Index: gcc-4_7-branch/gcc/doc/invoke.texi
+Index: gcc-4.7.2/gcc/doc/invoke.texi
 ===================================================================
---- gcc-4_7-branch.orig/gcc/doc/invoke.texi	2012-04-10 10:54:04.000000000 -0700
-+++ gcc-4_7-branch/gcc/doc/invoke.texi	2012-04-10 10:56:02.263442231 -0700
+--- gcc-4.7.2.orig/gcc/doc/invoke.texi	2012-09-14 13:45:27.000000000 -0700
++++ gcc-4.7.2/gcc/doc/invoke.texi	2012-09-20 07:40:54.712937541 -0700
 @@ -260,6 +260,7 @@
  -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
  -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
@@ -92,7 +92,7 @@ Index: gcc-4_7-branch/gcc/doc/invoke.texi
  -Wredundant-decls @gol
  -Wreturn-type  -Wsequence-point  -Wshadow @gol
  -Wsign-compare  -Wsign-conversion  -Wstack-protector @gol
-@@ -3878,6 +3879,14 @@
+@@ -3879,6 +3880,14 @@
   for most targets, it is made up of code and thus requires the stack
   to be made executable in order for the program to work properly.
  
@@ -107,10 +107,10 @@ Index: gcc-4_7-branch/gcc/doc/invoke.texi
  @item -Wfloat-equal
  @opindex Wfloat-equal
  @opindex Wno-float-equal
-Index: gcc-4_7-branch/gcc/gcc.c
+Index: gcc-4.7.2/gcc/gcc.c
 ===================================================================
---- gcc-4_7-branch.orig/gcc/gcc.c	2012-04-10 10:54:04.000000000 -0700
-+++ gcc-4_7-branch/gcc/gcc.c	2012-04-10 10:56:02.267442207 -0700
+--- gcc-4.7.2.orig/gcc/gcc.c	2012-08-06 07:34:27.000000000 -0700
++++ gcc-4.7.2/gcc/gcc.c	2012-09-20 07:40:54.716937541 -0700
 @@ -673,6 +673,8 @@
      %{flto} %{flto=*} %l " LINK_PIE_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
@@ -120,10 +120,10 @@ Index: gcc-4_7-branch/gcc/gcc.c
      %{static:} %{L*} %(mfwrap) %(link_libgcc) %o\
      %{fopenmp|ftree-parallelize-loops=*:%:include(libgomp.spec)%(link_gomp)}\
      %{fgnu-tm:%:include(libitm.spec)%(link_itm)}\
-Index: gcc-4_7-branch/gcc/incpath.c
+Index: gcc-4.7.2/gcc/incpath.c
 ===================================================================
---- gcc-4_7-branch.orig/gcc/incpath.c	2012-04-10 10:54:04.000000000 -0700
-+++ gcc-4_7-branch/gcc/incpath.c	2012-04-10 10:56:02.267442207 -0700
+--- gcc-4.7.2.orig/gcc/incpath.c	2012-01-26 15:34:58.000000000 -0800
++++ gcc-4.7.2/gcc/incpath.c	2012-09-20 07:40:54.716937541 -0700
 @@ -361,6 +361,24 @@
  	}
        fprintf (stderr, _("End of search list.\n"));
@@ -149,10 +149,10 @@ Index: gcc-4_7-branch/gcc/incpath.c
  }
  
  /* Use given -I paths for #include "..." but not #include <...>, and
-Index: gcc-4_7-branch/gcc/Makefile.in
+Index: gcc-4.7.2/gcc/Makefile.in
 ===================================================================
---- gcc-4_7-branch.orig/gcc/Makefile.in	2012-04-10 10:54:05.000000000 -0700
-+++ gcc-4_7-branch/gcc/Makefile.in	2012-04-10 10:56:02.267442207 -0700
+--- gcc-4.7.2.orig/gcc/Makefile.in	2012-08-06 07:34:27.000000000 -0700
++++ gcc-4.7.2/gcc/Makefile.in	2012-09-20 07:40:54.716937541 -0700
 @@ -2065,7 +2065,7 @@
  
  incpath.o: incpath.c incpath.h $(CONFIG_H) $(SYSTEM_H) $(CPPLIB_H) \
@@ -162,10 +162,10 @@ Index: gcc-4_7-branch/gcc/Makefile.in
  
  CFLAGS-prefix.o += -DPREFIX=\"$(prefix)\" -DBASEVER=$(BASEVER_s)
  prefix.o: prefix.c $(CONFIG_H) $(SYSTEM_H) coretypes.h prefix.h \
-Index: gcc-4_7-branch/gcc/configure
+Index: gcc-4.7.2/gcc/configure
 ===================================================================
---- gcc-4_7-branch.orig/gcc/configure	2012-04-10 10:55:32.000000000 -0700
-+++ gcc-4_7-branch/gcc/configure	2012-04-10 10:56:12.183442720 -0700
+--- gcc-4.7.2.orig/gcc/configure	2012-09-20 07:30:27.000000000 -0700
++++ gcc-4.7.2/gcc/configure	2012-09-20 07:41:08.548938066 -0700
 @@ -914,6 +914,7 @@
  with_system_zlib
  enable_maintainer_mode
@@ -183,25 +183,25 @@ Index: gcc-4_7-branch/gcc/configure
    --enable-plugin         enable plugin support
    --disable-libquadmath-support
                            disable libquadmath support for Fortran
-@@ -17970,7 +17973,7 @@
+@@ -18010,7 +18013,7 @@
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 17973 "configure"
-+#line 17976 "configure"
+-#line 18013 "configure"
++#line 18016 "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -18076,7 +18079,7 @@
+@@ -18116,7 +18119,7 @@
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 18079 "configure"
-+#line 18082 "configure"
+-#line 18119 "configure"
++#line 18122 "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -27075,6 +27078,19 @@
+@@ -27129,6 +27132,19 @@
  fi
  
  
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 72180db..2ec141e 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -43,10 +43,11 @@ SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
 DEBIANNAME_libgcc = "libgcc1"
 
 MIRRORS =+ "\
-${GNU_MIRROR}/gcc/releases/    ftp://gcc.gnu.org/pub/gcc/releases/ \n \
-${GNU_MIRROR}/gcc/	http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \n \
-${GNU_MIRROR}/gcc/releases/    http://gcc.get-software.com/releases/ \n \
-${GNU_MIRROR}/gcc/	http://gcc.get-software.com/releases/ \n \
+${GNU_MIRROR}/gcc    ftp://gcc.gnu.org/pub/gcc/releases/ \n \
+${GNU_MIRROR}/gcc	ftp://gd.tuwien.ac.at/gnu/gcc/ \n \
+${GNU_MIRROR}/gcc	http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \n \
+${GNU_MIRROR}/gcc   http://gcc.get-software.com/releases/ \n \
+${GNU_MIRROR}/gcc	http://gcc.get-software.com/releases/ \n \
 "
 
 #
-- 
1.7.9.5



