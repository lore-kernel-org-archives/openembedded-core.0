Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SNdVh-00018f-4d
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 07:14:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Apr 2012 22:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158918971"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2012 22:04:45 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2012 13:04:01 +0800
Message-Id: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1335498445.git.lianhao.lu@intel.com>
References: <cover.1335498445.git.lianhao.lu@intel.com>
Subject: [PATCH 1/7] multilib.bbclass: Added multilib specific package QA.
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
X-List-Received-Date: Fri, 27 Apr 2012 05:14:25 -0000

Added a new PACKAGEFUNCS function to check the multilib packages'
dependency.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/multilib.bbclass |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index c2d2f85..58cd113 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -66,3 +66,34 @@ python __anonymous () {
     clsextend.map_variable("PACKAGE_INSTALL")
     clsextend.map_variable("INITSCRIPT_PACKAGES")
 }
+
+PACKAGEFUNCS_append = "do_package_qa_multilib"
+
+python do_package_qa_multilib() {
+
+    def check_mlprefix(pkg, var, mlprefix):
+        values = bb.utils.explode_dep_versions(d.getVar('%s_%s' % (var, pkg), True) or d.getVar(var, True) or "")
+        candidates = []
+        for i in values.keys():
+            if i.startswith('virtual/'):
+                i = i[len('virtual/'):]
+            if not i.startswith(mlprefix):
+                candidates.append(i)
+        if len(candidates) > 0:
+            bb.warn("Multilib QA Issue: %s package %s - suspicious values '%s' in %s" 
+                   % (d.getVar('PN', True), pkg, ' '.join(candidates), var))
+
+    ml = d.getVar('MLPREFIX', True)
+    if not ml:
+        return
+
+    packages = d.getVar('PACKAGES', True)
+    for pkg in packages.split():
+        check_mlprefix(pkg, 'RDEPENDS', ml)
+        check_mlprefix(pkg, 'RPROVIDES', ml)
+        check_mlprefix(pkg, 'RRECOMMENDS', ml)
+        check_mlprefix(pkg, 'RSUGGESTS', ml)
+        check_mlprefix(pkg, 'RREPLACES', ml)
+        check_mlprefix(pkg, 'RCONFLICTS', ml)
+}
+
-- 
1.7.0.4



