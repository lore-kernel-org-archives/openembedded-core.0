Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 480 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Aug 2018 07:30:01 UTC
Received: from atl4mhfb02.myregisteredsite.com
	(atl4mhfb02.myregisteredsite.com [209.17.115.118])
	by mail.openembedded.org (Postfix) with ESMTP id 80191795C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 07:30:01 +0000 (UTC)
Received: from atl4mhob02.registeredsite.com (atl4mhob02.registeredsite.com
	[209.17.115.40])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	w7O7M3JH007711 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 03:22:03 -0400
Received: from mailpod.hostingplatform.com (atl4qobmail05.registeredsite.com
	[10.30.71.207])
	by atl4mhob02.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	w7O7Lx3P009922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL) for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 03:22:00 -0400
Received: (qmail 29994 invoked by uid 0); 24 Aug 2018 07:21:59 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 24 Aug 2018 07:21:59 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2018 09:21:44 +0200
Message-Id: <1535095304-12578-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] busybox/mdev-mount.sh: Fix partition detect and cleanup mountpoint on fail
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
X-List-Received-Date: Fri, 24 Aug 2018 07:30:01 -0000

This fixes issues mainly seen when mounting eMMC devices:

The wildcard /sys/block/${DEVBASE}/${DEVBASE}*1 matches both "mmcblk0p1"
and "mmcblk0boot1" for example, and this results in syntax errors. Fix this
by searching for a "partition" file instead, which only exists for real
partitions and not 'fakes' like the eMMC extra's.

When mount fails, the mountpoint file is left behind, causing later attempts
at auto-mounting it to fail. If mount fails, remove the mountpoint, leaving
the system in the state as it was before the mount attempt.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/busybox/files/mdev-mount.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/files/mdev-mount.sh b/meta/recipes-core/busybox/files/mdev-mount.sh
index b4385a1..130e947 100644
--- a/meta/recipes-core/busybox/files/mdev-mount.sh
+++ b/meta/recipes-core/busybox/files/mdev-mount.sh
@@ -25,7 +25,7 @@ case "$ACTION" in
 		fi
 		# check for full-disk partition
 		if [ "${DEVBASE}" = "${MDEV}" ] ; then
-			if [ -d /sys/block/${DEVBASE}/${DEVBASE}*1 ] ; then
+			if [ -f /sys/block/${DEVBASE}/${DEVBASE}*1/partition ] ; then
 				# Partition detected, just quit
 				exit 0
 			fi
@@ -43,7 +43,7 @@ case "$ACTION" in
 		then
 			MOUNTPOINT="${MDEV_AUTOMOUNT_ROOT}/$MDEV"
 			mkdir -p "$MOUNTPOINT"
-			mount -t auto /dev/$MDEV "$MOUNTPOINT"
+			mount -t auto /dev/$MDEV "$MOUNTPOINT" || rmdir "$MOUNTPOINT"
 		fi
 		;;
 	remove)
-- 
1.9.1


