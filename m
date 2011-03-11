Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PxrzV-0006tg-84
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 03:22:09 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Mar 2011 18:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,300,1297065600"; d="scan'208";a="611596217"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2011 18:20:30 -0800
Message-Id: <e45b1dc124481012f097194421cc81de65def8d5.1299809859.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Old-Date: Fri, 4 Mar 2011 14:03:02 -0800
Date: Thu, 10 Mar 2011 18:20:28 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 06/12] task-base, task-poky-basic, task-poky: Remove hard-coded references to dropbear
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
X-List-Received-Date: Fri, 11 Mar 2011 02:22:09 -0000

From: Scott Garman <scott.a.garman@intel.com>

This is the first step in refactoring the SSH server selection to
be done in IMAGE_FEATURES instead of as hardcoded in these tasks.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/tasks/task-base.bb           |    8 +-------
 meta/recipes-extended/tasks/task-poky-basic.bb |    3 +--
 meta/recipes-sato/tasks/task-poky.bb           |    3 +--
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index d613bb2..138e617 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r69"
+PR = "r70"
 
 inherit task
 
@@ -60,11 +60,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24",  "linux-hotplug","",d)} "
 
 #
-# dropbear, openssh or none
-#
-DISTRO_SSH_DAEMON ?= "dropbear"
-
-#
 # pcmciautils for >= 2.6.13-rc1, pcmcia-cs for others
 #
 PCMCIA_MANAGER ?= "${@base_contains('MACHINE_FEATURES', 'kernel26','pcmciautils','pcmcia-cs',d)} "
@@ -81,7 +76,6 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 RDEPENDS_task-base = "\
     task-distro-base \
     task-machine-base \
-    ${DISTRO_SSH_DAEMON} \
     ${HOTPLUG} \
     \
     ${@base_contains('MACHINE_FEATURES', 'kernel26','task-base-kernel26','task-base-kernel24',d)} \
diff --git a/meta/recipes-extended/tasks/task-poky-basic.bb b/meta/recipes-extended/tasks/task-poky-basic.bb
index d7beafe..3d313f0 100644
--- a/meta/recipes-extended/tasks/task-poky-basic.bb
+++ b/meta/recipes-extended/tasks/task-poky-basic.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r2"
+PR = "r3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -55,7 +55,6 @@ RDEPENDS_task-poky-basic = "\
 
 RDEPENDS_task-poky-base-utils = "\
     busybox \
-    dropbear \
     "
 
 RDEPENDS_task-poky-basic-libs = "\
diff --git a/meta/recipes-sato/tasks/task-poky.bb b/meta/recipes-sato/tasks/task-poky.bb
index cfcbacb..72d4d0d 100644
--- a/meta/recipes-sato/tasks/task-poky.bb
+++ b/meta/recipes-sato/tasks/task-poky.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tasks for OpenedHand Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r33"
+PR = "r34"
 
 PACKAGES = "\
     task-poky-apps-console \
@@ -37,7 +37,6 @@ FILEMANAGER_mips ?= ""
 
 RDEPENDS_task-poky-apps-console = "\
     avahi-daemon \
-    dropbear \
     dbus \
     portmap \
     ${SPLASH}"
-- 
1.7.1.1



