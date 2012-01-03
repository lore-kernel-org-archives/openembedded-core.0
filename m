Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr2-0004L2-5l
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752123"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:44 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:18:55 -0800
Message-Id: <fb0cd3470e562f121803b722b16fd10620b79ff5.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 009/113] Add mini X core tasks
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:12 -0000

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
index 0000000..98189fe
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
+    mini-x-session \
+    ${XSERVER} \
+    ${VIRTUAL-RUNTIME_xserver_common} \
+    ${VIRTUAL-RUNTIME_graphical_init_manager} \
+    liberation-fonts \
+    xauth \
+    xhost \
+    xset \
+    xrandr"
-- 
1.7.6.4



