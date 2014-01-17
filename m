Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88BE961FE4
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 16:41:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0HGf5N5021713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 08:41:05 -0800 (PST)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 17 Jan 2014 08:41:05 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 10:38:02 -0600
Message-ID: <1389976685-25802-5-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1389976685-25802-1-git-send-email-jason.wessel@windriver.com>
References: <1389976685-25802-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] runqemu: Use the newer unfs3 for serving user space nfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2014 16:41:04 -0000
Content-Type: text/plain

From: Saul Wold <sgw@linux.intel.com>

This new version correctly handles the 64bit ext3 / ext4 issues we
were seeing with the older unfs-server which did not handle 64bit file
systems correctly, producing the duplicate cookies.

[YOCTO #5639]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu-export-rootfs |   53 ++++-------------------------------------
 scripts/runqemu-internal      |    2 +-
 2 files changed, 6 insertions(+), 49 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index bbdaf5b..2d87996 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -88,8 +88,7 @@ MOUNT_PORT=$[ 3048 + 2 * $NFS_INSTANCE ]
 
 ## For debugging you would additionally add
 ## --debug all
-MOUNTD_OPTS="--allow-non-root --mount-pid $MOUNTPID -f $EXPORTS --rmtab $RMTAB --prog $NFS_MOUNTPROG -r -P $MOUNT_PORT"
-NFSD_OPTS="--allow-non-root --nfs-pid $NFSPID -f $EXPORTS --prog $NFS_NFSPROG -P $NFS_PORT -r"
+UNFSD_OPTS="-p -N -i $NFSPID -e $EXPORTS -x $NFS_NFSPROG -n $NFS_PORT -y $NFS_MOUNTPROG -m $MOUNT_PORT"
 
 # Setup the exports file
 if [ "$1" = "start" ]; then
@@ -115,53 +114,18 @@ case "$1" in
 		exit 1
 	fi
 
-	echo "Starting User Mode rpc.mountd"
-	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd $MOUNTD_OPTS"
-	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd $MOUNTD_OPTS
-	if [ ! $? = 0 ]; then
-		echo "====================="
-		echo "Error starting MOUNTD"
-		echo "====================="
-		if [ ! "x$RPCBIND_RUNNING" = "x" ] ; then
-			echo "  If you see an error above that says:"
-			echo "    RPC: Authentication error; why = Client credential too weak"
-			echo "  You need to add the -i option when running rpcbind"
-			echo "==============================================="
-			echo "For recent Fedora/RedHat hosts:"
-			echo "Add RPCBIND_ARGS=-i to /etc/sysconfig/rpcbind"
-			echo "  or"
-			echo "Add RPCBIND_OPTIONS=-i to /etc/sysconfig/rpcbind"
-			echo "Then run as root: /etc/init.d/rpcbind restart"
-			echo "==============================================="
-			echo "For recent Debian/Ubuntu hosts:"
-			echo "Add OPTIONS=\"-i -w\"  to /etc/default/rpcbind"
-			echo "sudo service portmap restart"
-		fi
-
-		exit 1
-	fi
-
 	echo "Starting User Mode nfsd"
-	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.nfsd $NFSD_OPTS"
-	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.nfsd $NFSD_OPTS
+	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/unfsd $UNFSD_OPTS"
+	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/unfsd $UNFSD_OPTS
 	if [ ! $? = 0 ]; then
 		echo "Error starting nfsd"
 		exit 1
 	fi
-	# Check to make sure everything started ok.
-	if [ ! -f $MOUNTPID ]; then
-		echo "rpc.mountd did not start correctly"
-		exit 1
-	fi
+	 Check to make sure everything started ok.
 	if [ ! -f $NFSPID ]; then
 		echo "rpc.nfsd did not start correctly"
 		exit 1
 	fi
-	ps -fp `cat $MOUNTPID` > /dev/null 2> /dev/null
-	if [ ! $? = 0 ]; then
-		echo "rpc.mountd did not start correctly"
-		exit 1
-	fi
 	ps -fp `cat $NFSPID` > /dev/null 2> /dev/null
 	if [ ! $? = 0 ]; then
 		echo "rpc.nfsd did not start correctly"
@@ -169,16 +133,9 @@ case "$1" in
 	fi
 	echo " "
 	echo "On your target please remember to add the following options for NFS"
-	echo "nfsroot=IP_ADDRESS:$NFS_EXPORT_DIR,nfsvers=2,mountprog=$NFS_MOUNTPROG,nfsprog=$NFS_NFSPROG,udp"
+	echo "nfsroot=IP_ADDRESS:$NFS_EXPORT_DIR,nfsvers=3,port=$NFSD_PORT,mountprog=$MOUNTD_RPCPORT,nfsprog=$NFSD_RPCPORT,udp,mountport=$MOUNTD_PORT"
 	;;
   stop)
-	if [ -f "$MOUNTPID" ]; then
-		echo "Stopping rpc.mountd"
-		kill `cat $MOUNTPID`
-		rm -f $MOUNTPID
-	else
-		echo "No PID file, not stopping rpc.mountd"
-	fi
 	if [ -f "$NFSPID" ]; then
 		echo "Stopping rpc.nfsd"
 		kill `cat $NFSPID`
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 284b88c..cecb527 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -308,7 +308,7 @@ if [ "$FSTYPE" = "nfs" ]; then
     NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
     NFSD_PORT=$[ 3049 + 2 * $NFS_INSTANCE ]
     MOUNTD_PORT=$[ 3048 + 2 * $NFS_INSTANCE ]
-    UNFS_OPTS="nfsvers=2,mountprog=$MOUNTD_RPCPORT,nfsprog=$NFSD_RPCPORT,udp,port=$NFSD_PORT,mountport=$MOUNTD_PORT"
+    UNFS_OPTS="nfsvers=3,port=$NFSD_PORT,mountprog=$MOUNTD_RPCPORT,nfsprog=$NFSD_RPCPORT,udp,mountport=$MOUNTD_PORT"
 
     PSEUDO_LOCALSTATEDIR=~/.runqemu-sdk/pseudo
     export PSEUDO_LOCALSTATEDIR
-- 
1.7.9.5


