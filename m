Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9371570A5D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 15:26:22 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTYSv0fTJz3hhqW;
	Thu,  7 Aug 2014 17:26:23 +0200 (CEST)
X-Auth-Info: YL9ZzbbWEpQfNwEn0mD7NhdmWCFOAn9vvquCQHMCrxE=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hTYSt6pM8z7S6QJ; 
	Thu,  7 Aug 2014 17:26:22 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 17:26:12 +0200
Message-Id: <1407425175-2828-3-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1407425175-2828-1-git-send-email-marex@denx.de>
References: <1407425175-2828-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 2/5] Yocto: kernel: Pull out the linux.bin generation
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
X-List-Received-Date: Thu, 07 Aug 2014 15:26:26 -0000

Pull the generation of linux.bin image, which is then packed into uImage,
into a separate function. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/classes/kernel.bbclass | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2e2b1fe..62e3a4b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -444,26 +444,32 @@ MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
+uboot_prep_kimage() {
+	if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
+		linux_suffix=""
+		linux_comp="none"
+	else
+		vmlinux_path="vmlinux"
+		linux_suffix=".gz"
+		linux_comp="gzip"
+	fi
+
+	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
+
+	if [ "${linux_comp}" != "none" ] ; then
+		rm -f linux.bin
+		gzip -9 linux.bin
+		mv -f "linux.bin${linux_suffix}" linux.bin
+	fi
+
+	echo "${linux_comp}"
+}
+
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
 		if test "x${KEEPUIMAGE}" != "xyes" ; then
-			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-				vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
-				linux_suffix=""
-				linux_comp="none"
-			else
-				vmlinux_path="vmlinux"
-				linux_suffix=".gz"
-				linux_comp="gzip"
-			fi
-
-			${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
-
-			if [ "${linux_comp}" != "none" ] ; then
-				rm -f linux.bin
-				gzip -9 linux.bin
-				mv -f "linux.bin${linux_suffix}" linux.bin
-			fi
+			uboot_prep_kimage
 
 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
-- 
2.0.1


