Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Rg3C3-0006PG-0Y
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 00:45:59 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Dec 2011 15:38:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90362029"
Received: from unknown (HELO localhost) ([10.255.13.53])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2011 15:38:45 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	koen@dominion.thruhere.net, kergoth@gmail.com, martin.jansa@gmail.com,
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 28 Dec 2011 15:38:12 -0800
Message-Id: <2e4df880d9ebd67eef3fbea0f9f50bdf05a65459.1325115066.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325115066.git.dvhart@linux.intel.com>
References: <cover.1325115066.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1325115066.git.dvhart@linux.intel.com>
References: <cover.1325115066.git.dvhart@linux.intel.com>
Subject: [PATCH 4/4] task-core-boot: Allow DISTRO to disable keymaps via VIRTUAL-RUNTIME_keymaps
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
X-List-Received-Date: Wed, 28 Dec 2011 23:45:59 -0000

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



