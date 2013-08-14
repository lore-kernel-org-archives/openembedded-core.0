Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC3E6007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 15:03:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7EF3C5I019721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 10:03:12 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7EF3BNU028452
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 10:03:11 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 14 Aug 2013 10:03:11 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7EF3682030298;
	Wed, 14 Aug 2013 10:03:10 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 10:32:18 -0500
Message-ID: <1376494338-11646-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1376494338-11646-1-git-send-email-fcooper@ti.com>
References: <1376494338-11646-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] linux-dtb.inc: Run dts through the preprocessor
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
X-List-Received-Date: Wed, 14 Aug 2013 15:03:11 -0000
Content-Type: text/plain

* In the 3.11 kernel some dts files now include C code that must first run
  through the preprocessor.
* Update building the dtb by first running the dts file through the user's
  compiler before building using the device tree compiler.
* The logic used is based on mainline u-boot dts/Makefile.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 41dd599..f1aafa2 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -21,7 +21,10 @@ do_install_append() {
 			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
 			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
+
+			cat ${DTS_FILE} | \
+				${CPP} -x assembler-with-cpp -I ./include/ -I ./arch/${ARCH}/boot/dts - | \
+				dtc ${KERNEL_DEVICETREE_FLAGS} -O dtb -o ${DTS_BASE_NAME} -i arch/${ARCH}/boot/dts/ -
 			install -m 0644 ${DTS_BASE_NAME} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
 		done
 	fi
-- 
1.7.0.4


