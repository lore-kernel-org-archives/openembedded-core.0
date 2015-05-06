Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3331973F21
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:21:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2015 08:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="567210809"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 06 May 2015 08:21:52 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 18:21:47 +0300
Message-Id: <575db48cb64e54d04b6d9b7137702a6491b3edc6.1430925667.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430925667.git.cristian.iorga@intel.com>
References: <cover.1430925667.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1430925667.git.cristian.iorga@intel.com>
References: <cover.1430925667.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] runqemu-internal: correctly set format for root FS as raw
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
X-List-Received-Date: Wed, 06 May 2015 15:21:53 -0000

qemu guesses via probing the format of root FS, but
gives a warning and restricts write operations on block 0.
So fix it by setting correctly the format as raw.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/runqemu-internal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2db5566..bc2a355 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -123,7 +123,7 @@ if [ "$SLIRP_ENABLED" = "yes" ]; then
     if [ "$KVM_ACTIVE" = "yes" ]; then
         QEMU_NETWORK_CMD=""
         DROOT="/dev/vda"
-        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio"
+        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
     else
         QEMU_NETWORK_CMD=""
         DROOT="/dev/hda"
@@ -261,7 +261,7 @@ else
         if [ "$KVM_ACTIVE" = "yes" ]; then
             QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
             DROOT="/dev/vda"
-            ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio"
+            ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
         else
             QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
             DROOT="/dev/hda"
-- 
2.1.0


