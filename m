Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swrny-0002yQ-8k
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551535"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:02 +0100
Message-Id: <eda59b1ce105699700744ab9124efb74c161c7ad.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/9] classes/buildhistory: ensure old package info is removed
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
X-List-Received-Date: Thu, 02 Aug 2012 09:34:54 -0000

If a package is removed from PACKAGES, ensure that the package info file
and directory are removed from buildhistory so that we don't have stale
data lying around.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f5494cd..c3555da 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -149,6 +149,19 @@ python buildhistory_emit_pkghistory() {
     pr = d.getVar('PR', True)
     packages = squashspaces(d.getVar('PACKAGES', True))
 
+    packagelist = packages.split()
+    if not os.path.exists(pkghistdir):
+        os.makedirs(pkghistdir)
+    else:
+        # Remove files for packages that no longer exist
+        for item in os.listdir(pkghistdir):
+            if item != "latest":
+                if item not in packagelist:
+                    subdir = os.path.join(pkghistdir, item)
+                    for subfile in os.listdir(subdir):
+                        os.unlink(os.path.join(subdir, subfile))
+                    os.rmdir(subdir)
+
     rcpinfo = RecipeInfo(pn)
     rcpinfo.pe = pe
     rcpinfo.pv = pv
@@ -159,7 +172,7 @@ python buildhistory_emit_pkghistory() {
 
     # Apparently the version can be different on a per-package basis (see Python)
     pkgdest = d.getVar('PKGDEST', True)
-    for pkg in packages.split():
+    for pkg in packagelist:
         pe = getpkgvar(pkg, 'PE') or "0"
         pv = getpkgvar(pkg, 'PV')
         pr = getpkgvar(pkg, 'PR')
@@ -206,9 +219,6 @@ def write_recipehistory(rcpinfo, d):
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
 
-    if not os.path.exists(pkghistdir):
-        os.makedirs(pkghistdir)
-
     infofile = os.path.join(pkghistdir, "latest")
     f = open(infofile, "w")
     try:
-- 
1.7.9.5



