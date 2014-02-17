Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 5EDC06E7BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 16:34:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,861,1384297200"; d="scan'208";a="41299790"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 17 Feb 2014 17:34:09 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 17 Feb 2014 17:34:08 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Mon, 17 Feb 2014 17:34:08 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Feb 2014 17:28:58 +0100
Message-ID: <1392654538-842-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
X-OriginalArrivalTime: 17 Feb 2014 16:34:08.0133 (UTC)
	FILETIME=[146BCB50:01CF2BFE]
MIME-Version: 1.0
Subject: [PATCH] image_types: minor, inline CPIO_TOUCH_INIT()
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
X-List-Received-Date: Mon, 17 Feb 2014 16:34:11 -0000
Content-Type: text/plain

Since generic compression solution has been introduced
(see revision b7e4ed41ee480f00b7265341e9e2d2c2b9135143),
CPIO_TOUCH_INIT() is only called by IMAGE_CMD_cpio.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/classes/image_types.bbclass | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0467abd..27b0796 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -66,14 +66,10 @@ IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAM
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
 
-CPIO_TOUCH_INIT () {
-	if [ ! -L ${IMAGE_ROOTFS}/init ]
-	then
-	touch ${IMAGE_ROOTFS}/init
-	fi
-}
 IMAGE_CMD_cpio () {
-	${CPIO_TOUCH_INIT}
+	if [ ! -L ${IMAGE_ROOTFS}/init ]; then
+		touch ${IMAGE_ROOTFS}/init
+	fi
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
 
-- 
1.8.5.4


