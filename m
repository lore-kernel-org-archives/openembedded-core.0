Received: from [74.127.214.27] (helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@localhost>) id 1Q59lh-0007mg-FS
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 06:46:03 +0200
Received: by localhost (Postfix, from userid 1001)
	id 685B5D4030; Thu, 31 Mar 2011 00:36:38 -0400 (EDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2011 00:36:38 -0400
Message-Id: <a52b402933d97d7b9b2167e9c7a4fb4a8b4730ab.1301544780.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1301544780.git.bengardiner@nanometrics.ca>
References: <a5c403f0fc71f38c0669691da7f637303ea09a27.1300978024.git.richard.purdie@linuxfoundation.org>
	<cover.1301544780.git.bengardiner@nanometrics.ca>
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: [PATCH 3/3] image_types.bbclass: use .ubifs.img extension in IMAGE_CMD_ubi
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2011 04:46:03 -0000

( This is a port of 7308e68fc26cdbffa08d311a2319c8d1c3b2805f
from git://git.openembedded.org/openembedded )

The current IMAGE_CMD_ubi creates an interim image with a .rootfs.ubifs
extension.

The ubifs image created is not considered a valid rootfs without a UBI
container.

Change the filename of the iterim ubifs image used by IMAGE_CMD_ubi to
.ubifs.img to match the IMAGE_CMD_ubifs command.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Acked-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 meta/classes/image_types.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 6a66d21..1bfe6fd 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -56,12 +56,12 @@ IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -
 IMAGE_CMD_ubi () {
 	echo \[ubifs\] > ubinize.cfg 
 	echo mode=ubi >> ubinize.cfg
-	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg 
+	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg
 	echo vol_id=0 >> ubinize.cfg 
 	echo vol_type=dynamic >> ubinize.cfg 
 	echo vol_name=${UBI_VOLNAME} >> ubinize.cfg 
 	echo vol_flags=autoresize >> ubinize.cfg
-	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
+	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
 }
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
-- 
1.7.0.4



