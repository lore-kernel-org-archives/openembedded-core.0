Return-Path: <lukma@denx.de>
X-Greylist: delayed 443 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Jul 2019 14:28:02 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5C27E71F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 14:28:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45jkxg6PQrz1rrW9;
	Tue,  9 Jul 2019 16:20:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45jkxg66qkz1qql5;
	Tue,  9 Jul 2019 16:20:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 4fFMcl7KaaMa; Tue,  9 Jul 2019 16:20:38 +0200 (CEST)
X-Auth-Info: /ob6DcNfuPit+Ob/EaNTUgULJC2GMXCuQ6Cpcq3di6I=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
	[85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  9 Jul 2019 16:20:38 +0200 (CEST)
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>,
	openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 16:20:28 +0200
Message-Id: <20190709142028.16845-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] u-boot: Provide tasks to generate default U-Boot environment(s) images
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
X-List-Received-Date: Tue, 09 Jul 2019 14:28:03 -0000

This change provides tasks to generate default U-Boot environment images
from built U-Boot (via. get_default_envs.sh script).

Those images then can be used to generate wic images (with e.g. eMMC layout).
With such approach the end user doesn't see the "CRC environment" error
after the first boot.

Moreover, those are built per MACHINE (as u-boot itself is) so then could
be used in SWUpdate scenarios with single tar'ed archive with multiple
MACHINE specific *.swu images.

It is also possible to adjust the *_ENVS_* variables in machine specific
conf file.

Test:
Newest master-next for poky repo - SHA1: eb5b0a0b5e53a6e55a09e66489d3f24d0c6232ee
MACHINE = "beaglebone-yocto" in local.conf
bitbake virtual/bootloader


As a result following links are available in deploy directory:
u-boot-env.img{_r}.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 9a754fd09b..e0ccf1ce1f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -331,3 +331,44 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_compile
+
+# Extract default envs from build U-Boot
+DEFAULT_UBOOT_ENVS_FILE ?= "u-boot-env"
+DEFAULT_ENVS ?= "${DEFAULT_UBOOT_ENVS_FILE}.txt"
+UBOOT_ENVS_DEFAULT ?= "${DEFAULT_UBOOT_ENVS_FILE}-${MACHINE}-${PV}-${PR}.img"
+UBOOT_ENVS_SIZE ?= "65536"
+
+# Generate default environment
+do_gen_default_envs[doc] = "Generate image with default U-Boot environment(s)"
+do_gen_default_envs () {
+    ${B}/source/scripts/get_default_envs.sh ${B} > ${B}/${DEFAULT_ENVS}
+
+    # Generate env image
+    ${B}/tools/mkenvimage -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}
+
+    # Generate redundant env image
+    ${B}/tools/mkenvimage -r -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}
+
+    rm ${B}/${DEFAULT_ENVS}
+}
+
+addtask gen_default_envs before do_deploy after do_compile
+
+# Deploy default environment
+do_deploy_default_envs[doc] = "Copy images with default U-Boot environment to deployment directory"
+do_deploy_default_envs () {
+
+     install -d ${DEPLOYDIR}
+
+     install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
+     install ${B}/${UBOOT_ENVS_DEFAULT}_r ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r
+
+     cd ${DEPLOYDIR}
+     ln -sf ${UBOOT_ENVS_DEFAULT} ${DEFAULT_UBOOT_ENVS_FILE}.img
+     ln -sf ${UBOOT_ENVS_DEFAULT}_r ${DEFAULT_UBOOT_ENVS_FILE}.img_r
+
+     rm ${B}/${UBOOT_ENVS_DEFAULT}
+     rm ${B}/${UBOOT_ENVS_DEFAULT}_r
+}
+
+addtask deploy_default_envs before do_deploy after do_gen_default_envs
-- 
2.11.0


