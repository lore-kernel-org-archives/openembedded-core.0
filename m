Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0558A786F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 01:50:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2018 17:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,395,1515484800"; d="scan'208";a="206908236"
Received: from cthanang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.39])
	by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2018 17:50:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 14:50:00 +1300
Message-Id: <23837b7eb48113f6b43ad1a76d525e014f494b8d.1519609613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519609613.git.paul.eggleton@linux.intel.com>
References: <cover.1519609613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 7/8] devtool: search: also look in recipe cache
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
X-List-Received-Date: Mon, 26 Feb 2018 01:50:56 -0000

If pkgdata isn't present or is incomplete, then you get either a
traceback or you don't see the results you were hoping for. The recipe
cache that bitbake collects during startup contains some useful
information for each recipe that we could search through as well, and
we can access it easily using tinfoil's all_recipes() API function,
so add some code that does that. (We still show a warning if pkgdata
isn't present, as there are certain dynamic packages that are generated
at packaging time that won't show up in the cache).

One side-effect of this is that we will start showing non-target
recipes - that's actually a good thing, since seeing those is useful,
however we exclude nativesdk recipes when in the eSDK to avoid confusion
since nativesdk isn't directly applicable there.

Fixes [YOCTO #12356].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/search.py | 96 ++++++++++++++++++++++++++++---------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index 054985b85d5..b51a7b80207 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -36,44 +36,74 @@ def search(args, config, basepath, workspace):
 
         keyword_rc = re.compile(args.keyword)
 
-        for fn in os.listdir(pkgdata_dir):
-            pfn = os.path.join(pkgdata_dir, fn)
-            if not os.path.isfile(pfn):
+        def print_match(pn):
+            rd = parse_recipe(config, tinfoil, pn, True)
+            if not rd:
+                return
+            summary = rd.getVar('SUMMARY')
+            if summary == rd.expand(defsummary):
+                summary = ''
+            print("%s  %s" % (pn.ljust(20), summary))
+
+
+        matches = []
+        if os.path.exists(pkgdata_dir):
+            for fn in os.listdir(pkgdata_dir):
+                pfn = os.path.join(pkgdata_dir, fn)
+                if not os.path.isfile(pfn):
+                    continue
+
+                packages = []
+                match = False
+                if keyword_rc.search(fn):
+                    match = True
+
+                if not match:
+                    with open(pfn, 'r') as f:
+                        for line in f:
+                            if line.startswith('PACKAGES:'):
+                                packages = line.split(':', 1)[1].strip().split()
+
+                    for pkg in packages:
+                        if keyword_rc.search(pkg):
+                            match = True
+                            break
+                        if os.path.exists(os.path.join(pkgdata_dir, 'runtime', pkg + '.packaged')):
+                            with open(os.path.join(pkgdata_dir, 'runtime', pkg), 'r') as f:
+                                for line in f:
+                                    if ': ' in line:
+                                        splitline = line.split(':', 1)
+                                        key = splitline[0]
+                                        value = splitline[1].strip()
+                                    if key in ['PKG_%s' % pkg, 'DESCRIPTION', 'FILES_INFO'] or key.startswith('FILERPROVIDES_'):
+                                        if keyword_rc.search(value):
+                                            match = True
+                                            break
+                if match:
+                    print_match(fn)
+                    matches.append(fn)
+        else:
+            logger.warning('Package data is not available, results may be limited')
+
+        for recipe in tinfoil.all_recipes():
+            if args.fixed_setup and 'nativesdk' in recipe.inherits():
                 continue
 
-            packages = []
             match = False
-            if keyword_rc.search(fn):
+            if keyword_rc.search(recipe.pn):
                 match = True
-
-            if not match:
-                with open(pfn, 'r') as f:
-                    for line in f:
-                        if line.startswith('PACKAGES:'):
-                            packages = line.split(':', 1)[1].strip().split()
-
-                for pkg in packages:
-                    if keyword_rc.search(pkg):
+            else:
+                for prov in recipe.provides:
+                    if keyword_rc.search(prov):
                         match = True
                         break
-                    if os.path.exists(os.path.join(pkgdata_dir, 'runtime', pkg + '.packaged')):
-                        with open(os.path.join(pkgdata_dir, 'runtime', pkg), 'r') as f:
-                            for line in f:
-                                if ': ' in line:
-                                    splitline = line.split(':', 1)
-                                    key = splitline[0]
-                                    value = splitline[1].strip()
-                                if key in ['PKG_%s' % pkg, 'DESCRIPTION', 'FILES_INFO'] or key.startswith('FILERPROVIDES_'):
-                                    if keyword_rc.search(value):
-                                        match = True
-                                        break
-
-            if match:
-                rd = parse_recipe(config, tinfoil, fn, True)
-                summary = rd.getVar('SUMMARY')
-                if summary == rd.expand(defsummary):
-                    summary = ''
-                print("%s  %s" % (fn.ljust(20), summary))
+                if not match:
+                    for rprov in recipe.rprovides:
+                        if keyword_rc.search(rprov):
+                            match = True
+                            break
+            if match and not recipe.pn in matches:
+                print_match(recipe.pn)
     finally:
         tinfoil.shutdown()
 
@@ -85,4 +115,4 @@ def register_commands(subparsers, context):
                                             description='Searches for available target recipes. Matches on recipe name, package name, description and installed files, and prints the recipe name on match.',
                                             group='info')
     parser_search.add_argument('keyword', help='Keyword to search for (regular expression syntax allowed)')
-    parser_search.set_defaults(func=search, no_workspace=True)
+    parser_search.set_defaults(func=search, no_workspace=True, fixed_setup=context.fixed_setup)
-- 
2.14.3


