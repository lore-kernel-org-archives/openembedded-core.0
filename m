Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8G-0005pT-IO
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419454"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:40 -0800
Message-Id: <6903f53e8e1f48849c9ed1aff837bba6feb1ccbe.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/23] libx11-trim: update to 1.4.4
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:41 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Some description :
1 Remove --with-xcb because xcb is necessary item in the new version.
2 keysymdef_include.patch uses in keeping native directory of X11 as the default configuration. \
  or else host directory "/usr/include/X11" is selected when running  ./configure.
3 makekeys_crosscompile.patch avoid host contamination.
4 x11_disable_makekeys.patch uses in compiling makekey.c needed by makekeys-makekeys.o

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../libx11-trim-1.4.4/keysymdef_include.patch      |   23 ++++++++++
 .../libx11-trim-1.4.4/makekeys_crosscompile.patch  |   45 ++++++++++++++++++++
 .../libx11-trim-1.4.4/x11_disable_makekeys.patch   |   29 +++++++++++++
 .../recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb |   20 +++++++++
 4 files changed, 117 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch
new file mode 100644
index 0000000..d1bdab9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
+--- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
++++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
+@@ -355,7 +355,14 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysym definitions])
+-KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++AC_ARG_WITH(keysymdefdir,
++        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
++        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
++
++if test x$KEYSYMDEFDIR = x; then
++	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++fi
++
+ FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
+ for i in $FILES; do
+     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
new file mode 100644
index 0000000..e5eacf0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
@@ -0,0 +1,45 @@
+Because the size of "unsigned long" is different between 32-bit
+and 64-bit, judge whether target is 32-bit or 64-bit and tell
+"makekey". 
+
+Upstream-Status: Pending
+
+Signed-off-by: dbuitenh@windriver.com
+
+--- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 +0800
++++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800
+@@ -33,6 +33,7 @@
+ #include <X11/keysymdef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ 
+ typedef unsigned long Signature;
+ 
+@@ -124,7 +125,12 @@
+ 	    name = info[i].name;
+ 	    sig = 0;
+ 	    while ((c = *name++))
+-		sig = (sig << 1) + c;
++#ifdef USE32
++		sig = (uint32_t)(sig << 1) + c;
++#else
++		sig = (uint64_t)(sig << 1) + c;
++#endif
++		
+ 	    first = j = sig % z;
+ 	    for (k = 0; tab[j]; k++) {
+ 		j += first + 1;
+@@ -163,7 +169,11 @@
+ 	name = info[i].name;
+ 	sig = 0;
+ 	while ((c = *name++))
+-	    sig = (sig << 1) + c;
++#ifdef USE32
++	    sig = (uint32_t)(sig << 1) + c;
++#else
++	    sig = (uint64_t)(sig << 1) + c;
++#endif
+ 	first = j = sig % z;
+ 	while (offsets[j]) {
+ 	    j += first + 1;
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
new file mode 100644
index 0000000..9763313
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
@@ -0,0 +1,29 @@
+Index: libX11-1.3.4/src/util/Makefile.am
+===================================================================
+--- libX11-1.3.4.orig/src/util/Makefile.am
++++ libX11-1.3.4/src/util/Makefile.am
+@@ -1,24 +1 @@
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS = \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
+-
+-CC = @CC_FOR_BUILD@
+-CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
+-
+ EXTRA_DIST = mkks.sh
+-
+-if LINT
+-# Check source code with tools like lint & sparse
+-
+-ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+-		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
+-
+-lint:
+-	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
+-
+-endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
new file mode 100644
index 0000000..7aed308
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
@@ -0,0 +1,20 @@
+require libx11.inc
+
+DESCRIPTION += " Support for XCMS is disabled in this version."
+
+LICENSE = "MIT & MIT-style & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
+
+PR = "r0"
+
+DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
+
+SRC_URI += "file://x11_disable_makekeys.patch \
+            file://keysymdef_include.patch \
+            file://makekeys_crosscompile.patch"
+
+
+SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
+SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
+
+EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/ --disable-xcms "
-- 
1.7.6.4



