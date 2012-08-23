Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4eU8-0001Ba-AA
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 22:58:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2012 13:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,301,1344236400"; d="scan'208";a="184732599"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2012 13:46:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 13:46:27 -0700
Message-Id: <1345754787-23198-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] runqemu: Move the KVM check after the MACHINE/KERNEL Checks
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
X-List-Received-Date: Thu, 23 Aug 2012 20:58:36 -0000

The MACHINE/KERNEL Checks setup MACHINE is it's unset, the KVM checks valid
MACHINE is qemux86 or qemux86-64 and fail if it's unset!

[YOCTO #2970]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu |   31 ++++++++++++++++---------------
 1 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 290f9cc..a3c3509 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -191,6 +191,22 @@ elif [ ! -w /dev/net/tun ] ; then
 	exit 1
 fi
 
+# Report errors for missing combinations of options
+if [ -z "$MACHINE" -a -z "$KERNEL" ]; then
+    error "you must specify at least a MACHINE or KERNEL argument"
+fi
+if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
+    error "NFS booting without an explicit ROOTFS path is not yet supported"
+fi
+
+if [ -z "$MACHINE" ]; then
+    MACHINE=`basename $KERNEL | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
+    if [ -z "$MACHINE" ]; then
+        error "Unable to set MACHINE from kernel filename [$KERNEL]"
+    fi
+    echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
+fi
+
 YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
 # Detect KVM configuration
 if [ "x$KVM_ENABLED" = "xyes" ]; then
@@ -220,21 +236,6 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
     fi
 fi
 
-# Report errors for missing combinations of options
-if [ -z "$MACHINE" -a -z "$KERNEL" ]; then
-    error "you must specify at least a MACHINE or KERNEL argument"
-fi
-if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
-    error "NFS booting without an explicit ROOTFS path is not yet supported"
-fi
-
-if [ -z "$MACHINE" ]; then
-    MACHINE=`basename $KERNEL | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
-    if [ -z "$MACHINE" ]; then
-        error "Unable to set MACHINE from kernel filename [$KERNEL]"
-    fi
-    echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
-fi
 machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
 # MACHINE is now set for all cases
 
-- 
1.7.7.6



