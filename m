Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B4FC160017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:12 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040336"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:13 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:28:01 +0300
Message-Id: <1475159288-31921-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 04/11] scripts/buildstats-diff: do not hardcode field widths in output
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:12 -0000

Dynamically adjust the width of all fields in task diff output. Makes
it easier to print other units than cputime, too.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 60 ++++++++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 22c44ff..56ac840 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -276,13 +276,14 @@ def print_ver_diff(bs1, bs2):
 def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
     """Diff task execution times"""
     tasks_diff = []
-    pkg_maxlen = 0
-    task_maxlen = 0
+
+    if min_val:
+        print("Ignoring tasks shorter than {}s".format(min_val))
+    if min_absdiff:
+        print("Ignoring time differences shorter than {}s".format(min_absdiff))
 
     pkgs = set(bs1.keys()).union(set(bs2.keys()))
     for pkg in pkgs:
-        if len(pkg) > pkg_maxlen:
-            pkg_maxlen = len(pkg)
         tasks1 = bs1[pkg]['tasks'] if pkg in bs1 else {}
         tasks2 = bs2[pkg]['tasks'] if pkg in bs2 else {}
         if not tasks1:
@@ -293,9 +294,6 @@ def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
             pkg_op = '  '
 
         for task in set(tasks1.keys()).union(set(tasks2.keys())):
-            if len(task) > task_maxlen:
-                task_maxlen = len(task)
-
             t1 = bs1[pkg]['tasks'][task].cputime if task in tasks1 else 0
             t2 = bs2[pkg]['tasks'][task].cputime if task in tasks2 else 0
             task_op = '  '
@@ -307,18 +305,15 @@ def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
                 if t2 == 0:
                     task_op = '- '
 
+            cputime = max(t1, t2)
+            if cputime < min_val:
+                log.debug("Filtering out %s:%s (%0.1fs)", pkg, task, cputime)
+                continue
+            if abs(t2-t1) < min_absdiff:
+                log.debug("Filtering out %s:%s (difference of %0.1fs)", pkg, task, t2-t1)
+                continue
             tasks_diff.append(TaskDiff(pkg, pkg_op, task, task_op, t1, t2, t2-t1, reldiff))
 
-    if min_val:
-        print("Ignoring tasks shorter than {}s".format(min_val))
-    if min_absdiff:
-        print("Ignoring time differences shorter than {}s".format(min_absdiff))
-
-    print()
-    print("  {:{pkg_maxlen}}   {:{task_maxlen}} {:>8} {:>10} {:>10}    {}".format(
-            'PKG', 'TASK', 'ABSDIFF', 'RELDIFF', 'CPUTIME1', 'CPUTIME2',
-            pkg_maxlen=pkg_maxlen, task_maxlen=task_maxlen))
-
     # Sort our list
     for field in reversed(sort_by):
         if field.startswith('-'):
@@ -328,18 +323,27 @@ def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
             reverse = False
         tasks_diff = sorted(tasks_diff, key=attrgetter(field), reverse=reverse)
 
+    linedata = [('  ', 'PKG', '  ', 'TASK', 'ABSDIFF', 'RELDIFF', 'CPUTIME1', 'CPUTIME2')]
+    field_lens = dict([('len_{}'.format(i), len(f)) for i, f in enumerate(linedata[0])])
+
+    # Prepare fields in string format and measure field lengths
     for diff in tasks_diff:
-        cputime = max(diff.cputime1, diff.cputime2)
-        if cputime > min_val:
-            if abs(diff.absdiff) > min_absdiff:
-                task_prefix = diff.task_op if diff.pkg_op == '  ' else '  '
-                print("{}{:{pkg_maxlen}} {}{:{task_maxlen}} {:+7.1f}s {:+9.1f}% {:9.1f}s -> {:.1f}s".format(
-                        diff.pkg_op, diff.pkg, task_prefix, diff.task, diff.absdiff, diff.reldiff, diff.cputime1, diff.cputime2,
-                        pkg_maxlen=pkg_maxlen, task_maxlen=task_maxlen))
-            else:
-                log.debug("Filtering out %s (difference of %0.1fs)", task, diff.absdiff)
-        else:
-            log.debug("Filtering out %s (%0.1fs)", task, cputime)
+        task_prefix = diff.task_op if diff.pkg_op == '  ' else '  '
+        linedata.append((diff.pkg_op, diff.pkg, task_prefix, diff.task,
+                         '{:+.1f}'.format(diff.absdiff),
+                         '{:+.1f}%'.format(diff.reldiff),
+                         '{:.1f}s'.format(diff.cputime1),
+                         '{:.1f}s'.format(diff.cputime2)))
+        for i, field in enumerate(linedata[-1]):
+            key = 'len_{}'.format(i)
+            if len(field) > field_lens[key]:
+                field_lens[key] = len(field)
+
+    # Print data
+    print()
+    for fields in linedata:
+        print("{:{len_0}}{:{len_1}}  {:{len_2}}{:{len_3}}  {:>{len_4}}  {:>{len_5}}  {:>{len_6}} -> {:{len_7}}".format(
+                *fields, **field_lens))
 
 
 def print_timediff_summary(bs1, bs2):
-- 
2.6.6


