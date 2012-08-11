Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T02RM-0000CG-A3
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 05:32:40 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 69FD830454
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 23:20:44 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2012 20:20:38 -0700
Message-Id: <081e2a4154575d494f0f56f1b5e4ff70b93ca8e2.1344655148.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344655148.git.scott.a.garman@intel.com>
References: <cover.1344655148.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344655148.git.scott.a.garman@intel.com>
References: <cover.1344655148.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 69FD830454.EE0A9
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: support booting poky-tiny images
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
X-List-Received-Date: Sat, 11 Aug 2012 03:32:40 -0000

Added support for booting poky-tiny images, which do not have block
device support. Note to shut down a running poky-tiny image, you
need to include the -f option to the poweroff command.

This fixes [YOCTO #2612].

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu          |    6 ++++++
 scripts/runqemu-internal |    5 +++++
 2 files changed, 11 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7454dd4..6f2f861 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -26,6 +26,7 @@ usage() {
     echo "  KERNEL - the kernel image file to use"
     echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
     echo "  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)"
+    echo "  TINY - specify 'tiny' if booting a poky-tiny image"
     echo "  Simplified QEMU command-line options can be passed with:"
     echo "    nographic - disables video console"
     echo "    serial - enables a serial console on /dev/ttyS0"
@@ -37,6 +38,7 @@ usage() {
     echo "  $MYNAME qemuarm"
     echo "  $MYNAME qemux86-64 core-image-sato ext3"
     echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial"
+    echo "  $MYNAME qemux86 tiny"
     echo "  $MYNAME qemux86 qemuparams=\"-m 256\""
     echo "  $MYNAME qemux86 bootparams=\"psplash=false\""
     exit 1
@@ -118,6 +120,10 @@ while true; do
                 LAZY_ROOTFS="true"
             fi
             ;;
+        "tiny")
+            FSTYPE=cpio.gz
+            TINY=true
+            ;;
         "nographic")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index eeadb24..5147c86 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -453,6 +453,11 @@ if [ "$MACHINE" = "akita" ]; then
     fi
 fi
 
+if [ "x$TINY" = "xtrue" ]; then
+    QEMUOPTIONS="-initrd $ROOTFS -nographic"
+    KERNCMDLINE="console=ttyS0 root=/dev/ram0"
+fi
+
 if [ "x$QEMUOPTIONS" = "x" ]; then
     echo "Error: Unable to support this combination of options"
     cleanup
-- 
1.7.9.5



