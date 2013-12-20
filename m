Return-Path: <joaohf@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9467660F25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 16:51:05 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id e16so2455477qcx.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 08:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mce/b+b6bJkIEI0CVJF8yXLwZPAWx366CVGh04ijjWU=;
	b=a7DovL0/5DgSBD24iFLv/VFzTpaI0xLo5d80+HtaqQiwhtF/Te8FwfGrxETH8c0f8R
	ZJnFISpqBr2HlpIepIJ4slFMIUPK964L/Z3lkL/hxuJ4GOt7YeivyqvgMb+wzHTuz22t
	RwJTfR3b44lMVasVaX1V6kJVvYAq891GArHF+t+QabY0Wf/acOqGZbIluySMTW2SZObY
	mJfXLQevkbjUQelOvUUuI+OEJhR/ho6l1reVIEVQvT0zKm/35ntPwE3K1zLklWp9Lflm
	bnX0wQXumAAltPrRlzfFlCQO3LPJfRd0OgRlfzl75hrZy4rVtJZbLzJD2PtImlLZISHU
	EOrw==
X-Received: by 10.224.126.5 with SMTP id a5mr15825525qas.43.1387558266404;
	Fri, 20 Dec 2013 08:51:06 -0800 (PST)
Received: from jfreitas.padtec.com.br (apolo.padtec.com.br. [200.228.158.130])
	by mx.google.com with ESMTPSA id
	q2sm7142648qer.22.2013.12.20.08.51.01 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Dec 2013 08:51:05 -0800 (PST)
From: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 14:50:00 -0200
Message-Id: <1387558200-17756-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATH v2] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Fri, 20 Dec 2013 16:51:05 -0000

Previous change (086ce22b88f5ef5f75a83119a32c8b3fdcfa296d) broke
the creating of vmdk images. This protects shell expansion variables
and let dd generate the image to be transformed to vmdk by image-vmdk.class.

Signed-off-by: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
---

Using IMAGE_FSTYPE to hold the result of base_contains().

 meta/classes/boot-directdisk.bbclass | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 3277666..d0113ac 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -61,6 +61,8 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
+IMAGE_FSTYPE = '${@base_contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
+
 boot_direct_populate() {
 	dest=$1
 	install -d $dest
@@ -88,10 +90,10 @@ build_boot_dd() {
 		grubefi_hddimg_populate $HDDDIR
 	fi
 
-	if [ ${IMAGE_FSTYPE} = "vmdk" ]; then
-		if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
+	if [ "${IMAGE_FSTYPE}" = "image-vmdk" ]; then
+		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
 			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
-			if [ x${SYSLINUX_SPLASH} != x ] ; then
+			if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
 				install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
 			fi
 		fi
@@ -129,9 +131,7 @@ build_boot_dd() {
 	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
 	parted $IMAGE set 1 boot on 
 
-	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
-		parted $IMAGE print
-	fi
+	parted $IMAGE print
 
 	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
 		dd of=$IMAGE bs=1 seek=440 conv=notrunc
@@ -141,10 +141,8 @@ build_boot_dd() {
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


