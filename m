Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 05EE16066A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 04:45:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2013 21:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,798,1367996400"; d="scan'208";a="379906183"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.203])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2013 21:45:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 21:45:40 -0700
Message-Id: <1375418740-14692-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] packagegroup-core-boot: correct runtime dependencies for non-sysvinit system
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
X-List-Received-Date: Fri, 02 Aug 2013 04:45:41 -0000

[YOCTO #4969]

Signed-off-by: Saul Wold <sgw@linux.intel.com>

core

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index d69c41d..486385a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -30,15 +30,18 @@ VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
+SYSVINIT_SCRIPTS = "${@base_contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
+                    modutils-initscripts \
+                    init-ifupdown \
+                   "
+
 RDEPENDS_${PN} = "\
     base-files \
     base-passwd \
     busybox \
-    ${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "", d)} \
+    ${@base_contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
-    modutils-initscripts \
     netbase \
-    init-ifupdown \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
     ${VIRTUAL-RUNTIME_initscripts} \
-- 
1.8.1.4


