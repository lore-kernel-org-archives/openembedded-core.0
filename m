Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TJXQJ-0000tI-1m
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 00:28:11 +0200
Received: from localhost (m8a2036d0.tmodns.net [208.54.32.138])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 84A8730434
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2012 18:15:04 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 15:13:53 -0700
Message-Id: <32da4081eb3b416d2df06e7d9087ecac1f62a78f.1349302333.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349302333.git.scott.a.garman@intel.com>
References: <cover.1349302333.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349302333.git.scott.a.garman@intel.com>
References: <cover.1349302333.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 84A8730434.CC1C5
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/3] runqemu: allow multiple unfs instances to run simultaneously
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
X-List-Received-Date: Wed, 03 Oct 2012 22:28:11 -0000

A miscalculation in the way the port numbers of mountd and nfsd
are created was causing conflicts when starting multiple instances
of qemu using userspace nfs.

Thanks to Rudolf Streif for proposing this fix!

Fixes [YOCTO #1969]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu-export-rootfs |    4 ++--
 scripts/runqemu-internal      |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 90edc8a..bbdaf5b 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -82,9 +82,9 @@ NFS_MOUNTPROG=$[ 21111 + $NFS_INSTANCE ]
 # rpc.nfsd RPC port
 NFS_NFSPROG=$[ 11111 + $NFS_INSTANCE ]
 # NFS port number
-NFS_PORT=$[ 3049 + $NFS_INSTANCE ]
+NFS_PORT=$[ 3049 + 2 * $NFS_INSTANCE ]
 # mountd port number
-MOUNT_PORT=$[ 3048 + $NFS_INSTANCE ]
+MOUNT_PORT=$[ 3048 + 2 * $NFS_INSTANCE ]
 
 ## For debugging you would additionally add
 ## --debug all
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 0f07bad..7ca00f8 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -277,8 +277,8 @@ if [ "$FSTYPE" = "nfs" ]; then
     NFS_DIR=`echo $ROOTFS | sed 's/^[^:]*:\(.*\)/\1/'`
     MOUNTD_RPCPORT=$[ 21111 + $NFS_INSTANCE ]
     NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
-    NFSD_PORT=$[ 3049 + $NFS_INSTANCE ]
-    MOUNTD_PORT=$[ 3048 + $NFS_INSTANCE ]
+    NFSD_PORT=$[ 3049 + 2 * $NFS_INSTANCE ]
+    MOUNTD_PORT=$[ 3048 + 2 * $NFS_INSTANCE ]
     UNFS_OPTS="nfsvers=2,mountprog=$MOUNTD_RPCPORT,nfsprog=$NFSD_RPCPORT,udp,port=$NFSD_PORT,mountport=$MOUNTD_PORT"
 
     PSEUDO_LOCALSTATEDIR=~/.runqemu-sdk/pseudo
-- 
1.7.9.5



