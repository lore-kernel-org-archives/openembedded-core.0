Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QCRwN-0008AF-Ji
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 09:35:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Apr 2011 00:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,245,1301900400"; d="scan'208";a="735912077"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 20 Apr 2011 00:32:47 -0700
Message-Id: <588c5f7b9237c2869ad77924c20f0bbeade94132.1303284287.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1303284287.git.dexuan.cui@intel.com>
References: <cover.1303284287.git.dexuan.cui@intel.com>
Old-Date: Wed, 20 Apr 2011 10:44:52 +0800
Date: Wed, 20 Apr 2011 15:30:36 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 7/9] task-poky-tools.bb, task-sdk-gmae.inc: enable lttng-ust for ARM
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
X-List-Received-Date: Wed, 20 Apr 2011 07:35:12 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

lttng-ust can build on ARM from 0.12 on.

Fixes [YOCTO #856]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/tasks/task-poky-tools.bb         |    7 ++++---
 meta/recipes-gnome/tasks/task-poky-sdk-gmae.bb     |    2 +-
 .../tasks/task-poky-standalone-gmae-sdk-target.bb  |    2 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    1 +
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/tasks/task-poky-tools.bb b/meta/recipes-core/tasks/task-poky-tools.bb
index f009a75..c5208ad 100644
--- a/meta/recipes-core/tasks/task-poky-tools.bb
+++ b/meta/recipes-core/tasks/task-poky-tools.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tools tasks for Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r8"
+PR = "r9"
 
 PACKAGES = "\
     task-poky-tools-debug \
@@ -57,12 +57,13 @@ RRECOMMENDS_task-poky-tools-profile = "\
 #    exmap-server
 
 # At present we only build lttng-ust on
-# qemux86/qemux86-64/qemuppc/emenlow/atom-pc since upstream liburcu
+# qemux86/qemux86-64/qemuppc/qemuarm/emenlow/atom-pc since upstream liburcu
 # (which is required by lttng-ust) may not build on other platforms, like
-# MIPS and qemu ARMv5te that poky uses now.
+# MIPS.
 RDEPENDS_task-poky-tools-profile_append_qemux86 = " valgrind lttng-ust systemtap"
 RDEPENDS_task-poky-tools-profile_append_qemux86-64 = " lttng-ust systemtap"
 RDEPENDS_task-poky-tools-profile_append_qemuppc = " lttng-ust systemtap"
+RDEPENDS_task-poky-tools-profile_append_qemuarm = " lttng-ust"
 RDEPENDS_task-poky-tools-profile_append_emenlow = " lttng-ust systemtap"
 RDEPENDS_task-poky-tools-profile_append_atom-pc = " lttng-ust systemtap"
 
diff --git a/meta/recipes-gnome/tasks/task-poky-sdk-gmae.bb b/meta/recipes-gnome/tasks/task-poky-sdk-gmae.bb
index d009e4e..64ad96c 100644
--- a/meta/recipes-gnome/tasks/task-poky-sdk-gmae.bb
+++ b/meta/recipes-gnome/tasks/task-poky-sdk-gmae.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OpenedHand
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r10"
+PR = "r11"
 
 ALLOW_EMPTY = "1"
 
diff --git a/meta/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bb
index 7dcad61..2a18e5c 100644
--- a/meta/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OpenedHand
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r12"
+PR = "r13"
 
 ALLOW_EMPTY = "1"
 
diff --git a/meta/recipes-gnome/tasks/task-sdk-gmae.inc b/meta/recipes-gnome/tasks/task-sdk-gmae.inc
index 0ab0b6e..2071089 100644
--- a/meta/recipes-gnome/tasks/task-sdk-gmae.inc
+++ b/meta/recipes-gnome/tasks/task-sdk-gmae.inc
@@ -35,5 +35,6 @@ SDK-EXTRAS ?= ""
 SDK-EXTRAS_qemux86 ?= " valgrind lttng-ust-dev"
 SDK-EXTRAS_qemux86-64 ?= " lttng-ust-dev"
 SDK-EXTRAS_qemuppc ?= " lttng-ust-dev"
+SDK-EXTRAS_qemuarm ?= " lttng-ust-dev"
 SDK-EXTRAS_emenlow ?= " lttng-ust-dev"
 SDK-EXTRAS_atom-pc ?= " lttng-ust-dev"
-- 
1.7.2



