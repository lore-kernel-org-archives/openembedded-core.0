Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7444D7589F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 17:35:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2015 10:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,488,1432623600"; d="scan'208";a="525478773"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2015 10:30:05 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 20:30:07 +0300
Message-Id: <d466be522da453d60a6d1de2874e153bf3143a98.1437067538.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1437067538.git.cristian.iorga@intel.com>
References: <cover.1437067538.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1437067538.git.cristian.iorga@intel.com>
References: <cover.1437067538.git.cristian.iorga@intel.com>
Subject: [PATCH v4 2/3] runqemu-internal: add temporary disk interface to qemuarm64
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
X-List-Received-Date: Thu, 16 Jul 2015 17:35:51 -0000

Starting with qemu 2.4, a disk needs be attached via a specified
interface, even if that interface is none. In case of qemuarm64
machine, the board is virtual, so a none interface it works
correctly.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 6878251..03b40d8 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -270,7 +270,7 @@ else
         if [ "$MACHINE" = "qemuarm64" ]; then
             QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
             DROOT="/dev/vda"
-            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,format=raw -device virtio-blk-device,drive=disk0"
+            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,if=none,format=raw -device virtio-blk-device,drive=disk0"
         fi
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
-- 
2.1.4


