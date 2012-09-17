Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TDa75-00035S-4f
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:07:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2012 04:53:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,435,1344236400"; d="scan'208";a="222991491"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2012 04:53:57 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:53:36 +0300
Message-Id: <1347882817-3118-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemux86: Support for KVM, paravirt and virtio added
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
X-List-Received-Date: Mon, 17 Sep 2012 12:07:43 -0000

KVM, paravirtualization and virtio drivers are now activated
in runqemu using the kvm option flag for qemux86.
Host CPU features are also exported to guest OS (Yocto Linux).
Usage example: runqemu qemux86 core-image-x11 kvm

Implements [YOCTO #2550].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    1 +
 scripts/runqemu                              |   16 +++++++++++++++-
 scripts/runqemu-internal                     |   14 +++++++++++---
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 7c082e7..32ae02b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -27,4 +27,5 @@ KERNEL_REVISION_CHECKING=""
 KERNEL_FEATURES_append = " features/netfilter"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32", "" ,d)}"
diff --git a/scripts/runqemu b/scripts/runqemu
index e843946..167e157 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -208,6 +208,7 @@ if [ -z "$MACHINE" ]; then
 fi
 
 YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
+YOCTO_PARAVIRT_KVM_WIKI="https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM"
 # Detect KVM configuration
 if [ "x$KVM_ENABLED" = "xyes" ]; then
     if [ -z "$KVM_CAPABLE" ]; then
@@ -226,14 +227,27 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
+    if [ ! -e /dev/vhost-net ]; then
+        echo "Missing virtio net device. Have you inserted vhost-net module?"
+        echo "For further help see"
+        echo "$YOCTO_PARAVIRT_KVM_WIKI";
+        exit 1;
+    fi
     if 9<>/dev/kvm ; then
-        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm"
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
+        KVM_ACTIVE="yes"
     else
         echo "You have no rights on /dev/kvm."
         echo "Please change the ownership of this file as described at"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
+    if [ ! -w /dev/vhost-net -a -r /dev/vhost-net ]; then
+        echo "You have no rights on /dev/vhost-net."
+        echo "Please change the ownership of this file as described at"
+        echo "$YOCTO_PARAVIRT_KVM_WIKI";
+        exit 1;
+    fi
 fi
 
 machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index a9b1c44..f2c8d83 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -221,7 +221,15 @@ n2=$(($n1 + 1))
 
 KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
 QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
-QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
+if [ "$KVM_ACTIVE" = "yes" ]; then
+    QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
+    DROOT="/dev/vda"
+    ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio"
+else
+    QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
+    DROOT="/dev/hda"
+    ROOTFS_OPTIONS="-hda $ROOTFS"
+fi
 KERNCMDLINE="mem=$QEMU_MEMORY"
 QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
 
@@ -321,8 +329,8 @@ if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu-system-i386
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" = "ext2" -o "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
+        KERNCMDLINE="vga=0 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-- 
1.7.9.5



