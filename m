Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqp-00083M-5Q
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578053"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:06:53 -0700
Message-Id: <a69066fa8b8f7d65e32f0a2700de2bf0e3c4dc4a.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Subject: [PATCH 03/12] conf: Create distro overridable IMAGE varibales
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
X-List-Received-Date: Fri, 20 May 2011 07:10:23 -0000

From: Khem Raj <raj.khem@gmail.com>

With default-setup being pulled in via bitbake.conf and task-core-boot
being pulled into all images in distros, we need
to have some variables that distro's can override if need be
This is a backport from angstrom/OE. It will help distros which
e.g. would like to use busybox-mdev instead of udev and similarly
for login manager these variables can be defined in distro policies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass                      |    9 ++++++++-
 meta/conf/distro/include/default-distrovars.inc |   13 +++++++++++++
 meta/recipes-core/tasks/task-core-boot.bb       |    4 ----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2469442..d360a18 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -5,7 +5,14 @@ inherit imagetest-${IMAGETEST}
 
 LICENSE = "MIT"
 PACKAGES = ""
-RDEPENDS += "${IMAGE_INSTALL}"
+
+IMAGE_BOOT ?= "${IMAGE_INITSCRIPTS} \
+               ${IMAGE_DEV_MANAGER} \
+               ${IMAGE_INIT_MANAGER} \
+               ${IMAGE_LOGIN_MANAGER}"
+
+
+RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 1aa45c8..8c82db8 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -6,6 +6,19 @@ OEINCLUDELOGS ?= "yes"
 KERNEL_CONSOLE ?= "ttyS0"
 
 PCMCIA_MANAGER ?= "pcmciautils"
+#
+# udev, devfsd, busybox-mdev (from busybox) or none
+#
+IMAGE_DEV_MANAGER ?= "udev"
+#
+# sysvinit, upstart
+#
+IMAGE_INIT_MANAGER ?= "sysvinit"
+IMAGE_INITSCRIPTS ?= "initscripts"
+#
+# tinylogin, getty
+#
+IMAGE_LOGIN_MANAGER ?= "tinylogin"
 
 IMAGE_LINGUAS ?= "en-us en-gb"
 LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 5aea771..b575e4d 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -21,13 +21,9 @@ RDEPENDS_task-core-boot = "\
     base-files \
     base-passwd \
     busybox \
-    initscripts \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
-    sysvinit \
-    tinylogin \
-    udev \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
-- 
1.7.3.4



