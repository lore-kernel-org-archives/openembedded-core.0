Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLu4d-0007qv-Dg
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 10:59:03 +0100
Received: by wwf4 with SMTP id 4so1280482wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 02:52:55 -0700 (PDT)
Received: by 10.216.161.17 with SMTP id v17mr2436138wek.112.1320313975051;
	Thu, 03 Nov 2011 02:52:55 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id l20sm9170294wbo.6.2011.11.03.02.52.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 02:52:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2011 10:52:50 +0100
Message-Id: <1320313970-2247-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] iproute2: update to 3.0.0 to fix build with updated iptables
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
X-List-Received-Date: Thu, 03 Nov 2011 09:59:03 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../configure-cross.patch                          |   57 +++++++++++++-------
 meta/recipes-connectivity/iproute2/iproute2.inc    |    7 ++-
 .../iproute2/iproute2_2.6.38.bb                    |    9 ---
 .../iproute2/iproute2_3.0.0.bb                     |    8 +++
 4 files changed, 51 insertions(+), 30 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-2.6.38 => iproute2-3.0.0}/configure-cross.patch (50%)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.0.0.bb

diff --git a/meta/recipes-connectivity/iproute2/iproute2-2.6.38/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.0.0/configure-cross.patch
similarity index 50%
rename from meta/recipes-connectivity/iproute2/iproute2-2.6.38/configure-cross.patch
rename to meta/recipes-connectivity/iproute2/iproute2-3.0.0/configure-cross.patch
index e26e8ef..92c12be 100644
--- a/meta/recipes-connectivity/iproute2/iproute2-2.6.38/configure-cross.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2-3.0.0/configure-cross.patch
@@ -1,31 +1,38 @@
+From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 3 Nov 2011 10:46:16 +0100
+Subject: [PATCH] make configure cross compile safe
+
+According to Kevin Tian:
 Upstream-Status: Pending
 
-# borrow from OE, to handle cross compile mess
-#
-# ktian1, 06/28/2010 
-Index: iproute2-2.6.34/configure
-===================================================================
---- iproute2-2.6.34.orig/configure
-+++ iproute2-2.6.34/configure
-@@ -4,7 +4,7 @@
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ configure |   13 +++++++------
+ 1 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index f5c3d40..bcc1948 100755
+--- a/configure
++++ b/configure
+@@ -2,6 +2,7 @@
+ # This is not an autconf generated configure
+ #
  INCLUDE=${1:-"$PWD/include"}
- 
- TABLES=
--
 +SYSROOT=$1
+ 
  check_atm()
  {
- cat >/tmp/atmtest.c <<EOF
-@@ -15,7 +15,7 @@ int main(int argc, char **argv) {
+@@ -13,7 +14,7 @@ int main(int argc, char **argv) {
  	return 0;
  }
  EOF
 -gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
-+$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1
++$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
  if [ $? -eq 0 ]
  then
      echo "TC_CONFIG_ATM:=y" >>Config
-@@ -49,7 +49,7 @@ int main(int argc, char **argv)
+@@ -47,7 +48,7 @@ int main(int argc, char **argv)
  
  EOF
  
@@ -34,7 +41,7 @@ Index: iproute2-2.6.34/configure
  then
  	echo "TC_CONFIG_XT:=y" >>Config
  	echo "using xtables"
-@@ -86,7 +86,7 @@ int main(int argc, char **argv) {
+@@ -84,7 +85,7 @@ int main(int argc, char **argv) {
  }
  
  EOF
@@ -43,7 +50,7 @@ Index: iproute2-2.6.34/configure
  
  if [ $? -eq 0 ]
  then
-@@ -126,7 +126,7 @@ int main(int argc, char **argv) {
+@@ -124,7 +125,7 @@ int main(int argc, char **argv) {
  }
  
  EOF
@@ -52,12 +59,24 @@ Index: iproute2-2.6.34/configure
  
  if [ $? -eq 0 ]
  then
-@@ -150,7 +150,7 @@ check_ipt()
+@@ -145,7 +146,7 @@ check_ipt()
  check_ipt_lib_dir()
  {
  	IPT_LIB_DIR=""
 -	for dir in /lib /usr/lib /usr/local/lib
 +	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
  	do
- 		for file in $dir/$TABLES/lib*t_*so ; do
+ 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
  			if [ -f $file ]; then
+@@ -168,7 +169,7 @@ int main(int argc, char **argv)
+ 	return 0;
+ }
+ EOF
+-gcc -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c >/dev/null 2>&1
++$CC -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c >/dev/null 2>&1
+ if [ $? -eq 0 ]
+ then
+ 	echo "IP_CONFIG_SETNS:=y" >>Config
+-- 
+1.7.2.5
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 0f27a01..6fc30a0 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -23,8 +23,11 @@ do_install () {
     rm ${D}/share -rf || true
 }
 
-FILES_${PN} += "/usr/lib/tc/*"
-FILES_${PN}-dbg += "/usr/lib/tc/.debug"
+# There are only .so files in iproute2
+INSANE_SKIP_${PN} = "dev-so"
+
+FILES_${PN} += "${base_libdir}/tc/*"
+FILES_${PN}-dbg += "${base_libdir}/tc/.debug"
 
 ALTERNATIVE_NAME = "ip"
 ALTERNATIVE_PATH = "${base_sbindir}/ip.iproute2"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb b/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
deleted file mode 100644
index 7abc41f..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require iproute2.inc
-
-PR = "r0"
-
-SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${BPN}-${PV}.tar.bz2 \
-	   file://configure-cross.patch"
-
-SRC_URI[md5sum] = "a243bfea837e71824b7ca26c3bb45fa8"
-SRC_URI[sha256sum] = "47629a4f547f21d94d8e823a87dd8e13042cadecefea2e2dc433e4134fa9aec4"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.0.0.bb
new file mode 100644
index 0000000..8d1db85
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.0.0.bb
@@ -0,0 +1,8 @@
+require iproute2.inc
+
+#v3.0.0 tag
+SRCREV = "ce691fb5ce78b2c75243c60a757a3990ae09681c"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git \
+           file://configure-cross.patch"
+S = "${WORKDIR}/git"
+
-- 
1.7.2.5



