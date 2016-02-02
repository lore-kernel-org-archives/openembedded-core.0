Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB5067718A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 09:38:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2016 01:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="906613742"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2016 01:38:19 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 725E46A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 02:26:12 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:27:54 +0200
Message-Id: <4a80d3209aa669db75e6343646ddb6a127ad8fc2.1454397260.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454397260.git.ed.bartosh@linux.intel.com>
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1454397260.git.ed.bartosh@linux.intel.com>
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 02/15] runqemu: don't use virtio for wic images
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
X-List-Received-Date: Tue, 02 Feb 2016 09:38:19 -0000

qemu hands with 'waiting for root device' message during the
boot of wic images if '-drive if=virtio' option is used.

Removed if=virtio from qemu command line for wic images. This
should fix above mentioned boot issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu-internal | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 4d5f6ad..8afcccf 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -265,7 +265,8 @@ else
             QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD"
         fi
         DROOT="/dev/vda"
-        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
+        ROOTFS_OPTIONS="-drive file=$ROOTFS,format=raw"
+        [ "$FSTYPE" != "wic" ] && ROOTFS_OPTIONS="$ROOTFS_OPTIONS,if=virtio"
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
         QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
-- 
2.1.4


