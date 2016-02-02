Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9FACF77298
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:43:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 09:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="875310246"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2016 09:43:27 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id B8A766A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:31:19 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 17:32:43 +0200
Message-Id: <ada82f5e68bae6d9149cb03e40cdd9aa38e34c7b.1454426922.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 03/14] runqemu: support path/to/<image>-<machine>.wic
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
X-List-Received-Date: Tue, 02 Feb 2016 17:43:26 -0000

Supported providing wic image path to runqemu:
  runquemu path/to/<image>-<machine>.wic

[YOCTO #8691]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0830901..48b7551 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -47,6 +47,7 @@ usage() {
     echo "  $MYNAME qemux86 qemuparams=\"-m 256\""
     echo "  $MYNAME qemux86 bootparams=\"psplash=false\""
     echo "  $MYNAME path/to/<image>-<machine>.vmdk"
+    echo "  $MYNAME path/to/<image>-<machine>.wic"
     exit 1
 }
 
@@ -88,7 +89,7 @@ process_filename() {
 		[ -z "$KERNEL" ] && KERNEL=$filename || \
 		    error "conflicting KERNEL args [$KERNEL] and [$filename]"
 		;;
-	/ext[234]/|/jffs2/|/btrfs/)
+	/ext[234]/|/jffs2/|/btrfs/|/wic/)
 		# A file ending in a supportted fs type is a rootfs image
 		if [ -z "$FSTYPE" -o "$FSTYPE" = "$EXT" ]; then
 		    FSTYPE=$EXT
@@ -235,7 +236,7 @@ elif [ ! -w /dev/net/tun ] ; then
 fi
 
 # Report errors for missing combinations of options
-if [ -z "$MACHINE" -a -z "$KERNEL" -a -z "$VM" ]; then
+if [ -z "$MACHINE" -a -z "$KERNEL" -a -z "$VM" -a "$FSTYPE" != "wic" ]; then
     error "you must specify at least a MACHINE, VM, or KERNEL argument"
 fi
 if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
@@ -243,8 +244,9 @@ if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
 fi
 
 if [ -z "$MACHINE" ]; then
-    if [ "x$FSTYPE" = "xvmdk" ] || [ "x$FSTYPE" = "xhddimg" ] || [ "x$FSTYPE" = "xhdddirect" ]; then
-        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+    if [ "x$FSTYPE" = "xvmdk" ] || [ "x$FSTYPE" = "xhddimg" ] || [ "x$FSTYPE" = "xhdddirect" ] || [ "x$FSTYPE" = "xwic" ]; then
+        [ "x$FSTYPE" = "xwic" ] && filename=$ROOTFS || filename=$VM
+        MACHINE=`basename $filename | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from image filename [$VM]"
         fi
-- 
2.1.4


