Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kc-0006Xw-4E
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450496"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:33 -0700
Message-Id: <ba02844fd3c3e09b4c40bfff50c32bdcc27899fc.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/21] script/runqemu: change boot command line for qemuppc
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:46 -0000

From: Liming Wang <liming.wang@windriver.com>

Because qemuppc has no graphic emulation, remove console=tty0
and make it run into 3 run level. This can reduce boot time
for qemuppc booting.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 scripts/runqemu-internal |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index c15632d..883fa5b 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -384,7 +384,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     BIOS=powerpc_rom.bin
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -nographic"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/hda rw console=ttyS0 3 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
@@ -393,7 +393,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
             cleanup
             return
         fi
-        KERNCMDLINE="root=/dev/nfs console=ttyS0 console=tty0 nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/nfs console=ttyS0 3 nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -no-reboot $QEMU_UI_OPTIONS"
     fi
 fi
-- 
1.7.6



