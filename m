Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1on-0002SW-Qd
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:07:06 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2012 09:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101466316"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2012 09:59:21 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:16 +0800
Message-Id: <d4c21b327692a1ca7479545bf5eb0dfe4994ccb5.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 11/18] iproute2: upgrade to 3.2.0
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
X-List-Received-Date: Sun, 22 Jan 2012 18:07:06 -0000

This patch is to upgrade iproute2 to tag 3.2.0.
And the tag is not fully testd by the upstream and has build error.
We use the next commit of tag 3.2.0 which fixs the error.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../configure-cross.patch                          |   30 ++++++++------------
 .../{iproute2_3.1.0.bb => iproute2_3.2.0.bb}       |    5 ++-
 2 files changed, 15 insertions(+), 20 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.1.0 => iproute2-3.2.0}/configure-cross.patch (69%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.1.0.bb => iproute2_3.2.0.bb} (46%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.1.0/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
similarity index 69%
rename from meta/recipes-connectivity/iproute2/iproute2-3.1.0/configure-cross.patch
rename to meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
index 92c12be..bed7b84 100644
--- a/meta/recipes-connectivity/iproute2/iproute2-3.1.0/configure-cross.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
@@ -7,14 +7,11 @@ According to Kevin Tian:
 Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- configure |   13 +++++++------
- 1 files changed, 7 insertions(+), 6 deletions(-)
+Signed-off-by: Shane Wang <shane.wang@intel.com>
 
-diff --git a/configure b/configure
-index f5c3d40..bcc1948 100755
---- a/configure
-+++ b/configure
+diff -r e4e1b14b9c4a configure
+--- a/configure	Sun Jan 22 15:26:47 2012 +0800
++++ b/configure	Sun Jan 22 15:29:38 2012 +0800
 @@ -2,6 +2,7 @@
  # This is not an autconf generated configure
  #
@@ -23,7 +20,7 @@ index f5c3d40..bcc1948 100755
  
  check_atm()
  {
-@@ -13,7 +14,7 @@ int main(int argc, char **argv) {
+@@ -13,7 +14,7 @@
  	return 0;
  }
  EOF
@@ -32,16 +29,16 @@ index f5c3d40..bcc1948 100755
  if [ $? -eq 0 ]
  then
      echo "TC_CONFIG_ATM:=y" >>Config
-@@ -47,7 +48,7 @@ int main(int argc, char **argv)
+@@ -47,7 +48,7 @@
  
  EOF
  
--if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
-+if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
+-if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
++if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
  then
  	echo "TC_CONFIG_XT:=y" >>Config
  	echo "using xtables"
-@@ -84,7 +85,7 @@ int main(int argc, char **argv) {
+@@ -84,7 +85,7 @@
  }
  
  EOF
@@ -50,7 +47,7 @@ index f5c3d40..bcc1948 100755
  
  if [ $? -eq 0 ]
  then
-@@ -124,7 +125,7 @@ int main(int argc, char **argv) {
+@@ -124,7 +125,7 @@
  }
  
  EOF
@@ -59,7 +56,7 @@ index f5c3d40..bcc1948 100755
  
  if [ $? -eq 0 ]
  then
-@@ -145,7 +146,7 @@ check_ipt()
+@@ -145,7 +146,7 @@
  check_ipt_lib_dir()
  {
  	IPT_LIB_DIR=""
@@ -68,7 +65,7 @@ index f5c3d40..bcc1948 100755
  	do
  		for file in $dir/{xtables,iptables}/lib*t_*so ; do
  			if [ -f $file ]; then
-@@ -168,7 +169,7 @@ int main(int argc, char **argv)
+@@ -168,7 +169,7 @@
  	return 0;
  }
  EOF
@@ -77,6 +74,3 @@ index f5c3d40..bcc1948 100755
  if [ $? -eq 0 ]
  then
  	echo "IP_CONFIG_SETNS:=y" >>Config
--- 
-1.7.2.5
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
similarity index 46%
rename from meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
index 0b47046..4391fb6 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
@@ -1,7 +1,8 @@
 require iproute2.inc
 
-#v3.1.0 tag
-SRCREV = "9cbe6bc337a35b91882f92599eefeb161f3e776e"
+#v3.2.0 tag is "447c118f138171b260ad045ad6e1b17f9ef462e2"
+#but it was not fully tested and had build error, and the next commit fixed it.
+SRCREV = "13603f6a9e46f08576f6284a0ef1ce1fbf94ffe0"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git \
            file://configure-cross.patch"
 S = "${WORKDIR}/git"
-- 
1.7.6



