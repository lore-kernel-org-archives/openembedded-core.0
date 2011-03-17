Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0ILO-00058c-TM
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 19:54:49 +0100
Received: by gwb11 with SMTP id 11so1245115gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=XNVk5sFuZY3+St1MVMd082QVwEEhA4XE1DbxSh5lXHo=;
	b=iqRgcXxXgQOgk1L4osOhlV7IKpBO/HKm3QlD8USO0U9xPf/vnONUuInnFxdRcKp9tJ
	N4nn8WdU6w3SV6tUUhB0MFukzNmAIRO9Yc0N3TO+/YqqmDk/WVgSaT6/IQKHWyfM4Q6d
	3Qj6c/IpPadokKbPV90S+vAtP3YXt/Bc7am8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=p/NT0ON0v+PVbIQjqoHufXy3HoStwaz8ofj4PWrA6SSXambA2rJBk7nuXyY9QwM1rE
	2Pxap2Xu5sccJvLa/DRix/X2hWDIeBqfVCIWtuQCUUMwuTqIj7Wo+8XpZGdQ46zXMyF5
	cpoUNvFhMS2v3l1puvsHK1gYMsCB8xme7cWxI=
Received: by 10.100.249.4 with SMTP id w4mr86728anh.65.1300387979291;
	Thu, 17 Mar 2011 11:52:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x32sm3028301ana.12.2011.03.17.11.52.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 11:52:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Mar 2011 11:52:53 -0700
Message-Id: <f19bd1cb04e0be2fd7f495cf3b842573fbd6ea7b.1300387701.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300387701.git.raj.khem@gmail.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] scripts/poky-qemu-internal: Add rw to KERNCMDLINE for non nfs boots as well
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
X-List-Received-Date: Thu, 17 Mar 2011 18:54:50 -0000

Without using rw the ext3 images boot the kernel but do not spawn the
console at the end

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/poky-qemu-internal |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
index 5ea30e8..6be08c4 100755
--- a/scripts/poky-qemu-internal
+++ b/scripts/poky-qemu-internal
@@ -275,7 +275,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
     if [ "$FSTYPE" = "ext3" ]; then
-        KERNCMDLINE="root=/dev/sda console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
+        KERNCMDLINE="root=/dev/sda rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M versatilepb -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
@@ -299,7 +299,7 @@ if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware -enable-gl"
     if [ "$FSTYPE" = "ext3" ]; then
-        KERNCMDLINE="vga=0 root=/dev/hda mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
+        KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
@@ -320,7 +320,7 @@ if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware -enable-gl"
     if [ "$FSTYPE" = "ext3" ]; then
-        KERNCMDLINE="vga=0 root=/dev/hda mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
+        KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
@@ -360,7 +360,7 @@ if [ "$MACHINE" = "qemumips" ]; then
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
     if [ "$FSTYPE" = "ext3" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
@@ -381,7 +381,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     BIOS=powerpc_rom.bin
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -nographic"
     if [ "$FSTYPE" = "ext3" ]; then
-        KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
-- 
1.7.4.1



