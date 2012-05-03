Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SQ1xJ-0000Yv-Pw
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 21:44:49 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 21:35:01 +0200
Message-Id: <1336073701-22049-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] busybox: remove unused patches for simple.script (udhcpc)
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
X-List-Received-Date: Thu, 03 May 2012 19:44:49 -0000

* OE-Core provides its own copy of simple.script.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../busybox-1.19.4/udhcpc-fix-nfsroot.patch        |   56 --------------------
 .../busybox/busybox-1.19.4/udhcpscript.patch       |   24 ---------
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    4 +-
 3 files changed, 1 insertion(+), 83 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.19.4/udhcpc-fix-nfsroot.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.19.4/udhcpscript.patch

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/udhcpc-fix-nfsroot.patch b/meta/recipes-core/busybox/busybox-1.19.4/udhcpc-fix-nfsroot.patch
deleted file mode 100644
index d2eab8b..0000000
--- a/meta/recipes-core/busybox/busybox-1.19.4/udhcpc-fix-nfsroot.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Pending
-
-# copy commit message from OE as the patch comment:
-#    commit ec4da6df3ad5b8b03446d0dda9c50a2439ae325a
-#    Author: Denys Dmytriyenko <denis@denix.org>
-#    Date:   Wed Feb 4 11:43:18 2009 -0500
-#
-#    busybox: fix nfsroot issues with resetting IP and deleting routes
-#
-# above comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-Index: busybox-1.15.3/examples/udhcp/simple.script
-===================================================================
---- busybox-1.15.3.orig/examples/udhcp/simple.script	2010-06-27 12:17:14.116876946 +0200
-+++ busybox-1.15.3/examples/udhcp/simple.script	2010-06-27 12:18:38.607868533 +0200
-@@ -10,10 +10,17 @@
- BROADCAST="broadcast +"
- [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
- 
-+# return 0 if root is mounted on a network filesystem
-+root_is_nfs() {
-+	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
-+}
-+
- case "$1" in
- 	deconfig)
-+		if ! root_is_nfs ; then
- 		echo "Setting IP address 0.0.0.0 on $interface"
--		ifconfig $interface 0.0.0.0
-+			ifconfig $interface 0.0.0.0
-+		fi
- 		;;
- 
- 	renew|bound)
-@@ -21,15 +28,17 @@
- 		ifconfig $interface $ip $NETMASK $BROADCAST
- 
- 		if [ -n "$router" ] ; then
--			echo "Deleting routers"
--			while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
--				:
--			done
-+			if ! root_is_nfs ; then
-+				echo "Deleting routers"
-+				while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
-+					:
-+				done
-+			fi
- 
- 			metric=0
- 			for i in $router ; do
- 				echo "Adding router $i"
--				route add default gw $i dev $interface metric $((metric++))
-+				route add default gw $i dev $interface metric $((metric++)) 2>/dev/null
- 			done
- 		fi
- 
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/udhcpscript.patch b/meta/recipes-core/busybox/busybox-1.19.4/udhcpscript.patch
deleted file mode 100644
index b82ea33..0000000
--- a/meta/recipes-core/busybox/busybox-1.19.4/udhcpscript.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-# copy commit message from OE as the patch comment
-#   commit c9bb6478a873d6de4c8a0e712435ac9a658a345d
-#   Author: Holger Schurig <schurig@mn-solutions.de>
-#   Date:   Wed Sep 29 08:29:58 2004 +0000
-#
-#   udhcpscript: fixes the "deleting routers" error message in case of no existing default routes
-#
-# Above comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-
-Index: busybox-1.15.1/examples/udhcp/simple.script
-===================================================================
---- busybox-1.15.1.orig/examples/udhcp/simple.script	2009-09-12 17:55:36.000000000 +0200
-+++ busybox-1.15.1/examples/udhcp/simple.script	2009-09-16 22:51:06.599693412 +0200
-@@ -22,7 +22,7 @@ case "$1" in
- 
- 		if [ -n "$router" ] ; then
- 			echo "Deleting routers"
--			while route del default gw 0.0.0.0 dev $interface ; do
-+			while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
- 				:
- 			done
- 
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index ad8297e..30dd333 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,9 +1,7 @@
 require busybox.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
-           file://udhcpscript.patch \
-           file://udhcpc-fix-nfsroot.patch \
            file://B921600.patch \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
-- 
1.7.9.5



