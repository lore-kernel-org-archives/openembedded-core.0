Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD8v5-0008D9-Qm
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 08:33:15 +0200
Received: by eaae1 with SMTP id e1so607892eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=y98D6t6SJMccB/1Kq/+Y+53a+dsCk2zU2hgPOT/0HPk=;
	b=a/ANOOzXRsAcv81ki3/0ZX5bfjHrKB/9ISJ4+0leAmAUHjTbFO8qWGEIYcez03DfLf
	ASmd0NUq13r9qgSBbSCGoWRRw9acNN+boVXq4CEAAC8mK6MW8/xoZsh9e8SWGdDZEoQq
	snrDEPjW2PKoAEF4S54PImLhJy0sqvDdkHSyF3kMefOThliaKGrdQN6wYeRZ2gZpJKs6
	i+FBQnF2S4UPJAOvuGUXA4u0dbGzPlYWD61Ye61PvXT2iuFDNqebnqebcXcIru/Sdj95
	qKVAureRplIzDEdOx4tHSgjShi0ymgZKQjEJZC9Uim1wYMKWlIaQnH1yy37pOIJLqB65
	Y4ew==
Received: by 10.180.95.197 with SMTP id dm5mr2334873wib.20.1333002252793;
	Wed, 28 Mar 2012 23:24:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm64180067wie.9.2012.03.28.23.24.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:24:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:24:06 +0200
Message-Id: <4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1333001415.git.Martin.Jansa@gmail.com>
References: <cover.1333001415.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] kernel.bbclass: merge uboot_mkimage improvements from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 06:33:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |   39 +++++++++++++++++++++++----------------
 1 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3519e7c..8cd5fc7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -502,32 +502,39 @@ do_sizecheck() {
 
 addtask sizecheck before do_install after do_compile
 
-KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
-# Don't include the DATETIME variable in the sstate package signatures
-KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
-
-kernel_do_deploy() {
-	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
-	fi
-
+do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		if test -e arch/${ARCH}/boot/uImage ; then
-			cp arch/${ARCH}/boot/uImage ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-		elif test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+		ENTRYPOINT=${UBOOT_ENTRYPOINT}
+		if test -n "${UBOOT_ENTRYSYMBOL}"; then
+			ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+				awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+		fi
+		if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
 			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-			uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
 			rm -f linux.bin
 		else
 			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
 			rm -f linux.bin.gz
 			gzip -9 linux.bin
-			uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
 			rm -f linux.bin.gz
 		fi
 	fi
+}
+
+addtask uboot_mkimage before do_install after do_compile
+
+KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+# Don't include the DATETIME variable in the sstate package signatures
+KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
+
+kernel_do_deploy() {
+	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
+	fi
 
 	cd ${DEPLOYDIR}
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-- 
1.7.8.5



