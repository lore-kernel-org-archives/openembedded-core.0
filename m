Return-Path: <joaohf@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6413460FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 18:14:48 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so1569337pbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=5l0BP4upr+RcSnxtgm44uKRU9L/hjKMTl/8/n0TSXL4=;
	b=HoMUCFXk0HzPYMIxM/EJevDXtCIzI4G541ikD/ai0KOGtMNLxCJfePDgCbZeWsgQYX
	7s02XY/oZNrFxR3f0tIp5fbwPwap8b6xGh2DRdu+SqYFrXDYwwI7QXU1+MXXLmd1xsf7
	v3XCsQ85qasElVM6hJYpV0LY/8sVhSOuodMCUc72jop/20C4zKgY8U9qhGStOfGMBDru
	rJY8FyApYzd76IbARGoKhMshh048QRYQ8/Oh4XXQPvz8oD/Ik7Z4mqSJcCDDy2Fn372G
	cNF7fahpfFxA+XWT0tz3WhVMV0FWvONjY6MzbY6SoZftT5jkoA+t5TD6ax5c0ZF99tv+
	YvnQ==
X-Received: by 10.68.202.6 with SMTP id ke6mr3520080pbc.173.1379096090136;
	Fri, 13 Sep 2013 11:14:50 -0700 (PDT)
Received: from jfreitas.padtec.com.br (apolo.padtec.com.br. [200.228.158.130])
	by mx.google.com with ESMTPSA id
	py4sm13231657pbc.14.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 11:14:49 -0700 (PDT)
From: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2013 15:12:38 -0300
Message-Id: <1379095958-15269-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH v2] boot-directdisk: Allow for EFI-only boot direct disk images
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
X-List-Received-Date: Fri, 13 Sep 2013 18:14:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Henrique Ferreira de Freitas <joaohf@gmail.com>

Condition building PCBIOS legacy images on MACHINE_FEATURES containing "pcbios"
or not containing "efi". This ensures existing BSPs will continue to get the
old PCBIOS legacy-only images. New BSPs can add "efi", "pcbios", or both. The
images created likewise support one or the other or both.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 65 ++++++++++++++++++++++++++++++------
 meta/classes/syslinux.bbclass        |  5 +++
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 8a55aae..4b9d7bd 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -31,6 +31,29 @@ EXCLUDE_FROM_WORLD = "1"
 BOOTDD_VOLUME_ID   ?= "boot"
 BOOTDD_EXTRA_SPACE ?= "16384"
 
+EFI = "${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
+EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "", d)}"
+
+# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
+# contain "efi". This way legacy is supported by default if neither is
+# specified, maintaining the original behavior.
+def pcbios(d):
+    pcbios = base_contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
+    if pcbios == "0":
+        pcbios = base_contains("MACHINE_FEATURES", "efi", "0", "1", d)
+    return pcbios
+
+def pcbios_class(d):
+    if d.getVar("PCBIOS", True) == "1":
+        return "syslinux"
+    return ""
+
+PCBIOS = "${@pcbios(d)}"
+PCBIOS_CLASS = "${@pcbios_class(d)}"
+
+inherit ${PCBIOS_CLASS}
+inherit ${EFI_CLASS}
+
 # Get the build_syslinux_cfg() function from the syslinux class
 
 AUTO_SYSLINUXCFG = "1"
@@ -38,17 +61,32 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
-inherit syslinux
-		
+populate() {
+	DEST=$1
+	install -d ${DEST}
+
+	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
+	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
+
+	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
+		install -m 0644 ${INITRD} ${DEST}/initrd
+	fi
+
+}
+
 build_boot_dd() {
 	HDDDIR="${S}/hdd/boot"
 	HDDIMG="${S}/hdd.image"
 	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
 
-	install -d $HDDDIR
-	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage $HDDDIR/vmlinuz
-	install -m 0644 ${S}/syslinux.cfg $HDDDIR/syslinux.cfg
-	install -m 444 ${STAGING_DATADIR}/syslinux/ldlinux.sys $HDDDIR/ldlinux.sys
+	populate ${HDDDIR}
+
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_hddimg_populate
+	fi
+	if [ "${EFI}" = "1" ]; then
+		grubefi_hddimg_populate
+	fi
 
 	BLOCKS=`du -bks $HDDDIR | cut -f 1`
 	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
@@ -62,7 +100,9 @@ build_boot_dd() {
 	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
 	mcopy -i $HDDIMG -s $HDDDIR/* ::/
 
-	syslinux $HDDIMG
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_hdddirect_install $HDDIMG
+	fi	
 	chmod 644 $HDDIMG
 
 	ROOTFSBLOCKS=`du -Lbks ${ROOTFS} | cut -f 1`
@@ -85,9 +125,11 @@ build_boot_dd() {
 		dd of=$IMAGE bs=1 seek=440 conv=notrunc
 
 	OFFSET=`expr $END2 / 512`
-	dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
+	if [ "${PCBIOS}" = "1" ]; then
+		dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
+	fi
 	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
-	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
+	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512	
 
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
@@ -96,7 +138,10 @@ build_boot_dd() {
 
 python do_bootdirectdisk() {
     validate_disk_signature(d)
-    bb.build.exec_func('build_syslinux_cfg', d)
+    if d.getVar("PCBIOS", True) == "1":
+        bb.build.exec_func('build_syslinux_cfg', d)
+    if d.getVar("EFI", True) == "1":
+        bb.build.exec_func('build_grub_cfg', d)
     bb.build.exec_func('build_boot_dd', d)
 }
 
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 501bc6d..dae6609 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -64,6 +64,11 @@ syslinux_hddimg_install() {
 	syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 }
 
+syslinux_hdddirect_install() {
+	DEST=$1
+	syslinux $DEST
+}
+
 python build_syslinux_cfg () {
     import copy
     import sys
-- 
1.8.1.2


