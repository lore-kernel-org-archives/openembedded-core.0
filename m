Received: from [74.127.214.27] (helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@localhost>) id 1Q59vI-00080q-IU
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 06:55:58 +0200
Received: by localhost (Postfix, from userid 1001)
	id 63617D402D; Thu, 31 Mar 2011 00:36:38 -0400 (EDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2011 00:36:37 -0400
Message-Id: <907dd3d266c8fe4fcbdb698b23937687cb88ec15.1301544780.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1301544780.git.bengardiner@nanometrics.ca>
References: <a5c403f0fc71f38c0669691da7f637303ea09a27.1300978024.git.richard.purdie@linuxfoundation.org>
	<cover.1301544780.git.bengardiner@nanometrics.ca>
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: [PATCH 2/3] image_types.bbclass: add link to .rootfs.<type> or .<type>.img
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
X-List-Received-Date: Thu, 31 Mar 2011 04:55:58 -0000

( This is a port of commit cfde49e8d0f1cf09d589910f1a342849db148519
from git://git.openembedded.org/openembedded )

The current image link-creation code will unconditionaly create a link
from .<type> pointing to the .rootfs.<type> output.

This is not compatible with the UBIFS images produced which have
.<type>.img extension since they are not considered to be valid rootfs
images when they are not included in a UBI container.

Check for existence of the link target .rootfs.<type> before creating the
link and fallback to a check for the .<type>.img target after that.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Acked-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 meta/classes/image_types.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 696e978..6a66d21 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -16,7 +16,11 @@ runimagecmd () {
 	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
 	${cmd}
 	cd ${DEPLOY_DIR_IMAGE}/
-	ln -fs ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
+	if [ -f ${IMAGE_NAME}.rootfs.${type} ]; then
+		ln -fs ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
+	elif [ -f ${IMAGE_NAME}.${type}.img ]; then
+		ln -fs ${IMAGE_NAME}.${type}.img ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
+	fi
 }
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
-- 
1.7.0.4



