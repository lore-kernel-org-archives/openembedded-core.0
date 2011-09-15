Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Uw-0001Ud-6z
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264350"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:14:54 -0700
Message-Id: <3fdb63b7e46b70d79d4c08e1a0936ed0efaef791.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
Subject: [RC2 PULL 05/13] task-core: split into task-core-console and task-core-x11
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
X-List-Received-Date: Thu, 15 Sep 2011 03:20:23 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

[YOCTO #1481]

Since tasks are referred to almost exclusively via RDEPENDS, and bitbake
will build an entire task recipe when only one of its task packages are
actually needed, building a console-only image that uses
task-core-apps-console (or less directly, has apps-console in its
IMAGE_FEATURES) will cause a build of a whole list of X11 applications
that aren't needed. Splitting the task-core recipe into X11 and console
portions prevents this issue.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   10 +++++--
 meta/conf/multilib.conf                            |    3 +-
 meta/recipes-core/tasks/task-core-console.bb       |   28 ++++++++++++++++++++
 .../tasks/{task-core.bb => task-core-x11.bb}       |   17 ++----------
 4 files changed, 40 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/tasks/task-core-console.bb
 rename meta/recipes-sato/tasks/{task-core.bb => task-core-x11.bb} (79%)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index a7fc011..9dfa6a9 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2460,9 +2460,13 @@ RECIPE_LATEST_VERSION_pn-core-image-sato-sdk = "1.0"
 RECIPE_MAINTAINER_pn-core-image-sato-sdk = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-core-image-sdk = "OE-Core"
 
-RECIPE_STATUS_pn-task-core = "green"
-RECIPE_LATEST_VERSION_pn-task-core = "1.0"
-RECIPE_MAINTAINER_pn-task-core = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_STATUS_pn-task-core-console = "green"
+RECIPE_LATEST_VERSION_pn-task-core-console = "1.0"
+RECIPE_MAINTAINER_pn-task-core-console = "Dongxiao Xu <dongxiao.xu@intel.com>"
+
+RECIPE_STATUS_pn-task-core-x11 = "green"
+RECIPE_LATEST_VERSION_pn-task-core-x11 = "1.0"
+RECIPE_MAINTAINER_pn-task-core-x11 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-task-core-basic = "green"
 RECIPE_LATEST_VERSION_pn-task-core-basic = "1.0"
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 16db375..3133bf1 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -368,12 +368,13 @@ BBCLASSEXTEND_append_pn-task-base = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-apps-x11-pimlico = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-basic = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-boot = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-task-core-console = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-lsb = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-task-core = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-nfs = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-ssh-dropbear = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-ssh-openssh = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-tools = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-task-core-x11 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-x11-sato = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tasks = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tcf-agent = " ${MULTILIBS}"
diff --git a/meta/recipes-core/tasks/task-core-console.bb b/meta/recipes-core/tasks/task-core-console.bb
new file mode 100644
index 0000000..cb22732
--- /dev/null
+++ b/meta/recipes-core/tasks/task-core-console.bb
@@ -0,0 +1,28 @@
+#
+# Copyright (C) 2011 Intel Corporation
+#
+
+DESCRIPTION = "Tasks for core console applications"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r35"
+
+PACKAGES = "\
+    task-core-apps-console \
+    task-core-apps-console-dbg \
+    task-core-apps-console-dev \
+    "
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ALLOW_EMPTY = "1"
+
+SPLASH ?= "psplash"
+
+RDEPENDS_task-core-apps-console = "\
+    avahi-daemon \
+    dbus \
+    portmap \
+    ${SPLASH}"
+
diff --git a/meta/recipes-sato/tasks/task-core.bb b/meta/recipes-sato/tasks/task-core-x11.bb
similarity index 79%
rename from meta/recipes-sato/tasks/task-core.bb
rename to meta/recipes-sato/tasks/task-core-x11.bb
index a595ad7..26d550a 100644
--- a/meta/recipes-sato/tasks/task-core.bb
+++ b/meta/recipes-sato/tasks/task-core-x11.bb
@@ -1,17 +1,14 @@
 #
-# Copyright (C) 2007-2008 OpenedHand Ltd.
+# Copyright (C) 2011 Intel Corporation
 #
 
-DESCRIPTION = "Tasks for OpenedHand Poky"
+DESCRIPTION = "Tasks for core X11 applications"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r34"
+PR = "r35"
 
 PACKAGES = "\
-    task-core-apps-console \
-    task-core-apps-console-dbg \
-    task-core-apps-console-dev \
     task-core-apps-x11-core \
     task-core-apps-x11-core-dbg \
     task-core-apps-x11-core-dev \
@@ -29,18 +26,10 @@ XSERVER ?= "xserver-kdrive-fbdev"
 
 ALLOW_EMPTY = "1"
 
-SPLASH ?= "psplash"
-
 # pcmanfm doesn't work on mips/powerpc
 FILEMANAGER ?= "pcmanfm"
 FILEMANAGER_mips ?= ""
 
-RDEPENDS_task-core-apps-console = "\
-    avahi-daemon \
-    dbus \
-    portmap \
-    ${SPLASH}"
-
 
 RDEPENDS_task-core-x11-base = "\
     dbus \
-- 
1.7.6



