Return-Path: <nathan.rossi@xilinx.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5552C6A8C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 07:32:48 +0000 (UTC)
Received: from mail211-va3-R.bigfish.com (10.7.14.234) by
	VA3EHSOBE011.bigfish.com (10.7.40.61) with Microsoft SMTP Server id
	14.1.225.23; Mon, 17 Jun 2013 07:32:49 +0000
Received: from mail211-va3 (localhost [127.0.0.1])	by
	mail211-va3-R.bigfish.com (Postfix) with ESMTP id EAE0B52021F;
	Mon, 17 Jun 2013 07:32:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1e23h906i1155h192ch)
Received-SPF: pass (mail211-va3: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail211-va3 (localhost.localdomain [127.0.0.1]) by mail211-va3
	(MessageSwitch) id 1371454366513319_12762;
	Mon, 17 Jun 2013 07:32:46 +0000 (UTC)
Received: from VA3EHSMHS007.bigfish.com (unknown [10.7.14.252])	by
	mail211-va3.bigfish.com (Postfix) with ESMTP id 6FDDD24009A;
	Mon, 17 Jun 2013 07:32:46 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by VA3EHSMHS007.bigfish.com
	(10.7.99.17) with Microsoft SMTP Server id 14.1.225.23; Mon, 17 Jun 2013
	07:32:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from <nathan.rossi@xilinx.com>)	id 1UoTvh-0003AP-R4;
	Mon, 17 Jun 2013 00:32:45 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 17:31:36 +1000
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1371454297-32315-1-git-send-email-nathan.rossi@xilinx.com>
References: <1371454297-32315-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <97a6af37-c446-4eeb-86d2-4352f0d37a0a@VA3EHSMHS007.ehs.local>
X-OriginatorOrg: xilinx.com
Cc: meta-xilinx@yoctoproject.org
Subject: [RFC 1/2] scripts/runqemu: Add support for 'qemuzynq' machine
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
X-List-Received-Date: Mon, 17 Jun 2013 07:32:48 -0000
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



