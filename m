Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RpOEu-0004Bb-2n
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:03:32 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0NHtg9v014983;
	Mon, 23 Jan 2012 09:55:43 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 23 Jan 2012 12:54:32 -0500
Message-Id: <6bcfd05bd269dcceaf8629f22900e4a12650cf3b.1327341147.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1327341147.git.bruce.ashfield@windriver.com>
References: <cover.1327341147.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1327341147.git.bruce.ashfield@windriver.com>
References: <cover.1327341147.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/qemuppc: fix console and ethernet
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
X-List-Received-Date: Mon, 23 Jan 2012 18:03:32 -0000

Two issues are fixed with this commit, the ability to use the keyboard
on a graphical qemu boot and enabling ethernet by default on a 3.0
kernel.

The keyboard is fixed via the same method as the other simulations with
the addition of console=tty on the qemu command line.

Ethernet is fixed by adding a dependency of PCNET32 to the qemuppc
configuration, which allows us to build ethernet directly into the image.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 scripts/runqemu-internal                        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 145e548..9a543ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "f1cc220f4ddf434bf254707c83a45794a63f117f"
 SRCREV_machine_qemuppc ?= "8bd5b80cb3243dadc9d6c5c09482c49994dff1a8"
-SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
+SRCREV_meta ?= "665fea1c249b4f335cb1c9a46a9f2c138d611f1a"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 0b79bee..10859e7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemuppc ?= "53e71af30e30162e17e32b2f57e4481f5bc0573e"
 SRCREV_machine_qemux86 ?= "9e73573b6b227ab2c62e66e63470866d136f8d76"
 SRCREV_machine_qemux86-64 ?= "3551fd0412965b1f6b0b2f6ba35f7fecdaddb58a"
 SRCREV_machine ?= "6f5b11830deba4a6262c8c4abf67e608924f649e"
-SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
+SRCREV_meta ?= "665fea1c249b4f335cb1c9a46a9f2c138d611f1a"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 11dda55..21fbce3 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -394,7 +394,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=/dev/hda rw console=ttyS0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
-- 
1.7.0.4



