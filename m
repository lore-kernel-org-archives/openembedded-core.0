Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F33646D64B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 01:59:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAU1wkI8001943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 17:58:57 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 17:58:36 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2018 20:58:22 -0500
Message-ID: <3fa72e2dcc40d2f20f8f4350d0a5817f90aca805.1543542953.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1543542953.git.kai.kang@windriver.com>
References: <cover.1543542953.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] u-boot-tools: fix compile error
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
X-List-Received-Date: Fri, 30 Nov 2018 01:59:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It uses sandbox_defconfig to produce u-boot tools. But EFI is only
supported by arm and x86, then it fails to run task do_compile on other
arches:

| include/config_distro_bootcmd.h:267:3: error: #error "sandbox EFI
| support is only supported on ARM and x86"

Only enable EFI support for u-boot-tools on x86 and arm to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
index 127c4c15d1..7893d2aebc 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
@@ -17,13 +17,20 @@ EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
+SED_CONFIG_EFI = '-e "s/CONFIG_EFI_LOADER=.*/# CONFIG_EFI_LOADER is not set/"'
+SED_CONFIG_EFI_x86 = ''
+SED_CONFIG_EFI_x86-64 = ''
+SED_CONFIG_EFI_arm = ''
+SED_CONFIG_EFI_armeb = ''
+SED_CONFIG_EFI_aarch64 = ''
+
 do_compile () {
 	oe_runmake sandbox_defconfig
 
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
 	# generating it requires bin2header tool, which for target build
 	# is built with target tools and thus cannot be executed on host.
-	sed -i "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" .config
+	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} .config
 
 	oe_runmake cross_tools NO_SDL=1
 }
-- 
2.19.0.rc2


