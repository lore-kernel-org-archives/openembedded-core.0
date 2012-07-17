Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Sr3KB-0006O0-DY
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 10:40:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jul 2012 01:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178556504"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 01:28:46 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 11:28:54 +0300
Message-Id: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/3] iproute2: upgrade to 3.4.0
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
X-List-Received-Date: Tue, 17 Jul 2012 08:40:08 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iproute2/iproute2-3.2.0/configure-cross.patch  |   76 -------------------
 .../iproute2/iproute2-3.4.0/configure-cross.patch  |   77 ++++++++++++++++++++
 meta/recipes-connectivity/iproute2/iproute2.inc    |   10 +--
 .../iproute2/iproute2_3.2.0.bb                     |   11 ---
 .../iproute2/iproute2_3.4.0.bb                     |    9 +++
 5 files changed, 91 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb

diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
deleted file mode 100644
index bed7b84..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
+++ /dev/null
@@ -1,76 +0,0 @@
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
-diff -r e4e1b14b9c4a configure
---- a/configure	Sun Jan 22 15:26:47 2012 +0800
-+++ b/configure	Sun Jan 22 15:29:38 2012 +0800
-@@ -2,6 +2,7 @@
- # This is not an autconf generated configure
- #
- INCLUDE=${1:-"$PWD/include"}
-+SYSROOT=$1
- 
- check_atm()
- {
-@@ -13,7 +14,7 @@
- 	return 0;
- }
- EOF
--gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
-+$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
- if [ $? -eq 0 ]
- then
-     echo "TC_CONFIG_ATM:=y" >>Config
-@@ -47,7 +48,7 @@
- 
- EOF
- 
--if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
-+if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
- then
- 	echo "TC_CONFIG_XT:=y" >>Config
- 	echo "using xtables"
-@@ -84,7 +85,7 @@
- }
- 
- EOF
--gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
-+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
- 
- if [ $? -eq 0 ]
- then
-@@ -124,7 +125,7 @@
- }
- 
- EOF
--gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
-+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
- 
- if [ $? -eq 0 ]
- then
-@@ -145,7 +146,7 @@
- check_ipt_lib_dir()
- {
- 	IPT_LIB_DIR=""
--	for dir in /lib /usr/lib /usr/local/lib
-+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
- 	do
- 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
- 			if [ -f $file ]; then
-@@ -168,7 +169,7 @@
- 	return 0;
- }
- EOF
--gcc -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c >/dev/null 2>&1
-+$CC -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c >/dev/null 2>&1
- if [ $? -eq 0 ]
- then
- 	echo "IP_CONFIG_SETNS:=y" >>Config
diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch
new file mode 100644
index 0000000..42f591a
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch
@@ -0,0 +1,77 @@
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
+Index: iproute2-3.4.0/configure
+===================================================================
+--- iproute2-3.4.0.orig/configure
++++ iproute2-3.4.0/configure
+@@ -2,6 +2,7 @@
+ # This is not an autconf generated configure
+ #
+ INCLUDE=${1:-"$PWD/include"}
++SYSROOT=$1
+ 
+ # Make a temp directory in build tree.
+ TMPDIR=$(mktemp -d config.XXXXXX)
+@@ -17,7 +18,7 @@ int main(int argc, char **argv) {
+ 	return 0;
+ }
+ EOF
+-gcc -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm >/dev/null 2>&1 
++$CC -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm >/dev/null 2>&1
+ if [ $? -eq 0 ]
+ then
+     echo "TC_CONFIG_ATM:=y" >>Config
+@@ -51,7 +52,7 @@ int main(int argc, char **argv)
+ 
+ EOF
+ 
+-if gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
++if $CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
+ then
+ 	echo "TC_CONFIG_XT:=y" >>Config
+ 	echo "using xtables"
+@@ -88,7 +89,7 @@ int main(int argc, char **argv) {
+ }
+ 
+ EOF
+-gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl >/dev/null 2>&1
++$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl >/dev/null 2>&1
+ 
+ if [ $? -eq 0 ]
+ then
+@@ -128,7 +129,7 @@ int main(int argc, char **argv) {
+ }
+ 
+ EOF
+-gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl >/dev/null 2>&1
++$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl >/dev/null 2>&1
+ 
+ if [ $? -eq 0 ]
+ then
+@@ -149,7 +150,7 @@ check_ipt()
+ check_ipt_lib_dir()
+ {
+ 	IPT_LIB_DIR=""
+-	for dir in /lib /usr/lib /usr/local/lib
++	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
+ 	do
+ 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
+ 			if [ -f $file ]; then
+@@ -172,7 +173,7 @@ int main(int argc, char **argv)
+ 	return 0;
+ }
+ EOF
+-gcc -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c >/dev/null 2>&1
++$CC -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c >/dev/null 2>&1
+ if [ $? -eq 0 ]
+ then
+ 	echo "IP_CONFIG_SETNS:=y" >>Config
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 86847ef..7caf7d0 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -26,12 +26,12 @@ do_install () {
 # There are only .so files in iproute2
 INSANE_SKIP_${PN} = "dev-so"
 
-FILES_${PN} += "${base_libdir}/tc"
-FILES_${PN}-dbg += "${base_libdir}/tc/.debug"
+FILES_${PN} += "${libdir}/tc"
+FILES_${PN}-dbg += "${libdir}/tc/.debug"
 
-ALTERNATIVE_NAME = "ip"
-ALTERNATIVE_PATH = "${base_sbindir}/ip.iproute2"
-ALTERNATIVE_LINK = "${base_bindir}/ip"
+ALTERNATIVE_${PN} = "ip"
+ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
+ALTERNATIVE_LINK_NAME[ip] = "${base_bindir}/ip"
 ALTERNATIVE_PRIORITY = "100"
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
deleted file mode 100644
index 5af12af..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require iproute2.inc
-
-PR = "r1"
-
-#v3.2.0 tag is "447c118f138171b260ad045ad6e1b17f9ef462e2"
-#but it was not fully tested and had build error, and the next commit fixed it.
-SRCREV = "13603f6a9e46f08576f6284a0ef1ce1fbf94ffe0"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git \
-           file://configure-cross.patch"
-S = "${WORKDIR}/git"
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
new file mode 100644
index 0000000..cf1d521
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
@@ -0,0 +1,9 @@
+require iproute2.inc
+
+PR = "r0"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
+           file://configure-cross.patch"
+
+SRC_URI[md5sum] = "879d3fac4e90809598b2864ec4a0cbf8"
+SRC_URI[sha256sum] = "38e846e412b2fa235a447b50c20ad1e9770d1b3ed4d3ab18ca0b18c6e8b79ba4"
-- 
1.7.9.5



