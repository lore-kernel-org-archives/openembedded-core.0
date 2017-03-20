Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE737795B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:18:53 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 5F5AAA0039E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 13:19:25 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017032013185368-378733 ;
	Mon, 20 Mar 2017 13:18:53 +0100 
From: Daniel Schultz <d.schultz@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 13:18:53 +0100
Message-Id: <1490012333-43021-3-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1490012333-43021-1-git-send-email-d.schultz@phytec.de>
References: <1490012333-43021-1-git-send-email-d.schultz@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 20.03.2017 13:18:53,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 20.03.2017 13:18:53,
	Serialize complete at 20.03.2017 13:18:53
X-TNEFEvaluated: 1
Subject: [PATCH 3/3] meta: images: Add fsck to avoid corrupt EXT file systems
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
X-List-Received-Date: Mon, 20 Mar 2017 12:18:53 -0000

This patch avoids the creation of a corrupt EXT file system.

Since there are no checks if a EXT file system was successfully created,
this should add to prevent possible system failures.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 meta/classes/image_types.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d2eb99d..66c643d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -74,6 +74,7 @@ oe_mkext234fs () {
 	# Create a sparse image block
 	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
 	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
+	fsck.$fstype -fy ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
 }
 
 IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
-- 
1.9.1


