Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SQIPw-0007XC-JU
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 15:19:28 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 15:09:38 +0200
Message-Id: <1336136978-11081-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] busybox: port improvements to simple.script from Debian (udhcpc)
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
X-List-Received-Date: Fri, 04 May 2012 13:19:28 -0000

* Support resolvconf
* Avoid bashism $((metric++))
* Use 'domain' instead of 'search' for domain parameter

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* This patch is based on the denzil branch.
* This patch requires "busybox: remove unused patches for simple.script (udhcpc)",
  because of the PR bump.

 meta/recipes-core/busybox/busybox_1.19.4.bb   |    2 +-
 meta/recipes-core/busybox/files/simple.script |   27 ++++++++++++++++++-------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index 30dd333..0b1e787 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 5cc21b9..27368f0 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -20,6 +20,9 @@ fi
 
 case "$1" in
 	deconfig)
+		if [ -x /sbin/resolvconf ]; then
+			/sbin/resolvconf -d "${interface}.udhcpc"
+		fi
 		if ! root_is_nfs ; then
                         if [ $have_bin_ip -eq 1 ]; then
                                 ip addr flush dev $interface
@@ -53,19 +56,29 @@ case "$1" in
 			metric=0
 			for i in $router ; do
                                 if [ $have_bin_ip -eq 1 ]; then
-                                        ip route add default via $i metric $((metric++))
+                                        ip route add default via $i metric $metric
                                 else
-                                        route add default gw $i dev $interface metric $((metric++)) 2>/dev/null
+                                        route add default gw $i dev $interface metric $metric 2>/dev/null
                                 fi
+                                metric=$(($metric + 1))
 			done
 		fi
 
-		echo -n > $RESOLV_CONF
-		[ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
-		for i in $dns ; do
-			echo adding dns $i
-			echo nameserver $i >> $RESOLV_CONF
+		# Update resolver configuration file
+		R=""
+		[ -n "$domain" ] && R="domain $domain
+"
+		for i in $dns; do
+			echo "$0: Adding DNS $i"
+			R="${R}nameserver $i
+"
 		done
+
+		if [ -x /sbin/resolvconf ]; then
+			echo -n "$R" | /sbin/resolvconf -a "${interface}.udhcpc"
+		else
+			echo -n "$R" > "$RESOLV_CONF"
+		fi
 		;;
 esac
 
-- 
1.7.9.5



