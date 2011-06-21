Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QZ7bO-0004h6-5H
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 22:31:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Jun 2011 13:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="16391778"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 21 Jun 2011 13:27:33 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 13:27:26 -0700
Message-Id: <b907a0a93b1d7e92429efb08eb0f27c7eaa3c2d8.1308687821.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <c3a70e785af909a60451135bf72663bed052ff7d.1308687821.git.nitin.a.kamble@intel.com>
References: <c3a70e785af909a60451135bf72663bed052ff7d.1308687821.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1308687821.git.nitin.a.kamble@intel.com>
References: <cover.1308687821.git.nitin.a.kamble@intel.com>
Subject: [btrfs patch 6/6] scripts/runqemu: enable btrfs
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
X-List-Received-Date: Tue, 21 Jun 2011 20:31:16 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 scripts/runqemu          |    6 +++---
 scripts/runqemu-internal |   12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index aa44070..5aed25a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -71,7 +71,7 @@ process_filename() {
             usage
         fi
     elif [[ "x$EXT" == "xext2" || "x$EXT" == "xext3" ||
-            "x$EXT" == "xjffs2" ]]; then
+            "x$EXT" == "xjffs2" || "x$EXT" == "xbtrfs" ]]; then
         # A file ending in a supportted fs type is a rootfs image
         if [[ -z "$FSTYPE" || "$FSTYPE" == "$EXT" ]]; then
             FSTYPE=$EXT
@@ -101,7 +101,7 @@ while [ $i -le $# ]; do
                 usage
             fi
             ;;
-        "ext2" | "ext3" | "jffs2" | "nfs")
+        "ext2" | "ext3" | "jffs2" | "nfs" | "btrfs")
             if [[ -z "$FSTYPE" || "$FSTYPE" == "$arg" ]]; then
                 FSTYPE=$arg
             else
@@ -317,7 +317,7 @@ if [[ -e "$ROOTFS" && -z "$FSTYPE" ]]; then
     # Extract the filename extension
     EXT=`echo $ROOTFS | awk -F . '{ print \$NF }'`
     if [[ "x$EXT" == "xext2" || "x$EXT" == "xext3" || 
-          "x$EXT" == "xjffs2" ]]; then
+          "x$EXT" == "xjffs2" || "x$EXT" == "xbtrfs" ]]; then
         FSTYPE=$EXT
     else
         echo "Note: Unable to determine filesystem extension for $ROOTFS"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ffac05e..c15632d 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -277,7 +277,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     MACHINE_SUBTYPE=versatilepb
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
-    if [ "$FSTYPE" = "ext3" ]; then
+    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/sda rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M versatilepb -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
@@ -301,7 +301,7 @@ fi
 if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware -enable-gl"
-    if [ "$FSTYPE" = "ext3" ]; then
+    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
     fi
@@ -322,7 +322,7 @@ fi
 if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware -enable-gl"
-    if [ "$FSTYPE" = "ext3" ]; then
+    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
     fi
@@ -345,7 +345,7 @@ fi
 
 if [ "$MACHINE" = "spitz" ]; then
     QEMU=qemu-system-arm
-    if [ "$FSTYPE" = "ext3" ]; then
+    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         echo $ROOTFS
         ROOTFS=`readlink -f $ROOTFS`
         echo $ROOTFS
@@ -361,7 +361,7 @@ if [ "$MACHINE" = "qemumips" ]; then
     QEMU=qemu-system-mips
     MACHINE_SUBTYPE=malta
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
-    if [ "$FSTYPE" = "ext3" ]; then
+    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
@@ -383,7 +383,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     CPU_SUBTYPE=603e
     BIOS=powerpc_rom.bin
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -nographic"
-    if [ "$FSTYPE" = "ext3" ]; then
+    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
-- 
1.7.4.4



