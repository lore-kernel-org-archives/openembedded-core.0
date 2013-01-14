Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TumWg-0002SF-CO
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 17:04:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jan 2013 07:48:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="271793233"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by orsmga002.jf.intel.com with ESMTP; 14 Jan 2013 07:49:17 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2013 17:49:26 +0200
Message-Id: <1358178566-10080-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] iproute2: upgrade to v3.7.0
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
X-List-Received-Date: Mon, 14 Jan 2013 16:04:44 -0000

configure-cross patch is now simplified.
sysroot is now properly set.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iproute2/iproute2-3.5.1/configure-cross.patch  |   77 --------------------
 .../iproute2/iproute2/configure-cross.patch        |   32 ++++++++
 .../{iproute2_3.5.1.bb => iproute2_3.7.0.bb}       |    6 +-
 3 files changed, 35 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2-3.5.1/configure-cross.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_3.5.1.bb => iproute2_3.7.0.bb} (61%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.5.1/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.5.1/configure-cross.patch
deleted file mode 100644
index 42f591a..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2-3.5.1/configure-cross.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 3 Nov 2011 10:46:16 +0100
-Subject: [PATCH] make configure cross compile safe
-
-According to Kevin Tian:
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
-Index: iproute2-3.4.0/configure
-===================================================================
---- iproute2-3.4.0.orig/configure
-+++ iproute2-3.4.0/configure
-@@ -2,6 +2,7 @@
- # This is not an autconf generated configure
- #
- INCLUDE=${1:-"$PWD/include"}
-+SYSROOT=$1
- 
- # Make a temp directory in build tree.
- TMPDIR=$(mktemp -d config.XXXXXX)
-@@ -17,7 +18,7 @@ int main(int argc, char **argv) {
- 	return 0;
- }
- EOF
--gcc -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm >/dev/null 2>&1 
-+$CC -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm >/dev/null 2>&1
- if [ $? -eq 0 ]
- then
-     echo "TC_CONFIG_ATM:=y" >>Config
-@@ -51,7 +52,7 @@ int main(int argc, char **argv)
- 
- EOF
- 
--if gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
-+if $CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
- then
- 	echo "TC_CONFIG_XT:=y" >>Config
- 	echo "using xtables"
-@@ -88,7 +89,7 @@ int main(int argc, char **argv) {
- }
- 
- EOF
--gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl >/dev/null 2>&1
-+$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl >/dev/null 2>&1
- 
- if [ $? -eq 0 ]
- then
-@@ -128,7 +129,7 @@ int main(int argc, char **argv) {
- }
- 
- EOF
--gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl >/dev/null 2>&1
-+$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl >/dev/null 2>&1
- 
- if [ $? -eq 0 ]
- then
-@@ -149,7 +150,7 @@ check_ipt()
- check_ipt_lib_dir()
- {
- 	IPT_LIB_DIR=""
--	for dir in /lib /usr/lib /usr/local/lib
-+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
- 	do
- 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
- 			if [ -f $file ]; then
-@@ -172,7 +173,7 @@ int main(int argc, char **argv)
- 	return 0;
- }
- EOF
--gcc -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c >/dev/null 2>&1
-+$CC -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c >/dev/null 2>&1
- if [ $? -eq 0 ]
- then
- 	echo "IP_CONFIG_SETNS:=y" >>Config
diff --git a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
new file mode 100644
index 0000000..10606f3
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
@@ -0,0 +1,32 @@
+From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 3 Nov 2011 10:46:16 +0100
+Subject: [PATCH] make configure cross compile safe
+
+According to Kevin Tian:
+Upstream-Status: Pending
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+
+Index: iproute2-3.7.0/configure
+===================================================================
+--- iproute2-3.7.0.orig/configure
++++ iproute2-3.7.0/configure
+@@ -2,6 +2,7 @@
+ # This is not an autconf generated configure
+ #
+ INCLUDE=${1:-"$PWD/include"}
++SYSROOT=$1
+ : ${PKG_CONFIG:=pkg-config}
+ : ${CC=gcc}
+ echo "PKG_CONFIG:=${PKG_CONFIG}" >>Config
+@@ -158,7 +159,7 @@ check_ipt_lib_dir()
+ 		return
+ 	fi
+ 
+-	for dir in /lib /usr/lib /usr/local/lib
++	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
+ 	do
+ 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
+ 			if [ -f $file ]; then
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb b/meta/recipes-connectivity/iproute2/iproute2_3.7.0.bb
similarity index 61%
rename from meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.7.0.bb
index 3d402cf..1863acb 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.7.0.bb
@@ -1,12 +1,12 @@
 require iproute2.inc
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch"
 
-SRC_URI[md5sum] = "d4425b44edd5eacd6099e672e4baacbf"
-SRC_URI[sha256sum] = "36f2674e5436289f3ccfb0a58707aca9dcfa295d06afc36d2117674508f5ef72"
+SRC_URI[md5sum] = "b07241b267036de9a79ca5b69acf8593"
+SRC_URI[sha256sum] = "6b0e76d7adb8b9b65f70571f75d72db7c2548eff7813cace9e267065c3c0cb34"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
1.7.10.4



