Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC78177E88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 13:25:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 07 Jun 2017 06:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="271298589"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2017 06:25:13 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CFD585800C1;
	Wed,  7 Jun 2017 06:25:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 16:24:16 +0300
Message-Id: <1496841856-27399-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <20170607123145.1043.50092@do.openembedded.org>
References: <20170607123145.1043.50092@do.openembedded.org>
Subject: [PATCH v4] u-boot: enable dhcp for MPC8315 board
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
X-List-Received-Date: Wed, 07 Jun 2017 13:25:13 -0000

Getting ip address from DHCP server is much more convenient
than setting static ip. It allows to configure u-boot in
more generic way and to avoid hardcoding static ip in
u-boot configuration.

Enabled dhcp client functionality for Yocto reference
hardware MPC8315E-RDB.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../u-boot/files/MPC8315ERDB-enable-DHCP.patch        | 19 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc     |  4 +++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch

diff --git a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
new file mode 100644
index 0000000..cea52b7
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
@@ -0,0 +1,19 @@
+Enabled dhcp client functionality for Yocto reference
+hardware MPC8315E-RDB.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
+
+diff --git a/configs/MPC8315ERDB_defconfig b/configs/MPC8315ERDB_defconfig
+index 4e2b705..b02ab1f 100644
+--- a/configs/MPC8315ERDB_defconfig
++++ b/configs/MPC8315ERDB_defconfig
+@@ -9,6 +9,7 @@ CONFIG_HUSH_PARSER=y
+ CONFIG_CMD_I2C=y
+ CONFIG_CMD_USB=y
+ # CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=y
+ CONFIG_CMD_MII=y
+ CONFIG_CMD_PING=y
+ CONFIG_CMD_EXT2=y
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
index df24c85..8ee1c32 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
@@ -9,6 +9,8 @@ PE = "1"
 # repo during parse
 SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
 
-SRC_URI = "git://git.denx.de/u-boot.git"
+SRC_URI = "git://git.denx.de/u-boot.git \
+    file://MPC8315ERDB-enable-DHCP.patch \
+"
 
 S = "${WORKDIR}/git"
-- 
2.1.4


