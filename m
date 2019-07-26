Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 63B8B7D69D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 07:40:57 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45w1Gf3TM0z1rTYK;
	Fri, 26 Jul 2019 09:40:58 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45w1Gf329bz1qqkS;
	Fri, 26 Jul 2019 09:40:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id eV67_ON7BRbf; Fri, 26 Jul 2019 09:40:57 +0200 (CEST)
X-Auth-Info: AlcG4AQA5lN6Ie8lEx7/yjAdk1CgAm5fHE+nkQ/zrbg=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
	[85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 26 Jul 2019 09:40:57 +0200 (CEST)
From: Lukasz Majewski <lukma@denx.de>
To: akuster808 <akuster808@gmail.com>
Date: Fri, 26 Jul 2019 09:40:39 +0200
Message-Id: <20190726074039.26753-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Subject: [PATCH v2] u-boot: Generate default U-Boot environment images
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
X-List-Received-Date: Fri, 26 Jul 2019 07:40:58 -0000

This change provides tasks to generate default U-Boot environment images
from built U-Boot (via. get_default_envs.sh script).

Those images then can be used to generate wic images (with e.g. eMMC layout).
With such approach the end user doesn't see the "CRC environment" error
after the first boot.

Moreover, those are built per MACHINE (as u-boot itself is) so then could
be used in SWUpdate scenarios with single tar'ed archive with multiple
MACHINE specific *.swu images.

The UBOOT_ENVS_SIZE must be defined in machine specific conf file as well
as it is also possible to adjust (optionally) the *_ENVS_* variables.

Test:
Newest master-next for poky repo - SHA1: eb5b0a0b5e53a6e55a09e66489d3f24d0c6232ee
MACHINE = "beaglebone-yocto" in local.conf
bitbake virtual/bootloader


As a result following links are available in deploy directory:
u-boot-env.img{_r}.

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v2:

- Move the content of deploy_default_envs task to do_deploy
- Move the content of gen_default_envs task to do_compile
- Create the u-boot-env.img{r} conditionally, only when UBOOT_ENVS_SIZE is
  defined
- Change the commit title to reflect changes done for v2
---
 meta/recipes-bsp/u-boot/u-boot.inc | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 9a754fd09b..7ede2da0eb 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -68,6 +68,13 @@ UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
 UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
 UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
 
+# U-Boot variables necessary for extracting default envs from build U-Boot
+DEFAULT_UBOOT_ENVS_FILE ?= "u-boot-env"
+DEFAULT_ENVS ?= "${DEFAULT_UBOOT_ENVS_FILE}.txt"
+UBOOT_ENVS_DEFAULT ?= "${DEFAULT_UBOOT_ENVS_FILE}-${MACHINE}-${PV}-${PR}.img"
+# The UBOOT_ENVS_SIZE needs to defined in the <machine>.conf file
+# UBOOT_ENVS_SIZE = "65536"
+
 # returns all the elements from the src uri that are .cfg files
 def find_cfgs(d):
     sources=src_patches(d, True)
@@ -132,6 +139,19 @@ do_compile () {
         oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
     fi
 
+    # Generate default environment
+    if [ -n "${UBOOT_ENVS_SIZE}" ]
+    then
+        ${B}/source/scripts/get_default_envs.sh ${B} > ${B}/${DEFAULT_ENVS}
+
+        # Generate env image
+        ${B}/tools/mkenvimage -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}
+
+        # Generate redundant env image
+        ${B}/tools/mkenvimage -r -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}
+
+        rm ${B}/${DEFAULT_ENVS}
+    fi
 }
 
 do_install () {
@@ -328,6 +348,20 @@ do_deploy () {
         ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
         ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
     fi
+
+    if [ -n "${UBOOT_ENVS_SIZE}" ]
+    then
+        install -d ${DEPLOYDIR}
+        install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
+        install ${B}/${UBOOT_ENVS_DEFAULT}_r ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r
+
+        cd ${DEPLOYDIR}
+        ln -sf ${UBOOT_ENVS_DEFAULT} ${DEFAULT_UBOOT_ENVS_FILE}.img
+        ln -sf ${UBOOT_ENVS_DEFAULT}_r ${DEFAULT_UBOOT_ENVS_FILE}.img_r
+
+        rm ${B}/${UBOOT_ENVS_DEFAULT}
+        rm ${B}/${UBOOT_ENVS_DEFAULT}_r
+    fi
 }
 
 addtask deploy before do_build after do_compile
-- 
2.11.0


