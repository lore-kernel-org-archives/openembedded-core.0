Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 40B3971B0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 23:36:53 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id F2BF7B8A47A; Thu,  1 Dec 2016 00:36:51 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 00:36:47 +0100
Message-Id: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/5] kernel.bbclass: allow uncompressed initramfs archives
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
X-List-Received-Date: Wed, 30 Nov 2016 23:36:56 -0000

The code failed to copy the initramfs in case it was a plain
cpio archive.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 25a153c..4aeeacb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -165,7 +165,7 @@ copy_initramfs() {
 	mkdir -p ${B}/usr
 	# Find and use the first initramfs image archive type we find
 	rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
-	for img in cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
+	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
 		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
 			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img ${B}/usr/.
 			case $img in
-- 
2.7.4


