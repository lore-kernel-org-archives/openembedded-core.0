Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UaHYM-0001az-6n
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 05:30:03 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz10so1796160pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 20:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=SXsbbyqaMZU+B1aZ05gfdW5z5SUNjU81HEcgZG/gqVs=;
	b=kRRzq34dc7lesLowFuY1NxhhfsOhUiSPzHKhkDjsmW0soTN+i5V3fqizIn2FdCOt8a
	NbYzcziqDwCBlV+xbe4hyGbr6srgiwiQpOJeOI6HmYn5a5e536+W+5EB7WF1Ea7dGfz1
	XVMCH9pTTcwUwNuaMEzpoBB7zye7DfrJPgOB510nXlhFQ+hE2oelU0m/Fuv0avnXBkfv
	8pv7rEvh83rs1F2ivc2x/spw0/y51DeoWD0tA9seHQK4w9cH0bnV/Q7d6b1rLv3hY0Le
	5EpNHWV37VqLQsm/MYj8n7ymD+m+Wgc82l5QI5kApD/oarRSzQ/lxhskxjvph0yRpvir
	4/og==
X-Received: by 10.68.113.65 with SMTP id iw1mr10421193pbb.31.1368069114317;
	Wed, 08 May 2013 20:11:54 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id qh4sm1645065pac.8.2013.05.08.20.11.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 20:11:53 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 13:24:03 +1000
Message-Id: <1368069844-13706-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1368069844-13706-1-git-send-email-net147@gmail.com>
References: <1368069844-13706-1-git-send-email-net147@gmail.com>
Subject: [PATCH 2/3] boot-directdisk: Scope HDDDIR and HDDIMG variables to avoid conflicts
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
X-List-Received-Date: Thu, 09 May 2013 03:30:30 -0000
X-List-Received-Date: Thu, 09 May 2013 03:30:30 -0000
X-List-Received-Date: Thu, 09 May 2013 03:30:30 -0000

These variables should not be shared with other image classes.
The bootimg class also has an HDDDIR variable that could be overwritten
if executing concurrently in the same image recipe.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index aa172c6..9673760 100644
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
-	install -m 444 ${STAGING_DATADIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
+	install -d $HDDDIR
+	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage $HDDDIR/vmlinuz
+	install -m 0644 ${S}/syslinux.cfg $HDDDIR/syslinux.cfg
+	install -m 444 ${STAGING_DATADIR}/syslinux/ldlinux.sys $HDDDIR/ldlinux.sys
 
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



