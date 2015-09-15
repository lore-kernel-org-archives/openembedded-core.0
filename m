Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob19.myregisteredsite.com
	(atl4mhob19.myregisteredsite.com [209.17.115.112])
	by mail.openembedded.org (Postfix) with ESMTP id 005F36E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 09:50:43 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob19.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t8F9ogXI017441 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 05:50:42 -0400
Received: (qmail 345 invoked by uid 0); 15 Sep 2015 09:50:42 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 15 Sep 2015 09:50:42 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 11:50:39 +0200
Message-Id: <1442310639-1597-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] image_types.bbclass: Don't try to create ubi symlink twice
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
X-List-Received-Date: Tue, 15 Sep 2015 09:50:46 -0000

Fixes b6e64de541b37 "Restore compatibility with previous UBI filesystems"

The multivolume UBI code creates symlinks for each volume. If the volume name
is empty, it will create a symlink that the rootfs code will attempt to
create again later, resulting in a crash like this (unless IMAGE_LINK_NAME
is blank):
  ERROR: Error executing a python function in .../recipes-core/images/my-image.bb:
  File: '.../oe-core/meta/lib/oe/image.py', lineno: 203, function: _create_symlinks
   *** 0203:                    os.symlink(src, dst)
  Exception: OSError: [Errno 17] File exists

To prevent this from happening, only create symlinks to volumes that have
a name, and let the rootfs script create the default symlink later.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/image_types.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 306403e..afa2e8e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -139,17 +139,19 @@ multiubi_mkfs() {
 	# Cleanup cfg file
 	mv ubinize${vname}.cfg ${DEPLOY_DIR_IMAGE}/
 
-	# Create own symlink
-	cd ${DEPLOY_DIR_IMAGE}
-	if [ -e ${IMAGE_NAME}${vname}.rootfs.ubifs ]; then
-		ln -sf ${IMAGE_NAME}${vname}.rootfs.ubifs \
-		${IMAGE_LINK_NAME}${vname}.ubifs
-	fi
-	if [ -e ${IMAGE_NAME}${vname}.rootfs.ubi ]; then
-		ln -sf ${IMAGE_NAME}${vname}.rootfs.ubi \
-		${IMAGE_LINK_NAME}${vname}.ubi
+	# Create own symlinks for 'named' volumes
+	if [ -n "$vname" ]; then
+		cd ${DEPLOY_DIR_IMAGE}
+		if [ -e ${IMAGE_NAME}${vname}.rootfs.ubifs ]; then
+			ln -sf ${IMAGE_NAME}${vname}.rootfs.ubifs \
+			${IMAGE_LINK_NAME}${vname}.ubifs
+		fi
+		if [ -e ${IMAGE_NAME}${vname}.rootfs.ubi ]; then
+			ln -sf ${IMAGE_NAME}${vname}.rootfs.ubi \
+			${IMAGE_LINK_NAME}${vname}.ubi
+		fi
+		cd -
 	fi
-	cd -
 }
 
 IMAGE_CMD_multiubi () {
-- 
1.9.1


