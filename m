Return-Path: <nathan@nathanrossi.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6987B76E70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 05:00:16 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so197931674pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 22:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Wb+j0+Ook6iiFqukn4U0gKVyh8wmXbuo1kJEtE7lyqo=;
	b=KsQYN2QeQghDSoTXdq3pG7P7PbizK9tz+gB2owlYB0sRXJBoA+Uco06SB3Mirb3wA1
	GbI37km49hJz1tKsMsepvp7gcBD6SBDOcphR7P0TsjopknMutWEMrNbWg1grLuZHq6IZ
	MhyfWp5s9khg5Bn0eOLKDKthw5MPqf6qnIbRTUe1K6cLFpEcL1WPVZO0qlhR+nY8SoL3
	v1if9InFDpuZoSoyHgOi/aQxOvCIBbyaoGe8bht1oMpTb2+cJnVwTUsnp+1mduSaSXf2
	5nRHQLLDtNftIkfo3QfsttEhp0EiSQTgHh0xudVKUZU4+1Nc+R5RR/KFkZy9sdelSSrn
	KNlQ==
X-Gm-Message-State: ALoCoQkPYTMtJZ+8p84WS9qJHHedDf33eQzdNgyJX0r/JNMzM5wSgOnrmsFTjJBsFFfW+GduhZS4
X-Received: by 10.66.101.39 with SMTP id fd7mr54774326pab.3.1442379616853;
	Tue, 15 Sep 2015 22:00:16 -0700 (PDT)
Received: from nathanbox.home.gateway ([103.26.61.212])
	by smtp.gmail.com with ESMTPSA id
	lg7sm25143220pbc.1.2015.09.15.22.00.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Sep 2015 22:00:15 -0700 (PDT)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 14:59:58 +1000
Message-Id: <1442379599-27186-2-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1442379599-27186-1-git-send-email-nathan@nathanrossi.com>
References: <1442379599-27186-1-git-send-email-nathan@nathanrossi.com>
Subject: [PATCH 1/2] runqemu-internal: Fix qemu networking for qemuzynq an qemumicroblaze
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
X-List-Received-Date: Wed, 16 Sep 2015 05:00:17 -0000

This patch brings the qemu networking setup for qemuzynq and
qemumicroblaze into feature parity with the other qemu machines.
Specifically enabling TAP interface attachcment and kernel command line
IP configuration.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 scripts/runqemu-internal | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 1527268..2d2a839 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -587,20 +587,20 @@ fi
 
 if [ "$MACHINE" = "qemumicroblaze" ]; then
     QEMU=qemu-system-microblazeel
-    QEMU_SYSTEM_OPTIONS="-M petalogix-ml605 -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
+    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M petalogix-ml605 -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
     if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
-        KERNCMDLINE="earlyprintk root=/dev/ram rw"
+        KERNCMDLINE="earlyprintk root=/dev/ram rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
     fi
 fi
 
 if [ "$MACHINE" = "qemuzynq" ]; then
     QEMU=qemu-system-arm
-    QEMU_SYSTEM_OPTIONS="-M xilinx-zynq-a9 -serial null -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
+    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xilinx-zynq-a9 -serial null -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
     # zynq serial ports are named 'ttyPS0' and 'ttyPS1', fixup the default values
     SCRIPT_KERNEL_OPT=$(echo "$SCRIPT_KERNEL_OPT" | sed 's/console=ttyS/console=ttyPS/g')
     if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
-        KERNCMDLINE="earlyprintk root=/dev/ram rw"
+        KERNCMDLINE="earlyprintk root=/dev/ram rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
     fi
 fi
-- 
2.5.1


