Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UA16p-0008HV-Be
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 17:41:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2013 08:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,735,1355126400"; d="scan'208";a="267320375"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2013 08:24:21 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 18:24:45 +0200
Message-Id: <1361809486-28017-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] minicom: upgrade to 2.6.2
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
X-List-Received-Date: Mon, 25 Feb 2013 16:41:08 -0000

- all patches removed;
- fixes already integrated in source code;
- gcc4-scope.patch removed as was not enabled;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../minicom/minicom-2.6.1/gcc4-scope.patch         |   46 --------------------
 .../minicom_fix_for_automake-1.12.patch            |   21 ---------
 .../rename-conflicting-functions.patch             |   15 -------
 .../minicom/{minicom_2.6.1.bb => minicom_2.6.2.bb} |   12 ++---
 4 files changed, 4 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/gcc4-scope.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/rename-conflicting-functions.patch
 rename meta/recipes-extended/minicom/{minicom_2.6.1.bb => minicom_2.6.2.bb} (61%)

diff --git a/meta/recipes-extended/minicom/minicom-2.6.1/gcc4-scope.patch b/meta/recipes-extended/minicom/minicom-2.6.1/gcc4-scope.patch
deleted file mode 100644
index 0660cb0..0000000
--- a/meta/recipes-extended/minicom/minicom-2.6.1/gcc4-scope.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Inappropriate [others]
-
---- minicom-2.1/src/window.c.orig	2006-06-14 17:49:53.000000000 +0200
-+++ minicom-2.1/src/window.c	2006-06-14 17:50:14.000000000 +0200
-@@ -62,7 +62,7 @@
- static char *CS, *SF, *SR, *VB, *BL;
- static char *VE, *VI, *KS, *KE;
- static char *CD, *CL, *IC, *DC;
--static char *BC, *CR, *NL;
-+static char *mcBC, *CR, *NL;
- #if ST_LINE
- static char *TS, *FS, *DS;
- #endif
-@@ -322,8 +322,8 @@
-   else if (NL != CNULL && x == 0 && x == curx && y == cury + 1)
- 	outstr(NL);
- #endif
--  else if (BC != CNULL && y == cury && x == curx - 1)
--  	outstr(BC);
-+  else if (mcBC != CNULL && y == cury && x == curx - 1)
-+  	outstr(mcBC);
-   else	
-   	outstr(tgoto(CM, x, y));
-   curx = x;
-@@ -1918,7 +1918,7 @@
-   CL = tgetstr("cl", &_tptr);
-   IC = tgetstr("ic", &_tptr);
-   DC = tgetstr("dc", &_tptr);
--  BC = tgetstr("bc", &_tptr);
-+  mcBC = tgetstr("bc", &_tptr);
-   CR = tgetstr("cr", &_tptr);
-   NL = tgetstr("nl", &_tptr);
-   AC = tgetstr("ac", &_tptr);
-@@ -1967,10 +1967,10 @@
-   _has_am = tgetflag("am");
-   _mv_standout = tgetflag("ms");
-   if (tgetflag("bs")) {
--    if (BC == CNULL) BC = "\b";
-+    if (mcBC == CNULL) mcBC = "\b";
-   } 
-   else
--    BC = CNULL;	
-+    mcBC = CNULL;	
- 
-   /* Special IBM box-drawing characters */
-   D_UL  = 201;
diff --git a/meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch b/meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
deleted file mode 100644
index aba6298..0000000
--- a/meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Pending
-
-This patch fixes following issue with automake 1.12
-
-| configure.in:193: error: automatic de-ANSI-fication support has been removed
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/03
-
-Index: minicom-2.6.1/configure.in
-===================================================================
---- minicom-2.6.1.orig/configure.in
-+++ minicom-2.6.1/configure.in
-@@ -190,7 +190,6 @@ AC_CHECK_HEADERS(stdarg.h varargs.h term
- 
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
--AM_C_PROTOTYPES
- AC_TYPE_UID_T
- AC_TYPE_MODE_T
- AC_TYPE_PID_T
diff --git a/meta/recipes-extended/minicom/minicom-2.6.1/rename-conflicting-functions.patch b/meta/recipes-extended/minicom/minicom-2.6.1/rename-conflicting-functions.patch
deleted file mode 100644
index 1a50f18..0000000
--- a/meta/recipes-extended/minicom/minicom-2.6.1/rename-conflicting-functions.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
---- minicom-2.3/src/minicom.c-orig	2009-06-08 14:49:07.000000000 +0200
-+++ minicom-2.3/src/minicom.c	2009-06-08 14:50:23.000000000 +0200
-@@ -63,6 +63,10 @@
- }
- #endif /*DEBUG*/
- 
-+#ifdef __USE_GNU
-+#define getline minicom_getline
-+#endif
-+
- /*
-  * Sub - menu's.
-  */
diff --git a/meta/recipes-extended/minicom/minicom_2.6.1.bb b/meta/recipes-extended/minicom/minicom_2.6.2.bb
similarity index 61%
rename from meta/recipes-extended/minicom/minicom_2.6.1.bb
rename to meta/recipes-extended/minicom/minicom_2.6.2.bb
index b54853d..0d65e80 100644
--- a/meta/recipes-extended/minicom/minicom_2.6.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.6.2.bb
@@ -6,16 +6,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/3700/minicom-${PV}.tar.gz \
-	file://rename-conflicting-functions.patch \
-	file://minicom_fix_for_automake-1.12.patch \
-	"
-#	file://gcc4-scope.patch
+SRC_URI = "http://alioth.debian.org/frs/download.php/3869/minicom-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "435fb410a5bfa9bb20d4248b3ca53529"
-SRC_URI[sha256sum] = "a6e7bf533c3796f3a67a7d109f328d46497c687ed13885bd1be4ce0548fc4f56"
+SRC_URI[md5sum] = "203c56c4b447f45e2301b0cc4e83da3c"
+SRC_URI[sha256sum] = "f3cf215f7914ffa5528e398962176102ad74df27ba38958142f56aa6d15c9168"
 
 inherit autotools gettext
 
-- 
1.7.10.4



