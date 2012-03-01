Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S34kX-0004eV-8y for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 13:04:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21BuGBn015134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 11:56:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13693-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 11:56:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21Bu7Fb015127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 11:56:08 GMT
Message-ID: <1330602970.31767.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 11:56:10 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libx11-trim: Drop obsolete 1.3.4 version
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
X-List-Received-Date: Thu, 01 Mar 2012 12:04:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
deleted file mode 100644
index eeb4175..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
+++ b/dev/null
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
+++ b/dev/null
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
+++ b/dev/null
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
+++ b/dev/null
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
deleted file mode 100644
index 3a8f2c4..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
+++ b/dev/null
@@ -1,20 +0,0 @@
-require libx11.inc
-
-DESCRIPTION += " Support for XCB, and XCMS is disabled in this version."
-
-LICENSE = "MIT & MIT-style & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
-
-PR = "r2"
-
-DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
-
-SRC_URI += "file://x11_disable_makekeys.patch \
-            file://include_fix.patch \
-            file://nodolt.patch \
-            file://makekeys_crosscompile.patch"
-
-SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
-SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
-
-EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-xcms --with-xcb"




