Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id BC5B079101
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 09:01:00 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w93911Gc001130
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Oct 2018 11:01:01 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.201])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w93911eO012760;
	Wed, 3 Oct 2018 11:01:01 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 007D8997B1D;
	Wed,  3 Oct 2018 11:01:01 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 11:00:36 +0200
Message-Id: <20181003090036.508-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181003090036.508-1-andrej.valek@siemens.com>
References: <20181003090036.508-1-andrej.valek@siemens.com>
Subject: [PATCH 1/1] feat(dbg-packages): possibility to add packages to debug rootfs
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
X-List-Received-Date: Wed, 03 Oct 2018 09:01:01 -0000

Static libraries are not included in rootfs, it means, that sources are
not going into debug rootfs. This option enables to install additional
packages even if the standard package is not installed.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/image.bbclass             | 4 +++-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/lib/oe/package_manager.py         | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 34fdbb0850..289978e000 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -101,6 +101,8 @@ LDCONFIGDEPEND_libc-musl = ""
 # don't want this dependency, which is causing dependency loop
 KERNELDEPMODDEPEND ?= "virtual/kernel:do_packagedata"
 
+ADDITIONAL_DBG_ROOTFS ?= ""
+
 do_rootfs[depends] += " \
     makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND} \
     virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot \
@@ -125,7 +127,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'ADDITIONAL_DBG_ROOTFS']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index e07ad0cc6b..982c30cfa2 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -293,7 +293,7 @@ def sdk_command_variables(d):
 def sdk_variables(d):
     variables = ['BUILD_IMAGES_FROM_FEEDS','SDK_OS','SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT',
                  'SDKTARGETSYSROOT','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
-                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI', 'PACKAGE_EXCLUDE_COMPLEMENTARY']
+                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'ADDITIONAL_DBG_ROOTFS']
     variables.extend(sdk_command_variables(d))
     return " ".join(variables)
 
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 8f4b42b0da..63d3d0f609 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -581,6 +581,10 @@ class PackageManager(object, metaclass=ABCMeta):
                 bb.note("Installing complementary packages ...")
                 bb.note('Running %s' % cmd)
                 complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
+                # install additional debug packages
+                if globs == '*-dbg':
+                    for add_dbg_pkgs in self.d.getVar('ADDITIONAL_DBG_ROOTFS').split():
+                        complementary_pkgs += "\n%s-dbg" % add_dbg_pkgs
                 self.install(complementary_pkgs.split(), attempt_only=True)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Could not compute complementary packages list. Command "
-- 
2.11.0


