Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2514D728A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:55:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 28 Jan 2015 03:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,480,1418112000"; d="scan'208";a="518910018"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by orsmga003.jf.intel.com with ESMTP; 28 Jan 2015 03:47:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 11:54:43 +0000
Message-Id: <915e90c46c8d7472e0fdc12893788c96af586e50.1422445957.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] classes/image: ensure uninstalled packages do not appear in manifests
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
X-List-Received-Date: Wed, 28 Jan 2015 11:55:10 -0000

Since the rewrite of the image construction code in python a few
releases ago, we remove a couple of packages from the image as one of
the final steps when constructing the image (notably update-rc.d and
run-postinsts).  However, because of the order of operations, these
packages are still listed both in the buildhistory
installed_package*.txt files and in the manifest file created next to
the image, which is wrong.

There were two possible solutions to this: (1) change the order such
that the uninstallation occurs before calling ROOTFS_POSTPROCESS_COMMAND
or (2) add another hook variable in such that we can have the
package list collection code run at the right time. Because it's
currently possible (but very much not recommended) to install additional
packages within ROOTFS_POSTPROCESS_COMMAND, which may have postinstall
scripts and thus require the packages we would otherwise uninstall if we
were to take option 1, option 2 is really the least likely to cause
problems. Therefore, add ROOTFS_POSTUNINSTALL_COMMAND and make the image
and buildhistory classes use it.

Fixes [YOCTO #6479].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |  5 ++--
 meta/classes/image.bbclass        |  2 +-
 meta/lib/oe/rootfs.py             | 55 +++++++++++++++++++++------------------
 3 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2b5f84a..90cfe4f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -484,8 +484,9 @@ END
 	echo "SDKSIZE = $sdksize" >> ${BUILDHISTORY_DIR_SDK}/sdk-info.txt
 }
 
-# By prepending we get in before the removal of packaging files
-ROOTFS_POSTPROCESS_COMMAND =+ " buildhistory_list_installed_image ;\
+# By using ROOTFS_POSTUNINSTALL_COMMAND we get in after uninstallation of
+# unneeded packages but before the removal of packaging files
+ROOTFS_POSTUNINSTALL_COMMAND += " buildhistory_list_installed_image ;\
                                 buildhistory_get_image_installed ; "
 
 IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 62b214a..56dbf52 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -165,7 +165,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-twe
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
 # Write manifest
 IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
-ROOTFS_POSTPROCESS_COMMAND =+ "write_image_manifest ; "
+ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 536efcc..30d164c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -137,34 +137,39 @@ class Rootfs(object):
                                       self.d.getVar('IMAGE_ROOTFS', True),
                                       "run-postinsts", "remove"])
 
-        # Remove unneeded package-management related components
-        if bb.utils.contains("IMAGE_FEATURES", "package-management",
-                         True, False, self.d):
-            return
+        runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES", "package-management",
+                         True, False, self.d)
+        if not runtime_pkgmanage:
+            # Remove components that we don't need if we're not going to install
+            # additional packages at runtime
+            if delayed_postinsts is None:
+                installed_pkgs_dir = self.d.expand('${WORKDIR}/installed_pkgs.txt')
+                pkgs_to_remove = list()
+                with open(installed_pkgs_dir, "r+") as installed_pkgs:
+                    pkgs_installed = installed_pkgs.read().split('\n')
+                    for pkg_installed in pkgs_installed[:]:
+                        pkg = pkg_installed.split()[0]
+                        if pkg in ["update-rc.d",
+                                "base-passwd",
+                                self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
+                                ]:
+                            pkgs_to_remove.append(pkg)
+                            pkgs_installed.remove(pkg_installed)
+
+                if len(pkgs_to_remove) > 0:
+                    self.pm.remove(pkgs_to_remove, False)
+                    # Update installed_pkgs.txt
+                    open(installed_pkgs_dir, "w+").write('\n'.join(pkgs_installed))
 
-        if delayed_postinsts is None:
-            installed_pkgs_dir = self.d.expand('${WORKDIR}/installed_pkgs.txt')
-            pkgs_to_remove = list()
-            with open(installed_pkgs_dir, "r+") as installed_pkgs:
-                pkgs_installed = installed_pkgs.read().split('\n')
-                for pkg_installed in pkgs_installed[:]:
-                    pkg = pkg_installed.split()[0]
-                    if pkg in ["update-rc.d",
-                               "base-passwd",
-                               self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
-                               ]:
-                        pkgs_to_remove.append(pkg)
-                        pkgs_installed.remove(pkg_installed)
-
-            if len(pkgs_to_remove) > 0:
-                self.pm.remove(pkgs_to_remove, False)
-                # Update installed_pkgs.txt
-                open(installed_pkgs_dir, "w+").write('\n'.join(pkgs_installed))
+            else:
+                self._save_postinsts()
 
-        else:
-            self._save_postinsts()
+        post_uninstall_cmds = self.d.getVar("ROOTFS_POSTUNINSTALL_COMMAND", True)
+        execute_pre_post_process(self.d, post_uninstall_cmds)
 
-        self.pm.remove_packaging_data()
+        if not runtime_pkgmanage:
+            # Remove the package manager data files
+            self.pm.remove_packaging_data()
 
     def _run_intercepts(self):
         intercepts_dir = os.path.join(self.d.getVar('WORKDIR', True),
-- 
1.9.3


