Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RcMqB-0000fc-8Q
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 20:56:11 +0100
Received: by iakh37 with SMTP id h37so3846499iak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 11:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=fWm5ZUjYOR6PHfXf7njikgT6a66oHki1eId+B/WVkU8=;
	b=ZS6LVhp7/sg+CykhwQJ7dlIGlaOAftAQnmaMSZFQhZYg1MFpODKMP6O97beaHfAGW2
	07UF0InoWYBjVGs13AiqRJGELbb1OnzF+6kju8njHiA1VwhP1g/uDIIc07T7n78oDJt+
	D0LPWEE77qsLPXIfA+3PcZbhubGHohFtqLIV4=
Received: by 10.50.87.234 with SMTP id bb10mr23404269igb.81.1324237748426;
	Sun, 18 Dec 2011 11:49:08 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	cv10sm10929303igc.0.2011.12.18.11.49.05 (version=SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 11:49:07 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 23:47:28 +0400
Message-Id: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Sun, 18 Dec 2011 19:56:11 -0000

As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
separate task from do_deploy. This way the do_install task can also
benefit from generated uImage.

The only major feature of oe-core's version (not to recreate uImage
if it exists) is retained in this patch. On the contra, as this version
was merged from meta-oe/org.oe.dev, new function has another feature:
it permits overriding the u-boot entrypoint via u-boot symbol.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/kernel.bbclass |   43 +++++++++++++++++++++++++++----------------
 1 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3f2f75a..8832a77 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -489,6 +489,33 @@ do_sizecheck() {
 
 addtask sizecheck before do_install after do_compile
 
+# Define to 1 to force kernel.bbclass to recreate uImage for you
+KERNEL_RECREATE_UIMAGE ?= "0"
+
+do_uboot_mkimage() {
+    test "x${KERNEL_IMAGETYPE}" = "xuImage" || return 0
+    test "x${KERNEL_RECREATE_UIMAGE}" = "x1" -o ! -e arch/${ARCH}/boot/uImage || return 0
+
+    ENTRYPOINT=${UBOOT_ENTRYPOINT}
+    if test -n "${UBOOT_ENTRYSYMBOL}"; then
+        ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+               awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+    fi
+    if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+        ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+        uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+        rm -f linux.bin
+    else
+        ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
+        rm -f linux.bin.gz
+        gzip -9 linux.bin
+        uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+        rm -f linux.bin.gz
+    fi
+}
+
+addtask uboot_mkimage before do_install after do_compile
+
 KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
@@ -500,22 +527,6 @@ kernel_do_deploy() {
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
1.7.7.3



