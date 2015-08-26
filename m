Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AC4DD734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 21:57:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 14:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,418,1437462000"; d="scan'208";a="632871961"
Received: from afshjern.zpn.intel.com ([10.219.17.7])
	by orsmga003.jf.intel.com with ESMTP; 26 Aug 2015 14:57:03 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 16:57:33 -0500
Message-Id: <1440626255-29614-2-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/3] Empty image: core-image-empty recipe, Rootfs fix
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
X-List-Received-Date: Wed, 26 Aug 2015 21:57:05 -0000

Added a core-image-empty recipe, as well as a DpkgOpkgRootfs test
which skips the package post installs step, if PACKAGE_INSTALL is
empty.

[YOCTO #7664]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/lib/oe/rootfs.py                        | 6 +++++-
 meta/recipes-core/images/core-image-empty.bb | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/images/core-image-empty.bb

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8c8244c..f8cc6eb 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -585,7 +585,11 @@ class DpkgOpkgRootfs(Rootfs):
 
         pkg_list = []
 
-        pkgs = self._get_pkgs_postinsts(status_file)
+        pkgs = None
+        if not self.d.getVar('PACKAGE_INSTALL', True).strip():
+            bb.note("Building empty image")
+        else:
+            pkgs = self._get_pkgs_postinsts(status_file)
         if pkgs:
             root = "__packagegroup_postinst__"
             pkgs[root] = pkgs.keys()
diff --git a/meta/recipes-core/images/core-image-empty.bb b/meta/recipes-core/images/core-image-empty.bb
new file mode 100644
index 0000000..550567c
--- /dev/null
+++ b/meta/recipes-core/images/core-image-empty.bb
@@ -0,0 +1,7 @@
+SUMMARY = "An empty image."
+IMAGE_INSTALL = ""
+IMAGE_LINGUAS = ""
+PACKAGE_INSTALL = ""
+LICENSE = "MIT"
+
+inherit image
-- 
2.5.0


