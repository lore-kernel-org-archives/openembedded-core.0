Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1RBWYi-00062x-AH
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 20:51:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p95Ijai5023814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 11:45:36 -0700 (PDT)
Received: from ord-lpggp2.lombard (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 5 Oct 2011 11:45:35 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Oct 2011 13:43:59 -0500
Message-ID: <1317840239-5290-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] Allow user mode NFS server to run without rpcbind / portmap
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
X-List-Received-Date: Wed, 05 Oct 2011 18:51:12 -0000
Content-Type: text/plain

From the 2.6.39 linux kernel and up it is possible to use
and nfsroot mount without the need to talk to an RPC info
server as long as the port numbers for mountd and nfsd
are known in advance.

This patch updates the qemu startup scripts and the
user mode NFS server to have the ability to start
without the need to use rpcbind or portmap services.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../023-no-rpc-register.patch                      |   34 ++++++++++++++++++++
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    3 +-
 scripts/runqemu-export-rootfs                      |    4 ++-
 scripts/runqemu-internal                           |   16 +++------
 4 files changed, 44 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch

diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch
new file mode 100644
index 0000000..50f23fc
--- /dev/null
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+# Allow user mode NFS to work without rpcbind / portmap
+# Patch origin: Wind River
+
+---
+ rpcmisc.c |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+--- a/rpcmisc.c
++++ b/rpcmisc.c
+@@ -91,7 +91,8 @@ not_inetd:
+ 		if (transp == NULL)
+ 			Dprintf(L_FATAL, "cannot create udp service.");
+ 		for (i = 0; (vers = verstbl[i]) != 0; i++) {
+-			if (!svc_register(transp, prog, vers, dispatch, IPPROTO_UDP)) {
++			if (!(svc_register(transp, prog, vers, dispatch, IPPROTO_UDP) ||
++			      svc_register(transp, prog, vers, dispatch, 0))) {
+ 				Dprintf(L_FATAL,
+ 					"unable to register (%s, %d, udp).",
+ 					name, vers);
+@@ -110,7 +111,8 @@ not_inetd:
+ 		transp->xp_ops->xp_recv = auth_rendevouser;
+ #endif
+ 		for (i = 0; (vers = verstbl[i]) != 0; i++) {
+-			if (!svc_register(transp, prog, vers, dispatch, IPPROTO_TCP)) {
++			if (!(svc_register(transp, prog, vers, dispatch, IPPROTO_TCP) ||
++			      svc_register(transp, prog, vers, dispatch, 0))) {
+ 				Dprintf(L_FATAL,
+ 					"unable to register (%s, %d, tcp).",
+ 					name, vers);
diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
index 8ed2e33..29c7052 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
+++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} = "pseudo"
 RDEPENDS_${PN}_virtclass-native = "pseudo-native"
 RDEPENDS_${PN}_virtclass-nativesdk = "pseudo-nativesdk"
 BASEPV = "2.2beta47"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://linux.mathematik.tu-darmstadt.de/pub/linux/oldstuff/people/okir/nfs-server-${BASEPV}.tar.gz \
            file://001-2.2b47-2.2b51.patch \
@@ -32,6 +32,7 @@ SRC_URI = "ftp://linux.mathematik.tu-darmstadt.de/pub/linux/oldstuff/people/okir
            file://020-undefined-chmod-fix.patch \
            file://021-nolibwrap.patch \
            file://022-add-close-on-exec-descriptors.patch \
+           file://023-no-rpc-register.patch \
           "
 
 SRC_URI[md5sum] = "79a29fe9f79b2f3241d4915767b8c511"
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 3ee3112..5cb4bf2 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -83,10 +83,12 @@ NFS_MOUNTPROG=$[ 21111 + $NFS_INSTANCE ]
 NFS_NFSPROG=$[ 11111 + $NFS_INSTANCE ]
 # NFS port number
 NFS_PORT=$[ 3049 + $NFS_INSTANCE ]
+# mountd port number
+MOUNT_PORT=$[ 3048 + $NFS_INSTANCE ]
 
 ## For debugging you would additionally add
 ## --debug all
-MOUNTD_OPTS="--allow-non-root --mount-pid $MOUNTPID -f $EXPORTS --rmtab $RMTAB --prog $NFS_MOUNTPROG -r"
+MOUNTD_OPTS="--allow-non-root --mount-pid $MOUNTPID -f $EXPORTS --rmtab $RMTAB --prog $NFS_MOUNTPROG -r -P $MOUNT_PORT"
 NFSD_OPTS="--allow-non-root --nfs-pid $NFSPID -f $EXPORTS --prog $NFS_NFSPROG -P $NFS_PORT -r"
 
 # Setup the exports file
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ce3291f..2968ed9 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -258,21 +258,15 @@ fi
 if [ "$FSTYPE" = "nfs" ]; then
     NFS_SERVER="192.168.7.1"
     NFS_DIR=`echo $ROOTFS | sed 's/^[^:]*:\(.*\)/\1/'`
-    MOUNTD_PORT=$[ 21111 + $NFS_INSTANCE ]
-    NFSD_PORT=$[ 11111 + $NFS_INSTANCE ]
-    UNFS_OPTS="nfsvers=2,mountprog=$MOUNTD_PORT,nfsprog=$NFSD_PORT,udp"
+    MOUNTD_RPCPORT=$[ 21111 + $NFS_INSTANCE ]
+    NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
+    NFSD_PORT=$[ 3049 + $NFS_INSTANCE ]
+    MOUNTD_PORT=$[ 3048 + $NFS_INSTANCE ]
+    UNFS_OPTS="nfsvers=2,mountprog=$MOUNTD_RPCPORT,nfsprog=$NFSD_RPCPORT,udp,port=$NFSD_PORT,mountport=$MOUNTD_PORT"
 
     PSEUDO_LOCALSTATEDIR=~/.runqemu-sdk/pseudo
     export PSEUDO_LOCALSTATEDIR
 
-    rpcbind_running=`ps ax | grep rpcbind | grep -v grep | wc -l`
-    portmap_running=`ps ax | grep portmap | grep -v grep | wc -l`
-    if [[ $rpcbind_running == 0 && $portmap_running == 0 ]]; then
-        echo "You need to be running either rpcbind or portmap to continue"
-        cleanup
-        return
-    fi
-
     # Start the userspace NFS server
     echo "runqemu-export-rootfs restart $ROOTFS"
     runqemu-export-rootfs restart $ROOTFS
-- 
1.7.1



