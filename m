Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UYFDZ-0007jv-BM
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 14:36:06 +0200
Received: from i7-990x.r-finger.com
	(host86-137-88-6.range86-137.btcentralplus.com [86.137.88.6])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 868299528
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2013 13:18:12 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 13:18:11 +0100
Message-Id: <1367583491-18652-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367439862-4658-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1367439862-4658-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [Patch v3] image_types: fix default location of kernel when generating elf images
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
X-List-Received-Date: Fri, 03 May 2013 12:36:22 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

Generation of elf images fails because kernel images are no longer staged under
${STAGING_DIR_HOST}/kernel, but rather ${STAGING_DIR_HOST}/usr/src/kernel. This
patch fixes the path to point to the correct location.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 98d31f5..94837ae 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -185,7 +185,7 @@ IMAGE_CMD_cpio () {
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
 
-ELF_KERNEL ?= "${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}"
+ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
 ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
 
 IMAGE_CMD_elf () {
-- 
1.7.10.4



