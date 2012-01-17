Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ar-0006h2-Jh
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632906"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:03 -0800
Message-Id: <4fed8429bc31211a979aaa496d2af8c574b1140a.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/62] qemuppc: replace emulation of qemuppc from prep to mac99
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:38 -0000

From: Liming Wang <liming.wang@windriver.com>

With this new emulation, existing qemuppc functionality is maintained
and other functionality such as framebuffer + sato and NFS boot are
added.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/machine/qemuppc.conf                  |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 scripts/runqemu                                 |    7 +------
 scripts/runqemu-internal                        |   16 ++++++++--------
 5 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index bcc408f..48eecb7 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -5,7 +5,7 @@
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-ppc603e.inc
 
-KERNEL_IMAGETYPE = "zImage"
+KERNEL_IMAGETYPE = "vmlinux"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index c8983c4..c6bf446 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "bcf4107c7f22d10952618a2ad146e6149d240cd2"
 SRCREV_machine_qemuppc ?= "1e5511ea2cb5f150ffce86071035a81c0499494b"
-SRCREV_meta ?= "6ae3d992cf546184010e87a0349810198f1d167c"
+SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 921c258..e624b48 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "10e808d1c304b14cf42903fd637f239766b78476"
 SRCREV_machine_qemux86 ?= "e04f9f8e564c60b1ce907d64074c18730f8dab4e"
 SRCREV_machine_qemux86-64 ?= "53c2fa060d34e9a0b59e19398aeebbe73f24d89b"
 SRCREV_machine ?= "fe80c1e343bf8f038328a612cef7f821d7ec8dbf"
-SRCREV_meta ?= "6ae3d992cf546184010e87a0349810198f1d167c"
+SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/scripts/runqemu b/scripts/runqemu
index bed6a29..ac5facf 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -262,7 +262,7 @@ QEMUARM_DEFAULT_FSTYPE=ext3
 QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
 QEMUMIPS_DEFAULT_FSTYPE=ext3
 
-QEMUPPC_DEFAULT_KERNEL=zImage-qemuppc.bin
+QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
 QEMUPPC_DEFAULT_FSTYPE=ext3
 
 AKITA_DEFAULT_KERNEL=zImage-akita.bin
@@ -365,11 +365,6 @@ if [ -z "$FSTYPE" ]; then
     fi
 fi
 
-if [ "$FSTYPE" = "nfs" -a "$MACHINE" = "qemuppc" ]; then
-    echo "Error: usermode NFS boot is not available for qemuppc."
-    exit 1
-fi
-
 # FSTYPE is now set for all cases
 
 # Handle cases where a ROOTFS type is given instead of a filename, e.g.
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2968ed9..c55619b 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -389,13 +389,13 @@ fi
 
 if [ "$MACHINE" = "qemuppc" ]; then
     QEMU=qemu-system-ppc
-    MACHINE_SUBTYPE=prep
-    CPU_SUBTYPE=603e
-    BIOS=powerpc_rom.bin
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -nographic"
+    MACHINE_SUBTYPE=mac99
+    CPU_SUBTYPE=G4
+    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=/dev/hda rw console=ttyS0 3 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+        KERNCMDLINE="root=/dev/hda rw console=ttyS0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
@@ -403,8 +403,8 @@ if [ "$MACHINE" = "qemuppc" ]; then
             cleanup
             return
         fi
-        KERNCMDLINE="root=/dev/nfs console=ttyS0 3 nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -no-reboot $QEMU_UI_OPTIONS"
+        KERNCMDLINE="root=/dev/nfs console=ttyS0 nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
     fi
 fi
 
-- 
1.7.6.5



