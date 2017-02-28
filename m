Return-Path: <marex@denx.de>
X-Greylist: delayed 337 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Feb 2017 19:47:01 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2940172F7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 19:47:01 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.6.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3vXpq74Z4lz3hjhG;
	Tue, 28 Feb 2017 20:41:23 +0100 (CET)
X-Auth-Info: ntbRWDqjxIQFEVTxoSdNZDfCaIR9zPXf+XvDf7HhwZ8=
Received: from kurokawa.lan (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3vXpq72fqVzvdWQ;
	Tue, 28 Feb 2017 20:41:23 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 20:41:10 +0100
Message-Id: <20170228194110.12504-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] u-boot: Fix handling of CMD_LICENSE in u-boot-mkimage
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
X-List-Received-Date: Tue, 28 Feb 2017 19:47:02 -0000

Only ever change the CMD_LICENSE in the u-boot config if it is enabled
to prevent corruption of the config file. In case the CMD_LICENSE was
already disabled, the sed substitution inserted another "# " in front
of the CMD_LICENSE which triggered a restart of Kconfig oldconfig and
failed the build.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
index 66edae812f..c110226710 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
@@ -13,7 +13,7 @@ do_compile () {
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
 	# generating it requires bin2header tool, which for target build
 	# is built with target tools and thus cannot be executed on host.
-	sed -i "s/CONFIG_CMD_LICENSE.*/# CONFIG_CMD_LICENSE is not set/" .config
+	sed -i "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" .config
 
 	oe_runmake cross_tools NO_SDL=1
 }
-- 
2.11.0


