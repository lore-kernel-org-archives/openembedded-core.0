Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AEFFD76E04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 16:20:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2015 09:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,548,1437462000"; d="scan'208";a="807393003"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2015 09:20:24 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 11:20:16 -0500
Message-Id: <d6ef7aefeb091eafe59724a74fa59ad0b0ca0b20.1442503745.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <dc1b328b4e41695df96acac6ba73620a535d2ee1.1442503745.git.alejandro.joya.cruz@intel.com>
References: <dc1b328b4e41695df96acac6ba73620a535d2ee1.1442503745.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
References: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH 3/3] packagegroup-core-boot: overwrite hardcoded dependency to virtual reference
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
X-List-Received-Date: Thu, 17 Sep 2015 16:20:24 -0000

This recipe have a hardcoded dependency to busybox, in order to be able to have a flexible selection,
instead of the hardcoded dependency,now is point to virtual reference anybox.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 09f5373..355631f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -19,12 +19,12 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
-VIRTUAL-RUNTIME_login_manager ?= "busybox"
+VIRTUAL-RUNTIME_login_manager ?= "${VIRTUAL-RUNTIME_anybox}"
 VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
-SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
+SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', '${VIRTUAL-RUNTIME_anybox-hwclock}', '', d)} \
                     modutils-initscripts \
                     init-ifupdown \
                     ${VIRTUAL-RUNTIME_initscripts} \
@@ -33,7 +33,7 @@ SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwc
 RDEPENDS_${PN} = "\
     base-files \
     base-passwd \
-    busybox \
+    ${VIRTUAL-RUNTIME_anybox} \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     netbase \
-- 
2.1.0


