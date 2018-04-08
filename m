Return-Path: <marex@denx.de>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 08 Apr 2018 23:10:02 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6582A71CBD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2018 23:10:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40K88g170Pz1qtxB;
	Mon,  9 Apr 2018 01:02:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40K88g0lzbz1qqkH;
	Mon,  9 Apr 2018 01:02:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id cNiQCEyMdFUI; Mon,  9 Apr 2018 01:02:25 +0200 (CEST)
X-Auth-Info: Gw9/Lh3LhGmG0ityCM8V7SM65T43/YyCYrsLI+7TC/I=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  9 Apr 2018 01:02:25 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 01:02:23 +0200
Message-Id: <20180408230223.17260-1-marex@denx.de>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Sun, 08 Apr 2018 23:10:02 -0000

This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
patches accepted upstream, getting the patch count to zero.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../u-boot/files/MPC8315ERDB-enable-DHCP.patch        | 19 -------------------
 ...t-common_2018.01.inc => u-boot-common_2018.03.inc} |  6 ++----
 ...fw-utils_2018.01.bb => u-boot-fw-utils_2018.03.bb} |  0
 ...t-mkimage_2018.01.bb => u-boot-mkimage_2018.03.bb} |  0
 .../u-boot/{u-boot_2018.01.bb => u-boot_2018.03.bb}   |  0
 5 files changed, 2 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
 rename meta/recipes-bsp/u-boot/{u-boot-common_2018.01.inc => u-boot-common_2018.03.inc} (68%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.01.bb => u-boot-fw-utils_2018.03.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.01.bb => u-boot-mkimage_2018.03.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2018.01.bb => u-boot_2018.03.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
deleted file mode 100644
index ecaa1796a4..0000000000
--- a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Enabled dhcp client functionality for Yocto reference
-hardware MPC8315E-RDB.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
-
-Index: git/configs/MPC8315ERDB_defconfig
-===================================================================
---- git.orig/configs/MPC8315ERDB_defconfig
-+++ git/configs/MPC8315ERDB_defconfig
-@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=y
- CONFIG_CMD_SATA=y
- CONFIG_CMD_USB=y
- # CONFIG_CMD_SETEXPR is not set
-+CONFIG_CMD_DHCP=y
- CONFIG_CMD_MII=y
- CONFIG_CMD_PING=y
- CONFIG_CMD_DATE=y
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
similarity index 68%
rename from meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
index d2073ea0c7..8ffae365a9 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
@@ -7,10 +7,8 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
+SRCREV = "f95ab1fb6e37f0601f397091bb011edf7a98b890"
 
-SRC_URI = "git://git.denx.de/u-boot.git \
-    file://MPC8315ERDB-enable-DHCP.patch \
-"
+SRC_URI = "git://git.denx.de/u-boot.git"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.01.bb b/meta/recipes-bsp/u-boot/u-boot_2018.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2018.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2018.03.bb
-- 
2.16.2


