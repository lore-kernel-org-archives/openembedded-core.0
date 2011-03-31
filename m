Received: from [74.127.214.27] (helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@localhost>) id 1Q59lh-0007mh-F2
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 06:46:02 +0200
Received: by localhost (Postfix, from userid 1001)
	id 414CED402A; Thu, 31 Mar 2011 00:36:38 -0400 (EDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2011 00:36:36 -0400
Message-Id: <7c809bbb4acd86fcd133a2fb4f902bde3afc7e88.1301544780.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1301544780.git.bengardiner@nanometrics.ca>
References: <a5c403f0fc71f38c0669691da7f637303ea09a27.1300978024.git.richard.purdie@linuxfoundation.org>
	<cover.1301544780.git.bengardiner@nanometrics.ca>
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: [PATCH 1/3] image_types.bbclass: rm symlink destination via ln
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
X-List-Received-Date: Thu, 31 Mar 2011 04:46:02 -0000

From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

( This is a port of commit ffdf56431d26ce54377d672764a8bba61dcaf853
from git://git.openembedded.org/openembedded )

Rather than rm'ing the destination-file manually, do ln -f

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Acked-by: Roman I Khimov <khimov@altell.ru>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 meta/classes/image_types.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f11a7ed..696e978 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -16,8 +16,7 @@ runimagecmd () {
 	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
 	${cmd}
 	cd ${DEPLOY_DIR_IMAGE}/
-	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
-	ln -s ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
+	ln -fs ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
 }
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
-- 
1.7.0.4



