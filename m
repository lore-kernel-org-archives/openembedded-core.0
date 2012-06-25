Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Sj1mq-0003l2-BA
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 07:24:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Jun 2012 22:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="160237784"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by azsmga001.ch.intel.com with ESMTP; 24 Jun 2012 22:13:39 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2012 13:15:30 +0800
Message-Id: <13ed4eabf4dfcb28267d045fc30e402a3484e95d.1340600710.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <5bfc2cadad3f2b0e2b03c4562aba4efd0a604c95.1340600710.git.lianhao.lu@intel.com>
References: <5bfc2cadad3f2b0e2b03c4562aba4efd0a604c95.1340600710.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1340600710.git.lianhao.lu@intel.com>
References: <cover.1340600710.git.lianhao.lu@intel.com>
Subject: [PATCH V3 2/3] image/core-image: Handle conflicting IMAGE_FEATURES.
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
X-List-Received-Date: Mon, 25 Jun 2012 05:24:32 -0000

IMAGE_FEATURES such as 'ssh-server-dropbear' and 'ssh-server-openssh'
can't be both enabled. User can use the following variables to define
the relationship of image features:

IMAGE_FEATURES_REPLACES_foo = "bar" means including image feature "foo"
would replace the image feature "bar".

IMAGE_FEATURES_CONFLICTS_foo = "bar" means including both image features
"foo" and "bar" would cause an parsing error.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/core-image.bbclass                 |   11 ++++++++++-
 meta/classes/image.bbclass                      |   17 +++++++++++++++++
 meta/recipes-sato/images/core-image-sato-sdk.bb |    2 ++
 3 files changed, 29 insertions(+), 1 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 25f5c5a..6b207d7 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -47,6 +47,14 @@ PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
 PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
 PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
 
+
+# IMAGE_FEAETURES_REPLACES_foo = 'bar1 bar2'
+# Including image feature foo would replace the image features bar1 and bar2
+IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
+
+# IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
+# An error exception would be raised if both image features foo and bar1(or bar2) are included
+
 CORE_IMAGE_BASE_INSTALL = '\
     task-core-boot \
     task-base-extended \
@@ -60,7 +68,8 @@ IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
 X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
 ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games apps-x11-pimlico package-management"
-SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ssh-server-dropbear"
+SSHSERVER_IMAGE_FEATURES ??= "ssh-server-dropbear"
+SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ${SSHSERVER_IMAGE_FEATURES}"
 
 inherit image
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0772363..6fac974 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -87,6 +87,23 @@ python () {
         deps += " %s:do_populate_sysroot" % dep
     d.setVarFlag('do_rootfs', 'depends', deps)
 
+    #process IMAGE_FEATURES, we must do this before runtime_mapping_rename
+    #Check for replaces image features
+    features = set(oe.data.typed_value('IMAGE_FEATURES', d))
+    remain_features = features.copy()
+    for feature in features:
+        replaces = set((d.getVar("IMAGE_FEATURES_REPLACES_%s" % feature, True) or "").split())
+        remain_features -= replaces
+
+    #Check for conflict image features
+    for feature in remain_features:
+        conflicts = set((d.getVar("IMAGE_FEATURES_CONFLICTS_%s" % feature, True) or "").split())
+        temp = conflicts & remain_features
+        if temp:
+            raise bb.parse.SkipPackage("%s contains conflicting IMAGE_FEATURES %s %s" % (d.getVar('PN', True), feature, ' '.join(list(temp))))
+
+    d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
+
     # If we don't do this we try and run the mapping hooks while parsing which is slow
     # bitbake should really provide something to let us know this...
     if d.getVar('BB_WORKERCONTEXT', True) is not None:
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index eed1698..5bb9469 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -8,6 +8,8 @@ form a standalone SDK."
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
 
+SSHSERVER_IMAGE_FEATURES = "ssh-server-openssh"
+
 LICENSE = "MIT"
 
 inherit core-image
-- 
1.7.0.4



