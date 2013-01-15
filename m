Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TuwK9-0003Sn-GN
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 03:32:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0F2H5JW023701
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 18:17:05 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 14 Jan 2013 18:17:04 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jan 2013 10:17:01 +0800
Message-ID: <2a80e8cc5d6029e65634c583bc95a6a6c301cf6a.1358141174.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358141174.git.Qi.Chen@windriver.com>
References: <cover.1358141174.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] runqemu scripts: add support for booting an ISO image
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
X-List-Received-Date: Tue, 15 Jan 2013 02:32:26 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add support for booting an ISO image for runqemu scripts.

[YOCTO #3710]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu          |    6 ++++++
 scripts/runqemu-internal |    7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 188eccf..c20c8dd 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -27,6 +27,7 @@ usage() {
     echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
     echo "  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)"
     echo "  RAMFS - boot a ramfs-based image"
+    echo "  ISO - boot an ISO image"
     echo "  VM - boot a vmdk image"
     echo "  Simplified QEMU command-line options can be passed with:"
     echo "    nographic - disables video console"
@@ -40,6 +41,7 @@ usage() {
     echo "  $MYNAME qemux86-64 core-image-sato ext3"
     echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial"
     echo "  $MYNAME qemux86 ramfs"
+    echo "  $MYNAME qemux86 iso"
     echo "  $MYNAME qemux86 qemuparams=\"-m 256\""
     echo "  $MYNAME qemux86 bootparams=\"psplash=false\""
     echo "  $MYNAME path/to/<image>-<machine>.vmdk"
@@ -132,6 +134,10 @@ while true; do
             FSTYPE=cpio.gz
             RAMFS=true
             ;;
+        "iso")
+	    FSTYPE=iso
+	    ISOFS=true
+	    ;;
         "nographic")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 9d570ed..0e3dad0 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -475,6 +475,10 @@ if [ "x$RAMFS" = "xtrue" ]; then
     KERNCMDLINE="root=/dev/ram0 debugshell"
 fi
 
+if [ "x$ISOFS" = "xtrue" ]; then
+    QEMUOPTIONS="-cdrom $ROOTFS"
+fi
+
 if [ "x$QEMUOPTIONS" = "x" ]; then
     echo "Error: Unable to support this combination of options"
     cleanup
@@ -577,6 +581,9 @@ echo "Running $QEMU..."
 if [ "$FSTYPE" = "vmdk" ]; then
     echo $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
+elif [ "$FSTYPE" = "iso" ]; then
+    echo $QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
+    LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
 else
     echo $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append '"'$KERNCMDLINE $SCRIPT_KERNEL_OPT'"'
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
-- 
1.7.9.5



