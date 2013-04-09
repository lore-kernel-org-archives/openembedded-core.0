Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UPaoL-0001CM-VU
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:51:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2013 08:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="319756165"
Received: from adamian-desktop.rb.intel.com ([10.237.105.58])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2013 08:32:55 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 278E7560C9C; Tue,  9 Apr 2013 18:33:07 +0300 (EEST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 18:33:05 +0300
Message-Id: <1365521585-12785-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] qemu script: explicitly set 32 bit depth for x86-64
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
X-List-Received-Date: Tue, 09 Apr 2013 15:51:25 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch is the same as 6c22c591374d258228f74814cded34a24b4bf2d3,
but for x86-64 targets which exhibit the same problem.

Qemu update from 1.2 to 1.4 now allows for 16bit depth in guests,
whereby previously only 32bit depth was supported. However,
the new support is broken, so we force 32bit depth in all cases.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 scripts/runqemu-internal |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index e8191d1..c7e4c5c 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -349,7 +349,7 @@ if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="vga=0 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
+        KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
-- 
1.7.10.4



