Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qzz7j-0001wc-PJ
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 00:55:40 +0200
Received: from localhost.localdomain (c-98-246-165-28.hsd1.or.comcast.net
	[98.246.165.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 9AC0B2FF7E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Sep 2011 18:50:38 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 15:50:30 -0700
Message-Id: <396b96c9583f7a072b27d914a5cef2a7788aa74e.1315090054.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315090054.git.scott.a.garman@intel.com>
References: <cover.1315090054.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1315090054.git.scott.a.garman@intel.com>
References: <cover.1315090054.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 9AC0B2FF7E.08179
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: standardize ability to specify custom qemu/kenel boot options
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
X-List-Received-Date: Sat, 03 Sep 2011 22:55:40 -0000

The old manner of specifying custom options to QEMU in this script
using angle brackets was a frequent source of confusion. Meanwhile,
Otavio Salvador added a decent method of specifying custom kernel
boot options to this script. This patch documents the bootparams
option and adds a similar way of specifying custom QEMU options
using qemuparams="".

This fixes [YOCTO #1019]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu |   32 ++++++++++++++++++--------------
 1 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 113088e..74938f7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -26,17 +26,19 @@ usage() {
     echo "  KERNEL - the kernel image file to use"
     echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
     echo "  MACHINE=xyz - the machine name (optional, autodetected from KERNEL filename if unspecified)"
-    echo "  Additional QEMU command-line options can be passed with:"
+    echo "  Simplified QEMU command-line options can be passed with:"
     echo "    nographic - disables video console"
     echo "    serial - enables a serial console on /dev/ttyS0"
-    echo "    kvm - enables KVM when running qemux86/qemux86-64, VT capable CPU required"
-    echo "    \"<extra-qemu-options>\" - enables extra qemu options, excluding serial and kvm"
+    echo "    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)"
+    echo "  qemuparams=\"xyz\" - specify custom parameters to QEMU"
+    echo "  bootparams=\"xyz\" - specify custom kernel parameters during boot"
     echo ""
     echo "Examples:"
     echo "  $MYNAME qemuarm"
     echo "  $MYNAME qemux86-64 core-image-sato ext3"
     echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial"
-    echo "  $MYNAME qemux86 \"<-m 256>\""
+    echo "  $MYNAME qemux86 qemuparams=\"-m 256\""
+    echo "  $MYNAME qemux86 bootparams=\"psplash=false\""
     exit 1
 }
 
@@ -135,6 +137,18 @@ while [ $i -le $# ]; do
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial stdio"
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
             ;;
+        "qemuparams="*)
+            SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
+
+            # Warn user if they try to specify serial or kvm options
+            # to use simplified options instead
+            serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
+            kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
+            if [[ ! -z "$serial_option" || ! -z "$kvm_option" ]]; then
+                echo "Error: Please use simplified serial or kvm options instead"
+                usage
+            fi
+            ;;
         "bootparams="*)
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT ${arg##bootparams=}"
             ;;
@@ -149,16 +163,6 @@ while [ $i -le $# ]; do
             KVM_ENABLED="yes"
             KVM_CAPABLE=`grep 'vmx\|smx' /proc/cpuinfo`
             ;;
-        \<*\>)
-            SCRIPT_QEMU_EXTRA_OPT=$arg 
-            serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
-            kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
-            echo "$kvm_option"
-            if [[ ! -z "$serial_option" || ! -z "$kvm_option" ]]; then
-                echo "Error: Please use serial or kvm params instead!"
-                usage
-            fi
-            ;;
         *)
             # A directory name is an nfs rootfs
             if [ -d "$arg" ]; then
-- 
1.7.1



