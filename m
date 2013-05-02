Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UY0ej-0005v7-N5
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 23:03:12 +0200
Received: by mail-da0-f49.google.com with SMTP id p5so473415dak.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JGrFLW0eNIC1w659zA08v3nQQ7vmXDMgyph5F5miy1g=;
	b=M6u0Wxvoli9KiJwe2SrQkipz49uLUvImTSuAkrp8HIC3zilDvByPsjcFWvHE904laa
	UYzvlQFL07vGEqXrRxt1nfRMQjpnnFSYUmJ+ppoXGA99biumMgSItCx4d/YfgpwvkVeX
	xLKax/ypka6s4ZgsRe4sPKvZ0gat44IcejRklqXmxmIdD3qy8c3mBL02/MUKIojLTMY5
	r/5VhlxAc0iChAyfItLZARopBYLV5VqsRL5teuU9xYGtYAhgsANJ/HY1kOR5pW+sof7D
	60ScgPSPiEZQXYMcLNuy+oZ5u08H/N5TJqu10vwRfnQ+fc2o0VM3DUXwYqfx6UmZGqQA
	FgXw==
X-Received: by 10.68.175.97 with SMTP id bz1mr10750002pbc.37.1367527515106;
	Thu, 02 May 2013 13:45:15 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id b7sm8574019pba.39.2013.05.02.13.45.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 13:45:14 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 06:56:33 +1000
Message-Id: <1367528193-10516-3-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1367528193-10516-1-git-send-email-net147@gmail.com>
References: <1367528193-10516-1-git-send-email-net147@gmail.com>
Subject: [PATCH 2/2] bootimg: Scope HDDDIR and ISODIR variables to avoid conflicts
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
X-List-Received-Date: Thu, 02 May 2013 21:03:22 -0000

These variables should not be shared with other image classes.
The boot-directdisk class also has an HDDDIR variable that could be
overwritten if executing concurrently in the same image recipe.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/bootimg.bbclass | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b7ddf42..11b3294 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -29,9 +29,6 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
 
-HDDDIR = "${S}/hddimg"
-ISODIR = "${S}/iso"
-
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
@@ -76,13 +73,15 @@ populate() {
 }
 
 build_iso() {
+	ISODIR="${S}/iso"
+
 	# Only create an ISO if we have an INITRD and NOISO was not set
 	if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
 		bbnote "ISO image will not be created."
 		return
 	fi
 
-	populate ${ISODIR}
+	populate $ISODIR
 
 	if [ "${PCBIOS}" = "1" ]; then
 		syslinux_iso_populate
@@ -95,12 +94,12 @@ build_iso() {
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
-			${MKISOFS_OPTIONS} ${ISODIR}
+			${MKISOFS_OPTIONS} $ISODIR
 	else
 		bbnote "EFI-only ISO images are untested, please provide feedback."
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-			-r ${ISODIR}
+			-r $ISODIR
 	fi
 
 	isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
@@ -111,9 +110,11 @@ build_iso() {
 }
 
 build_hddimg() {
+	HDDDIR="${S}/hddimg"
+
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
-		populate ${HDDDIR}
+		populate $HDDDIR
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_populate
@@ -128,7 +129,7 @@ build_hddimg() {
 		#  Blocks: 1024 bytes
 
 		# Determine the sector count just for the data
-		SECTORS=$(expr $(du --apparent-size -ks ${HDDDIR} | cut -f 1) \* 2)
+		SECTORS=$(expr $(du --apparent-size -ks $HDDDIR | cut -f 1) \* 2)
 
 		# Account for the filesystem overhead. This includes directory
 		# entries in the clusters as well as the FAT itself.
@@ -140,13 +141,13 @@ build_hddimg() {
 		#   8.3 filenames only
 
 		# 32 bytes per dir entry
-		DIR_BYTES=$(expr $(find ${HDDDIR} | tail -n +2 | wc -l) \* 32)
+		DIR_BYTES=$(expr $(find $HDDDIR | tail -n +2 | wc -l) \* 32)
 		# 32 bytes for every end-of-directory dir entry
-		DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 32))
+		DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find $HDDDIR -type d | tail -n +2 | wc -l) \* 32))
 		# 4 bytes per FAT entry per sector of data
 		FAT_BYTES=$(expr $SECTORS \* 4)
 		# 4 bytes per FAT entry per end-of-cluster list
-		FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 4))
+		FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find $HDDDIR -type d | tail -n +2 | wc -l) \* 4))
 
 		# Use a ceiling function to determine FS overhead in sectors
 		DIR_SECTORS=$(expr $(expr $DIR_BYTES + 511) / 512)
@@ -173,7 +174,7 @@ build_hddimg() {
 		IMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
 		# Copy HDDDIR recursively into the image file directly
-		mcopy -i ${IMG} -s ${HDDDIR}/* ::/
+		mcopy -i ${IMG} -s $HDDDIR/* ::/
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_install
-- 
1.8.2.1



