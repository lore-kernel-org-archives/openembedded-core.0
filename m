Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DBC1171AB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 07:35:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAT7ZrmU023805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Nov 2016 23:35:53 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 23:35:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 23:35:47 -0800
Message-ID: <8b33efa40146f0db67d377f29a5ad9f2e1c547af.1480404884.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1480404884.git.liezhi.yang@windriver.com>
References: <cover.1480404884.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] runqemu-export-rootfs: fix inconsistent var names
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
X-List-Received-Date: Tue, 29 Nov 2016 07:35:52 -0000
Content-Type: text/plain

Fixed:
$ runqemu nfs qemux86-64
[snip]
On your target please remember to add the following options for NFS
nfsroot=IP_ADDRESS:/path/to/nfsroot,nfsvers=3,port=,mountprog=,nfsprog=,udp,mountport=
[snip]

Note that the values are null, this is because their var names are
inconsistent.

[YOCTO #10519]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu-export-rootfs | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 3dee131..0dd3eba 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -78,23 +78,17 @@ if [ ! -d "$PSEUDO_LOCALSTATEDIR" ]; then
 fi
 
 # rpc.mountd RPC port
-NFS_MOUNTPROG=$[ 21111 + $NFS_INSTANCE ]
+MOUNTD_RPCPORT=$[ 21111 + $NFS_INSTANCE ]
 # rpc.nfsd RPC port
-NFS_NFSPROG=$[ 11111 + $NFS_INSTANCE ]
-# NFS port number
-NFS_PORT=$[ 3049 + 2 * $NFS_INSTANCE ]
+NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
+# NFS server port number
+NFSD_PORT=$[ 3049 + 2 * $NFS_INSTANCE ]
 # mountd port number
-MOUNT_PORT=$[ 3048 + 2 * $NFS_INSTANCE ]
+MOUNTD_PORT=$[ 3048 + 2 * $NFS_INSTANCE ]
 
 ## For debugging you would additionally add
 ## --debug all
-UNFSD_OPTS="-p -N -i $NFSPID -e $EXPORTS -x $NFS_NFSPROG -n $NFS_PORT -y $NFS_MOUNTPROG -m $MOUNT_PORT"
-
-# Setup the exports file
-if [ "$1" = "start" ]; then
-	echo "Creating exports file..."
-	echo "$NFS_EXPORT_DIR (rw,async,no_root_squash,no_all_squash,insecure)" > $EXPORTS
-fi
+UNFSD_OPTS="-p -N -i $NFSPID -e $EXPORTS -x $NFSD_RPCPORT -n $NFSD_PORT -y $MOUNTD_RPCPORT -m $MOUNTD_PORT"
 
 # See how we were called.
 case "$1" in
@@ -114,6 +108,9 @@ case "$1" in
 		exit 1
 	fi
 
+	echo "Creating exports file..."
+	echo "$NFS_EXPORT_DIR (rw,async,no_root_squash,no_all_squash,insecure)" > $EXPORTS
+
 	echo "Starting User Mode nfsd"
 	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS"
 	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS
-- 
2.9.0


