Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UHZeZ-00010n-1D
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 13:59:47 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 13:42:07 +0100
Message-Id: <1363610528-10705-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] image_types.bbclass: only create links if the target exists
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 13:00:13 -0000

When creating images containing many partitions, rootfs.$type
may not be available.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/image_types.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 6bb113d..f7b8314 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -95,7 +95,9 @@ runimagecmd () {
         # And create the symlinks
         if [ -n "${IMAGE_LINK_NAME}" ]; then
             for type in ${subimages}; do
-                ln -s ${IMAGE_NAME}.rootfs.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
+                if [ -e ${IMAGE_NAME}.rootfs.$type ]; then
+                    ln -s ${IMAGE_NAME}.rootfs.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
+                fi
             done
         fi
 }
-- 
1.7.10.4



