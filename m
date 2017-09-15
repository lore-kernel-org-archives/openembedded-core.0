Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2229D784DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 13:04:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Sep 2017 06:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1172538626"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2017 06:04:44 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 16:04:39 +0300
Message-Id: <1d8d9d5d64d5a403aa16bb90ddc2c6cbc59b3d79.1505480244.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
References: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
References: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/4] scripts/buildstats-diff: move more code to lib/buildstats.py
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
X-List-Received-Date: Fri, 15 Sep 2017 13:04:44 -0000

More refactoring of buildstats-diff script. Move recipe version
comparison functionality to scripts/lib/buildstats.py. This patch also
compasses some wording changes, i.e. changing 'package' to 'recipe'.

[YOCTO #11382]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff   | 86 +++++++++++++++++------------------------------
 scripts/lib/buildstats.py | 31 ++++++++++++++++-
 2 files changed, 61 insertions(+), 56 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index ce82dabee9..a128dd324f 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -24,7 +24,7 @@ from operator import attrgetter
 # Import oe libs
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 sys.path.append(os.path.join(scripts_path, 'lib'))
-from buildstats import BuildStats, diff_buildstats, taskdiff_fields
+from buildstats import BuildStats, diff_buildstats, taskdiff_fields, BSVerDiff
 
 
 # Setup logging
@@ -76,72 +76,48 @@ def read_buildstats(path, multi):
 
 def print_ver_diff(bs1, bs2):
     """Print package version differences"""
-    pkgs1 = set(bs1.keys())
-    pkgs2 = set(bs2.keys())
-    new_pkgs = pkgs2 - pkgs1
-    deleted_pkgs = pkgs1 - pkgs2
-
-    echanged = []
-    vchanged = []
-    rchanged = []
-    unchanged = []
-    common_pkgs = pkgs2.intersection(pkgs1)
-    if common_pkgs:
-        for pkg in common_pkgs:
-            if bs1[pkg].epoch != bs2[pkg].epoch:
-                echanged.append(pkg)
-            elif bs1[pkg].version != bs2[pkg].version:
-                vchanged.append(pkg)
-            elif bs1[pkg].revision != bs2[pkg].revision:
-                rchanged.append(pkg)
-            else:
-                unchanged.append(pkg)
 
-    maxlen = max([len(pkg) for pkg in pkgs1.union(pkgs2)])
+    diff = BSVerDiff(bs1, bs2)
+
+    maxlen = max([len(r) for r in set(bs1.keys()).union(set(bs2.keys()))])
     fmt_str = "  {:{maxlen}} ({})"
-#    if unchanged:
-#        print("\nUNCHANGED PACKAGES:")
-#        print("-------------------")
-#        maxlen = max([len(pkg) for pkg in unchanged])
-#        for pkg in sorted(unchanged):
-#            print(fmt_str.format(pkg, bs2[pkg]['nevr'], maxlen=maxlen))
-
-    if new_pkgs:
-        print("\nNEW PACKAGES:")
-        print("-------------")
-        for pkg in sorted(new_pkgs):
-            print(fmt_str.format(pkg, bs2[pkg].nevr, maxlen=maxlen))
-
-    if deleted_pkgs:
-        print("\nDELETED PACKAGES:")
-        print("-----------------")
-        for pkg in sorted(deleted_pkgs):
-            print(fmt_str.format(pkg, bs1[pkg].nevr, maxlen=maxlen))
+
+    if diff.new:
+        print("\nNEW RECIPES:")
+        print("------------")
+        for name, val in sorted(diff.new.items()):
+            print(fmt_str.format(name, val.nevr, maxlen=maxlen))
+
+    if diff.dropped:
+        print("\nDROPPED RECIPES:")
+        print("----------------")
+        for name, val in sorted(diff.dropped.items()):
+            print(fmt_str.format(name, val.nevr, maxlen=maxlen))
 
     fmt_str = "  {0:{maxlen}} {1:<20}    ({2})"
-    if rchanged:
+    if diff.rchanged:
         print("\nREVISION CHANGED:")
         print("-----------------")
-        for pkg in sorted(rchanged):
-            field1 = "{} -> {}".format(pkg, bs1[pkg].revision, bs2[pkg].revision)
-            field2 = "{} -> {}".format(bs1[pkg].nevr, bs2[pkg].nevr)
-            print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
+        for name, val in sorted(diff.rchanged.items()):
+            field1 = "{} -> {}".format(val.left.revision, val.right.revision)
+            field2 = "{} -> {}".format(val.left.nevr, val.right.nevr)
+            print(fmt_str.format(name, field1, field2, maxlen=maxlen))
 
-    if vchanged:
+    if diff.vchanged:
         print("\nVERSION CHANGED:")
         print("----------------")
-        for pkg in sorted(vchanged):
-            field1 = "{} -> {}".format(bs1[pkg].version, bs2[pkg].version)
-            field2 = "{} -> {}".format(bs1[pkg].nevr, bs2[pkg].nevr)
-            print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
+        for name, val in sorted(diff.vchanged.items()):
+            field1 = "{} -> {}".format(val.left.version, val.right.version)
+            field2 = "{} -> {}".format(val.left.nevr, val.right.nevr)
+            print(fmt_str.format(name, field1, field2, maxlen=maxlen))
 
-    if echanged:
+    if diff.echanged:
         print("\nEPOCH CHANGED:")
         print("--------------")
-        for pkg in sorted(echanged):
-            field1 = "{} -> {}".format(bs1[pkg].epoch, bs2[pkg].epoch)
-            field2 = "{} -> {}".format(bs1[pkg].nevr, bs2[pkg].nevr)
-            print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
+        for name, val in sorted(diff.echanged.items()):
+            field1 = "{} -> {}".format(val.left.epoch, val.right.epoch)
+            field2 = "{} -> {}".format(val.left.nevr, val.right.nevr)
+            print(fmt_str.format(name, field1, field2, maxlen=maxlen))
 
 
 def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index bd6332176a..b1c9e617c6 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -15,7 +15,7 @@ import json
 import logging
 import os
 import re
-from collections import namedtuple
+from collections import namedtuple,OrderedDict
 from statistics import mean
 
 
@@ -307,3 +307,32 @@ def diff_buildstats(bs1, bs2, stat_attr, min_val=None, min_absdiff=None):
             tasks_diff.append(TaskDiff(pkg, pkg_op, task, task_op, val1, val2,
                                        val2-val1, reldiff))
     return tasks_diff
+
+
+class BSVerDiff(object):
+    """Class representing recipe version differences between two buildstats"""
+    def __init__(self, bs1, bs2):
+        RecipeVerDiff = namedtuple('RecipeVerDiff', 'left right')
+
+        recipes1 = set(bs1.keys())
+        recipes2 = set(bs2.keys())
+
+        self.new = dict([(r, bs2[r]) for r in sorted(recipes2 - recipes1)])
+        self.dropped = dict([(r, bs1[r]) for r in sorted(recipes1 - recipes2)])
+        self.echanged = {}
+        self.vchanged = {}
+        self.rchanged = {}
+        self.unchanged = {}
+
+        common = recipes2.intersection(recipes1)
+        if common:
+            for recipe in common:
+                rdiff = RecipeVerDiff(bs1[recipe], bs2[recipe])
+                if bs1[recipe].epoch != bs2[recipe].epoch:
+                    self.echanged[recipe] = rdiff
+                elif bs1[recipe].version != bs2[recipe].version:
+                    self.vchanged[recipe] = rdiff
+                elif bs1[recipe].revision != bs2[recipe].revision:
+                    self.rchanged[recipe] = rdiff
+                else:
+                    self.unchanged[recipe] = rdiff
-- 
2.12.3


