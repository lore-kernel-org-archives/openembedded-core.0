Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qe3QW-0006ZZ-HA
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 13:04:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jul 2011 03:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,478,1304319600"; d="scan'208";a="26399744"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2011 03:51:03 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:51:32 +0800
Message-Id: <7415b32b2334a2e0f98c1a2f8d2df838f2954122.1309862610.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
References: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1309862610.git.lianhao.lu@intel.com>
References: <cover.1309862610.git.lianhao.lu@intel.com>
Subject: [MULTILIB_SUBTASK4 3/5] multilib/package.bbclass: Set PACKAGE_ARCH for multilib.
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
X-List-Received-Date: Tue, 05 Jul 2011 11:04:24 -0000

Set PACKAGE_ARCH in case of multilib.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/multilib.bbclass |   10 ++--------
 meta/classes/package.bbclass  |   11 +++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 17edc37..66d2df9 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -21,16 +21,10 @@ python multilib_virtclass_handler () {
         e.data.delVarFlags("libdir_virtclass-multilib-" + variant)
         e.data.setVar("target_libdir", libdir)
 
-        tarch = e.data.getVar("TARGET_ARCH", True)
-        parch = e.data.getVar("PACKAGE_ARCH", True)
-        baseparch = e.data.getVar("BASE_PACKAGE_ARCH", True)
-        if parch == tarch:
-            e.data.setVar("PACKAGE_ARCH", "${TARGET_ARCH}")
-        if baseparch == tarch:
-            e.data.setVar("BASE_PACKAGE_ARCH", "${TARGET_ARCH}")
-
     bb.data.setVar("PN", variant + "-" + bb.data.getVar("PN", e.data, False), e.data)
     bb.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,bb.data.getVar("SHLIBSDIR",e.data,False) + "/" + variant, e.data)
+    bb.data.setVar("PACKAGE_ARCH", "${BASE_PACKAGE_ARCH}" , e.data);
+    bb.data.setVar("BASE_PACKAGE_ARCH_virtclass-multilib-" + variant, "ml" + variant, e.data);
     bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", e.data, False) + override, e.data)
 }
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8f91c95..2ad2cf2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -166,6 +166,17 @@ python () {
         bb.data.setVarFlag('do_package', 'deptask', " ".join(deps), d)
     else:
         d.setVar("PACKAGERDEPTASK", "")
+
+    multilib_archs = []
+    multilibs= d.getVar('MULTILIBS', True) or ""
+    if multilibs:
+        for ext in multilibs.split():
+            eext = ext.split(':')
+            if len(eext) > 1:
+                if eext[0] == 'multilib':
+                    multilib_archs.append('ml' + eext[1])
+
+    d.setVar("MULTILIB_ARCHS", ' '.join(multilib_archs))
 }
 
 def splitfile(file, debugfile, debugsrcdir, d):
-- 
1.7.0.4



