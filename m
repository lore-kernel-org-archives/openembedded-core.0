Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 733166E82D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 17:15:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jan 2014 09:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,737,1384329600"; d="scan'208";a="466047471"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2014 09:15:34 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id B83DE6A4092;
	Tue, 28 Jan 2014 09:15:27 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 19:16:39 +0200
Message-Id: <1390929399-28383-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] scripts/runqemu-internal: use -cpu core2duo for qemux86-64
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
X-List-Received-Date: Tue, 28 Jan 2014 17:15:54 -0000

Now that the tune for qemux86-64 changed to core2-64 we need to
tell the emulator to use a proper CPU model. With the default setting
of qemu64 we'll get things like:

root@qemux86-64:~# smart --help
traps: python[758] trap invalid opcode ip:7f2af01f6be7 sp:7fff49466ef0 error:0 in strop.so[7f2af01f5000+6000]
Illegal instruction

If the tune for qemux86 changes, that needs to be updated too.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/runqemu-internal | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index e3b0729..0893107 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -388,6 +388,7 @@ fi
 
 if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
+    CPU_SUBTYPE=core2duo
     if [ ! -z "$vga_option" ]; then
         QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     else
@@ -395,7 +396,7 @@ if [ "$MACHINE" = "qemux86-64" ]; then
     fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "x$ROOTFS" = "x" ]; then
@@ -407,10 +408,10 @@ if [ "$MACHINE" = "qemux86-64" ]; then
             return 1
         fi
         KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "vmdk" ]; then
-        QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $QEMU_UI_OPTIONS"
     fi
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
     # qemux86 and qemux86-64. We can use timer interrupt mode for now.
-- 
1.8.5.3


