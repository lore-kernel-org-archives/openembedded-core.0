Return-Path: <nathan.rossi@xilinx.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe005.messaging.microsoft.com [65.55.88.15])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFAD6077F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 07:47:40 +0000 (UTC)
Received: from mail138-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 4 Jul 2013 07:47:40 +0000
Received: from mail138-tx2 (localhost [127.0.0.1])	by
	mail138-tx2-R.bigfish.com (Postfix) with ESMTP id 8FEAD2601B2;
	Thu,  4 Jul 2013 07:47:40 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1e23h906i1155h192ch)
Received-SPF: pass (mail138-tx2: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail138-tx2 (localhost.localdomain [127.0.0.1]) by mail138-tx2
	(MessageSwitch) id 1372924059672927_17279;
	Thu,  4 Jul 2013 07:47:39 +0000 (UTC)
Received: from TX2EHSMHS015.bigfish.com (unknown [10.9.14.232])	by
	mail138-tx2.bigfish.com (Postfix) with ESMTP id 95EB32E0042;
	Thu,  4 Jul 2013 07:47:39 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by TX2EHSMHS015.bigfish.com
	(10.9.99.115) with Microsoft SMTP Server id 14.1.225.23; Thu, 4 Jul 2013
	07:47:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from <nathan.rossi@xilinx.com>)	id 1UueGP-0001Fz-8t;
	Thu, 04 Jul 2013 00:47:37 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jul 2013 17:47:01 +1000
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <044c6bc4-86ca-4c96-bb24-50183cdf65b3@CH1EHSMHS029.ehs.local>
References: <044c6bc4-86ca-4c96-bb24-50183cdf65b3@CH1EHSMHS029.ehs.local>
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <29d2793c-ea60-47b0-bb2f-c1e16f9d0fdf@TX2EHSMHS015.ehs.local>
X-OriginatorOrg: xilinx.com
Cc: meta-xilinx@yoctoproject.org
Subject: [PATCH 1/2] scripts/runqemu: Add support for 'qemuzynq' machine
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
X-List-Received-Date: Thu, 04 Jul 2013 07:47:40 -0000
Content-Type: text/plain

* Add support to boot the 'qemuzynq' machine in qemu-system-arm
* Use the specific machine model for Zynq 'xilinx-zynq-a9'
* Use the DTB generated from the kernel build as the DTB for boot
* Force use of initrd rootfs (either in ext or cpio formats)

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 scripts/runqemu          |    6 +++++-
 scripts/runqemu-internal |   15 +++++++++++++++
 2 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f2eb2e1..01ef741 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -107,7 +107,8 @@ KVM_ENABLED="no"
 while true; do
     arg=${1}
     case "$arg" in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | "qemumips64" | "qemush4"  | "qemuppc")
+        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | \
+        "qemumips64" | "qemush4"  | "qemuppc" | "qemuzynq")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -308,6 +309,9 @@ QEMUSH4_DEFAULT_FSTYPE=ext3
 QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
 QEMUPPC_DEFAULT_FSTYPE=ext3
 
+QEMUZYNQ_DEFAULT_KERNEL=uImage
+QEMUZYNQ_DEFAULT_FSTYPE=cpio
+
 AKITA_DEFAULT_KERNEL=zImage-akita.bin
 AKITA_DEFAULT_FSTYPE=jffs2
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 4f3ba7b..f156c4d 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -59,6 +59,9 @@ else
         "qemush4")
             mem_size=1024
             ;;
+        "qemuzynq")
+            mem_size=1024
+            ;;
         *)
             mem_size=64
             ;;
@@ -270,6 +273,7 @@ case "$MACHINE" in
     "qemuarmv7") ;;
     "qemux86") ;;
     "qemux86-64") ;;
+    "qemuzynq") ;;
     "akita") ;;
     "spitz") ;;
     *)
@@ -492,6 +496,17 @@ if [ "$MACHINE" = "akita" ]; then
     fi
 fi
 
+if [ "$MACHINE" = "qemuzynq" ]; then
+    QEMU=qemu-system-arm
+    QEMU_SYSTEM_OPTIONS="-M xilinx-zynq-a9 -serial null -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
+    # zynq serial ports are named 'ttyPS0' and 'ttyPS1', fixup the default values
+    SCRIPT_KERNEL_OPT=$(echo "$SCRIPT_KERNEL_OPT" | sed 's/console=ttyS/console=ttyPS/g')
+    if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
+        KERNCMDLINE="earlyprintk root=/dev/ram rw"
+        QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
+    fi
+fi
+
 if [ "x$RAMFS" = "xtrue" ]; then
     QEMUOPTIONS="-initrd $ROOTFS -nographic"
     KERNCMDLINE="root=/dev/ram0 debugshell"
-- 
1.7.5.4



