Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2AA6072C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 22:13:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2015 14:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,310,1444719600"; d="scan'208";a="853305482"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.105])
	by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2015 14:13:30 -0800
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 16:13:16 -0600
Message-Id: <e91e58de8406b919ad5d579c69c50f21a879f43b.1447797811.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH 4/4] packagegroup-core-boot:replace busybox to variable
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
X-List-Received-Date: Tue, 17 Nov 2015 22:13:30 -0000

It replaces the use of busybox as hardcoded dependency to more dynamic
this wouldn't affect the way that the system is build only it let a more
flexible replacement in the core.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 09f5373..bac93b8 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -24,7 +24,7 @@ VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
-SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
+SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', '${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
                     modutils-initscripts \
                     init-ifupdown \
                     ${VIRTUAL-RUNTIME_initscripts} \
@@ -33,7 +33,7 @@ SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwc
 RDEPENDS_${PN} = "\
     base-files \
     base-passwd \
-    busybox \
+    ${VIRTUAL-RUNTIME_base-utils} \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     netbase \
-- 
2.1.0


