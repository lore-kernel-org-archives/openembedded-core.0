Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id C1C0D79AF4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:25:08 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w9HDP8IE028186
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:25:08 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.93])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w9HDP8if002242;
	Wed, 17 Oct 2018 15:25:08 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0F9CC47A833;
	Wed, 17 Oct 2018 15:25:08 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 15:24:35 +0200
Message-Id: <20181017132435.14623-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181003090036.508-1-andrej.valek@siemens.com>
References: <20181003090036.508-1-andrej.valek@siemens.com>
Subject: [PATCH v3] rootfs: possibility to add packages to debug rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2018 13:25:09 -0000

Static libraries are not included in rootfs, it means, that sources are
not going into debug rootfs. This option enables to install additional
packages even if the standard package is not installed.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/image.bbclass             |  4 +++-
 meta/classes/populate_sdk_base.bbclass |  2 +-
 meta/lib/oe/rootfs.py                  | 10 ++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 34fdbb0850..452b1ad391 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -38,6 +38,8 @@ IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
 
+# These pacackages will be installed as additional into debug rootfs
+IMAGE_INSTALL_DEBUGFS ?= ""
 
 # These packages will be removed from a read-only rootfs after all other
 # packages have been installed
@@ -125,7 +127,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index d9a391c613..677ba3cf12 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -296,7 +296,7 @@ def sdk_command_variables(d):
 def sdk_variables(d):
     variables = ['BUILD_IMAGES_FROM_FEEDS','SDK_OS','SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT',
                  'SDKTARGETSYSROOT','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
-                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI', 'PACKAGE_EXCLUDE_COMPLEMENTARY']
+                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'IMAGE_INSTALL_DEBUGFS']
     variables.extend(sdk_command_variables(d))
     return " ".join(variables)
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ddda552263..e5512d09ef 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -148,6 +148,16 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.note("  Install complementary '*-src' packages...")
             self.pm.install_complementary('*-src')
 
+        """
+        Install additional debug packages. Possibility to install additional packages,
+        which are not automatically installed as complementary package of
+        standard one, e.g. debug package of static libraries.
+        """
+        extra_debug_pkgs = self.d.getVar('IMAGE_INSTALL_DEBUGFS')
+        if extra_debug_pkgs:
+            bb.note("  Install extra debug packages...")
+            self.pm.install(extra_debug_pkgs.split(), True)
+
         bb.note("  Rename debug rootfs...")
         try:
             shutil.rmtree(self.image_rootfs + '-dbg')
-- 
2.11.0


