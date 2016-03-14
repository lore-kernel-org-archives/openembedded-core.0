Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD8277017D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:53:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2E6r1HE012022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:53:01 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:53:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:52:54 -0700
Message-ID: <d8b9ca3f8af09bd9928d3b34d8e711904e75a4da.1457938286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938286.git.liezhi.yang@windriver.com>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] runqemu: simplify the checking for vm images
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
X-List-Received-Date: Mon, 14 Mar 2016 06:53:00 -0000
Content-Type: text/plain

* So that we can add more image support easliy.
* I think that wic should be vm images.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu          |   34 +++++++++++++++++++++++-----------
 scripts/runqemu-internal |   10 +++++-----
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 771aa38..ed32bc2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -75,6 +75,7 @@ KVM_ENABLED="no"
 KVM_ACTIVE="no"
 VHOST_ENABLED="no"
 VHOST_ACTIVE="no"
+IS_VM="false"
 
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
@@ -89,7 +90,7 @@ process_filename() {
 		[ -z "$KERNEL" ] && KERNEL=$filename || \
 		    error "conflicting KERNEL args [$KERNEL] and [$filename]"
 		;;
-	/ext[234]/|/jffs2/|/btrfs/|/wic/)
+	/ext[234]/|/jffs2/|/btrfs/)
 		# A file ending in a supportted fs type is a rootfs image
 		if [ -z "$FSTYPE" -o "$FSTYPE" = "$EXT" ]; then
 		    FSTYPE=$EXT
@@ -98,10 +99,11 @@ process_filename() {
 		    error "conflicting FSTYPE types [$FSTYPE] and [$EXT]"
 		fi
 		;;
-	/hddimg/|/hdddirect/|/vmdk/)
+	/hddimg/|/hdddirect/|/vmdk/|/wic/)
 		FSTYPE=$EXT
 		VM=$filename
 		ROOTFS=$filename
+		IS_VM="true"
 		;;
 	*)
 		error "unknown file arg [$filename]"
@@ -109,6 +111,13 @@ process_filename() {
     esac
 }
 
+check_fstype_conflicts() {
+    if [ -z "$FSTYPE" -o "$FSTYPE" = "$1" ]; then
+        FSTYPE=$1
+    else
+        error "conflicting FSTYPE types [$FSTYPE] and [$1]"
+    fi
+}
 # Parse command line args without requiring specific ordering. It's a
 # bit more complex, but offers a great user experience.
 while true; do
@@ -119,9 +128,12 @@ while true; do
             [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
-        "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs" | "hddimg" | "hdddirect" | "wic" | "vmdk")
-            [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ] && FSTYPE=$arg || \
-                error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
+        "ext"[234] | "jffs2" | "nfs" | "btrfs")
+            check_fstype_conflicts $arg
+            ;;
+        "hddimg" | "hdddirect" | "wic" | "vmdk")
+            check_fstype_conflicts $arg
+            IS_VM="true"
             ;;
         "ramfs")
             FSTYPE=cpio.gz
@@ -245,7 +257,7 @@ if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
 fi
 
 if [ -z "$MACHINE" ]; then
-    if [ "x$FSTYPE" = "xvmdk" ] || [ "x$FSTYPE" = "xhddimg" ] || [ "x$FSTYPE" = "xhdddirect" ] || [ "x$FSTYPE" = "xwic" ]; then
+    if [ "$IS_VM" = "true" ]; then
         [ "x$FSTYPE" = "xwic" ] && filename=$ROOTFS || filename=$VM
         MACHINE=`basename $filename | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
@@ -457,7 +469,7 @@ if [ -e "$ROOTFS" -a -z "$FSTYPE" ]; then
     fi
 fi
 
-if [ -z "$KERNEL" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" -a "x$FSTYPE" != "xwic" ]; then
+if [ -z "$KERNEL" -a "$IS_VM" = "false" ]; then \
     setup_path_vars 1
     eval kernel_file=\$${machine2}_DEFAULT_KERNEL
     KERNEL=$DEPLOY_DIR_IMAGE/$kernel_file
@@ -483,7 +495,7 @@ fi
 if [ "$LAZY_ROOTFS" = "true" ]; then
     setup_path_vars 1
     echo "Assuming $ROOTFS really means $DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE"
-    if [ "$FSTYPE" = "hddimg" -o "x$FSTYPE" = "xhdddirect" ]; then
+    if [ "$IS_VM" = "true" ]; then
         VM=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
     else
         ROOTFS=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
@@ -498,7 +510,7 @@ if [ -z "$ROOTFS" ]; then
 
     if [ -z "$ROOTFS" ]; then
         error "Unable to determine default rootfs for MACHINE [$MACHINE]"
-    elif [ "x$FSTYPE" = "xvmdk" -o "x$FSTYPE" = "xhddimg" -o "x$FSTYPE" = "xhdddirect" ]; then
+    elif [ "$IS_VM" = "true" ]; then
 		VM=$ROOTFS
     fi
 fi
@@ -508,11 +520,11 @@ ROOTFS=`readlink -f $ROOTFS`
 
 echo ""
 echo "Continuing with the following parameters:"
-if [ "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" ]; then
+if [ "$IS_VM" = "false" ]; then
     echo "KERNEL: [$KERNEL]"
     echo "ROOTFS: [$ROOTFS]"
 else
-    echo "VMDK:   [$VM]"
+    echo "VM:   [$VM]"
 fi
 echo "FSTYPE: [$FSTYPE]"
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 9d5d6af..b7d80b2 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -300,13 +300,13 @@ case "$MACHINE" in
     ;;
 esac
 
-if [ ! -f "$KERNEL" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" -a "x$FSTYPE" != "xwic" ]; then
+if [ ! -f "$KERNEL" -a "$IS_VM" = "false" ]; then
     echo "Error: Kernel image file $KERNEL doesn't exist"
     cleanup
     return 1
 fi
 
-if [ "$FSTYPE" != "nfs" -a "$FSTYPE" != "vmdk" -a "$FSTYPE" != "hddimg" -a "$FSTYPE" != "hdddirect" -a ! -f "$ROOTFS" ]; then
+if [ "$FSTYPE" != "nfs" -a "$IS_VM" = "false" -a ! -f "$ROOTFS" ]; then
     echo "Error: Image file $ROOTFS doesn't exist"
     cleanup
     return 1
@@ -428,7 +428,7 @@ if [ "$MACHINE" = "qemux86" ]; then
         KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
     fi
-    if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
+    if [ "$IS_VM" = "true" ]; then
         QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
     fi
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
@@ -464,7 +464,7 @@ if [ "$MACHINE" = "qemux86-64" ]; then
         KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $QEMU_UI_OPTIONS"
     fi
-    if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
+    if [ "$IS_VM" = "true" ]; then
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $QEMU_UI_OPTIONS"
     fi
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
@@ -721,7 +721,7 @@ fi
 
 echo "Running $QEMU..."
 # -no-reboot is a mandatory option - see bug #100
-if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
+if [ "$IS_VM" = "true" ]; then
     # Check root=/dev/sdX or root=/dev/vdX
     [ ! -e "$VM" ] && error "VM image is not found!"
     if grep -q 'root=/dev/sd' $VM; then
-- 
1.7.9.5


