Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDGAt-0001qo-Lz
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 16:18:03 +0200
Received: by wibhj13 with SMTP id hj13so91357wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=IALQylpnng6HdA73MvSZkx9QsFV1WG7RUGgWn081974=;
	b=FeQRvIzIhd7fvNhp/CBfd6OgmjlGUrwhCsyibalJX+m6hHYyM94Rod1G3aZzrrC9Mp
	UbshoZI8cnjS3bzXfAa3LGkaWIEz9K+xUCQg42lzNYy58ItQOc/bxVGVJR8VE9ES+BWg
	QD80zfL/Lid8Fmmc5xgirTPvOanv0BLgC5guUJOlOP9dMXfvryYwH2j11HNLlMrm3b9d
	Rq54J5iesB+LsAjuQzwFbKL7xymvnd9ICkrOzoYXlfAdtwfFb5vFy7U7C03x/WdJyMM3
	5ObwM3aG+OrK19PluF+kzdf+2l6gVYdRn8QmSKG4YdS9rdS5vUr62x3UENet60S88W1G
	Hmsw==
Received: by 10.180.95.197 with SMTP id dm5mr5912319wib.20.1333030140496;
	Thu, 29 Mar 2012 07:09:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm29268653wiw.1.2012.03.29.07.08.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 07:08:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 16:08:54 +0200
Message-Id: <95ae402382812a107254fa222cf9694f502927b3.1333028738.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1333028738.git.Martin.Jansa@gmail.com>
References: <cover.1333028738.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 1/2] kernel.bbclass: merge uboot_mkimage improvements from meta-oe
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
X-List-Received-Date: Thu, 29 Mar 2012 14:18:03 -0000

* allows to detect ENTRYPOINT from kernel binary marked with UBOOT_ENTRYSYMBOL
  used e.g. by ben-nanonote

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |   41 +++++++++++++++++++++++++----------------
 1 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3519e7c..0ae9bed 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -507,28 +507,37 @@ KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 
+do_uboot_mkimage() {
+	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
+		if test ! -e arch/${ARCH}/boot/uImage ; then
+			ENTRYPOINT=${UBOOT_ENTRYPOINT}
+			if test -n "${UBOOT_ENTRYSYMBOL}"; then
+				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+			fi
+			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+				${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+				rm -f linux.bin
+			else
+				${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
+				rm -f linux.bin.gz
+				gzip -9 linux.bin
+				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+				rm -f linux.bin.gz
+			fi
+		fi
+	fi
+}
+
+addtask uboot_mkimage before do_install after do_compile
+
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
 	fi
 
-	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		if test -e arch/${ARCH}/boot/uImage ; then
-			cp arch/${ARCH}/boot/uImage ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-		elif test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-			uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-			rm -f linux.bin
-		else
-			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-			rm -f linux.bin.gz
-			gzip -9 linux.bin
-			uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-			rm -f linux.bin.gz
-		fi
-	fi
-
 	cd ${DEPLOYDIR}
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-- 
1.7.8.5



