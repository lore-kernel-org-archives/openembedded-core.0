Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC8A-0007hO-Na
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173233"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:43 -0700
Message-Id: <9020c3a1a7cbaffe24b5f3d0e08ef7becfff7b7b.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/17] runqemu-internal: qemu fails to run on ext2 image
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
X-List-Received-Date: Fri, 22 Jun 2012 22:15:07 -0000

From: Kang Kai <kai.kang@windriver.com>

[Yocto 2579]

When set DISTRO to poky-tiny, only ext2 image is created. But
runqemu-internal doesn't set QEMUOPTIONS for ext2 image that make qemu
fail to boot.

Fix it for qemux86 arch since poky-tiny can only build for qemux86 now.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 scripts/runqemu-internal |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index c8e3186..041464d 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -319,7 +319,7 @@ fi
 if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware -enable-gl"
-    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "$FSTYPE" = "ext2" -o "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
     fi
-- 
1.7.7.6



