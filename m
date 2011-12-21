Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RdHcv-000777-Tf
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 09:34:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 00:27:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88828064"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 00:27:11 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 16:18:06 +0800
Message-Id: <d03aa0ef5ab991c5f7865a5402d69373ceb19879.1324454963.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324454963.git.edwin.zhai@intel.com>
References: <cover.1324454963.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1324454963.git.edwin.zhai@intel.com>
References: <cover.1324454963.git.edwin.zhai@intel.com>
Subject: [PATCH 2/4] Add mini X core tasks
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
X-List-Received-Date: Wed, 21 Dec 2011 08:34:18 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/classes/core-image.bbclass               |    2 +
 meta/recipes-sato/tasks/task-core-x11-mini.bb |   45 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-sato/tasks/task-core-x11-mini.bb

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 8e83d4a..c08895f 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # Available IMAGE_FEATURES:
 #
 # - apps-console-core
+# - x11-mini            - minimal environment for X11 server 
 # - x11-base            - X11 server + minimal desktop	
 # - x11-sato            - OpenedHand Sato environment
 # - x11-netbook         - Metacity based environment for netbooks
@@ -29,6 +30,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - debug-tweaks        - makes an image suitable for development
 #
 PACKAGE_GROUP_apps-console-core = "task-core-apps-console"
+PACKAGE_GROUP_x11-mini = "task-core-x11-mini"
 PACKAGE_GROUP_x11-base = "task-core-x11-base"
 PACKAGE_GROUP_x11-sato = "task-core-x11-sato"
 PACKAGE_GROUP_x11-netbook = "task-core-x11-netbook"
diff --git a/meta/recipes-sato/tasks/task-core-x11-mini.bb b/meta/recipes-sato/tasks/task-core-x11-mini.bb
new file mode 100644
index 0000000..35779d9
--- /dev/null
+++ b/meta/recipes-sato/tasks/task-core-x11-mini.bb
@@ -0,0 +1,45 @@
+#
+# Copyright (C) 2011 Intel Corporation
+#
+
+DESCRIPTION = "Tasks for core X11 applications"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+PACKAGES = "\
+    task-core-x11-mini \
+    task-core-x11-mini-dbg \
+    task-core-x11-mini-dev \
+    "
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+XSERVER ?= "xserver-kdrive-fbdev"
+
+ALLOW_EMPTY = "1"
+
+ROOTLESS_X = "1"
+
+# xserver-common, x11-common
+VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
+
+# elsa, xserver-nodm-init
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
+
+
+RDEPENDS_task-core-x11-mini = "\
+    dbus \
+    pointercal \
+    matchbox-terminal \
+    matchbox-wm \
+    minix-session \
+    ${XSERVER} \
+    ${VIRTUAL-RUNTIME_xserver_common} \
+    ${VIRTUAL-RUNTIME_graphical_init_manager} \
+    liberation-fonts \
+    xauth \
+    xhost \
+    xset \
+    xrandr"
-- 
1.7.1



