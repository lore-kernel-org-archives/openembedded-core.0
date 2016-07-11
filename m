Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1B77665D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 17:54:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2016 10:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,347,1464678000"; d="scan'208";a="844259066"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga003.jf.intel.com with ESMTP; 11 Jul 2016 10:54:52 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 10:55:29 -0700
Message-Id: <20160711175529.2650-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711175529.2650-1-stephano.cetola@linux.intel.com>
References: <20160711175529.2650-1-stephano.cetola@linux.intel.com>
Subject: [PATCH V3] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Mon, 11 Jul 2016 17:54:53 -0000

For images not containing a package manager, this allows the removal of support
packages based on the REMOVE_PKG_SUPPORT variable. Packages that will be
uninstalled include: update-rc.d, base-passwd, shadow, run-postinsts, and
update-alternatives.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ed0bab1..6939dce 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -253,6 +253,24 @@ class Rootfs(object, metaclass=ABCMeta):
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d)
+        runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES", "package-management",
+                                        True, False, self.d)
+
+        if (not runtime_pkgmanage and self.d.getVar('REMOVE_PKG_SUPPORT', True) == "1"
+                and delayed_postinsts is None):
+            # Remove components that we don't need if we're not going to install
+            # additional packages at runtime
+            pkgs_installed = image_list_installed_packages(self.d)
+            unneeded_pkgs = ["update-rc.d", "base-passwd", "shadow",
+                    "update-alternatives", "run-postinsts"]
+            unneeded_pkgs.extend(self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL",
+                True).split(","))
+            pkgs_to_remove = [pkg for pkg in pkgs_installed if pkg in unneeded_pkgs]
+
+            if len(pkgs_to_remove) > 0:
+                bb.warn("removing packages")
+                self.pm.remove(pkgs_to_remove, False)
+
         if image_rorfs:
             # Remove components that we don't need if it's a read-only rootfs
             unneeded_pkgs = self.d.getVar("ROOTFS_RO_UNNEEDED", True).split()
@@ -271,8 +289,6 @@ class Rootfs(object, metaclass=ABCMeta):
         post_uninstall_cmds = self.d.getVar("ROOTFS_POSTUNINSTALL_COMMAND", True)
         execute_pre_post_process(self.d, post_uninstall_cmds)
 
-        runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES", "package-management",
-                                              True, False, self.d)
         if not runtime_pkgmanage:
             # Remove the package manager data files
             self.pm.remove_packaging_data()
-- 
2.9.0


