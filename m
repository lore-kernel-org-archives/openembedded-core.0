Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5344D6AC4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213419"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:29 +1300
Message-Id: <25c17fdc4efda5dbe631b7ab72fc22cf8c900ce5.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/18] devtool: search: print SUMMARY value
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:12 -0000

Print the SUMMARY value for each matched item assuming it's not the
default.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/search.py | 77 +++++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index 1c8eaff..2ea4462 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -22,53 +22,60 @@ import bb
 import logging
 import argparse
 import re
-from devtool import setup_tinfoil, DevtoolError
+from devtool import setup_tinfoil, parse_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
 def search(args, config, basepath, workspace):
     """Entry point for the devtool 'search' subcommand"""
 
-    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
-    pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
-    tinfoil.shutdown()
+    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+    try:
+        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        defsummary = tinfoil.config_data.getVar('SUMMARY', False) or ''
 
-    keyword_rc = re.compile(args.keyword)
+        keyword_rc = re.compile(args.keyword)
 
-    for fn in os.listdir(pkgdata_dir):
-        pfn = os.path.join(pkgdata_dir, fn)
-        if not os.path.isfile(pfn):
-            continue
+        for fn in os.listdir(pkgdata_dir):
+            pfn = os.path.join(pkgdata_dir, fn)
+            if not os.path.isfile(pfn):
+                continue
 
-        packages = []
-        match = False
-        if keyword_rc.search(fn):
-            match = True
+            packages = []
+            match = False
+            if keyword_rc.search(fn):
+                match = True
 
-        if not match:
-            with open(pfn, 'r') as f:
-                for line in f:
-                    if line.startswith('PACKAGES:'):
-                        packages = line.split(':', 1)[1].strip().split()
+            if not match:
+                with open(pfn, 'r') as f:
+                    for line in f:
+                        if line.startswith('PACKAGES:'):
+                            packages = line.split(':', 1)[1].strip().split()
 
-            for pkg in packages:
-                if keyword_rc.search(pkg):
-                    match = True
-                    break
-                if os.path.exists(os.path.join(pkgdata_dir, 'runtime', pkg + '.packaged')):
-                    with open(os.path.join(pkgdata_dir, 'runtime', pkg), 'r') as f:
-                        for line in f:
-                            if ': ' in line:
-                                splitline = line.split(':', 1)
-                                key = splitline[0]
-                                value = splitline[1].strip()
-                            if key in ['PKG_%s' % pkg, 'DESCRIPTION', 'FILES_INFO'] or key.startswith('FILERPROVIDES_'):
-                                if keyword_rc.search(value):
-                                    match = True
-                                    break
+                for pkg in packages:
+                    if keyword_rc.search(pkg):
+                        match = True
+                        break
+                    if os.path.exists(os.path.join(pkgdata_dir, 'runtime', pkg + '.packaged')):
+                        with open(os.path.join(pkgdata_dir, 'runtime', pkg), 'r') as f:
+                            for line in f:
+                                if ': ' in line:
+                                    splitline = line.split(':', 1)
+                                    key = splitline[0]
+                                    value = splitline[1].strip()
+                                if key in ['PKG_%s' % pkg, 'DESCRIPTION', 'FILES_INFO'] or key.startswith('FILERPROVIDES_'):
+                                    if keyword_rc.search(value):
+                                        match = True
+                                        break
 
-        if match:
-            print(fn)
+            if match:
+                rd = parse_recipe(config, tinfoil, fn, True)
+                summary = rd.getVar('SUMMARY', True)
+                if summary == rd.expand(defsummary):
+                    summary = ''
+                print("%s  %s" % (fn.ljust(20), summary))
+    finally:
+        tinfoil.shutdown()
 
     return 0
 
-- 
2.1.0


