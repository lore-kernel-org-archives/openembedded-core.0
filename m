Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE20787ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 17:45:21 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3zNSsG57rBz1rLFQ;
	Fri, 19 Jan 2018 18:45:22 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3zNSsG4jghz1qql3;
	Fri, 19 Jan 2018 18:45:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id xuGGjs4ZyQTP; Fri, 19 Jan 2018 18:45:18 +0100 (CET)
X-Auth-Info: ndeXF8VDx6dK4+hDX2Fi7B1fQvEkxTKVbyDVU/zHhCk=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 Jan 2018 18:45:18 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 18:45:02 +0100
Message-Id: <20180119174502.4010-1-marex@denx.de>
X-Mailer: git-send-email 2.15.1
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2018.01 release
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
X-List-Received-Date: Fri, 19 Jan 2018 17:45:22 -0000

This upgrades the U-Boot from 2017.11 to 2018.01 release
and drops patches accepted upstream.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../u-boot/files/10m50-update-device-tree.patch    | 28 ---------------
 .../u-boot/files/v2017.11-fw-utils-build-fix.patch | 41 ----------------------
 ...ommon_2017.11.inc => u-boot-common_2018.01.inc} |  4 +--
 ...utils_2017.11.bb => u-boot-fw-utils_2018.01.bb} |  0
 ...kimage_2017.11.bb => u-boot-mkimage_2018.01.bb} |  0
 .../{u-boot_2017.11.bb => u-boot_2018.01.bb}       |  0
 6 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.11.inc => u-boot-common_2018.01.inc} (72%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.11.bb => u-boot-fw-utils_2018.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.11.bb => u-boot-mkimage_2018.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.11.bb => u-boot_2018.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch b/meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch
deleted file mode 100644
index 841953cd10..0000000000
--- a/meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Nios II for MAX10 10m50 board requires update to 
-its device tree to enable CPU driver during
-u-boot pre-relocation. This patch tag the CPU 
-with dm-pre-reloc flag.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Gan, Yau Wai <yau.wai.gan@intel.com>
-
----
- arch/nios2/dts/10m50_devboard.dts | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/nios2/dts/10m50_devboard.dts b/arch/nios2/dts/10m50_devboard.dts
-index 05eac30..461ae68 100644
---- a/arch/nios2/dts/10m50_devboard.dts
-+++ b/arch/nios2/dts/10m50_devboard.dts
-@@ -19,6 +19,7 @@
- 		#size-cells = <0>;
- 
- 		cpu: cpu@0 {
-+			u-boot,dm-pre-reloc;
- 			device_type = "cpu";
- 			compatible = "altr,nios2-1.1";
- 			reg = <0x00000000>;
--- 
-2.7.4
-
diff --git a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
deleted file mode 100644
index bd6e4a572f..0000000000
--- a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ded84f90a1066eef5f34daa4539273de64f7b811 Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan.agner@toradex.com>
-Date: Tue, 14 Nov 2017 15:47:18 +0100
-Subject: [PATCH 1/1] envtools: make sure version/timestamp header file are
- available
-
-With commit 84d46e7e8948 ("tools: env: allow to print U-Boot version")
-the fw_env utilities need the version.h header file. Building only
-the envtools in a pristine build directory will fail due to missing
-header files.
-
-Make sure the header files are a dependency of the envtools target.
-
-Fixes: 84d46e7e8948 ("tools: env: allow to print U-Boot version")
-Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
-Tested-by: Peter Robinson <pbrobinson@gmail.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-
-Upstream-Status: Backport [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
-
-Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 61fd973..f8c66a2 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1447,7 +1447,7 @@ checkarmreloc: u-boot
- 		false; \
- 	fi
- 
--envtools: scripts_basic
-+envtools: scripts_basic $(version_h) $(timestamp_h)
- 	$(Q)$(MAKE) $(build)=tools/env
- 
- tools-only: scripts_basic $(version_h) $(timestamp_h)
--- 
-2.7.4
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
similarity index 72%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
index 65f1228043..d2073ea0c7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
@@ -7,12 +7,10 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
+SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
-    file://10m50-update-device-tree.patch \
-    file://v2017.11-fw-utils-build-fix.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.11.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.11.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.11.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.11.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.11.bb b/meta/recipes-bsp/u-boot/u-boot_2018.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.11.bb
rename to meta/recipes-bsp/u-boot/u-boot_2018.01.bb
-- 
2.15.1


