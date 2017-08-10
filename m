Return-Path: <yau.wai.gan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85AB0780F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 07:19:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2017 00:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,351,1498546800"; d="scan'208";a="1181026522"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2017 00:16:28 -0700
From: "Gan, Yau Wai" <yau.wai.gan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 17:06:25 -0700
Message-Id: <1502323585-64342-2-git-send-email-yau.wai.gan@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502323585-64342-1-git-send-email-yau.wai.gan@intel.com>
References: <1502323585-64342-1-git-send-email-yau.wai.gan@intel.com>
Cc: marek.vasut@gmail.com, "Gan, Yau Wai" <yau.wai.gan@intel.com>, Gan
Subject: [PATCH] u-boot: update nios2 device tree for 10m50 board
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
X-List-Received-Date: Thu, 10 Aug 2017 07:19:18 -0000

In order for u-boot to work on Nios II architecture,
the device tree file requires adding pre-relocation
flag to the CPU node.

Patch is tested on 10m50 board. Pass booting up
Linux.

[YOCTO #11628]

Signed-off-by: Gan, Yau Wai <yau.wai.gan@intel.com>
---
 .../u-boot/files/10m50-update-device-tree.patch    | 28 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch

diff --git a/meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch b/meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch
new file mode 100644
index 0000000..841953c
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch
@@ -0,0 +1,28 @@
+Nios II for MAX10 10m50 board requires update to 
+its device tree to enable CPU driver during
+u-boot pre-relocation. This patch tag the CPU 
+with dm-pre-reloc flag.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Gan, Yau Wai <yau.wai.gan@intel.com>
+
+---
+ arch/nios2/dts/10m50_devboard.dts | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/nios2/dts/10m50_devboard.dts b/arch/nios2/dts/10m50_devboard.dts
+index 05eac30..461ae68 100644
+--- a/arch/nios2/dts/10m50_devboard.dts
++++ b/arch/nios2/dts/10m50_devboard.dts
+@@ -19,6 +19,7 @@
+ 		#size-cells = <0>;
+ 
+ 		cpu: cpu@0 {
++			u-boot,dm-pre-reloc;
+ 			device_type = "cpu";
+ 			compatible = "altr,nios2-1.1";
+ 			reg = <0x00000000>;
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
index f27989d..e37f5fd 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
@@ -11,6 +11,7 @@ SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
+    file://10m50-update-device-tree.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


