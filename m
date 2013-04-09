Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UPa5V-0006SH-KM
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:03:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 07:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="292378900"
Received: from adamian-desktop.rb.intel.com ([10.237.105.58])
	by orsmga001.jf.intel.com with ESMTP; 09 Apr 2013 07:46:33 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 69065560C9C; Tue,  9 Apr 2013 17:46:45 +0300 (EEST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: richard.purdie@linuxfoundation.org, tom.zanussi@linux.intel.com,
	ross.burton@intel.com, paul.eggleton@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 17:46:43 +0300
Message-Id: <1365518803-11025-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] qemu: use default qemu CPU definition
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
X-List-Received-Date: Tue, 09 Apr 2013 15:04:00 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This fixes guest crashes when trying to use restricted
instructions based on CPU description. Using default qemu
CPU descriptions restrict faults on using restricted
model-specific registers.

[YOCTO #3908]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 scripts/runqemu          |    2 +-
 scripts/runqemu-internal |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8ed1226..43d7600 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -261,7 +261,7 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         exit 1;
     fi
     if [ -w /dev/kvm -a -r /dev/kvm ]; then
-        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm "
         KVM_ACTIVE="yes"
     else
         echo "You have no rights on /dev/kvm."
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index e8191d1..a7813e5 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -323,10 +323,11 @@ fi
 
 if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu-system-i386
+    QEMU_CPU_OPTIONS="-cpu qemu32"
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" = "ext2" -o "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_CPU_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
@@ -347,10 +348,11 @@ fi
 
 if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
+    QEMU_CPU_OPTIONS="-cpu qemu64"
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_CPU_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "x$ROOTFS" = "x" ]; then
-- 
1.7.10.4



