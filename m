Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 96A6573567
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:08:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 05:00:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,594,1418112000"; d="scan'208";a="686780879"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2015 05:08:09 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 15:07:54 +0200
Message-Id: <4b1c009d55f164694181da94caf31f985ba2e10c.1424178303.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
Subject: [PATCH v2 01/11] bluetooth.bbclass: simplify recipe inference of bluetooth provider
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
X-List-Received-Date: Tue, 17 Feb 2015 13:08:39 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

Defines ${BLUEZ} to be the provider of bluez services as specified by
DISTRO_FEATURES.

Example recipe fragment:
  inherit bluetooth
  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
  PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
  PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5"

[YOCTO #5031]

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/classes/bluetooth.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/classes/bluetooth.bbclass

diff --git a/meta/classes/bluetooth.bbclass b/meta/classes/bluetooth.bbclass
new file mode 100644
index 0000000..f88b4ae
--- /dev/null
+++ b/meta/classes/bluetooth.bbclass
@@ -0,0 +1,14 @@
+# Avoid code duplication in bluetooth-dependent recipes.
+
+# Define a variable that expands to the recipe (package) providing core
+# bluetooth support on the platform:
+# "" if bluetooth is not in DISTRO_FEATURES
+# else "bluez5" if bluez5 is in DISTRO_FEATURES
+# else "bluez4"
+
+# Use this with:
+#  inherit bluetooth
+#  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
+#  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"
+
+BLUEZ ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5', 'bluez4', d), '', d)}"
-- 
2.1.0


