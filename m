Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liming.wang@windriver.com>) id 1RimAO-0003kd-G5
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 13:11:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q058c8Y8019032
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jan 2012 00:38:08 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 5 Jan 2012 00:38:08 -0800
From: Liming Wang <liming.wang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <sgw@linux.intel.com>
Date: Thu, 5 Jan 2012 16:37:43 +0800
Message-ID: <1325752666-28560-2-git-send-email-liming.wang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] qemuppc: replace emulation of qemuppc from prep to mac99
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
X-List-Received-Date: Thu, 05 Jan 2012 12:11:32 -0000
Content-Type: text/plain

With this new emulation, qemuppc can support framebuffer
and the nfs booting works well.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/machine/qemuppc.conf |    2 +-
 scripts/runqemu                |    7 +------
 scripts/runqemu-internal       |   16 ++++++++--------
 3 files changed, 10 insertions(+), 15 deletions(-)

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
1.7.5.4



