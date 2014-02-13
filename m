Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDFE6EE4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:55:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Feb 2014 03:55:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,838,1384329600"; d="scan'208";a="482780840"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 13 Feb 2014 03:55:29 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 13:55:26 +0200
Message-Id: <453395e793d0d5c30d4e8092ee6faf80484ad447.1392292446.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392292446.git.laurentiu.palcu@intel.com>
References: <cover.1392292446.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392292446.git.laurentiu.palcu@intel.com>
References: <cover.1392292446.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/1] lib/oe/rootfs.py: fix RPM multilib issue
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
X-List-Received-Date: Thu, 13 Feb 2014 11:55:46 -0000

For some odd reason (at least I couldn't find an explanation to this,
yet), if a multilib version of a package is installed after the main one
(that is: in a different smart session), the main package binaries are
not overwritten.

This commit restores the functionality to the original one, before
migrating to python: feed all the packages to smart, apart from attempt
only ones which are installed separately.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/rootfs.py |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b6baf77..5676275 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -317,10 +317,17 @@ class RpmRootfs(Rootfs):
 
         self.pm.update()
 
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                self.pm.install(pkgs_to_install[pkg_type],
-                                [False, True][pkg_type == "aop"])
+        pkgs = []
+        pkgs_attempt = []
+        for pkg_type in pkgs_to_install:
+            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
+                pkgs_attempt += pkgs_to_install[pkg_type]
+            else:
+                pkgs += pkgs_to_install[pkg_type]
+
+        self.pm.install(pkgs)
+
+        self.pm.install(pkgs_attempt, True)
 
         self.pm.install_complementary()
 
-- 
1.7.9.5


