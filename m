Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrF-0004fO-Kv
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752220"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:41 -0800
Message-Id: <fd2a93f1d8ed45692e24c72562c5b6c6535f4e40.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 055/113] task-core-boot: Allow DISTRO to disable keymaps via VIRTUAL-RUNTIME_keymaps
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:27 -0000

From: Darren Hart <dvhart@linux.intel.com>

keymaps pulls in gettext, which can't build without wide character support.

Rather than have to add a -tiny variant of every MACHINE to drop "keyboard" from
the MACHINE_FEATURES, just enable the DISTRO to define what gets added to
RDEPENDS_task-core-boot when MACHINE_FEATURES includes keyboard via the
VIRTUAL-RUNTIME_keymaps variable. By default, keep "keymaps".

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-core/tasks/task-core-boot.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 05c280d..6487436 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -17,14 +17,12 @@ PR = "r9"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
-# Distro can override dev_manager provider
+# Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
-# Distro can override login_manager provider
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
-# Distro can override init_manager provider
 VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
-# Distro can override initscripts provider
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 PACKAGES = "\
     task-core-boot \
@@ -37,7 +35,7 @@ RDEPENDS_task-core-boot = "\
     base-passwd \
     busybox \
     ${VIRTUAL-RUNTIME_initscripts} \
-    ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
+    ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     modutils-initscripts \
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
-- 
1.7.6.4



