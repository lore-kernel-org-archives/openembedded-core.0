Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob18.myregisteredsite.com
	(atl4mhob18.myregisteredsite.com [209.17.115.111])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA7765C66
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 06:54:15 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob18.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t056sFeL015233 for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Jan 2015 01:54:15 -0500
Received: (qmail 27375 invoked by uid 0); 5 Jan 2015 06:54:15 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 5 Jan 2015 06:54:14 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jan 2015 07:54:09 +0100
Message-Id: <1420440849-4370-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] busybox mdev-mount.sh: Fix bashism ("==" instead of "=")
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
X-List-Received-Date: Mon, 05 Jan 2015 06:54:19 -0000

In three test statements, the script was using a "==" instead
of "=", fix this bashism.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/busybox/files/mdev-mount.sh |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/files/mdev-mount.sh b/meta/recipes-core/busybox/files/mdev-mount.sh
index d5d66d6..51fefbe 100644
--- a/meta/recipes-core/busybox/files/mdev-mount.sh
+++ b/meta/recipes-core/busybox/files/mdev-mount.sh
@@ -15,7 +15,7 @@ case "$ACTION" in
 			exit 0
 		fi
 		DEVBASE=`expr substr $MDEV 1 3`
-		if [ "${DEVBASE}" == "mmc" ] ; then
+		if [ "${DEVBASE}" = "mmc" ] ; then
 			DEVBASE=`expr substr $MDEV 1 7`
 		fi
 		# check for "please don't mount it" file
@@ -24,7 +24,7 @@ case "$ACTION" in
 			exit 0
 		fi
 		# check for full-disk partition
-		if [ "${DEVBASE}" == "${MDEV}" ] ; then
+		if [ "${DEVBASE}" = "${MDEV}" ] ; then
 			if [ -d /sys/block/${DEVBASE}/${DEVBASE}*1 ] ; then
 				# Partition detected, just quit
 				exit 0
@@ -33,7 +33,7 @@ case "$ACTION" in
 				# No size at all
 				exit 0
 			fi
-			if [ `cat /sys/block/${DEVBASE}/size` == 0 ] ; then
+			if [ `cat /sys/block/${DEVBASE}/size` = 0 ] ; then
 				# empty device, bail out
 				exit 0
 			fi
-- 
1.7.9.5


