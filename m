Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlj-0001ox-13
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 00:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="736914135"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2011 00:24:46 -0700
Message-Id: <dfc8e34c33a5c827f802790d371f038a818678d1.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 10:44:52 +0800
Date: Fri, 22 Apr 2011  0:24:46 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 17/33] task-poky-tools.bb, task-sdk-gmae.inc: enable lttng-ust for ARM
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:11 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

lttng-ust can build on ARM from 0.12 on.
Merged with rebranding

Fixes [YOCTO #856]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-core-tools.bb         |    8 ++++----
 meta/recipes-gnome/tasks/task-core-sdk-gmae.bb     |    4 ++--
 .../tasks/task-core-standalone-gmae-sdk-target.bb  |    4 ++--
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    1 +
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 958dff1..9b2a4ce 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -2,11 +2,11 @@
 # Copyright (C) 2008 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Tools tasks for Poky"
+DESCRIPTION = "Tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r8"
+PR = "r9"
 
 PACKAGES = "\
     task-core-tools-debug \
@@ -57,9 +57,9 @@ RRECOMMENDS_task-core-tools-profile = "\
 #    exmap-server
 
 # At present we only build lttng-ust on
-# qemux86/qemux86-64/qemuppc/emenlow/atom-pc since upstream liburcu
+# qemux86/qemux86-64/qemuppc/qemuarm/emenlow/atom-pc since upstream liburcu
 # (which is required by lttng-ust) may not build on other platforms, like
-# MIPS and qemu ARMv5te that poky uses now.
+# MIPS.
 RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust systemtap"
 RDEPENDS_task-core-tools-profile_append_qemux86-64 = " lttng-ust systemtap"
 RDEPENDS_task-core-tools-profile_append_qemuppc = " lttng-ust systemtap"
diff --git a/meta/recipes-gnome/tasks/task-core-sdk-gmae.bb b/meta/recipes-gnome/tasks/task-core-sdk-gmae.bb
index 6cb1410..d56aa07 100644
--- a/meta/recipes-gnome/tasks/task-core-sdk-gmae.bb
+++ b/meta/recipes-gnome/tasks/task-core-sdk-gmae.bb
@@ -2,11 +2,11 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OpenedHand Poky"
+DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r10"
+PR = "r11"
 
 ALLOW_EMPTY = "1"
 
diff --git a/meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
index 32e60a8..42d4148 100644
--- a/meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
@@ -2,11 +2,11 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OpenedHand Poky"
+DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
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
1.7.1



