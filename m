Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9363C70A41
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 15:26:22 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTYSv3DlGz3hhqp;
	Thu,  7 Aug 2014 17:26:23 +0200 (CEST)
X-Auth-Info: 5B3cRzPghi+6pKSIYycR/EVWyOcKWKnpYhCpD5G/0KI=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hTYSv2LF3z7S6S4; 
	Thu,  7 Aug 2014 17:26:23 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 17:26:14 +0200
Message-Id: <1407425175-2828-5-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1407425175-2828-1-git-send-email-marex@denx.de>
References: <1407425175-2828-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 4/5] Yocto: kernel: Build DTBs early
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

Pull out the compilation of the DTB blobs right after the kernel's
own do_compile function finishes. This makes them available just in
time for the kernel image construction functions.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 6b8f1a5..ee3a5e1 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -5,6 +5,18 @@ python __anonymous () {
     d.appendVar("PACKAGES", " kernel-devicetree")
 }
 
+do_compile_append() {
+	if test -n "${KERNEL_DEVICETREE}"; then
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+			fi
+			oe_runmake ${DTB}
+		done
+	fi
+}
+
 do_install_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTB in ${KERNEL_DEVICETREE}; do
@@ -13,10 +25,8 @@ do_install_append() {
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
 			DTB_BASE_NAME=`basename ${DTB} .dtb`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
-			oe_runmake ${DTB}
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
 			fi
-- 
2.0.1


