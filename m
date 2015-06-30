Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC03275C41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:06:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5U36eYQ024538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:06:40 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 20:06:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 20:06:38 -0700
Message-ID: <beba9071becefdf378f14bf74dd52d651473887d.1435633566.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435633566.git.liezhi.yang@windriver.com>
References: <cover.1435633566.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bootimg.bbclass:hddimg: check the size of rootfs.img for hddimg
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

The hddimg uses FAT, so the single file size should be less than 4GB,
otherwise errors, check that and error out.

Another way might be use ext2/3/4 rather than FAT, but EFI only supports
FAT, if we make EFI use FAT, and non-EFI use extX, that would the code
very different, which seems not worth.

[YOCTO #6449]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/bootimg.bbclass |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 605edc9..ab1d1bd 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -249,6 +249,19 @@ build_hddimg() {
 			efi_hddimg_populate ${HDDDIR}
 		fi
 
+		# Check the size of ${HDDDIR}/rootfs.img, error out if it
+		# exceeds 4GB, it is the single file's max size of FAT fs.
+		if [ -f ${HDDDIR}/rootfs.img ]; then
+			rootfs_img_size=`stat -c '%s' ${HDDDIR}/rootfs.img`
+			max_size=`expr 4 \* 1024 \* 1024 \* 1024`
+			if [ $rootfs_img_size -gt $max_size ]; then
+				bberror "${HDDDIR}/rootfs.img execeeds 4GB,"
+				bberror "this doesn't work on FAT filesystem, you can try either of:"
+				bberror "1) Reduce the size of rootfs.img"
+				bbfatal "2) Use iso, vmdk or vdi to instead of hddimg\n"
+			fi
+		fi
+
 		build_fat_img ${HDDDIR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 
 		if [ "${PCBIOS}" = "1" ]; then
-- 
1.7.9.5


