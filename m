Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWVnJ-0005ZO-Ey
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 18:49:17 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 18:39:07 +0200
Message-Id: <1337618347-30900-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] netbase: merge init script updates from upstream
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
X-List-Received-Date: Mon, 21 May 2012 16:49:17 -0000

* Read /proc/mounts only once.
* Support many more network filesystem types.
* Remaining differences to netbase 4.47:
  - Uses the mountvirtfs keyword instead of mountkernfs
  - Doesn't use lsb functions
  - Doesn't print a warning if /etc/network/options exists
  - Doesn't use --exclude parameter for ifup, because
    busybox doesn't support it.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/netbase/netbase-4.47/init |  101 ++++++++++++++++++---------
 meta/recipes-core/netbase/netbase_4.47.bb   |    2 +-
 2 files changed, 70 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase-4.47/init b/meta/recipes-core/netbase/netbase-4.47/init
index 8a67e1c..bace9df 100644
--- a/meta/recipes-core/netbase/netbase-4.47/init
+++ b/meta/recipes-core/netbase/netbase-4.47/init
@@ -1,52 +1,89 @@
-#!/bin/sh
-#
+#!/bin/sh -e
 ### BEGIN INIT INFO
 # Provides:          networking
-# Required-Start:    $local_fs mountvirtfs
+# Required-Start:    mountvirtfs $local_fs
 # Required-Stop:     $local_fs
+# Should-Start:      ifupdown
+# Should-Stop:       ifupdown
 # Default-Start:     S
 # Default-Stop:      0 6
-# Short-Description: Raise network interfaces and configure them
+# Short-Description: Raise network interfaces.
 ### END INIT INFO
 
-PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
 
-if ! [ -x /sbin/ifup ]; then
-    exit 0
-fi
+[ -x /sbin/ifup ] || exit 0
+
+check_network_file_systems() {
+    [ -e /proc/mounts ] || return 0
+
+    if [ -e /etc/iscsi/iscsi.initramfs ]; then
+	echo "not deconfiguring network interfaces: iSCSI root is mounted."
+	exit 0
+    fi
+
+    exec 9<&0 < /proc/mounts
+    while read DEV MTPT FSTYPE REST; do
+	case $DEV in
+	/dev/nbd*|/dev/nd[a-z]*|/dev/etherd/e*)
+	    echo "not deconfiguring network interfaces: network devices still mounted."
+	    exit 0
+	    ;;
+	esac
+	case $FSTYPE in
+	nfs|nfs4|smbfs|ncp|ncpfs|cifs|coda|ocfs2|gfs|pvfs|pvfs2|fuse.httpfs|fuse.curlftpfs)
+	    echo "not deconfiguring network interfaces: network file systems still mounted."
+	    exit 0
+	    ;;
+	esac
+    done
+    exec 0<&9 9<&-
+}
+
+check_network_swap() {
+    [ -e /proc/swaps ] || return 0
+
+    exec 9<&0 < /proc/swaps
+    while read DEV MTPT FSTYPE REST; do
+	case $DEV in
+	/dev/nbd*|/dev/nd[a-z]*|/dev/etherd/e*)
+	    echo "not deconfiguring network interfaces: network swap still mounted."
+	    exit 0
+	    ;;
+	esac
+    done
+    exec 0<&9 9<&-
+}
 
 case "$1" in
-    start)
-        echo -n "Configuring network interfaces... "
-        ifup -a
+start)
+	echo -n "Configuring network interfaces... "
+	ifup -a
 	echo "done."
 	;;
-    stop)
-        if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts | 
-          grep -q "^/ nfs$"; then
-            echo "NOT deconfiguring network interfaces: / is an NFS mount"
-        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |  
-          grep -q "^/ smbfs$"; then
-            echo "NOT deconfiguring network interfaces: / is an SMB mount"
-	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts | 
-          grep -qE '^(nfs|smbfs|ncp|coda)$'; then
-            echo "NOT deconfiguring network interfaces: network shares still mounted."
-        else
-            echo -n "Deconfiguring network interfaces... "
-            ifdown -a
-	    echo "done."
-        fi
+
+stop)
+	check_network_file_systems
+	check_network_swap
+
+	echo -n "Deconfiguring network interfaces... "
+	ifdown -a
+	echo "done."
 	;;
-    force-reload|restart)
-        echo -n "Reconfiguring network interfaces... "
-        ifdown -a
-        ifup -a
+
+force-reload|restart)
+	echo "Running $0 $1 is deprecated because it may not enable again some interfaces"
+	echo "Reconfiguring network interfaces... "
+	ifdown -a || true
+	ifup -a
 	echo "done."
 	;;
-    *)
-	echo "Usage: /etc/init.d/networking {start|stop|restart|force-reload}"
+
+*)
+	echo "Usage: /etc/init.d/networking {start|stop}"
 	exit 1
 	;;
 esac
 
 exit 0
+
diff --git a/meta/recipes-core/netbase/netbase_4.47.bb b/meta/recipes-core/netbase/netbase_4.47.bb
index a1462f8..f84e9a4 100644
--- a/meta/recipes-core/netbase/netbase_4.47.bb
+++ b/meta/recipes-core/netbase/netbase_4.47.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r1"
+PR = "r2"
 
 inherit update-rc.d
 
-- 
1.7.9.5



