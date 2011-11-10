Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOG-0005aX-OW
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351207"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:54 -0800
Message-Id: <b7a17670795d9b0f95a2298be9f6ac1b0cf4083a.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 12/33] task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow distributions to use different set of initscripts or no initscripts at all
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Nov 2011 07:49:43 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb   |    6 +++++-
 meta/recipes-core/tasks/task-core-boot.bb |    6 ++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 23a3051..4fe7987 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -1,7 +1,11 @@
 SUMMARY = "Keyboard maps"
 DESCRIPTION = "Keymaps and initscript to set the keymap on bootup."
 SECTION = "base"
-RDEPENDS_${PN} = "initscripts console-tools"
+
+# Distro can override initscripts provider
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} console-tools"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 9e63ebb..05c280d 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
 ALLOW_EMPTY = "1"
-PR = "r8"
+PR = "r9"
 
 #
 # Set by the machine configuration with packages essential for device bootup
@@ -23,6 +23,8 @@ VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
 # Distro can override init_manager provider
 VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
+# Distro can override initscripts provider
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 
 PACKAGES = "\
     task-core-boot \
@@ -34,7 +36,7 @@ RDEPENDS_task-core-boot = "\
     base-files \
     base-passwd \
     busybox \
-    initscripts \
+    ${VIRTUAL-RUNTIME_initscripts} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
-- 
1.7.6.4



