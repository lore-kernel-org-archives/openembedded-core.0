Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 78530731F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 01:48:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2016 18:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,259,1470726000"; 
   d="scan'208";a="2895737"
Received: from ashuvini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.135])
	by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2016 18:48:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 13:48:06 +1200
Message-Id: <8fa0c221a4e40a09c5092ff658847bd9082fd666.1472607521.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1472607521.git.paul.eggleton@linux.intel.com>
References: <cover.1472607521.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1472607521.git.paul.eggleton@linux.intel.com>
References: <cover.1472607521.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] scripts/contrib: update scripts for changes to internal API
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
X-List-Received-Date: Wed, 31 Aug 2016 01:48:48 -0000

The multiconfig changes altered some of the functions being called here,
so update the calls. Make use of the new Tinfoil.parse_recipe_file()
function to make parsing easier.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/devtool-stress.py           | 6 +++---
 scripts/contrib/list-packageconfig-flags.py | 7 +++----
 scripts/contrib/verify-homepage.py          | 6 +++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
index 7ba0984..d555c51 100755
--- a/scripts/contrib/devtool-stress.py
+++ b/scripts/contrib/devtool-stress.py
@@ -43,15 +43,15 @@ def select_recipes(args):
     tinfoil = bb.tinfoil.Tinfoil()
     tinfoil.prepare(False)
 
-    pkg_pn = tinfoil.cooker.recipecache.pkg_pn
-    (latest_versions, preferred_versions) = bb.providers.findProviders(tinfoil.config_data, tinfoil.cooker.recipecache, pkg_pn)
+    pkg_pn = tinfoil.cooker.recipecaches[''].pkg_pn
+    (latest_versions, preferred_versions) = bb.providers.findProviders(tinfoil.config_data, tinfoil.cooker.recipecaches[''], pkg_pn)
 
     skip_classes = args.skip_classes.split(',')
 
     recipelist = []
     for pn in sorted(pkg_pn):
         pref = preferred_versions[pn]
-        inherits = [os.path.splitext(os.path.basename(f))[0] for f in tinfoil.cooker.recipecache.inherits[pref[1]]]
+        inherits = [os.path.splitext(os.path.basename(f))[0] for f in tinfoil.cooker.recipecaches[''].inherits[pref[1]]]
         for cls in skip_classes:
             if cls in inherits:
                 break
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 1af7de3..389fb97 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -37,7 +37,6 @@ if not bitbakepath:
     sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
     sys.exit(1)
 
-import bb.cache
 import bb.cooker
 import bb.providers
 import bb.tinfoil
@@ -45,7 +44,7 @@ import bb.tinfoil
 def get_fnlist(bbhandler, pkg_pn, preferred):
     ''' Get all recipe file names '''
     if preferred:
-        (latest_versions, preferred_versions) = bb.providers.findProviders(bbhandler.config_data, bbhandler.cooker.recipecache, pkg_pn)
+        (latest_versions, preferred_versions) = bb.providers.findProviders(bbhandler.config_data, bbhandler.cooker.recipecaches[''], pkg_pn)
 
     fn_list = []
     for pn in sorted(pkg_pn):
@@ -58,11 +57,11 @@ def get_fnlist(bbhandler, pkg_pn, preferred):
 
 def get_recipesdata(bbhandler, preferred):
     ''' Get data of all available recipes which have PACKAGECONFIG flags '''
-    pkg_pn = bbhandler.cooker.recipecache.pkg_pn
+    pkg_pn = bbhandler.cooker.recipecaches[''].pkg_pn
 
     data_dict = {}
     for fn in get_fnlist(bbhandler, pkg_pn, preferred):
-        data = bb.cache.Cache.loadDataFull(fn, bbhandler.cooker.collection.get_file_appends(fn), bbhandler.config_data)
+        data = bbhandler.parse_recipe_file(fn)
         flags = data.getVarFlags("PACKAGECONFIG")
         flags.pop('doc', None)
         if flags:
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 04917e8..d39dd1d 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -33,17 +33,17 @@ def wgetHomepage(pn, homepage):
         return 0
 
 def verifyHomepage(bbhandler):
-    pkg_pn = bbhandler.cooker.recipecache.pkg_pn
+    pkg_pn = bbhandler.cooker.recipecaches[''].pkg_pn
     pnlist = sorted(pkg_pn)
     count = 0
     checked = []
     for pn in pnlist:
         for fn in pkg_pn[pn]:
             # There's no point checking multiple BBCLASSEXTENDed variants of the same recipe
-            realfn, _ = bb.cache.Cache.virtualfn2realfn(fn)
+            realfn, _, _ = bb.cache.virtualfn2realfn(fn)
             if realfn in checked:
                 continue
-            data = bb.cache.Cache.loadDataFull(realfn, bbhandler.cooker.collection.get_file_appends(realfn), bbhandler.config_data)
+            data = bbhandler.parse_recipe_file(realfn)
             homepage = data.getVar("HOMEPAGE", True)
             if homepage:
                 try:
-- 
2.5.5


