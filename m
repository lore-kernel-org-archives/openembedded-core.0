Return-Path: <nathan.rossi@xilinx.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id 30F2960667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 07:32:47 +0000 (UTC)
Received: from mail162-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.23; Mon, 17 Jun 2013 07:32:47 +0000
Received: from mail162-ch1 (localhost [127.0.0.1])	by
	mail162-ch1-R.bigfish.com (Postfix) with ESMTP id 7BF7E2C0AC8;
	Mon, 17 Jun 2013 07:32:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1e23h906i1155h192ch)
Received-SPF: pass (mail162-ch1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail162-ch1 (localhost.localdomain [127.0.0.1]) by mail162-ch1
	(MessageSwitch) id 1371454365944923_7775;
	Mon, 17 Jun 2013 07:32:45 +0000 (UTC)
Received: from CH1EHSMHS026.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.232])	by mail162-ch1.bigfish.com (Postfix) with ESMTP id
	DAA6EC0062;	Mon, 17 Jun 2013 07:32:45 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CH1EHSMHS026.bigfish.com
	(10.43.70.26) with Microsoft SMTP Server id 14.1.225.23;
	Mon, 17 Jun 2013 07:32:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from <nathan.rossi@xilinx.com>)	id 1UoTvh-0003AK-ET;
	Mon, 17 Jun 2013 00:32:45 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 17:31:37 +1000
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1371454297-32315-1-git-send-email-nathan.rossi@xilinx.com>
References: <1371454297-32315-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <fa444481-d1d7-4bee-b4d5-ecd6ab2616f3@CH1EHSMHS026.ehs.local>
X-OriginatorOrg: xilinx.com
Cc: meta-xilinx@yoctoproject.org
Subject: [RFC 2/2] scripts/runqemu: Add support for 'qemumicroblaze' machine
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
X-List-Received-Date: Mon, 17 Jun 2013 07:32:47 -0000
Content-Type: text/plain

* Add support to boot the 'qemumicroblaze' machine in
  qemu-system-microblazeel
* Use the specific machine model for a MicroBlaze system 'petalogix-ml605'
* Use the DTB generated from the kernel build as the DTB for boot
* Force use of initrd rootfs (either in ext or cpio formats)

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 scripts/runqemu          |    5 ++++-
 scripts/runqemu-internal |   13 +++++++++++++
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 01ef741..5f7f252 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -108,7 +108,7 @@ while true; do
     arg=${1}
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | \
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemuzynq")
+        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -309,6 +309,9 @@ QEMUSH4_DEFAULT_FSTYPE=ext3
 QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
 QEMUPPC_DEFAULT_FSTYPE=ext3
 
+QEMUMICROBLAZE_DEFAULT_KERNEL=linux.bin.ub
+QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
+
 QEMUZYNQ_DEFAULT_KERNEL=uImage
 QEMUZYNQ_DEFAULT_FSTYPE=cpio
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f156c4d..9619bec 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -50,6 +50,9 @@ else
         "qemuarm")
             mem_size=128
             ;;
+        "qemumicroblaze")
+            mem_size=64
+            ;;
         "qemumips"|"qemumips64")
             mem_size=128
             ;;
@@ -264,6 +267,7 @@ fi
 
 case "$MACHINE" in
     "qemuarm") ;;
+    "qemumicroblaze") ;;
     "qemumips") ;;
     "qemumipsel") ;;
     "qemumips64") ;;
@@ -496,6 +500,15 @@ if [ "$MACHINE" = "akita" ]; then
     fi
 fi
 
+if [ "$MACHINE" = "qemumicroblaze" ]; then
+    QEMU=qemu-system-microblazeel
+    QEMU_SYSTEM_OPTIONS="-M petalogix-ml605 -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
+    if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
+        KERNCMDLINE="earlyprintk root=/dev/ram rw"
+        QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
+    fi
+fi
+
 if [ "$MACHINE" = "qemuzynq" ]; then
     QEMU=qemu-system-arm
     QEMU_SYSTEM_OPTIONS="-M xilinx-zynq-a9 -serial null -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
-- 
1.7.5.4



