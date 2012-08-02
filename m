Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swrny-0002yR-IR
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551537"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:03 +0100
Message-Id: <131eeeda2ca99e6f01392b17a6da70feea6d1d9f.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/9] classes/buildhistory: remove unused functions
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

getlastrecipeversion and readRecipeInfo weren't called anywhere.
Remove them so we don't have to keep them up-to-date with future
additions to the recipe info file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index c3555da..510a6df 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -68,28 +68,6 @@ python buildhistory_emit_pkghistory() {
 
         return val
 
-    def readRecipeInfo(pn, histfile):
-        rcpinfo = RecipeInfo(pn)
-        f = open(histfile, "r")
-        try:
-            for line in f:
-                lns = line.split('=')
-                name = lns[0].strip()
-                value = lns[1].strip(" \t\r\n").strip('"')
-                if name == "PE":
-                    rcpinfo.pe = value
-                elif name == "PV":
-                    rcpinfo.pv = value
-                elif name == "PR":
-                    rcpinfo.pr = value
-                elif name == "DEPENDS":
-                    rcpinfo.depends = value
-                elif name == "PACKAGES":
-                    rcpinfo.packages = value
-        finally:
-            f.close()
-        return rcpinfo
-
     def readPackageInfo(pkg, histfile):
         pkginfo = PackageInfo(pkg)
         f = open(histfile, "r")
@@ -118,13 +96,6 @@ python buildhistory_emit_pkghistory() {
             f.close()
         return pkginfo
 
-    def getlastrecipeversion(pn):
-        try:
-            histfile = os.path.join(pkghistdir, "latest")
-            return readRecipeInfo(pn, histfile)
-        except EnvironmentError:
-            return None
-
     def getlastpkgversion(pkg):
         try:
             histfile = os.path.join(pkghistdir, pkg, "latest")
-- 
1.7.9.5



