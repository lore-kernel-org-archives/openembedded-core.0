Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF9260069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040341"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:14 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:28:02 +0300
Message-Id: <1475159288-31921-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 05/11] scripts/buildstats-diff: introduce --diff-attr
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:13 -0000

A new command line option for choosing which "attribute" of the
buildstats to compare. At first, the already supported 'cputime' is the
only available option. But, refactoring done in this patch should make
it easy to add new attribute types.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 140 +++++++++++++++++++++++++++++-------------------
 1 file changed, 84 insertions(+), 56 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 56ac840..05bf74c 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -48,8 +48,7 @@ TIMEZONES = {'UTC': TimeZone(0, 'UTC'),
              'EET': TimeZone(7200, 'EET'),
              'EEST': TimeZone(10800, 'EEST')}
 
-
-taskdiff_fields = ('pkg', 'pkg_op', 'task', 'task_op', 'cputime1', 'cputime2',
+taskdiff_fields = ('pkg', 'pkg_op', 'task', 'task_op', 'value1', 'value2',
                    'absdiff', 'reldiff')
 TaskDiff = namedtuple('TaskDiff', ' '.join(taskdiff_fields))
 
@@ -272,16 +271,46 @@ def print_ver_diff(bs1, bs2):
             print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
 
 
-
-def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
+def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
     """Diff task execution times"""
+    def val_to_str(val, human_readable=False):
+        """Convert raw value to printable string"""
+        def hms_time(secs):
+            """Get time in human-readable HH:MM:SS format"""
+            h = int(secs / 3600)
+            m = int((secs % 3600) / 60)
+            s = secs % 60
+            if h == 0:
+                return "{:02d}:{:04.1f}".format(m, s)
+            else:
+                return "{:d}:{:02d}:{:04.1f}".format(h, m, s)
+
+        if val_type == 'cputime':
+            if human_readable:
+                return hms_time(val)
+            else:
+                return "{:.1f}s".format(val)
+        else:
+            return str(val)
+
+    def sum_vals(buildstats):
+        """Get cumulative sum of all tasks"""
+        total = 0.0
+        for recipe_data in buildstats.values():
+            for bs_task in recipe_data['tasks'].values():
+                total += getattr(bs_task, val_type)
+        return total
+
     tasks_diff = []
 
     if min_val:
-        print("Ignoring tasks shorter than {}s".format(min_val))
+        print("Ignoring tasks less than {} ({})".format(
+                val_to_str(min_val, True), val_to_str(min_val)))
     if min_absdiff:
-        print("Ignoring time differences shorter than {}s".format(min_absdiff))
+        print("Ignoring differences less than {} ({})".format(
+                val_to_str(min_absdiff, True), val_to_str(min_absdiff)))
 
+    # Prepare the data
     pkgs = set(bs1.keys()).union(set(bs2.keys()))
     for pkg in pkgs:
         tasks1 = bs1[pkg]['tasks'] if pkg in bs1 else {}
@@ -294,25 +323,27 @@ def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
             pkg_op = '  '
 
         for task in set(tasks1.keys()).union(set(tasks2.keys())):
-            t1 = bs1[pkg]['tasks'][task].cputime if task in tasks1 else 0
-            t2 = bs2[pkg]['tasks'][task].cputime if task in tasks2 else 0
+            val1 = getattr(bs1[pkg]['tasks'][task], val_type) if task in tasks1 else 0
+            val2 = getattr(bs2[pkg]['tasks'][task], val_type) if task in tasks2 else 0
             task_op = '  '
-            if t1 == 0:
+            if val1 == 0:
                 reldiff = float('inf')
                 task_op = '+ '
             else:
-                reldiff = 100 * (t2 - t1) / t1
-                if t2 == 0:
+                reldiff = 100 * (val2 - val1) / val1
+                if val2 == 0:
                     task_op = '- '
 
-            cputime = max(t1, t2)
-            if cputime < min_val:
-                log.debug("Filtering out %s:%s (%0.1fs)", pkg, task, cputime)
+            if max(val1, val2) < min_val:
+                log.debug("Filtering out %s:%s (%s)", pkg, task,
+                          val_to_str(max(val1, val2)))
                 continue
-            if abs(t2-t1) < min_absdiff:
-                log.debug("Filtering out %s:%s (difference of %0.1fs)", pkg, task, t2-t1)
+            if abs(val2 - val1) < min_absdiff:
+                log.debug("Filtering out %s:%s (difference of %s)", pkg, task,
+                          val_to_str(val2-val1))
                 continue
-            tasks_diff.append(TaskDiff(pkg, pkg_op, task, task_op, t1, t2, t2-t1, reldiff))
+            tasks_diff.append(TaskDiff(pkg, pkg_op, task, task_op, val1, val2,
+                                       val2-val1, reldiff))
 
     # Sort our list
     for field in reversed(sort_by):
@@ -323,17 +354,18 @@ def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
             reverse = False
         tasks_diff = sorted(tasks_diff, key=attrgetter(field), reverse=reverse)
 
-    linedata = [('  ', 'PKG', '  ', 'TASK', 'ABSDIFF', 'RELDIFF', 'CPUTIME1', 'CPUTIME2')]
+    linedata = [('  ', 'PKG', '  ', 'TASK', 'ABSDIFF', 'RELDIFF',
+                val_type.upper() + '1', val_type.upper() + '2')]
     field_lens = dict([('len_{}'.format(i), len(f)) for i, f in enumerate(linedata[0])])
 
     # Prepare fields in string format and measure field lengths
     for diff in tasks_diff:
         task_prefix = diff.task_op if diff.pkg_op == '  ' else '  '
         linedata.append((diff.pkg_op, diff.pkg, task_prefix, diff.task,
-                         '{:+.1f}'.format(diff.absdiff),
+                         val_to_str(diff.absdiff),
                          '{:+.1f}%'.format(diff.reldiff),
-                         '{:.1f}s'.format(diff.cputime1),
-                         '{:.1f}s'.format(diff.cputime2)))
+                         val_to_str(diff.value1),
+                         val_to_str(diff.value2)))
         for i, field in enumerate(linedata[-1]):
             key = 'len_{}'.format(i)
             if len(field) > field_lens[key]:
