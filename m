Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E81EB6B4C4
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:20:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8CHK3KO022834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 10:20:03 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Sep 2013 10:20:03 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 12:19:43 -0500
Message-ID: <1379006387-20186-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 1/5] bootimage.bbclass: Move fat image creation into a function
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
X-List-Received-Date: Thu, 12 Sep 2013 17:20:02 -0000
Content-Type: text/plain

In order to call the fat image creation multiple times it needs to be
in its own function.  A future commit will make use of the new
function to additionally create EFI image files for use with an ISO.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/bootimg.bbclass |  110 ++++++++++++++++++++++--------------------
 1 file changed, 58 insertions(+), 52 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b312e0d..2ed7017 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -128,6 +128,63 @@ build_iso() {
 	ln -s ${IMAGE_NAME}.iso ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
 }
 
+build_fat_img() {
+	FATSOURCEDIR=$1
+	FATIMG=$2
+
+	# Calculate the size required for the final image including the
+	# data and filesystem overhead.
+	# Sectors: 512 bytes
+	#  Blocks: 1024 bytes
+
+	# Determine the sector count just for the data
+	SECTORS=$(expr $(du --apparent-size -ks ${FATSOURCEDIR} | cut -f 1) \* 2)
+
+	# Account for the filesystem overhead. This includes directory
+	# entries in the clusters as well as the FAT itself.
+	# Assumptions:
+	#   FAT32 (12 or 16 may be selected by mkdosfs, but the extra
+	#   padding will be minimal on those smaller images and not
+	#   worth the logic here to caclulate the smaller FAT sizes)
+	#   < 16 entries per directory
+	#   8.3 filenames only
+
+	# 32 bytes per dir entry
+	DIR_BYTES=$(expr $(find ${FATSOURCEDIR} | tail -n +2 | wc -l) \* 32)
+	# 32 bytes for every end-of-directory dir entry
+	DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find ${FATSOURCEDIR} -type d | tail -n +2 | wc -l) \* 32))
+	# 4 bytes per FAT entry per sector of data
+	FAT_BYTES=$(expr $SECTORS \* 4)
+	# 4 bytes per FAT entry per end-of-cluster list
+	FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find ${FATSOURCEDIR} -type d | tail -n +2 | wc -l) \* 4))
+
+	# Use a ceiling function to determine FS overhead in sectors
+	DIR_SECTORS=$(expr $(expr $DIR_BYTES + 511) / 512)
+	# There are two FATs on the image
+	FAT_SECTORS=$(expr $(expr $(expr $FAT_BYTES + 511) / 512) \* 2)
+	SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
+
+	# Determine the final size in blocks accounting for some padding
+	BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
+
+	# Ensure total sectors is an integral number of sectors per
+	# track or mcopy will complain. Sectors are 512 bytes, and we
+	# generate images with 32 sectors per track. This calculation is
+	# done in blocks, thus the mod by 16 instead of 32.
+	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
+
+	# mkdosfs will sometimes use FAT16 when it is not appropriate,
+	# resulting in a boot failure from SYSLINUX. Use FAT32 for
+	# images larger than 512MB, otherwise let mkdosfs decide.
+	if [ $(expr $BLOCKS / 1024) -gt 512 ]; then
+		FATSIZE="-F 32"
+	fi
+
+	mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} ${BLOCKS}
+	# Copy FATSOURCEDIR recursively into the image file directly
+	mcopy -i ${FATIMG} -s ${FATSOURCEDIR}/* ::/
+}
+
 build_hddimg() {
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
@@ -140,58 +197,7 @@ build_hddimg() {
 			grubefi_hddimg_populate
 		fi
 
-		# Calculate the size required for the final image including the
-		# data and filesystem overhead.
-		# Sectors: 512 bytes
-		#  Blocks: 1024 bytes
-
-		# Determine the sector count just for the data
-		SECTORS=$(expr $(du --apparent-size -ks ${HDDDIR} | cut -f 1) \* 2)
-
-		# Account for the filesystem overhead. This includes directory
-		# entries in the clusters as well as the FAT itself.
-		# Assumptions:
-		#   FAT32 (12 or 16 may be selected by mkdosfs, but the extra
-		#   padding will be minimal on those smaller images and not
-		#   worth the logic here to caclulate the smaller FAT sizes)
-		#   < 16 entries per directory
-		#   8.3 filenames only
-
-		# 32 bytes per dir entry
-		DIR_BYTES=$(expr $(find ${HDDDIR} | tail -n +2 | wc -l) \* 32)
-		# 32 bytes for every end-of-directory dir entry
-		DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 32))
-		# 4 bytes per FAT entry per sector of data
-		FAT_BYTES=$(expr $SECTORS \* 4)
-		# 4 bytes per FAT entry per end-of-cluster list
-		FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 4))
-
-		# Use a ceiling function to determine FS overhead in sectors
-		DIR_SECTORS=$(expr $(expr $DIR_BYTES + 511) / 512)
-		# There are two FATs on the image
-		FAT_SECTORS=$(expr $(expr $(expr $FAT_BYTES + 511) / 512) \* 2)
-		SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
-
-		# Determine the final size in blocks accounting for some padding
-		BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
-
-		# Ensure total sectors is an integral number of sectors per
-		# track or mcopy will complain. Sectors are 512 bytes, and we
-		# generate images with 32 sectors per track. This calculation is
-		# done in blocks, thus the mod by 16 instead of 32.
-		BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
-
-		# mkdosfs will sometimes use FAT16 when it is not appropriate,
-		# resulting in a boot failure from SYSLINUX. Use FAT32 for
-		# images larger than 512MB, otherwise let mkdosfs decide.
-		if [ $(expr $BLOCKS / 1024) -gt 512 ]; then
-			FATSIZE="-F 32"
-		fi
-
-		IMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
-		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
-		# Copy HDDDIR recursively into the image file directly
-		mcopy -i ${IMG} -s ${HDDDIR}/* ::/
+		build_fat_img ${HDDDIR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_install
-- 
1.7.9.5


