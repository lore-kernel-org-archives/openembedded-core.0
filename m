Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1Uaq8T-0007zH-T8
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 18:25:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 09:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="335587250"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2013 09:06:18 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id 4247A6A408D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 09:06:08 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 19:06:25 +0300
Message-Id: <7cbb9c520107dd3640c51819bf84e2ae06e45fd1.1368201796.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1368201796.git.stefanx.stanacar@intel.com>
References: <cover.1368201796.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1368201796.git.stefanx.stanacar@intel.com>
References: <cover.1368201796.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/3] runqemu-internal: support for ext2 and ext4 not only ext3
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
X-List-Received-Date: Fri, 10 May 2013 16:25:43 -0000
X-List-Received-Date: Fri, 10 May 2013 16:25:43 -0000

Don't check only for ext3 fstype, we can boot ext2 and ext4 just
as well.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/runqemu-internal | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f11706d..3bd0a09 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -299,7 +299,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     export QEMU_AUDIO_DRV="none"
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
-    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/sda rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
@@ -323,7 +323,7 @@ fi
 if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu-system-i386
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
-    if [ "$FSTYPE" = "ext2" -o "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
@@ -347,7 +347,7 @@ fi
 if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
-    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
@@ -373,7 +373,7 @@ fi
 
 if [ "$MACHINE" = "spitz" ]; then
     QEMU=qemu-system-arm
-    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         echo $ROOTFS
         ROOTFS=`readlink -f $ROOTFS`
         echo $ROOTFS
@@ -393,7 +393,7 @@ if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemum
     esac
     MACHINE_SUBTYPE=malta
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
-    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
@@ -415,7 +415,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     CPU_SUBTYPE=G4
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
-    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
@@ -434,7 +434,7 @@ if [ "$MACHINE" = "qemush4" ]; then
     QEMU=qemu-system-sh4
     MACHINE_SUBTYPE=r2d
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         KERNCMDLINE="root=/dev/hda rw console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
-- 
1.8.1.4