@@ -345,33 +377,14 @@ def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
         print("{:{len_0}}{:{len_1}}  {:{len_2}}{:{len_3}}  {:>{len_4}}  {:>{len_5}}  {:>{len_6}} -> {:{len_7}}".format(
                 *fields, **field_lens))
 
-
-def print_timediff_summary(bs1, bs2):
-    """Print summary of the timediffs"""
-    def total_cputime(buildstats):
-        sum = 0.0
-        for recipe_data in buildstats.values():
-            for bs_task in recipe_data['tasks'].values():
-                sum += bs_task.cputime
-        return sum
-
-    def hms_time(secs):
-        """Get time in human-readable HH:MM:SS format"""
-        h = int(secs / 3600)
-        m = int((secs % 3600) / 60)
-        s = secs % 60
-        if h == 0:
-            return "{:02d}:{:04.1f}".format(m, s)
-        else:
-            return "{:d}:{:02d}:{:04.1f}".format(h, m, s)
-
-    total1 = total_cputime(bs1)
-    total2 = total_cputime(bs2)
-    print("\nCumulative CPU Time:")
-    print ("  {:+.1f}s    {:+.1f}%    {} ({:.1f}s) -> {} ({:.1f}s)".format(
-                total2 - total1, 100 * (total2-total1) / total1,
-                hms_time(total1), total1, hms_time(total2), total2))
-
+    # Print summary of the diffs
+    total1 = sum_vals(bs1)
+    total2 = sum_vals(bs2)
+    print("\nCumulative {}:".format(val_type))
+    print ("  {}    {:+.1f}%    {} ({}) -> {} ({})".format(
+                val_to_str(total2 - total1), 100 * (total2-total1) / total1,
+                val_to_str(total1, True), val_to_str(total1),
+                val_to_str(total2, True), val_to_str(total2)))
 
 
 def parse_args(argv):
@@ -382,15 +395,21 @@ Script for comparing buildstats of two separate builds."""
             formatter_class=argparse.ArgumentDefaultsHelpFormatter,
             description=description)
 
+    min_val_defaults = {'cputime': 3.0}
+    min_absdiff_defaults = {'cputime': 1.0}
+
     parser.add_argument('--debug', '-d', action='store_true',
                         help="Verbose logging")
     parser.add_argument('--ver-diff', action='store_true',
                         help="Show package version differences and exit")
-    parser.add_argument('--min-val', default=3.0, type=float,
-                        help="Filter out tasks shorter than MIN_VAL seconds")
-    parser.add_argument('--min-absdiff', default=1.0, type=float,
-                        help="Filter out tasks whose difference in cputime is "
-                             "less that  MIN_ABSDIFF seconds")
+    parser.add_argument('--diff-attr', default='cputime', choices=('cputime',),
+                        help="Buildstat attribute which to compare")
+    parser.add_argument('--min-val', default=min_val_defaults, type=float,
+                        help="Filter out tasks less than MIN_VAL. "
+                             "Default depends on --diff-attr.")
+    parser.add_argument('--min-absdiff', default=min_absdiff_defaults, type=float,
+                        help="Filter out tasks whose difference is less than "
+                             "MIN_ABSDIFF, Default depends on --diff-attr.")
     parser.add_argument('--sort-by', default='absdiff',
                         help="Comma-separated list of field sort order. "
                              "Prepend the field name with '-' for reversed sort. "
@@ -398,7 +417,16 @@ Script for comparing buildstats of two separate builds."""
     parser.add_argument('buildstats1', metavar='BUILDSTATS1', help="'Left' buildstat")
     parser.add_argument('buildstats2', metavar='BUILDSTATS2', help="'Right' buildstat")
 
-    return parser.parse_args(argv)
+    args = parser.parse_args(argv)
+
+    # Handle defaults for the filter arguments
+    if args.min_val is min_val_defaults:
+        args.min_val = min_val_defaults[args.diff_attr]
+    if args.min_absdiff is min_absdiff_defaults:
+        args.min_absdiff = min_absdiff_defaults[args.diff_attr]
+
+    return args
+
 
 def main(argv=None):
     """Script entry point"""
@@ -422,8 +450,8 @@ def main(argv=None):
     if args.ver_diff:
         print_ver_diff(bs1, bs2)
     else:
-        print_task_diff(bs1, bs2, args.min_val, args.min_absdiff, sort_by)
-        print_timediff_summary(bs1, bs2)
+        print_task_diff(bs1, bs2, args.diff_attr, args.min_val,
+                        args.min_absdiff, sort_by)
 
     return 0
 
-- 
2.6.6


