Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVDB-0000sc-VH
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:28:14 +0100
Received: by faaa20 with SMTP id a20so338376faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=LaBMHIiO20U9Zd+TIQg9AeGL5GndHFEKGvVmwd/pkWE=;
	b=STUU1ka0Y/bchg2YNt5LPPshLedazy9MsdG9WFg9BqoUMe3+qUbdAyxYl/vUY3rTss
	0n9k+krnHRbuiYmpT0wC/oDkNtZJEUaJl/HpRprdK5Q68NjWauLWJjAAerRg/3WFTFV2
	JJ1NtT1pDJytx9/ywScZE7k5rPtBTRO6ucGBo=
Received: by 10.180.0.100 with SMTP id 4mr26307942wid.48.1323793278294;
	Tue, 13 Dec 2011 08:21:18 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 28sm27231923wby.3.2011.12.13.08.21.16
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 08:21:17 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:19:46 +0400
Message-Id: <1323793193-31090-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 2/9] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Tue, 13 Dec 2011 16:28:14 -0000

As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
separate task from do_deploy. This way the do_install task can also
benefit from generated uImage.

The only major feature of oe-core's version (not to recreate uImage
if it exists) is retained in this patch. On the contra, as this version
was merged from meta-oe/org.oe.dev, new function has another feature:
it permits overriding the u-boot entrypoint via u-boot symbol.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/kernel.bbclass |   40 ++++++++++++++++++++++++----------------
 1 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a75c199..db00d2d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -485,6 +485,30 @@ do_sizecheck() {
 
 addtask sizecheck before do_install after do_compile
 
+do_uboot_mkimage() {
+    if test "x${KERNEL_IMAGETYPE}" = "xuImage" -a \
+            ! -e arch/${ARCH}/boot/uImage ; then
+        ENTRYPOINT=${UBOOT_ENTRYPOINT}
+        if test -n "${UBOOT_ENTRYSYMBOL}"; then
+            ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+                   awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+        fi
+        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+            ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+            rm -f linux.bin
+        else
+            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
+            rm -f linux.bin.gz
+            gzip -9 linux.bin
+            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+            rm -f linux.bin.gz
+        fi
+    fi
+}
+
+addtask uboot_mkimage before do_install after do_compile
+
 KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
@@ -496,22 +520,6 @@ kernel_do_deploy() {
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



