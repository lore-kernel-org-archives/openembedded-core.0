Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2lA0-0004O3-0f
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:14:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Feb 2013 07:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="283086275"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2013 07:58:22 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 17:59:11 +0200
Message-Id: <1360079951-3674-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] classextend.py: use explode_dep_versions2 in order to preserve versions too
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:14:21 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/lib/oe/classextend.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 61cbb8f..c37a896 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -63,11 +63,12 @@ class ClassExtender(object):
         deps = self.d.getVar(varname, True)
         if not deps:
             return
-        deps = bb.utils.explode_deps(deps)
-        newdeps = []
+        deps = bb.utils.explode_dep_versions2(deps)
+        newdeps = {}
         for dep in deps:
-            newdeps.append(self.map_depends(dep))
-        self.d.setVar(varname, " ".join(newdeps))
+            newdeps[self.map_depends(dep)] = deps[dep]
+
+        self.d.setVar(varname, bb.utils.join_deps(newdeps, False))
 
     def map_packagevars(self):
         for pkg in (self.d.getVar("PACKAGES", True).split() + [""]):
-- 
1.7.11.7



