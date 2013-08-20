Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id C87816B7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:20:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KGKV2N023299;
	Tue, 20 Aug 2013 11:20:31 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KGKUS1032299;
	Tue, 20 Aug 2013 11:20:31 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 11:20:30 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KGKLvL006373;
	Tue, 20 Aug 2013 11:20:28 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:51:28 -0500
Message-ID: <1377017488-32708-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377017488-32708-1-git-send-email-fcooper@ti.com>
References: <1377017488-32708-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [for dylan][PATCH 3/3] linux-dtb.inc: Fix dtb generation for kernels newer than 3.8
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
X-List-Received-Date: Tue, 20 Aug 2013 16:20:31 -0000
Content-Type: text/plain

From: Otavio Salvador <otavio@ossystems.com.br>

The 3.8 kernel has change the default directory where the dtb file is
stored. The change has been done at:

,----[ Quote of 3.8 kernel change ]
| commit 499cd8298628eeabf0eb5eb6525d4faa0eec80d8
| Author: Grant Likely <grant.likely@secretlab.ca>
| Date:   Tue Nov 27 16:29:11 2012 -0700
|
|     ARM: dt: change .dtb build rules to build in dts directory
|
|     The current rules have the .dtb files build in a different directory
|     from the .dts files. The only reason for this is that it was what
|     PowerPC has done historically. This patch changes ARM to use the generic
|     dtb rule which builds .dtb files in the same directory as the source .dts.
|
|     Cc: Russell King <linux@arm.linux.org.uk>
|     Cc: Arnd Bergmann <arnd@arndb.de>
|     Acked-by: Olof Johansson <olof@lixom.net>
|     Cc: linux-arm-kernel@lists.infradead.org
|     Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
|     [swarren: added rm command for old stale .dtb files]
|     Signed-off-by: Stephen Warren <swarren@nvidia.com>
|     Signed-off-by: Rob Herring <rob.herring@calxeda.com>
`----

This change adds support for both places to backward and forward
compatibility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7c8058f..258a5fc 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -16,8 +16,12 @@ do_install_append() {
 			DTB_BASE_NAME=`basename ${DTB} .dtb`
 			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
 			oe_runmake ${DTB}
-			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+			if [ ! -e "${DTB_PATH}" ]; then
+				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+			fi
+			install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
 		done
 	fi
 }
@@ -32,8 +36,12 @@ do_deploy_append() {
 			DTB_BASE_NAME=`basename ${DTB} .dtb`
 			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
+			if [ ! -e "${DTB_PATH}" ]; then
+				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+			fi
 			install -d ${DEPLOYDIR}
-			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${DEPLOYDIR}/${DTB_NAME}.dtb
+			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
 			cd ${DEPLOYDIR}
 			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
 			cd -
-- 
1.7.0.4


