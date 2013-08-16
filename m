Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ye0-f173.google.com (mail-ye0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 27DF86B2CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 18:34:50 +0000 (UTC)
Received: by mail-ye0-f173.google.com with SMTP id g12so361375yee.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=1WMgvPflZAPbHNrnIYUlFScgqPUJ50xc+otaGCARpkE=;
	b=m3SdI2vSjXA9wODNvHiEnkP4/cFBf5+k6m8z+0TdVo/N+ANtEXhFpr0OzxgQ2thW3a
	TqzM6qj/HVfGD2cMGB4XF8nK9OB9/A/2cvF2vho4Lp/FwBGDaxR/c4i9bpv3erR/Dw3U
	bEyokfPzbvmVy0JIo1nM5/F0n/20x4YmmfeXmpZbdAJISVEjJQ9Ri0vVT8WalG0um7CZ
	E0wHdjiy0HUgKKW5BvhUpuc56OypNvUI8sA9eds4GTByEnc0btsWzdmqmYSeBgI1Du88
	PsqT9Zp/tpf5+SHPachiyZPCLnBZUO/3hIFzBSq5W48dIIyseNFTi36ugr3LAAPTmsWC
	gGWQ==
X-Received: by 10.236.138.194 with SMTP id a42mr2611186yhj.58.1376678091234;
	Fri, 16 Aug 2013 11:34:51 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id r68sm3148857yhg.19.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 16 Aug 2013 11:34:50 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 15:34:28 -0300
Message-Id: <1376678068-31668-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-dtb.inc: Fix dtb generation for kernels newer than 3.8
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
X-List-Received-Date: Fri, 16 Aug 2013 18:34:51 -0000

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
---
 meta/recipes-kernel/linux/linux-dtb.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index cebc76a..6b8f1a5 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -15,8 +15,12 @@ do_install_append() {
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
@@ -31,8 +35,12 @@ do_deploy_append() {
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
1.8.4.rc1


