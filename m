Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id D55527702A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 03:31:04 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so40704283pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 20:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oftapgqTYwTUOxhOMRtZOG6CM0fTCMlqfbI4BNnna7E=;
	b=g0Wa7IsxVEjlXUWtZUSLFCBVx5Of6fb2wU/BF06ep6+tCLahO8Yfg9emE4Te+Zj3hr
	xBFIcclqtftTx1V3JYPrEiYk59o3Zt/Xtq+2tulIjD5LH7ZVYvpNb/Q3tXdffiMgv+MI
	PzJB0+6N6Kw5H7tloDOWFchR95HZp9tm8u0LnOyTVCWvH3HZRx9hCH55lSGtilk7V6/7
	NraHl7743I29G1/alin1wrl6N+DtrL8dL5reH6SIQE/Q9ixem5jdC0ub+vQBeCT8pzja
	7ocUf/PD2wMLcx6YOyoVCV9NM3oKCBEaaK5NM6wnPVMsfILQmY3w67L1bl9GxeEed7BD
	tYTw==
X-Received: by 10.68.143.4 with SMTP id sa4mr7800708pbb.111.1445398263639;
	Tue, 20 Oct 2015 20:31:03 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	mk5sm6327282pab.44.2015.10.20.20.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 20:31:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 20:40:20 -0700
Message-Id: <1445398820-13258-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [jethro/master][PATCH] busybox: Fix mdev block device automounting
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
X-List-Received-Date: Wed, 21 Oct 2015 03:31:05 -0000

The directory ${MDEV_AUTOMOUNT_ROOT}/ which is '/run/media' may not
exist yet when the device is found, so lets use -p switch to mkdir cmd
so it create preceding parent dirs if needed.

Remove some bash specific constructs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/files/mdev-mount.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/files/mdev-mount.sh b/meta/recipes-core/busybox/files/mdev-mount.sh
index d5d66d6..b4385a1 100644
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
+			if [ "`cat /sys/block/${DEVBASE}/size`" = "0" ] ; then
 				# empty device, bail out
 				exit 0
 			fi
@@ -42,7 +42,7 @@ case "$ACTION" in
 		if ! mount /dev/$MDEV > /dev/null 2>&1
 		then
 			MOUNTPOINT="${MDEV_AUTOMOUNT_ROOT}/$MDEV"
-			mkdir "$MOUNTPOINT"
+			mkdir -p "$MOUNTPOINT"
 			mount -t auto /dev/$MDEV "$MOUNTPOINT"
 		fi
 		;;
-- 
2.6.1


