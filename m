Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 310C96DEF3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 06:50:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB46oR8w013542
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Dec 2013 22:50:27 -0800 (PST)
Received: from wind-OptiPlex-780.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 22:50:27 -0800
From: Zhu Yanjun <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Dec 2013 14:50:38 +0800
Message-ID: <1386139839-10522-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] boot-directdisk: add the support of vmdk
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
X-List-Received-Date: Wed, 04 Dec 2013 06:50:28 -0000
Content-Type: text/plain

---
 meta/classes/boot-directdisk.bbclass |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 5535728..b2bd210 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -88,6 +88,15 @@ build_boot_dd() {
 		grubefi_hddimg_populate $HDDDIR
 	fi
 
+	if [ ${IMAGE_FSTYPE} = "vmdk" ]; then
+		if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
+			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
+			if [ x${SYSLINUX_SPLASH} != x ] ; then
+				install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
+			fi
+		fi
+	fi
+
 	BLOCKS=`du -bks $HDDDIR | cut -f 1`
 	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
 
@@ -119,17 +128,22 @@ build_boot_dd() {
 	parted $IMAGE mkpart primary fat16 0 ${END1}B
 	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
 	parted $IMAGE set 1 boot on 
-	parted $IMAGE print
+
+	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
+		parted $IMAGE print
+	fi
 
 	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
 		dd of=$IMAGE bs=1 seek=440 conv=notrunc
 
 	OFFSET=`expr $END2 / 512`
-	if [ "${PCBIOS}" = "1" ]; then
-		dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
+	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
+		if [ "${PCBIOS}" = "1" ]; then
+			dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
+		fi
+		dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
 	fi
-	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
-	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512	
+	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512      
 
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
-- 
1.7.9.5


