Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVOAe-0000XI-3e
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:28:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2012 07:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145583551"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.139])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2012 07:18:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2012 17:18:13 +0300
Message-Id: <85c5eba684762030ce443c521f07905cd8f5aa5f.1337350637.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/9] multilib.bbclass: Added multilib specific package QA.
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
X-List-Received-Date: Fri, 18 May 2012 14:28:44 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

Added a new PACKAGEFUNCS function to check the multilib packages'
dependency.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/multilib.bbclass |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index c2d2f85..f3e7618 100644
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
+            if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)):
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
1.7.7.6



