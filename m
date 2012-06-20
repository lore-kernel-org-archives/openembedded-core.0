Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1ShCdi-0001Qo-NP
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 06:35:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 21:24:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155805265"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 21:24:49 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:25:23 +0800
Message-Id: <622f94dd940787bff2cf59299be285cfb6ddec98.1340166208.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <644f893ebb1c70b7081a82cef39b10b7233463cd.1340166208.git.lianhao.lu@intel.com>
References: <644f893ebb1c70b7081a82cef39b10b7233463cd.1340166208.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1340166208.git.lianhao.lu@intel.com>
References: <cover.1340166208.git.lianhao.lu@intel.com>
Subject: [PATCH V2 3/3] core-image/misc: Added new IMAGE_FEATURE eclipse-support.
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
X-List-Received-Date: Wed, 20 Jun 2012 04:35:35 -0000

Added a new IMAGE_FEATURES eclipse-support to support developing user
applications through Eclipse plugin.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/core-image.bbclass                    |    2 ++
 meta/conf/multilib.conf                            |    1 +
 .../tasks/task-core-eclipse-support.bb             |   17 +++++++++++++++++
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    2 +-
 4 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/tasks/task-core-eclipse-support.bb

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 6b207d7..8505d6f 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -28,6 +28,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
 # - debug-tweaks        - makes an image suitable for development
+# - eclipse-support     - Support Eclipse plugin
 #
 PACKAGE_GROUP_apps-console-core = "task-core-apps-console"
 PACKAGE_GROUP_x11-mini = "task-core-x11-mini"
@@ -46,6 +47,7 @@ PACKAGE_GROUP_ssh-server-dropbear = "task-core-ssh-dropbear"
 PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
 PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
 PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
+PACKAGE_GROUP_eclipse-support = "task-core-eclipse-support task-core-tools-debug task-core-tools-profile"
 
 
 # IMAGE_FEAETURES_REPLACES_foo = 'bar1 bar2'
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index cea8694..ee21d40 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -618,6 +618,7 @@ BBCLASSEXTEND_append_pn-task-core-basic = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-boot = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-clutter = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-console = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-task-core-eclipse-support = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-gtk-directfb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-lsb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-nfs = " ${MULTILIBS}"
diff --git a/meta/recipes-core/tasks/task-core-eclipse-support.bb b/meta/recipes-core/tasks/task-core-eclipse-support.bb
new file mode 100644
index 0000000..78a21a4
--- /dev/null
+++ b/meta/recipes-core/tasks/task-core-eclipse-support.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Agent for Eclipse plugin task for Poky"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+PACKAGES = "\
+    ${PN} \
+    ${PN}-dev \
+    ${PN}-dbg \
+    "
+
+ALLOW_EMPTY = "1"
+
+RDEPENDS_${PN} = "tcf-agent \
+	openssh-sftp-server \
+	"
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 5bb9469..0630314 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Image with Sato support that includes everything within \
 core-image-sato plus meta-toolchain, development headers and libraries to \
 form a standalone SDK."
 
-IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
+IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs eclipse-support"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
 
 SSHSERVER_IMAGE_FEATURES = "ssh-server-openssh"
-- 
1.7.0.4



