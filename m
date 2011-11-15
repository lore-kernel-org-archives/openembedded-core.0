Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQBx-0001VX-F4
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410698"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:36 -0800
Message-Id: <c1eafac46b61a52f989e7cbd3ee12f934e708889.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/16] libx11-diet: update to 1.4.4
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:18 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I remove patch "nodolt.patch" because it is no use in the new version \
and change patch "include_fix.patch" to "keysymdef_include.patch" from libx11-1.4.4.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../xorg-lib/libx11-diet-1.3/include_fix.patch     |   25 --------------------
 .../xorg-lib/libx11-diet-1.3/nodolt.patch          |   14 -----------
 .../X18NCMSstubs.diff                              |    1 +
 .../fix-disable-xlocale.diff                       |    1 +
 .../fix-utf8-wrong-define.patch                    |    2 +
 .../libx11-diet-1.4.4/keysymdef_include.patch      |   23 ++++++++++++++++++
 .../x11_disable_makekeys.patch                     |   23 ++++++++++--------
 .../{libx11-diet_1.3.bb => libx11-diet_1.4.4.bb}   |   17 ++++++++-----
 8 files changed, 50 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/X18NCMSstubs.diff (99%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/fix-disable-xlocale.diff (90%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/fix-utf8-wrong-define.patch (88%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/x11_disable_makekeys.patch (43%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.3.bb => libx11-diet_1.4.4.bb} (49%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
deleted file mode 100644
index b3bcbab..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- configure.ac |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- libX11-1.1.5.orig/configure.ac
-+++ libX11-1.1.5/configure.ac
-@@ -218,13 +218,13 @@ AC_SUBST(XDMCP_LIBS)
- AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
- 
- #
- # Find keysymdef.h
- #
--AC_MSG_CHECKING([keysymdef.h])
--dir=`pkg-config --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+ 	KEYSYMDEF=$withval, KEYSYMDEF="")
- if test -f "$KEYSYMDEF"; then
-         AC_MSG_RESULT([$KEYSYMDEF])
- else
- 	AC_MSG_ERROR([Cannot find keysymdef.h])
- fi
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
deleted file mode 100644
index cc05fdc..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libX11-1.2.1/configure.ac
-===================================================================
---- libX11-1.2.1.orig/configure.ac	2009-07-02 14:07:54.000000000 +0100
-+++ libX11-1.2.1/configure.ac	2009-07-02 14:08:01.000000000 +0100
-@@ -20,7 +20,6 @@
- 
- # Checks for programs.
- AC_PROG_LIBTOOL
--DOLT
- AC_PROG_CC
- XORG_CWARNFLAGS
- 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff
similarity index 99%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.3/X18NCMSstubs.diff
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff
index 91ab180..be71d44 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/X18NCMSstubs.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff
@@ -1,5 +1,6 @@
 Upstream-Status: Pending
 
+Upstream-Status: Inappropriate [configuration]
 Index: libX11-1.3/src/imConv.c
 ===================================================================
 --- libX11-1.3.orig/src/imConv.c
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disable-xlocale.diff
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-disable-xlocale.diff
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disable-xlocale.diff
index 7dcdd6a..a7c3984 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-disable-xlocale.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disable-xlocale.diff
@@ -1,5 +1,6 @@
 Upstream-Status: Pending
 
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 --- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +0100
 +++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
 @@ -701,7 +701,11 @@
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-utf8-wrong-define.patch
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-utf8-wrong-define.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-utf8-wrong-define.patch
index 26d3349..c6347f5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-utf8-wrong-define.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-utf8-wrong-define.patch
@@ -1,5 +1,7 @@
 Upstream-Status: Pending
 
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
 #
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
new file mode 100644
index 0000000..d1bdab9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
similarity index 43%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
index 0445835..ab48193 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
@@ -1,24 +1,27 @@
 Upstream-Status: Inappropriate [configuration]
 
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 ---
- src/util/Makefile.am |   17 -----------------
- 1 file changed, 17 deletions(-)
+ src/util/Makefile.am |   21 -----------------
+ 1 file changed, 21 deletions(-)
 
-Index: libX11-1.2.1/src/util/Makefile.am
-===================================================================
---- libX11-1.2.1.orig/src/util/Makefile.am	2008-10-07 18:18:19.000000000 +0100
-+++ libX11-1.2.1/src/util/Makefile.am	2009-07-02 14:04:38.000000000 +0100
-@@ -1,20 +1,3 @@
- # $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
+--- a/src/util/Makefile.am
++++ b/src/util/Makefile.am
+@@ -1,24 +1,3 @@
  
 -noinst_PROGRAMS=makekeys
 -
--makekeys_CFLAGS=$(X11_CFLAGS)
+-makekeys_CFLAGS = \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
 -
 -CC = @CC_FOR_BUILD@
+-CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
 -
  EXTRA_DIST = mkks.sh
--
+ 
 -if LINT
 -# Check source code with tools like lint & sparse
 -
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
similarity index 49%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
index de7edf1..1762829 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
@@ -3,23 +3,26 @@ require libx11.inc
 DESCRIPTION += " Support for XCB, UDC, XCMS and XLOCALE is disabled in \
 this version."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=597df7e9217e89ccaeb749f48ce2aeb0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r4"
+PR = "r0"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
-            file://include_fix.patch \
             file://X18NCMSstubs.diff \
+            file://keysymdef_include.patch \
             file://fix-disable-xlocale.diff \
             file://fix-utf8-wrong-define.patch \
-            file://nodolt.patch"
+           "
 
-SRC_URI[md5sum] = "0545089013213e90aac19b8f8045d32e"
-SRC_URI[sha256sum] = "34656d022ff2f94430b534612821428fe15ade028d86a42907958167f2e497ac"
+
+SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
+SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
 
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
 
-EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --without-xcb --disable-udc --disable-xcms --disable-xlocale"
+EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
 CFLAGS += "-D_GNU_SOURCE"
+
-- 
1.7.6.4



