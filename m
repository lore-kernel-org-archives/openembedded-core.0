Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D17DC76BD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 21:09:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2015 14:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,554,1437462000"; d="scan'208";a="564474596"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2015 14:09:11 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 16:09:03 -0500
Message-Id: <f2dfcd6a4e07c2b29f442e4194dd5fc6cfd56208.1442610201.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
References: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
References: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH V2 3/3] packagegroup-core-boot:change to virtual reference
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
X-List-Received-Date: Fri, 18 Sep 2015 21:09:14 -0000

This recipe have a hardcoded dependency to busybox, in order to be able to have a flexible selection,
instead of the hardcoded dependency,now is point to virtual reference base-utils.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 09f5373..38f29ce 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -19,12 +19,12 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
-VIRTUAL-RUNTIME_login_manager ?= "busybox"
+VIRTUAL-RUNTIME_login_manager ?= "${VIRTUAL-RUNTIME_base-utils}"
 VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
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


