Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id E11BC60CE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 10:10:55 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id z6so570877yhz.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SHZSbMGyipNNT+i5vmdS5FK0rOcVX80vwVaXrWEoi5o=;
	b=bSYy+ZKuMZ7n/8ZN2DTSrILhACBVa/U/2m7IjFsOenA5B6ehX7+ZJgBv4jeK6KHULZ
	a6aBxUNrf734a355LpC+O3oPmidggZH5i2oa+whxOTyYY1HWTVW4pcIDKPk8tpAyy5ir
	zQRQ8KAq60brH0+JtJAzdxir21GiQgkSqI092n1zwn5HbRAl7TWZiquI8obDVVrVq8/z
	lRtZTNcypTPF+aAoc1tS186esip/pT9rw+M3aNnuePoNVA3hWp2bhg8saYue4ME+pkBk
	wtMbar1mB114yr9CUkM6VY3cU0eXdO+tUuU2tXhbN8RFPXJ2kijfgR9uo5ounTVChwFa
	VDYQ==
X-Received: by 10.236.61.136 with SMTP id w8mr5275475yhc.14.1387534256704;
	Fri, 20 Dec 2013 02:10:56 -0800 (PST)
Received: from jfreitas.padtec.com.br (apolo.padtec.com.br. [200.228.158.130])
	by mx.google.com with ESMTPSA id
	f78sm10575980yhp.12.2013.12.20.02.10.54 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Dec 2013 02:10:55 -0800 (PST)
From: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 08:10:24 -0200
Message-Id: <1387534224-16453-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Fri, 20 Dec 2013 10:10:57 -0000

Previous change (086ce22b88f5ef5f75a83119a32c8b3fdcfa296d) broke
the creating of vmdk images. This protects shell expansion variables
and let dd generate the image to be transformed to vmdk by image-vmdk.class.
---
 meta/classes/boot-directdisk.bbclass | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 3277666..4f26f47 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -88,10 +88,10 @@ build_boot_dd() {
 		grubefi_hddimg_populate $HDDDIR
 	fi
 
-	if [ ${IMAGE_FSTYPE} = "vmdk" ]; then
-		if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
+	if [ "${IMAGE_FSTYPES}" = "vmdk" ]; then
+		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
 			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
-			if [ x${SYSLINUX_SPLASH} != x ] ; then
+			if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
 				install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
 			fi
 		fi
@@ -129,9 +129,7 @@ build_boot_dd() {
 	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
 	parted $IMAGE set 1 boot on 
 
-	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
-		parted $IMAGE print
-	fi
+	parted $IMAGE print
 
 	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
 		dd of=$IMAGE bs=1 seek=440 conv=notrunc
@@ -141,10 +139,8 @@ build_boot_dd() {
 		dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
 	fi
 
-	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
-		dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
-		dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512	
-	fi
+	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
+	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
 
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
-- 
1.8.3.2


