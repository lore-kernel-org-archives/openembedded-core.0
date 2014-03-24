Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 48F3A6FAE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:57:09 +0000 (UTC)
Received: from sestows930 (172.16.140.39) by smtp.enea.com (172.21.1.208) with
	Microsoft SMTP Server id 14.3.158.1; Mon, 24 Mar 2014 16:57:06 +0100
Received: by sestows930 (Postfix, from userid 1000)	id 721A61801D0; Mon, 24
	Mar 2014 16:57:06 +0100 (CET)
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 16:56:05 +0100
Message-ID: <1395676565-14427-2-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1395676565-14427-1-git-send-email-jonas.eriksson@enea.com>
References: <1395676565-14427-1-git-send-email-jonas.eriksson@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Cc: Josep Puigdemont <josep.puigdemont@enea.com>
Subject: [PATCH] cpio rootfs build: Avoid modifying rootfs dir
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
X-List-Received-Date: Mon, 24 Mar 2014 15:57:12 -0000
Content-Type: text/plain

The Linux kernel requires that initrd images contain a /init file for
the image to be used as an initrd, even if it is empty. Adding it into
the rootfs directory creates a race, that can upset tar when building
both a .tar and .cpio image file ("tar: .: file changed as we read it").
Additionally, whether or not the tar file will contain the /init file is
also up to the race condition.

To avoid this problem, move the /init addition out from the rootfs
directory, and thus only include it in the .cpio image.

Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image_types.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 602c1f0..8001025 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -67,10 +67,12 @@ IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_
 IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
 
 IMAGE_CMD_cpio () {
-	if [ ! -L ${IMAGE_ROOTFS}/init ]; then
-		touch ${IMAGE_ROOTFS}/init
-	fi
 	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
+	if [ ! -e ${IMAGE_ROOTFS}/init ]; then
+		mkdir -p ${WORKDIR}/cpio_append
+		touch ${WORKDIR}/cpio_append/init
+		(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
+	fi
 }
 
 ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
-- 
1.9.0


