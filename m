Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 628F377DB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 08:08:17 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Sep 2017 01:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,444,1500966000"; d="scan'208";a="153854538"
Received: from summit.tm.intel.com ([10.237.55.152])
	by orsmga005.jf.intel.com with ESMTP; 27 Sep 2017 01:08:18 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 11:08:14 +0300
Message-Id: <20170927080815.18392-2-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170927080815.18392-1-mikko.ylinen@linux.intel.com>
References: <20170926120328.14928-1-mikko.ylinen@linux.intel.com>
	<20170927080815.18392-1-mikko.ylinen@linux.intel.com>
Subject: [PATCH 1/2] rootfs.py: remove update-alternatives correctly
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
X-List-Received-Date: Wed, 27 Sep 2017 08:08:17 -0000

With "read-only-rootfs" in IMAGE_FEATURES, packages in ROOTFS_RO_UNNEEDED
are removed when building the rootfs. The list of packages to remove is
passed to the package manager and the list is sorted so that
update-alternatives provider is the last entry. This is with the
assumption that the last entry on the list/command line is removed last.

However, it turns out rpm does not care about "last on the command
line" and update-alternatives provider is removed before other the
packages get to run their %preun scripts for update-alternatives.

This leaves broken alternative symlinks in rootfs.

The fix is to first remove all but update-alternatives provider and
after that update-alternatives provider in its own remove() call.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9d4727e..5f62015 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -261,15 +261,22 @@ class Rootfs(object, metaclass=ABCMeta):
             # Remove components that we don't need if it's a read-only rootfs
             unneeded_pkgs = self.d.getVar("ROOTFS_RO_UNNEEDED").split()
             pkgs_installed = image_list_installed_packages(self.d)
-            # Make sure update-alternatives is last on the command line, so
-            # that it is removed last. This makes sure that its database is
-            # available while uninstalling packages, allowing alternative
-            # symlinks of packages to be uninstalled to be managed correctly.
+            # Make sure update-alternatives is removed last. This is
+            # because its database has to available while uninstalling
+            # other packages, allowing alternative symlinks of packages
+            # to be uninstalled or to be managed correctly otherwise.
             provider = self.d.getVar("VIRTUAL-RUNTIME_update-alternatives")
             pkgs_to_remove = sorted([pkg for pkg in pkgs_installed if pkg in unneeded_pkgs], key=lambda x: x == provider)
 
+            # update-alternatives provider is removed in its own remove()
+            # call because all package managers do not guarantee the packages
+            # are removed in the order they given in the list (which is
+            # passed to the command line). The sorting done earlier is
+            # utilized to implement the 2-stage removal.
+            if len(pkgs_to_remove) > 1:
+                self.pm.remove(pkgs_to_remove[:-1], False)
             if len(pkgs_to_remove) > 0:
-                self.pm.remove(pkgs_to_remove, False)
+                self.pm.remove([pkgs_to_remove[-1]], False)
 
         if delayed_postinsts:
             self._save_postinsts()
-- 
2.1.4


