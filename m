Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D51B7404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 15:22:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 24 Sep 2015 08:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,581,1437462000"; d="scan'208";a="567732636"
Received: from afshjern.zpn.intel.com ([10.219.128.51])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2015 08:22:58 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 10:23:16 -0500
Message-Id: <1443108196-26245-2-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1443108196-26245-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1443108196-26245-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv2 2/2] Empty image:rootfs.py:handle empty PACKAGE_INSTALL
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
X-List-Received-Date: Thu, 24 Sep 2015 15:22:59 -0000

rootfs.py: added a test in DpkgOpkgRootfs which skips the
get package post installs step (get_pkgs_postinsts), when
PACKAGE_INSTALL is empty.

[YOCTO #7664]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 3b53fce..4e81263 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -595,7 +595,11 @@ class DpkgOpkgRootfs(Rootfs):
 
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
-- 
2.5.3


