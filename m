Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C622F72E97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:06:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5U36dbF013968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:06:39 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 20:06:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 20:06:37 -0700
Message-ID: <82d0f12fe1c3750f2436caedc066b280d51112ab.1435633566.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435633566.git.liezhi.yang@windriver.com>
References: <cover.1435633566.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bootimg.bbclass:iso: use mkisofs -iso-level 3 for large iso
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
X-List-Received-Date: Tue, 30 Jun 2015 03:06:39 -0000
Content-Type: text/plain

There will be problems when rootfs.img is larger than 4GB:
mkisofs: Value too large for defined data type. File /path/to/iso/rootfs.img is too large for current mkisofs settings - ignoring

And will get a wrong iso.

Check the size of ${ISODIR}/rootfs.img, use mkisofs -iso-level 3
when it exceeds 3.8GB, the specification is 4G - 1 bytes, we need
leave a few space for other files.

[YOCTO #6449]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/bootimg.bbclass |   15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 4abe00e..605edc9 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -136,19 +136,30 @@ build_iso() {
 		mkisofs_compress_opts="-r"
 	fi
 
+	# Check the size of ${ISODIR}/rootfs.img, use mkisofs -iso-level 3
+	# when it exceeds 3.8GB, the specification is 4G - 1 bytes, we need
+	# leave a few space for other files.
+	mkisofs_iso_level=""
+	rootfs_img_size=`stat -c '%s' ${ISODIR}/rootfs.img`
+	# 4080218931 = 3.8 * 1024 * 1024 * 1024
+	if [ $rootfs_img_size -gt 4080218931 ]; then
+		bbnote "${ISODIR}/rootfs.img execeeds 3.8GB, using '-iso-level 3' for mkisofs"
+		mkisofs_iso_level="-iso-level 3"
+	fi
+
 	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
 		# PCBIOS only media
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
 			$mkisofs_compress_opts \
-			${MKISOFS_OPTIONS} ${ISODIR}
+			${MKISOFS_OPTIONS} $mkisofs_iso_level ${ISODIR}
 	else
 		# EFI only OR EFI+PCBIOS
 		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
-			$mkisofs_compress_opts ${MKISOFS_OPTIONS} \
+			$mkisofs_compress_opts ${MKISOFS_OPTIONS} $mkisofs_iso_level \
 			-eltorito-alt-boot -eltorito-platform efi \
 			-b efi.img -no-emul-boot \
 			${ISODIR}
-- 
1.7.9.5


