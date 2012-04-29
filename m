Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SObno-0007Wc-Ly
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 23:37:08 +0200
Received: by wera1 with SMTP id a1so1643831wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=S2xW6CukvoswMmfgnXhy578T8/HmyevoxMLE1mmPbnw=;
	b=c0yfIDxPHeLsz77P1SwoXurz89ce4px3qRL2hp4Wz0JRi2nhGDT2Jtzn/q/C/wBK1H
	aHiFbn9Jeh1L8TQh1MpJllxKPumqg2RDrh0a1VqtCmbXJRqY7bUCo12BNsUbl9R7WTn2
	azpggek/AXlRQ5C6a8hL1l86htakzCdZPvnVSt4+AizU166hyV06jh4xFxWmGVuKjaWZ
	1Gh6obtnVNGP8swE83+baVB3OX/xexRNCIxXQsYlUaYcNXlMwkF7g0SoC34V0ghqGUnf
	0LOXaJVO1mpKMPtmB3VXEBefyPdxhqWkoAiIf3BqEIXgUvt3epwVwdjFPv3R20+dGWOb
	azow==
Received: by 10.216.135.97 with SMTP id t75mr11190992wei.60.1335734847461;
	Sun, 29 Apr 2012 14:27:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h8sm37431904wix.4.2012.04.29.14.27.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 14:27:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2012 23:27:16 +0200
Message-Id: <aaa5eab3838d2b85d4e1316afdd91d354527ae20.1335734193.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335734193.git.Martin.Jansa@gmail.com>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335734193.git.Martin.Jansa@gmail.com>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] glib-2.0: upgrade to 2.32.1
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
X-List-Received-Date: Sun, 29 Apr 2012 21:37:08 -0000

* g_once_init_enter.patch shouldn't be needed after upstream commit
  794c1a30bc27b4c8d77537813acb1213d5ac80f2

