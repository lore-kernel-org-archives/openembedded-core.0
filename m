Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id B7C016AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 15:35:29 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w60so836354wes.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 08:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=TWtdOIYLDhTbkE4dxYE5I9asdYwaY9zzL/3252v5SaY=;
	b=O0Q27begXutKcAOpJ+ZPpbdZmRaIghqxPIN6EPngZFk/y+6uqC0xgu3vQuUlLFN4gH
	b2pP5V2ZR8/udl2OHGN4zKlZyhqNMt1kbYIejsSmEHWQUcUvlH/btebGrWasRpCoIcfG
	R0CkIii6aak7R5ggBufB9Z0epGbruv8gXPWvZ+NrjgKJLAxPSoFvX1Ig7pIv89wXAp4+
	7zSz5ZKqXzfYMq7yLYFxEejIG50y8nuzX0R+6mEG5xsl3uBNJFTAlW8lD2SEbDOGSTCG
	Rci2Ip13QKHQwjaGKq40ONs4lAlLr6ArMoLH3/dRaCWXUjOZFCE2xLAFVX4lHGcGiZ0Y
	2fGQ==
X-Received: by 10.180.74.197 with SMTP id w5mr2568032wiv.20.1374766529460;
	Thu, 25 Jul 2013 08:35:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hb2sm4530350wib.0.2013.07.25.08.35.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 08:35:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 16:31:40 +0100
Message-Id: <1374766300-14041-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkPV1iOGP1R0HoRUOde19gmH7coeBSwxISzxBt4PuF8FMXHohibht6mdFf3Z+TO5FCRnRDU
Subject: [PATCH] Revert "initrdscripts: mount / as read-only when live-booting"
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
X-List-Received-Date: Thu, 25 Jul 2013 15:35:30 -0000

My test environment must have been messed up as now hddimgs are failing to
re-mount / as read-write.

This reverts commit 7af92f8fa3a12fc8fcb22dbd12f87d89768b2d39.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index c56c79a..890c562 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -157,7 +157,7 @@ mount_and_boot() {
     case $union_fs_type in
 	"overlayfs")
 	    mkdir -p /rootfs.ro /rootfs.rw
-	    if ! mount -o ro,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
+	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
 		rm -rf /rootfs.ro /rootfs.rw
 		fatal "Could not mount rootfs image"
 	    else
@@ -170,7 +170,7 @@ mount_and_boot() {
 	    ;;
 	"aufs")
 	    mkdir -p /rootfs.ro /rootfs.rw
-	    if ! mount -o ro,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
+	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
 		rm -rf /rootfs.ro /rootfs.rw
 		fatal "Could not mount rootfs image"
 	    else
@@ -182,7 +182,7 @@ mount_and_boot() {
 	    fi
 	    ;;
 	"")
-	    if ! mount -o ro,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 		fatal "Could not mount rootfs image"
 	    fi
 	    ;;
-- 
1.7.10.4


