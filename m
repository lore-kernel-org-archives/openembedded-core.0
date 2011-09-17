Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R53IY-0002Z5-74
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 00:23:46 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3133321fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 15:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Wgmc7SbRcz/sU7g6U1qlU/an982hOgd8TY6/fR4LLSc=;
	b=GK1U+wjag+EI4MSCWfI4kFxYx3sxRT86rdRk4Dtv2qdm5PudLJfabohCj5E7l2uVTp
	SlTQlp9ub1Fe9w3SnBZLOlHcF/6x8rBHW8uHrFSG5GP6TL8sO19zObtyU2b+shXFKaDy
	LzwCnGLAwJ9+mk7DYMTnt+rpxVFFy9+CR2kIA=
Received: by 10.223.29.76 with SMTP id p12mr1949684fac.51.1316297914285;
	Sat, 17 Sep 2011 15:18:34 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l20sm16037887fad.12.2011.09.17.15.18.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Sep 2011 15:18:33 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 02:18:15 +0400
Message-Id: <1316297897-698-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 3/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Sat, 17 Sep 2011 22:23:46 -0000

As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
separate task from do_deploy. The only major feature of oe-core's
version (not to recreate uImage if it exists) is retained in this patch.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/kernel.bbclass |   40 ++++++++++++++++++++++++----------------
 1 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b44e3b5..6ff4018 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -486,6 +486,30 @@ do_sizecheck() {
 
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
@@ -497,22 +521,6 @@ kernel_do_deploy() {
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
1.7.2.5



