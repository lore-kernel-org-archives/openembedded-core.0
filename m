Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id F202A60601
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 19:16:01 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jLW635rXsz3hjMw;
	Sun, 19 Oct 2014 21:15:55 +0200 (CEST)
X-Auth-Info: fdEVfuywjpT0FEFYrtqOdMcj9ynB4cDt+S7pn4XeJnc=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3jLW632RLCzvhTZ;
	Sun, 19 Oct 2014 21:15:55 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Oct 2014 21:15:42 +0200
Message-Id: <1413746147-7120-3-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1413746147-7120-1-git-send-email-marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/7] kernel: Rework do_uboot_mkimage
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
X-List-Received-Date: Sun, 19 Oct 2014 19:16:02 -0000

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
---
 meta/classes/kernel.bbclass | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 762d3df..a216b5a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -451,22 +451,32 @@ MODULE_TARBALL_DEPLOY ?= "1"
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
2.1.1


