Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 08B2673D1B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 14:13:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Apr 2015 07:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,517,1422950400"; d="scan'208";a="702887954"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2015 07:13:27 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Apr 2015 17:13:14 +0300
Message-Id: <90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1428070227.git.cristian.iorga@intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1428070227.git.cristian.iorga@intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
Subject: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Fri, 03 Apr 2015 14:13:35 -0000

For a distro that contains bluetooth feature, set bluez5
as the default Bluetooth stack, while still allowing the
use of bluez4 as an alternative Bluetooth stack.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/classes/bluetooth.bbclass | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/bluetooth.bbclass b/meta/classes/bluetooth.bbclass
index f88b4ae..3816e7d 100644
--- a/meta/classes/bluetooth.bbclass
+++ b/meta/classes/bluetooth.bbclass
@@ -1,14 +1,20 @@
 # Avoid code duplication in bluetooth-dependent recipes.
 
-# Define a variable that expands to the recipe (package) providing core
-# bluetooth support on the platform:
+# Define a variable that expands to the recipe (package) providing
+# core bluetooth support on the platform:
 # "" if bluetooth is not in DISTRO_FEATURES
-# else "bluez5" if bluez5 is in DISTRO_FEATURES
-# else "bluez4"
+# else "bluez4" if bluez4 is in DISTRO_FEATURES
+# else "bluez5"
 
 # Use this with:
 #  inherit bluetooth
 #  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
 #  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"
+# if the obsolete, but still supported bluez4 BT stack is used
+# or
+#  inherit bluetooth
+#  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
+#  PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5"
+# if the default bluez5 BT stack is used
 
-BLUEZ ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5', 'bluez4', d), '', d)}"
+BLUEZ ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.utils.contains('DISTRO_FEATURES', 'bluez4', 'bluez4', 'bluez5', d), '', d)}"
-- 
2.1.0


