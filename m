Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TDxQb-0005TO-9r
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 15:01:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2012 05:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,442,1344236400"; d="scan'208";a="223533127"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2012 05:48:43 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 15:48:23 +0300
Message-Id: <1347972503-12200-1-git-send-email-cristian.iorga@intel.com>
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
X-List-Received-Date: Tue, 18 Sep 2012 13:01:25 -0000

    KVM, paravirtualization and virtio drivers are now activated
    in runqemu using the kvm option flag for qemux86-64.
    Host CPU features are also exported to guest OS (Yocto Linux).
    Usage example: runqemu qemux86-64 core-image-x11 kvm

    Implements [YOCTO #2550].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    1 +
 scripts/runqemu-internal                     |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 32ae02b..e265f6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
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



