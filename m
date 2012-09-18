Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TDxav-0005iL-OS
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 15:12:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Sep 2012 05:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,442,1344236400"; d="scan'208";a="194353484"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 18 Sep 2012 05:58:19 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 15:57:58 +0300
Message-Id: <1347973078-12399-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemux86-64: Support for KVM, paravirt and virtio added
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
X-List-Received-Date: Tue, 18 Sep 2012 13:12:06 -0000

    KVM, paravirtualization and virtio drivers are now activated
    in runqemu using the kvm option flag for qemux86-64.
    Host CPU features are also exported to guest OS (Yocto Linux).
    Usage example: runqemu qemux86-64 core-image-x11 kvm

    Implements [YOCTO #2550].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
 scripts/runqemu-internal                     |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 32ae02b..06dd677 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckou
 
 LINUX_VERSION ?= "3.4.10"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
@@ -28,4 +28,5 @@ KERNEL_FEATURES_append = " features/netfilter"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm"
+KERNEL_FEATURES_append_qemux86-64=" cfg/paravirt_kvm"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32", "" ,d)}"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f2c8d83..6e20dd7 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -350,8 +350,8 @@ if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
+        KERNCMDLINE="vga=0 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "x$ROOTFS" = "x" ]; then
-- 
1.7.9.5



