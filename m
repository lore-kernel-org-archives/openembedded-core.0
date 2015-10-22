Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8540177118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:18:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Oct 2015 08:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,182,1444719600"; d="scan'208";a="669605313"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.73])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 08:18:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 10:18:37 -0500
Message-Id: <3a1bb6889d0f040d48f8d89a26cd8e96dece2fce.1445525963.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445525963.git.anibal.limon@linux.intel.com>
References: <cover.1445525963.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1445525963.git.anibal.limon@linux.intel.com>
References: <cover.1445525963.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] runqemu: Enable support for kvm without vhost in x86 and x86_64
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
X-List-Received-Date: Thu, 22 Oct 2015 15:18:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

KVM can be used without vhost so add a new option to runqemu for
use kvm with vhost.

Example,
	runqemu qemux86 core-image-minimal kvm # kvm without vhost
	runqemu qemux86 core-image-minimal kvm-vhost # kvm with vhost

[YOCTO #7443]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/runqemu          | 31 +++++++++++++++++++++----------
 scripts/runqemu-internal |  6 +++++-
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5989507..e01d276 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -33,6 +33,7 @@ usage() {
     echo "    nographic - disables video console"
     echo "    serial - enables a serial console on /dev/ttyS0"
     echo "    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)"
+    echo "    kvm-vhost - enables KVM with vhost support when running qemux86/qemux86-64 (VT-capable CPU required)"
     echo "    publicvnc - enable a VNC server open to all hosts"
     echo "  qemuparams=\"xyz\" - specify custom parameters to QEMU"
     echo "  bootparams=\"xyz\" - specify custom kernel parameters during boot"
@@ -71,6 +72,8 @@ SERIALSTDIO=""
 TCPSERIAL_PORTNUM=""
 KVM_ENABLED="no"
 KVM_ACTIVE="no"
+VHOST_ENABLED="no"
+VHOST_ACTIVE="no"
 
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
@@ -170,6 +173,11 @@ while true; do
             KVM_ENABLED="yes"
             KVM_CAPABLE=`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`
             ;;
+        "kvm-vhost")
+            KVM_ENABLED="yes"
+            KVM_CAPABLE=`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`
+            VHOST_ENABLED="yes"
+            ;;
         "slirp")
             SLIRP_ENABLED="yes"
             ;;
@@ -270,12 +278,6 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-    if [ ! -e /dev/vhost-net ]; then
-        echo "Missing virtio net device. Have you inserted vhost-net module?"
-        echo "For further help see:"
-        echo "$YOCTO_PARAVIRT_KVM_WIKI";
-        exit 1;
-    fi
     if [ -w /dev/kvm -a -r /dev/kvm ]; then
         SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm"
         KVM_ACTIVE="yes"
@@ -285,13 +287,22 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-    if [ ! -w /dev/vhost-net -o ! -r /dev/vhost-net ]; then
-	if [ "$SLIRP_ENABLED" != "yes" ] ; then
+    if [ "x$VHOST_ENABLED" = "xyes" ]; then
+        if [ ! -e /dev/vhost-net ]; then
+            echo "Missing virtio net device. Have you inserted vhost-net module?"
+            echo "For further help see:"
+            echo "$YOCTO_PARAVIRT_KVM_WIKI";
+            exit 1;
+        fi
+
+        if [ -w /dev/vhost-net -a -r /dev/vhost-net ]; then
+            VHOST_ACTIVE="yes"
+        else
             echo "You have no rights on /dev/vhost-net."
             echo "Please change the ownership of this file as described at:"
-            echo "$YOCTO_PARAVIRT_KVM_WIKI";
+            echo "$YOCTO_KVM_WIKI";
             exit 1;
-	fi
+        fi
     fi
 fi
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 13840b3..38ea965 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -267,7 +267,11 @@ else
         KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
         QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
         if [ "$KVM_ACTIVE" = "yes" ]; then
-            QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
+            if [ "$VHOST_ACTIVE" = "yes" ]; then
+                QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
+            else
+                QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD"
+            fi
             DROOT="/dev/vda"
             ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
         else
-- 
2.1.4