* LIC_FILES_CHKSUM change is only because PCRE was upgraded and now
  pcre.h says "Copyright (c) 1997-2012 University of Cambridge" instead
  of 2010 and COPYING file
  "Please see the file LICENCE in the PCRE distribution for licensing
  details."  but LICENSE file is not part of glib distribution (but still
  BSD in standalone PCRE)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../glib-2.0/glib-2.0/configure-libtool.patch      |   54 ++++++++++++++------
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 ---------
 .../{glib-2.0_2.30.3.bb => glib-2.0_2.32.1.bb}     |    6 +--
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 4 files changed, 41 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.3.bb => glib-2.0_2.32.1.bb} (91%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
index c21e378..1d69a3f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
@@ -1,15 +1,31 @@
-# Poky renames libtool to $host_alias-libtool.
-# ./$host_alias-libtool isn't created until after configure runs with libtool >= 2.2.2
-# so we can't call # it at this point. We can safely assume a version is available
-# from PATH though
-# Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
+From 1c5718648d49e795efee91c220a2bf9386c184f2 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 28 Apr 2012 18:24:50 +0200
+Subject: [PATCH] configure: use $host_alias-libtool instead of libtool
+ directly
+
+Poky renames libtool to $host_alias-libtool.
+./$host_alias-libtool isn't created until after configure runs with
+libtool >= 2.2.2
+so we can't call # it at this point. We can safely assume a version is
+available
+from PATH though
+
+Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
+Rebased to glib-2.32.1 by Martin Jansa <Martin.Jansa@gmail.com>
 
 Upstream-Status: Inappropriate [configuration]
 
-diff -ruN glib-2.27.3-orig/configure.ac glib-2.27.3/configure.ac
---- glib-2.27.3-orig/configure.ac	2010-11-03 11:02:05.000000000 +0800
-+++ glib-2.27.3/configure.ac	2010-11-16 12:38:12.610485990 +0800
-@@ -1385,7 +1385,7 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a6478c6..9a93d60 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1470,7 +1470,7 @@ if test x"$glib_native_win32" = xyes; then
    G_MODULE_LDFLAGS=
  else
    export SED
@@ -18,16 +34,19 @@ diff -ruN glib-2.27.3-orig/configure.ac glib-2.27.3/configure.ac
  fi
  dnl G_MODULE_IMPL= don't reset, so cmd-line can override
  G_MODULE_NEED_USCORE=0
-@@ -1450,7 +1450,7 @@
+@@ -1535,9 +1535,9 @@ if test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL"; then
  	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
  dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
  	echo "void glib_plugin_test(void) { }" > plugin.c
--	${SHELL} ./libtool --mode=compile ${CC} -shared \
-+	${SHELL} ./$host_alias-libtool --mode=compile ${CC} -shared \
- 		-export-dynamic -o plugin.o plugin.c 2>&1 >/dev/null
- 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
- 		glib_cv_rtldglobal_broken,[
-@@ -1524,7 +1524,7 @@
+-	${SHELL} ./libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
++	${SHELL} ./$host_alias-libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
+ 		${CPPFLAGS} -c -o plugin.lo plugin.c >/dev/null 2>&1
+-	${SHELL} ./libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
++	${SHELL} ./$host_alias-libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
+ 		${LDFLAGS} -module -o plugin.la -export-dynamic \
+ 		-shrext ".o" -avoid-version plugin.lo \
+ 		-rpath /dont/care >/dev/null 2>&1
+@@ -1614,7 +1614,7 @@ fi
  
  AC_MSG_CHECKING(for the suffix of module shared libraries)
  export SED
@@ -36,3 +55,6 @@ diff -ruN glib-2.27.3-orig/configure.ac glib-2.27.3/configure.ac
  eval $shrext_cmds
  module=yes eval std_shrext=$shrext_cmds
  # chop the initial dot
+-- 
+1.7.8.6
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch b/meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
deleted file mode 100644
index 2eaa19b..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-fix g_once_init_enter compile failure
-
-Kernelshark trips over a compile bug in glib-2.0 addressed by Open Embedded
-back in the 2.22 timeframe. It appears to still be present in 2.27.
-
-http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg005
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-
-Upstream-Status: Pending
-
-Index: glib-2.27.5/glib/gthread.h
-===================================================================
---- glib-2.27.5.orig/glib/gthread.h
-+++ glib-2.27.5/glib/gthread.h
-@@ -344,7 +344,7 @@ void                    g_once_init_leav
- G_INLINE_FUNC gboolean
- g_once_init_enter (volatile gsize *value_location)
- {
--  if G_LIKELY ((gpointer) g_atomic_pointer_get (value_location) != NULL)
-+  if G_LIKELY ((gpointer) g_atomic_pointer_get ((volatile gpointer *)value_location) != NULL)
-     return FALSE;
-   else
-     return g_once_init_enter_impl (value_location);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.1.bb
similarity index 91%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.32.1.bb
index f1f9217..354620f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.1.bb
@@ -1,6 +1,5 @@
 require glib.inc
 
-PR = "r1"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -12,12 +11,11 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
-           file://g_once_init_enter.patch \
            file://glib-2.0_fix_for_x32.patch \
            file://nodbus.patch \
           "
-SRC_URI[md5sum] = "0f9fa329c6c1012d0fd861ad3d8a4520"
-SRC_URI[sha256sum] = "e6cbb27c71c445993346e785e8609cc75cea2941e32312e544872feba572dd27"
+SRC_URI[md5sum] = "032c7cf9868c9aa186b490b155a41144"
+SRC_URI[sha256sum] = "484d5b7fc09f3fa398355adaf74b369768f5859866c299f229c99721990f8398"
 
 # Only apply this patch for target recipe on uclibc
 SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 835743a..33f7613 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gmodule/COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gmodule/gmodule.h;startline=4;endline=17;md5=76ab161b37202cd004073c42fac276ed \
                     file://glib/pcre/COPYING;md5=266ebc3ff74ee9ce6fad65577667c0f4 \
-                    file://glib/pcre/pcre.h;startline=11;endline=35;md5=ce867cf87ebbd2bb55e980d90328390d \
+                    file://glib/pcre/pcre.h;startline=11;endline=35;md5=2ffb79f0a0933f282f4f36cda635683d \
                     file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
-- 
1.7.8.6



