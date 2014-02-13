Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EDC956ECD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 15:24:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2014 07:23:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,839,1384329600"; d="scan'208";a="480937145"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2014 07:23:57 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 17:26:51 +0200
Message-Id: <b41280dfea915ce7ad913089e0d10a1592161f5f.1392305041.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392305041.git.cristian.iorga@intel.com>
References: <cover.1392305041.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392305041.git.cristian.iorga@intel.com>
References: <cover.1392305041.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] runqemu: enforce right CPU type for qemux86/x86-64
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
X-List-Received-Date: Thu, 13 Feb 2014 15:24:16 -0000

Set in accordance with qemu machines configs.

Fixes [YOCTO #5817].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/runqemu          |  9 +++------
 scripts/runqemu-internal | 13 +++++++++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9272b6f..0db7ad6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -68,6 +68,8 @@ SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""
 SCRIPT_KERNEL_OPT=""
 SERIALSTDIO=""
+KVM_ENABLED="no"
+KVM_ACTIVE="no"
 
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
@@ -103,7 +105,6 @@ process_filename() {
 
 # Parse command line args without requiring specific ordering. It's a
 # bit more complex, but offers a great user experience.
-KVM_ENABLED="no"
 while true; do
     arg=${1}
     case "$arg" in
@@ -266,11 +267,7 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         exit 1;
     fi
     if [ -w /dev/kvm -a -r /dev/kvm ]; then
-        if [ "x$MACHINE" = "xqemux86" ]; then
-            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm32"
-        elif [ "x$MACHINE" = "xqemux86-64" ]; then
-            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm64"
-        fi
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm"
         KVM_ACTIVE="yes"
     else
         echo "You have no rights on /dev/kvm."
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 0893107..f9ca380 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -360,6 +360,11 @@ fi
 
 if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu-system-i386
+    if [ "$KVM_ACTIVE" = "yes" ]; then
+        CPU_SUBTYPE=kvm32
+    else
+        CPU_SUBTYPE=qemu32
+    fi
     if [ ! -z "$vga_option" ]; then
         QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     else
@@ -367,7 +372,7 @@ if [ "$MACHINE" = "qemux86" ]; then
     fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
@@ -388,7 +393,11 @@ fi
 
 if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
-    CPU_SUBTYPE=core2duo
+    if [ "$KVM_ACTIVE" = "yes" ]; then
+        CPU_SUBTYPE=kvm64
+    else
+        CPU_SUBTYPE=core2duo
+    fi
     if [ ! -z "$vga_option" ]; then
         QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     else
-- 
1.8.3.2


