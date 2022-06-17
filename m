Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83ED6C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 05:50:48 +0000 (UTC)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web10.27359.1655445039295440792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 22:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.92,306,1650960000";
   d="scan'208";a="77309221"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Jun 2022 21:50:38 -0800
IronPort-SDR: 
 KNVQjJm3EKAoMpuLjZ8f/RcBCGCTEzGlPee3+Oj9cmJgiJUFEZTx7n4Ksj+GgKBBkPq1CQOMB2
 IbteDVr7eSFN2qK9hCo6Rpo81EkEYa83Cw9/KASQ360SWLozaixLRZIeRVe9fDt9mK2zH3ot1J
 TEdVaIE2JeukqIijFI1wU49B4VRP85sRxRvlkWu94IMoFIixTxyo9Xn+l59AeYL4StrzqQ2JwR
 3xR9Iym4d3xz0DQNjrWT3odqQLnhyrI82kdmdJ/eHBKozml1G+ddPON/MLnrgrivzlh9wlO0TS
 zCQ=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Muhammad Hamza <muhammad_hamza@mentor.com>, Awais Belal
	<awais_belal@mentor.com>
Subject: [PATCH] initramfs-framework: move storage mounts to actual rootfs
Date: Fri, 17 Jun 2022 10:50:22 +0500
Message-ID: <20220617055022.1053835-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 05:50:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167014

Operations such as mkfs fail on devices that are not
switched to the actual rootfs before switch_root is
called. The kernel interprets these devices as still
being used even after unmounting and errors such as
below are seen when the target is fully booted

root@v1000:~# umount /dev/sdb1
root@v1000:~# mkfs.ext4 /dev/sdb1
mke2fs 1.43.8 (1-Jan-2018)
/dev/sdb1 contains a ext4 file system
        last mounted on Wed Nov 28 07:33:54 2018
Proceed anyway? (y,N) y
/dev/sdb1 is apparently in use by the system; will not make a filesystem here!

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
---
 .../initrdscripts/initramfs-framework/finish             | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index f08a920867..ac0de9f996 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -26,6 +26,15 @@ finish_run() {
 
 		info "Switching root to '$ROOTFS_DIR'..."
 
+		debug "Moving basic mounts onto rootfs"
+		for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
+			# Parse any OCT or HEX encoded chars such as spaces
+			# in the mount points to actual ASCII chars
+			dir=`printf $dir`
+			mkdir -p "${ROOTFS_DIR}/media/${dir##*/}"
+			mount -n --move "$dir" "${ROOTFS_DIR}/media/${dir##*/}"
+		done
+
 		debug "Moving /dev, /proc and /sys onto rootfs..."
 		mount --move /dev $ROOTFS_DIR/dev
 		mount --move /proc $ROOTFS_DIR/proc
-- 
2.25.1


