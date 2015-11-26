Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4396018C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 17:46:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 26 Nov 2015 09:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="860384206"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2015 09:46:42 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 09:34:59 +0000
Message-Id: <87e97a4c7460181a416e21348043a4e0be94ff80.1448530242.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1448530242.git.mariano.lopez@linux.intel.com>
References: <cover.1448530242.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1448530242.git.mariano.lopez@linux.intel.com>
References: <cover.1448530242.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] rootfs.py: Change logic to unistall packages
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
X-List-Received-Date: Thu, 26 Nov 2015 17:46:42 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

In the current state some of the base utils (update-rc.d,
base-passwd, shadow, and update-alternatives) are unistalled
when there is no package manager in the image. Checking for
previous commits, the unistall of these utils were to be
done in a read-only filesystem.

It is a valid option to have these utils without a package
manager, and also make sense to remove them when building a
read-only filesystem.

This changes the check logic from having a package mananger
to if is a read-only filesystem to remove the utils.

Another change implemented with this patch is that delayed
post installs now doesn't depend if there is a package manager.
Also it is a valid option to have post install scripts without
package manger.

[YOCTO #8235]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c004a5b..a2af332 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -239,26 +239,27 @@ class Rootfs(object):
             pkg_to_remove = ""
         else:
             pkg_to_remove = "update-rc.d"
-        if not runtime_pkgmanage:
-            # Remove components that we don't need if we're not going to install
-            # additional packages at runtime
-            if delayed_postinsts is None:
-                pkgs_installed = image_list_installed_packages(self.d)
-                pkgs_to_remove = list()
-                for pkg in pkgs_installed.split():
-                    if pkg in ["update-rc.d",
-                            "base-passwd",
-                            "shadow",
-                            "update-alternatives", pkg_to_remove,
-                            self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
-                            ]:
-                        pkgs_to_remove.append(pkg)
-
-                if len(pkgs_to_remove) > 0:
-                    self.pm.remove(pkgs_to_remove, False)
-
-            else:
-                self._save_postinsts()
+        if image_rorfs:
+            # Remove components that we don't need if it's a read-only rootfs
+            pkgs_installed = image_list_installed_packages(self.d)
+            pkgs_to_remove = list()
+            for pkg in pkgs_installed.split():
+                if pkg in ["update-rc.d",
+                        "base-passwd",
+                        "shadow",
+                        "update-alternatives", pkg_to_remove,
+                        self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
+                        ]:
+                    pkgs_to_remove.append(pkg)
+
+            if len(pkgs_to_remove) > 0:
+                self.pm.remove(pkgs_to_remove, False)
+
+        if delayed_postinsts:
+            self._save_postinsts()
+            if image_rorfs:
+                bb.warn("There are post install scripts "
+                        "in a read-only rootfs")
 
         post_uninstall_cmds = self.d.getVar("ROOTFS_POSTUNINSTALL_COMMAND", True)
         execute_pre_post_process(self.d, post_uninstall_cmds)
-- 
1.8.4.5


