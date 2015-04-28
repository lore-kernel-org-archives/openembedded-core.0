Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id E410173D90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:38:43 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbpZT3cSgz3hj4D;
	Tue, 28 Apr 2015 18:38:41 +0200 (CEST)
X-Auth-Info: gfOD/BLOP6kPmbPb+aZuwx19GD88D2Xn811ugfufzy8=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lbpZT0QgLzvhTg;
	Tue, 28 Apr 2015 18:38:41 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 18:38:30 +0200
Message-Id: <1430239116-7671-3-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430239116-7671-1-git-send-email-marex@denx.de>
References: <1430239116-7671-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/8] kernel: Rework do_uboot_mkimage
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
X-List-Received-Date: Tue, 28 Apr 2015 16:38:47 -0000

Rework the function so part it's internals can be re-used by fitImage
image type. The name of the temporary file , linux.bin , is recycled
a little more as it's now used for both the case where it is gzip
compressed and where it is not. This should be fine, since the file
is temporary and removed after the uImage was created anyway.

There is no functional change here.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 75bfd76..e85e73b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -435,22 +435,32 @@ MODULE_TARBALL_DEPLOY ?= "1"
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
 		if test "x${KEEPUIMAGE}" != "xyes" ; then
+			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+				vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
+				linux_suffix=""
+				linux_comp="none"
+			else
+				vmlinux_path="vmlinux"
+				linux_suffix=".gz"
+				linux_comp="gzip"
+			fi
+
+			${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
+
+			if [ "${linux_comp}" != "none" ] ; then
+				rm -f linux.bin
+				gzip -9 linux.bin
+				mv -f "linux.bin${linux_suffix}" linux.bin
+			fi
+
 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
 				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
 					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
 			fi
-			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-				${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
-				rm -f linux.bin
-			else
-				${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-				rm -f linux.bin.gz
-				gzip -9 linux.bin
-				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
-				rm -f linux.bin.gz
-			fi
+
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+			rm -f linux.bin
 		fi
 	fi
 }
-- 
2.1.4


