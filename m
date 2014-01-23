Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5666E876
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 14:35:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0NEZwMP003510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 06:35:58 -0800 (PST)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 06:35:58 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 08:32:46 -0600
Message-ID: <1390487566-13569-7-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 6/6] runqemu, runqemu-internal: Allow slirp for NFS and KVM use
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
X-List-Received-Date: Thu, 23 Jan 2014 14:35:58 -0000
Content-Type: text/plain

The default slirp address for the NFS server is 10.0.2.2.  If not
using a tap interface this address must be used or the target system
cannot connect properly.  Also the ip=... kernel arguments need to be
set to dhcp when using slirp or the root NFS will not get setup
properly.

The call to cleanup() results in a routine which is not defined when
setting up the NFS because it is called before acquire() for the
locking of the tap interfaces, the solution being to simply not call
cleanup() that early.

When using slirp, kvm should not execute the vhost net checks because
the vhost net will not be configure or used.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/runqemu          |   10 ++++++----
 scripts/runqemu-internal |   19 +++++++++++--------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dcb2931..9272b6f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -279,10 +279,12 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         exit 1;
     fi
     if [ ! -w /dev/vhost-net -o ! -r /dev/vhost-net ]; then
-        echo "You have no rights on /dev/vhost-net."
-        echo "Please change the ownership of this file as described at:"
-        echo "$YOCTO_PARAVIRT_KVM_WIKI";
-        exit 1;
+	if [ "$SLIRP_ENABLED" != "yes" ] ; then
+            echo "You have no rights on /dev/vhost-net."
+            echo "Please change the ownership of this file as described at:"
+            echo "$YOCTO_PARAVIRT_KVM_WIKI";
+            exit 1;
+	fi
     fi
 fi
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index cecb527..e3b0729 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -114,7 +114,7 @@ NFSRUNNING="false"
 ORIG_STTY=$(stty -g)
 
 if [ "$SLIRP_ENABLED" = "yes" ]; then
-    KERNEL_NETWORK_CMD=""
+    KERNEL_NETWORK_CMD="ip=dhcp"
     QEMU_TAP_CMD=""
     QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
     if [ "$KVM_ACTIVE" = "yes" ]; then
@@ -301,9 +301,18 @@ if [ "$FSTYPE" != "nfs" -a "$FSTYPE" != "vmdk" -a ! -f "$ROOTFS" ]; then
     return 1
 fi
 
-if [ "$FSTYPE" = "nfs" ]; then
+if [ "$NFS_SERVER" = "" ]; then
     NFS_SERVER="192.168.7.1"
+    if [ "$SLIRP_ENABLED" = "yes" ]; then
+	NFS_SERVER="10.0.2.2"
+    fi
+fi
+
+if [ "$FSTYPE" = "nfs" ]; then
     NFS_DIR=`echo $ROOTFS | sed 's/^[^:]*:\(.*\)/\1/'`
+    if [ "$NFS_INSTANCE" = "" ] ; then
+	NFS_INSTANCE=0
+    fi
     MOUNTD_RPCPORT=$[ 21111 + $NFS_INSTANCE ]
     NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
     NFSD_PORT=$[ 3049 + 2 * $NFS_INSTANCE ]
@@ -317,17 +326,11 @@ if [ "$FSTYPE" = "nfs" ]; then
     echo "runqemu-export-rootfs restart $ROOTFS"
     runqemu-export-rootfs restart $ROOTFS
     if [ $? != 0 ]; then
-        cleanup
         return 1
     fi
     NFSRUNNING="true"
 fi
 
-if [ "$NFS_SERVER" = "" ]; then
-    NFS_SERVER="192.168.7.1"
-    NFS_DIR=$ROOTFS
-fi
-
 if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarmv7" ]; then
     QEMU=qemu-system-arm
     MACHINE_SUBTYPE=versatilepb
-- 
1.7.9.5


