Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS2xM-0006YD-7R
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:08:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 01:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5775262"
Received: from unknown (HELO swold-MOBL.nomadix.com) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 01:05:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 01:05:11 -0700
Message-Id: <b31d66b5395b40740d2e28128dcd51c66e2495fd.1307001679.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
Cc: Jingdong Lu <jingdong.lu@windriver.com>
Subject: [CONSOLIDATED PULL 12/12] libx11: fix libX11 keysyms to pass xts5 of lsb
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
X-List-Received-Date: Thu, 02 Jun 2011 08:08:40 -0000

From: Jingdong Lu <jingdong.lu@windriver.com>

Fixes bug: [YOCTO #1095]
Because of cross-compiling libx11 keysyms will cause Xts5 test of LSB fail.
libx11 use a tool named "makekey" which compiled as a native tool to generate
ks_tables.h. Because the size of "unsigned long" is different between 32-bit
and 64-bit, we should judge whether our target is 32-bit or 64-bit and tell
"makekey".
I add a patch to "makekeys_crosscompile.patch" to "src/utils/makekeys.c" in
order to deal with the different targets. If our target is 32-bit, we force
the variable its type is "unsigned long" to "uint32_t". So we can generate a
correct keysyms.

Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
---
 .../libx11-1.3.4/makekeys_crosscompile.patch       |   45 ++++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb |    5 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |    8 +++-
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |    5 +-
 4 files changed, 58 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.3.4/makekeys_crosscompile.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.3.4/makekeys_crosscompile.patch
new file mode 100644
index 0000000..e5eacf0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.3.4/makekeys_crosscompile.patch
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
index b013498..1469bc1 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
@@ -5,12 +5,13 @@ DESCRIPTION += " Support for XCB, and XCMS is disabled in this version."
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
 SRC_URI += "file://../libx11-${PV}/x11_disable_makekeys.patch \
             file://../libx11-${PV}/include_fix.patch \
-            file://../libx11-${PV}/nodolt.patch"
+            file://../libx11-${PV}/nodolt.patch \
+            file://../libx11-${PV}/makekeys_crosscompile.patch"
 
 EXTRA_OECONF += "--disable-xcms --with-xcb"
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 030b0db..c156ce6 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -6,6 +6,8 @@ basic functions of the window system."
 
 require xorg-lib-common.inc
 
+inherit siteinfo
+
 PROVIDES = "virtual/libx11"
 
 XORG_PN = "libX11"
@@ -22,7 +24,11 @@ do_compile() {
 	touch makekeys-makekeys.o
 	(
 		unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
-		${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
+		if [ "${SITEINFO_BITS}" == "64" ]; then
+                        ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
+                else
+                        ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -o makekeys
+                fi
 	)
 	if [ "$?" != "0" ]; then
 		exit 1
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
index 08ba07b..3e046a1 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
@@ -5,11 +5,12 @@ LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://nodolt.patch \
-            file://include_fix.patch"
+            file://include_fix.patch \
+	    file://makekeys_crosscompile.patch"
 
 SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
 SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
-- 
1.7.3.4



