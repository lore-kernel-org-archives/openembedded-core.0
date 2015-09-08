Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 595F275E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537210"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:07 +0100
Message-Id: <61be2ad94304eb9d39e1a80a744c7a3750b85702.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/9] scriptutils: split out simple fetching function from recipetool
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:34 -0000

This will now also be used by "devtool upgrade".

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 30 +-----------------------------
 scripts/lib/scriptutils.py       | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ec6e107..c4754db 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -58,34 +58,6 @@ class RecipeHandler():
 
 
 
-def fetch_source(uri, destdir, srcrev):
-    import bb.data
-    bb.utils.mkdirhier(destdir)
-    localdata = bb.data.createCopy(tinfoil.config_data)
-    bb.data.update_data(localdata)
-    localdata.setVar('BB_STRICT_CHECKSUM', '')
-    localdata.setVar('SRCREV', srcrev)
-    ret = (None, None)
-    olddir = os.getcwd()
-    try:
-        fetcher = bb.fetch2.Fetch([uri], localdata)
-        for u in fetcher.ud:
-            ud = fetcher.ud[u]
-            ud.ignore_checksums = True
-        fetcher.download()
-        fetcher.unpack(destdir)
-        for u in fetcher.ud:
-            ud = fetcher.ud[u]
-            if ud.method.recommends_checksum(ud):
-                md5value = bb.utils.md5_file(ud.localpath)
-                sha256value = bb.utils.sha256_file(ud.localpath)
-                ret = (md5value, sha256value)
-    except bb.fetch2.BBFetchException, e:
-        raise bb.build.FuncFailed(e)
-    finally:
-        os.chdir(olddir)
-    return ret
-
 def supports_srcrev(uri):
     localdata = bb.data.createCopy(tinfoil.config_data)
     # This is a bit sad, but if you don't have this set there can be some
@@ -123,7 +95,7 @@ def create_recipe(args):
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
         logger.info('Fetching %s...' % srcuri)
-        checksums = fetch_source(args.source, srctree, srcrev)
+        checksums = scriptutils.fetch_uri(tinfoil.config_data, args.source, srctree, srcrev)
         dirlist = os.listdir(srctree)
         if 'git.indirectionsymlink' in dirlist:
             dirlist.remove('git.indirectionsymlink')
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index fdf4b5d..5d103a5 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -69,3 +69,30 @@ def git_convert_standalone_clone(repodir):
             # of the contents is shared
             bb.process.run('git repack -a', cwd=repodir)
             os.remove(alternatesfile)
+
+def fetch_uri(d, uri, destdir, srcrev=None):
+    """Fetch a URI to a local directory"""
+    import bb.data
+    bb.utils.mkdirhier(destdir)
+    localdata = bb.data.createCopy(d)
+    localdata.setVar('BB_STRICT_CHECKSUM', '')
+    localdata.setVar('SRCREV', srcrev)
+    ret = (None, None)
+    olddir = os.getcwd()
+    try:
+        fetcher = bb.fetch2.Fetch([uri], localdata)
+        for u in fetcher.ud:
+            ud = fetcher.ud[u]
+            ud.ignore_checksums = True
+        fetcher.download()
+        fetcher.unpack(destdir)
+        for u in fetcher.ud:
+            ud = fetcher.ud[u]
+            if ud.method.recommends_checksum(ud):
+                md5value = bb.utils.md5_file(ud.localpath)
+                sha256value = bb.utils.sha256_file(ud.localpath)
+                ret = (md5value, sha256value)
+    finally:
+        os.chdir(olddir)
+    return ret
+
-- 
2.1.0


