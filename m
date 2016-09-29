Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8A85360116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:14 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040344"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:15 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:28:03 +0300
Message-Id: <1475159288-31921-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 06/11] scripts/buildstats-diff: add read_bytes and write_bytes to --diff-attr
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:14 -0000

These are I/O counter values from /proc/<pid>/io and represent the
number of bytes read from / written to the storage layer. Default values
for --min-val and --min-absdiff limits are set to 512kB and 128kB,
respectively.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 46 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 05bf74c..3c894cb 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -17,6 +17,7 @@ import argparse
 import glob
 import json
 import logging
+import math
 import os
 import re
 import sys
@@ -77,6 +78,15 @@ class BSTask(dict):
         return self['rusage']['ru_stime'] + self['rusage']['ru_utime'] + \
                self['child_rusage']['ru_stime'] + self['child_rusage']['ru_utime']
 
+    @property
+    def read_bytes(self):
+        """Bytes read from the block layer"""
+        return self['iostat']['read_bytes']
+
+    @property
+    def write_bytes(self):
+        """Bytes written to the block layer"""
+        return self['iostat']['write_bytes']
 
 def read_buildstats_file(buildstat_file):
     """Convert buildstat text file into dict/json"""
@@ -290,8 +300,13 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
                 return hms_time(val)
             else:
                 return "{:.1f}s".format(val)
-        else:
-            return str(val)
+        elif 'bytes' in val_type and human_readable:
+                prefix = ['', 'Ki', 'Mi', 'Gi', 'Ti', 'Pi']
+                dec = int(math.log(val, 2) / 10)
+                prec = 1 if dec > 0 else 0
+                return "{:.{prec}f}{}B".format(val / (2 ** (10 * dec)),
+                                               prefix[dec], prec=prec)
+        return str(int(val))
 
     def sum_vals(buildstats):
         """Get cumulative sum of all tasks"""
@@ -323,16 +338,22 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
             pkg_op = '  '
 
         for task in set(tasks1.keys()).union(set(tasks2.keys())):
-            val1 = getattr(bs1[pkg]['tasks'][task], val_type) if task in tasks1 else 0
-            val2 = getattr(bs2[pkg]['tasks'][task], val_type) if task in tasks2 else 0
             task_op = '  '
+            if task in tasks1:
+                val1 = getattr(bs1[pkg]['tasks'][task], val_type)
+            else:
+                task_op = '+ '
+                val1 = 0
+            if task in tasks2:
+                val2 = getattr(bs2[pkg]['tasks'][task], val_type)
+            else:
+                val2 = 0
+                task_op = '- '
+
             if val1 == 0:
                 reldiff = float('inf')
-                task_op = '+ '
             else:
                 reldiff = 100 * (val2 - val1) / val1
-                if val2 == 0:
-                    task_op = '- '
 
             if max(val1, val2) < min_val:
                 log.debug("Filtering out %s:%s (%s)", pkg, task,
@@ -395,14 +416,19 @@ Script for comparing buildstats of two separate builds."""
             formatter_class=argparse.ArgumentDefaultsHelpFormatter,
             description=description)
 
-    min_val_defaults = {'cputime': 3.0}
-    min_absdiff_defaults = {'cputime': 1.0}
+    min_val_defaults = {'cputime': 3.0,
+                        'read_bytes': 524288,
+                        'write_bytes': 524288}
+    min_absdiff_defaults = {'cputime': 1.0,
+                            'read_bytes': 131072,
+                            'write_bytes': 131072}
 
     parser.add_argument('--debug', '-d', action='store_true',
                         help="Verbose logging")
     parser.add_argument('--ver-diff', action='store_true',
                         help="Show package version differences and exit")
-    parser.add_argument('--diff-attr', default='cputime', choices=('cputime',),
+    parser.add_argument('--diff-attr', default='cputime',
+                        choices=('cputime', 'read_bytes', 'write_bytes'),
                         help="Buildstat attribute which to compare")
     parser.add_argument('--min-val', default=min_val_defaults, type=float,
                         help="Filter out tasks less than MIN_VAL. "
-- 
2.6.6


