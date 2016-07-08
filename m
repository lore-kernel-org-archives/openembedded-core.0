Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7CC60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 16:32:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 08 Jul 2016 09:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,330,1464678000"; d="scan'208";a="1013257674"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2016 09:32:29 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2016 09:33:09 -0700
Message-Id: <20160708163309.26556-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160708163309.26556-1-stephano.cetola@linux.intel.com>
References: <20160708163309.26556-1-stephano.cetola@linux.intel.com>
Subject: [PATCH V2] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Fri, 08 Jul 2016 16:32:28 -0000

For images not containing a package manager, this allows the removal of support
packages based on the REMOVE_PKG_SUPPORT variable. Packages that will be
uninstalled include: update-rc.d, base-passwd, shadow, run-postinsts, and
update-alternatives.

[ YOCTO #9491 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ed0bab1..d05f6df 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -253,6 +253,22 @@ class Rootfs(object, metaclass=ABCMeta):
 
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
+                    "update-alternatives", "run-postinsts",
+                    self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)]
+            pkgs_to_remove = [pkg for pkg in pkgs_installed if pkg in unneeded_pkgs]
+
+            if len(pkgs_to_remove) > 0:
+                self.pm.remove(pkgs_to_remove, False)
+
         if image_rorfs:
             # Remove components that we don't need if it's a read-only rootfs
             unneeded_pkgs = self.d.getVar("ROOTFS_RO_UNNEEDED", True).split()
@@ -271,8 +287,6 @@ class Rootfs(object, metaclass=ABCMeta):
         post_uninstall_cmds = self.d.getVar("ROOTFS_POSTUNINSTALL_COMMAND", True)
         execute_pre_post_process(self.d, post_uninstall_cmds)
 
-        runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES", "package-management",
-                                              True, False, self.d)
         if not runtime_pkgmanage:
             # Remove the package manager data files
             self.pm.remove_packaging_data()
-- 
2.9.0


