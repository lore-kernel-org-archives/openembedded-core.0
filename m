Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UY0ed-0005uJ-RD
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 23:03:12 +0200
Received: by mail-pb0-f50.google.com with SMTP id um15so539282pbc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 13:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ZeMDr+MaxT8kyxXtv/bvyD7CNuU42tpdFagkr9VtviY=;
	b=LH4zzpzywqXN5jS6bP5/30PtkmFoCYqarhbVq1rwjuE8ccHSJGjABUZTfKsnZ9X6Ou
	VjkjFhZ3g/AtAzUr3KIwZCEm7FKENCvv6IL2NrwznJEgnns2SUu2Ird3uOtErZHZm3Db
	uMLcaRQeefwEa1Rk3u4wu4+XEbJRcaZM3Iy1Uw9fRl+19k4ybtgg4thQ3W3ZpiVDGQ8c
	i2McMXEx7E9yizFOauax2pKMrIdrUQEngZFqDFUb/RbH5+IJNRY6qQ3BX3uPBIldGln7
	ZmKbAtviW8vP3GfpRI6Evo+doxHEDGdrWguqktUylg6qFqOlBcI/4o2PwK5gZCQR+M13
	WNFg==
X-Received: by 10.66.20.7 with SMTP id j7mr11597636pae.142.1367527509174;
	Thu, 02 May 2013 13:45:09 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id fm2sm9599890pab.13.2013.05.02.13.45.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 13:45:08 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 06:56:32 +1000
Message-Id: <1367528193-10516-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1367528193-10516-1-git-send-email-net147@gmail.com>
References: <1367528193-10516-1-git-send-email-net147@gmail.com>
Subject: [PATCH 1/2] boot-directdisk: Scope HDDDIR and HDDIMG variables to avoid conflicts
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
X-List-Received-Date: Thu, 02 May 2013 21:03:22 -0000

These variables should not be shared with other image classes.
The bootimg class also has an HDDDIR variable that could be overwritten
if executing concurrently in the same image recipe.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 1506b42..a041482 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -28,9 +28,6 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
 
-HDDDIR = "${S}/hdd/boot"
-HDDIMG = "${S}/hdd.image"
-
 BOOTDD_VOLUME_ID   ?= "boot"
 BOOTDD_EXTRA_SPACE ?= "16384"
 
@@ -43,14 +40,16 @@ SYSLINUX_TIMEOUT ?= "10"
 inherit syslinux
 		
 build_boot_dd() {
+	HDDDIR="${S}/hdd/boot"
+	HDDIMG="${S}/hdd.image"
 	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
 
-	install -d ${HDDDIR}
-	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${HDDDIR}/vmlinuz
-	install -m 0644 ${S}/syslinux.cfg ${HDDDIR}/syslinux.cfg
-	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
+	install -d $HDDDIR
+	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage $HDDDIR/vmlinuz
+	install -m 0644 ${S}/syslinux.cfg $HDDDIR/syslinux.cfg
+	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys $HDDDIR/ldlinux.sys
 
-	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
+	BLOCKS=`du -bks $HDDDIR | cut -f 1`
 	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
 
 	# Ensure total sectors is an integral number of sectors per
@@ -59,11 +58,11 @@ build_boot_dd() {
 	# done in blocks, thus the mod by 16 instead of 32.
 	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
 
-	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C ${HDDIMG} $BLOCKS 
-	mcopy -i ${HDDIMG} -s ${HDDDIR}/* ::/
+	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
+	mcopy -i $HDDIMG -s $HDDDIR/* ::/
 
-	syslinux ${HDDIMG}
-	chmod 644 ${HDDIMG}
+	syslinux $HDDIMG
+	chmod 644 $HDDIMG
 
 	ROOTFSBLOCKS=`du -Lbks ${ROOTFS} | cut -f 1`
 	TOTALSIZE=`expr $BLOCKS + $ROOTFSBLOCKS`
@@ -83,7 +82,7 @@ build_boot_dd() {
 
 	OFFSET=`expr $END2 / 512`
 	dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
-	dd if=${HDDIMG} of=$IMAGE conv=notrunc seek=1 bs=512
+	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
 	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
 
 	cd ${DEPLOY_DIR_IMAGE}
-- 
1.8.2.1



