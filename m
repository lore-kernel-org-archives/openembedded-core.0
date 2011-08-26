Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QwrFs-00012V-Ri
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 09:55:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Aug 2011 00:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,283,1312182000"; d="scan'208";a="11274500"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Aug 2011 00:50:17 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 15:52:22 +0800
Message-Id: <c75c991a2a7ba813aa10ee21e242f41ffff04153.1314344548.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314344548.git.dongxiao.xu@intel.com>
References: <cover.1314344548.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314344548.git.dongxiao.xu@intel.com>
References: <cover.1314344548.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/5] multilib.bbclass: Fix renaming logic for "FILES_", "RDEPENDS_", etc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Aug 2011 07:55:09 -0000

In the orignal logic, the renaming will not work for "FILES_" if defined
variables as:

PACKAGES = "${PN}"
FILES_abc = "/usr/include/abc.h"

It is because ${PN} is "lib64-abc" so it will not be contained in
pkgrename.

This commit enumerates all element in PACKAGES, getting the original
packages and multilib packages, then doing renaming for "FILES_",
"RDEPENDS_", etc. This fixes a lot of missing files and incorrect
dependencies.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib.bbclass |   18 ++++++++----------
 1 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 571b7be..46c24e1 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -63,20 +63,18 @@ python __anonymous () {
             newvar.append(extend_name(v))
         d.setVar(varname, " ".join(newvar))
 
-    pkgs = []
-    pkgrename = {}
+    pkgs_mapping = []
     for pkg in (d.getVar("PACKAGES", True) or "").split():
         if pkg.startswith(variant):
-            pkgs.append(pkg)
+            pkgs_mapping.append([pkg.split(variant + "-")[1], pkg])
             continue
-        pkgrename[pkg] = extend_name(pkg)
-        pkgs.append(pkgrename[pkg])
+        pkgs_mapping.append([pkg, extend_name(pkg)])
 
-    if pkgrename:
-        d.setVar("PACKAGES", " ".join(pkgs))
-        for pkg in pkgrename:
-            for subs in ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY"]:
-                d.renameVar("%s_%s" % (subs, pkg), "%s_%s" % (subs, pkgrename[pkg]))
+    d.setVar("PACKAGES", " ".join([row[1] for row in pkgs_mapping]))
+
+    for pkg_mapping in pkgs_mapping:
+        for subs in ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY"]:
+            d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
 
     map_dependencies("DEPENDS", d)
     for pkg in (d.getVar("PACKAGES", True).split() + [""]):
-- 
1.7.1



