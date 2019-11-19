Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFD96C1C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:53:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Nov 2019 02:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="237289176"
Received: from ppatil-mobl1.amr.corp.intel.com (HELO shodan.fritz.box)
	([10.255.162.6])
	by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2019 02:52:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 23:52:52 +1300
Message-Id: <9370d34b2b6c8377b82da04c2b0777db70c74998.1574160556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574160556.git.paul.eggleton@linux.intel.com>
References: <cover.1574160556.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] devtool: fix devtool upgrade with reproducible_builds class
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
X-List-Received-Date: Tue, 19 Nov 2019 10:53:05 -0000
Content-Transfer-Encoding: 8bit

If the reproducible_build class is inherited then there may be a
"source-date-epoch" subdirectory in a fetched source tree; devtool
upgrade was not expecting that in the upgraded source. Take a small
snippet of code from recipetool create which already handles this,
and make it a shared function that can be used in both places.

Additionally, fix an assumption that the source is always in a
subdirectory in the cleanup code that blocked debugging this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py   |  5 +++--
 scripts/lib/recipetool/create.py |  4 +---
 scripts/lib/scriptutils.py       | 10 ++++++++++
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 18c5b66a29..cb6dce378a 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -32,7 +32,7 @@ def _run(cmd, cwd=''):
 
 def _get_srctree(tmpdir):
     srctree = tmpdir
-    dirs = os.listdir(tmpdir)
+    dirs = scriptutils.filter_src_subdirs(tmpdir)
     if len(dirs) == 1:
         srctree = os.path.join(tmpdir, dirs[0])
     return srctree
@@ -281,7 +281,8 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             logger.info('Preserving temporary directory %s' % tmpsrctree)
         else:
             shutil.rmtree(tmpsrctree)
-            shutil.rmtree(tmpdir)
+            if tmpdir != tmpsrctree:
+                shutil.rmtree(tmpdir)
 
     return (rev, md5, sha256, srcbranch, srcsubdir_rel)
 
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index b5c9f78843..4c4bbadb4c 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -495,9 +495,7 @@ def create_recipe(args):
         if ftmpdir and args.keep_temp:
             logger.info('Fetch temp directory is %s' % ftmpdir)
 
-        dirlist = os.listdir(srctree)
-        filterout = ['git.indirectionsymlink', 'source-date-epoch']
-        dirlist = [x for x in dirlist if x not in filterout]
+        dirlist = scriptutils.filter_src_subdirs(srctree)
         logger.debug('Directory listing (excluding filtered out):\n  %s' % '\n  '.join(dirlist))
         if len(dirlist) == 1:
             singleitem = os.path.join(srctree, dirlist[0])
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index c573dc7f67..45bdaf5f4e 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -268,3 +268,13 @@ def is_src_url(param):
     elif param.startswith('git@') or ('@' in param and param.endswith('.git')):
         return True
     return False
+
+def filter_src_subdirs(pth):
+    """
+    Filter out subdirectories of initial unpacked source trees that we do not care about.
+    Used by devtool and recipetool.
+    """
+    dirlist = os.listdir(pth)
+    filterout = ['git.indirectionsymlink', 'source-date-epoch']
+    dirlist = [x for x in dirlist if x not in filterout]
+    return dirlist
-- 
2.20.1


