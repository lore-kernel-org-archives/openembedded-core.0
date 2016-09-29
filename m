Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF17860017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040329"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:11 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:27:59 +0300
Message-Id: <1475159288-31921-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 02/11] scripts/buildstats-diff: rename --min-time and --min-timediff args
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:10 -0000

Rename these arguments to --min-val and --min-absdiff in preparation for
supporting other "quantities" than just cputime.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index d0cd766..7728b6d 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -260,7 +260,7 @@ def task_time(task):
     return cputime
 
 
-def print_task_diff(bs1, bs2, min_cputime=0, min_timediff=0, sort_by=('absdiff',)):
+def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
     """Diff task execution times"""
     tasks_diff = []
     pkg_maxlen = 0
@@ -296,10 +296,10 @@ def print_task_diff(bs1, bs2, min_cputime=0, min_timediff=0, sort_by=('absdiff',
 
             tasks_diff.append(TaskDiff(pkg, pkg_op, task, task_op, t1, t2, t2-t1, reldiff))
 
-    if min_cputime:
-        print("Ignoring tasks shorter than {}s".format(min_cputime))
-    if min_timediff:
-        print("Ignoring time differences shorter than {}s".format(min_timediff))
+    if min_val:
+        print("Ignoring tasks shorter than {}s".format(min_val))
+    if min_absdiff:
+        print("Ignoring time differences shorter than {}s".format(min_absdiff))
 
     print()
     print("  {:{pkg_maxlen}}   {:{task_maxlen}} {:>8} {:>10} {:>10}    {}".format(
@@ -317,8 +317,8 @@ def print_task_diff(bs1, bs2, min_cputime=0, min_timediff=0, sort_by=('absdiff',
 
     for diff in tasks_diff:
         cputime = max(diff.cputime1, diff.cputime2)
-        if cputime > min_cputime:
-            if abs(diff.absdiff) > min_timediff:
+        if cputime > min_val:
+            if abs(diff.absdiff) > min_absdiff:
                 task_prefix = diff.task_op if diff.pkg_op == '  ' else '  '
                 print("{}{:{pkg_maxlen}} {}{:{task_maxlen}} {:+7.1f}s {:+9.1f}% {:9.1f}s -> {:.1f}s".format(
                         diff.pkg_op, diff.pkg, task_prefix, diff.task, diff.absdiff, diff.reldiff, diff.cputime1, diff.cputime2,
@@ -369,11 +369,11 @@ Script for comparing buildstats of two separate builds."""
                         help="Verbose logging")
     parser.add_argument('--ver-diff', action='store_true',
                         help="Show package version differences and exit")
-    parser.add_argument('--min-time', default=3.0, type=float,
-                        help="Filter out tasks shorter than MIN_TIME seconds")
-    parser.add_argument('--min-timediff', default=1.0, type=float,
+    parser.add_argument('--min-val', default=3.0, type=float,
+                        help="Filter out tasks shorter than MIN_VAL seconds")
+    parser.add_argument('--min-absdiff', default=1.0, type=float,
                         help="Filter out tasks whose difference in cputime is "
-                             "less that  MIN_TIMEDIFF seconds")
+                             "less that  MIN_ABSDIFF seconds")
     parser.add_argument('--sort-by', default='absdiff',
                         help="Comma-separated list of field sort order. "
                              "Prepend the field name with '-' for reversed sort. "
@@ -405,7 +405,7 @@ def main(argv=None):
     if args.ver_diff:
         print_ver_diff(bs1, bs2)
     else:
-        print_task_diff(bs1, bs2, args.min_time, args.min_timediff, sort_by)
+        print_task_diff(bs1, bs2, args.min_val, args.min_absdiff, sort_by)
         print_timediff_summary(bs1, bs2)
 
     return 0
-- 
2.6.6


