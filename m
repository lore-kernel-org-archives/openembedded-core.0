Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84905C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 23:23:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.2248.1634599411708965457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 16:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A3A1CC0005;
	Mon, 18 Oct 2021 23:23:28 +0000 (UTC)
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] image_types: allow the creation of block devices on
 top of UBI volumes
Date: Tue, 19 Oct 2021 01:21:23 +0200
Message-Id: <20211018232123.2674220-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 23:23:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157097

Currently, the function multiubi_mkfs doesn't allow using anything else than
UBIFS over UBI.

Here, we propose to introduce two variables that allow to customize the ubinize
configuration and the image dependency, in order to be able to build UBI
images using the ubiblock abstraction layer and block filesystems.

For example, with this change it is possible to build a UBI volume using a
compressed squashfs, with the following configuration:
UBI_VOLTYPE ?= "static"
UBI_IMGTYPE ?= "squasfs-lz4"

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/classes/image_types.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 32d4cd4c768c..f643ed3ce7f1 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -139,16 +139,18 @@ IMAGE_CMD:cpio () {
 }
 
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
+UBI_VOLTYPE ?= "dynamic"
+UBI_IMGTYPE ?= "ubifs"
 
 multiubi_mkfs() {
 	local mkubifs_args="$1"
 	local ubinize_args="$2"
-    
+
         # Added prompt error message for ubi and ubifs image creation.
         if [ -z "$mkubifs_args" ] || [ -z "$ubinize_args" ]; then
             bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
         fi
-    
+
 	if [ -z "$3" ]; then
 		local vname=""
 	else
@@ -157,9 +159,9 @@ multiubi_mkfs() {
 
 	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
 	echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.${UBI_IMGTYPE} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo vol_type=${UBI_VOLTYPE} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
 	if [ -n "$vname" ]; then
@@ -198,7 +200,7 @@ IMAGE_CMD:multiubi () {
 IMAGE_CMD:ubi () {
 	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
 }
-IMAGE_TYPEDEP:ubi = "ubifs"
+IMAGE_TYPEDEP:ubi = "${UBI_IMGTYPE}"
 
 IMAGE_CMD:ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
 
@@ -329,7 +331,7 @@ CONVERSION_DEPENDS_gzsync = "zsync-curl-native"
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 
-DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
+DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
 # images that will not be built at do_rootfs time: vmdk, vhd, vhdx, vdi, qcow2, hddimg, iso, etc.
-- 
2.31.1


