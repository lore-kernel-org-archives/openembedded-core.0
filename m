Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1A94062136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 00:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 718452E4AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2ltYgXcyMoYd
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 6AA442E4A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 54E681342
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 49CBD156B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 46F5010BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2V0KDP7009518
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2V0KDVa009517
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2016 02:20:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 02:20:11 +0200
Message-Id: <55ffe5a631d152a927c984cb930f4faaeda4c23a.1459383524.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1459383524.git.pkj@axis.com>
References: <cover.1459383524.git.pkj@axis.com>
In-Reply-To: <cover.1459383524.git.pkj@axis.com>
References: <cover.1459383524.git.pkj@axis.com>
Subject: [PATCH 1/1] image.bbclass: Make unneeded packages for a read-only rootfs configurable
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
X-List-Received-Date: Thu, 31 Mar 2016 00:20:15 -0000

Previously the list of packages that are considered unneeded for a
read-only rootfs was hardcoded. This made it impossible to, e.g., have
shadow installed on a system with a read-only rootfs, but where /etc
is mounted writable.

This also lists ${VIRTUAL-RUNTIME_update-alternatives} rather than
update-alternatives (as was previously the case) since this should
actually remove the intended package.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/image.bbclass |  6 +++++-
 meta/lib/oe/rootfs.py      | 23 +++++------------------
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 62ff07e..894ff99 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -33,6 +33,10 @@ IMAGE_GEN_DEBUGFS ?= "0"
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
 
+# These packages will be removed from a read-only rootfs after all other
+# packages have been installed
+ROOTFS_RO_UNNEEDED = "update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
+
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 FEATURE_INSTALL[vardepvalue] = "${FEATURE_INSTALL}"
@@ -114,7 +118,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'COMPRESSIONTYPES', 'IMAGE_GEN_DEBUGFS']
+                 'COMPRESSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0f835d3..bfae1d8 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -238,28 +238,13 @@ class Rootfs(object):
                                       self.d.getVar('IMAGE_ROOTFS', True),
                                       "run-postinsts", "remove"])
 
-        runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES", "package-management",
-                         True, False, self.d)
-        sysvcompat_in_distro = bb.utils.contains("DISTRO_FEATURES", [ "systemd", "sysvinit" ],
-                         True, False, self.d)
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
-                         True, False, self.d)
-        if sysvcompat_in_distro and not image_rorfs:
-            pkg_to_remove = ""
-        else:
-            pkg_to_remove = "update-rc.d"
+                                        True, False, self.d)
         if image_rorfs:
             # Remove components that we don't need if it's a read-only rootfs
+            unneeded_pkgs = self.d.getVar("ROOTFS_RO_UNNEEDED", True).split()
             pkgs_installed = image_list_installed_packages(self.d)
-            pkgs_to_remove = list()
-            for pkg in pkgs_installed:
-                if pkg in ["update-rc.d",
-                        "base-passwd",
-                        "shadow",
-                        "update-alternatives", pkg_to_remove,
-                        self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
-                        ]:
-                    pkgs_to_remove.append(pkg)
+            pkgs_to_remove = [pkg for pkg in pkgs_installed if pkg in unneeded_pkgs]
 
             if len(pkgs_to_remove) > 0:
                 self.pm.remove(pkgs_to_remove, False)
@@ -273,6 +258,8 @@ class Rootfs(object):
         post_uninstall_cmds = self.d.getVar("ROOTFS_POSTUNINSTALL_COMMAND", True)
         execute_pre_post_process(self.d, post_uninstall_cmds)
 
+        runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES", "package-management",
+                                              True, False, self.d)
         if not runtime_pkgmanage:
             # Remove the package manager data files
             self.pm.remove_packaging_data()
-- 
2.1.0


