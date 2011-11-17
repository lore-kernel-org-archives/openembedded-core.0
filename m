Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RQzoJ-00058L-KJ
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 12:07:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAHB0obo022737
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 03:00:50 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 Nov 2011 03:00:50 -0800
Message-ID: <782bff85e0ca0cdaa8f4d443719c08f449cfbae8.1321527367.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1321527367.git.xiaofeng.yan@windriver.com>
References: <cover.1321527367.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 17 Nov 2011 18:42:36 +0800
Date: Thu, 17 Nov 2011 19:00:08 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libx11-trim: update to 1.4.4
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
X-List-Received-Date: Thu, 17 Nov 2011 11:07:16 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I remove patch "nodolt.patch" because it is no use in the new version \
and change patch "include_fix.patch" to "keysymdef_include.patch" from libx11-1.4.4.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../xorg-lib/libx11-trim-1.3.4/include_fix.patch   |   21 ---------
 .../libx11-trim-1.3.4/makekeys_crosscompile.patch  |   45 --------------------
 .../xorg-lib/libx11-trim-1.3.4/nodolt.patch        |   12 -----
 .../libx11-trim-1.3.4/x11_disable_makekeys.patch   |   33 --------------
 .../{libx11-trim_1.3.4.bb => libx11-trim_1.4.4.bb} |    7 +--
 5 files changed, 3 insertions(+), 115 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-trim_1.3.4.bb => libx11-trim_1.4.4.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
deleted file mode 100644
index eeb4175..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- configure.ac |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- libX11-1.3.4.orig/configure.ac
-+++ libX11-1.3.4/configure.ac
-@@ -353,9 +353,9 @@
- #
- # Find keysymdef.h
- #
--AC_MSG_CHECKING([keysymdef.h])
--dir=`$PKG_CONFIG --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
- if test -f "$KEYSYMDEF"; then
-         AC_MSG_RESULT([$KEYSYMDEF])
- else
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_crosscompile.patch
deleted file mode 100644
index e5eacf0..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_crosscompile.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Because the size of "unsigned long" is different between 32-bit
-and 64-bit, judge whether target is 32-bit or 64-bit and tell
-"makekey". 
-
-Upstream-Status: Pending
-
-Signed-off-by: dbuitenh@windriver.com
-
---- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 +0800
-+++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800
-@@ -33,6 +33,7 @@
- #include <X11/keysymdef.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <stdint.h>
- 
- typedef unsigned long Signature;
- 
-@@ -124,7 +125,12 @@
- 	    name = info[i].name;
- 	    sig = 0;
- 	    while ((c = *name++))
--		sig = (sig << 1) + c;
-+#ifdef USE32
-+		sig = (uint32_t)(sig << 1) + c;
-+#else
-+		sig = (uint64_t)(sig << 1) + c;
-+#endif
-+		
- 	    first = j = sig % z;
- 	    for (k = 0; tab[j]; k++) {
- 		j += first + 1;
-@@ -163,7 +169,11 @@
- 	name = info[i].name;
- 	sig = 0;
- 	while ((c = *name++))
--	    sig = (sig << 1) + c;
-+#ifdef USE32
-+	    sig = (uint32_t)(sig << 1) + c;
-+#else
-+	    sig = (uint64_t)(sig << 1) + c;
-+#endif
- 	first = j = sig % z;
- 	while (offsets[j]) {
- 	    j += first + 1;
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch
deleted file mode 100644
index bf6c7d5..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- libX11-1.3.4.orig/configure.ac
-+++ libX11-1.3.4/configure.ac
-@@ -32,7 +32,6 @@
- 
- # Checks for programs.
- AC_PROG_LIBTOOL
--DOLT
- AC_PROG_CC
- PKG_PROG_PKG_CONFIG
- 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable_makekeys.patch
deleted file mode 100644
index 561b577..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- src/util/Makefile.am |   21 -----------------
- 1 file changed, 21 deletions(-)
-
---- libX11-1.3.4.orig/src/util/Makefile.am
-+++ libX11-1.3.4/src/util/Makefile.am
-@@ -1,24 +1,3 @@
- 
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--CC = @CC_FOR_BUILD@
--CPPFLAGS = @CPPFLAGS_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
- 
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
rename to meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
index 3a8f2c4..81fb63b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
@@ -3,15 +3,14 @@ require libx11.inc
 DESCRIPTION += " Support for XCB, and XCMS is disabled in this version."
 
 LICENSE = "MIT & MIT-style & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r2"
+PR = "r0"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
-            file://include_fix.patch \
-            file://nodolt.patch \
+            file://keysymdef_include.patch \
             file://makekeys_crosscompile.patch"
 
 SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
-- 
1.7.0.4



