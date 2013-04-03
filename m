Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UNP6v-0008QO-KH
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 16:56:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Apr 2013 07:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="280226485"
Received: from adamian-desktop.rb.intel.com ([10.237.105.55])
	by azsmga001.ch.intel.com with ESMTP; 03 Apr 2013 07:39:11 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id B3A0A560C23; Wed,  3 Apr 2013 17:39:13 +0300 (EEST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 17:39:12 +0300
Message-Id: <1364999952-31485-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] qemu script: explicitly set 32 bit depth
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 14:56:29 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Qemu update from 1.2 to 1.4 now allows for 16bit depth in guests,
whereby previously only 32bit depth was supported. However,
the new support is broken, so we force 32bit depth in all cases.

MUST_REVERT: on qemu update, if 16bit depth support is working ok

Fixes [YOCTO #3828]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 scripts/runqemu-internal |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f06870e..1b04593 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -325,7 +325,7 @@ if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu-system-i386
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" = "ext2" -o "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="vga=0 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
+        KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
-- 
1.7.10.4



