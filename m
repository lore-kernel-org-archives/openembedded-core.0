Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE9EB71C86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:18:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="86877677"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2017 04:18:50 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:18:43 +0300
Message-Id: <141b1220659f0d4c8ab250031993f34144b2350d.1494846894.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/5] oe-build-perf-report: two verbosity levels for --list
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
X-List-Received-Date: Mon, 15 May 2017 11:18:50 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 45 ++++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index fc32fbe39a..34591bec16 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -79,29 +79,50 @@ def get_test_runs(repo, tag_name, **kwargs):
     # Return field names and a sorted list of revs
     return undef_fields, sorted(revs)
 
-def list_test_revs(repo, tag_name, **kwargs):
+def list_test_revs(repo, tag_name, verbosity, **kwargs):
     """Get list of all tested revisions"""
     fields, revs = get_test_runs(repo, tag_name, **kwargs)
     ignore_fields = ['tag_number']
+    if verbosity < 2:
+        extra_fields = ['COMMITS', 'TEST RUNS']
+        ignore_fields.extend(['commit_number', 'commit'])
+    else:
+        extra_fields = ['TEST RUNS']
+
     print_fields = [i for i, f in enumerate(fields) if f not in ignore_fields]
 
     # Sort revs
-    rows = [[fields[i].upper() for i in print_fields] + ['TEST RUNS']]
-    prev = [''] * len(revs)
+    rows = [[fields[i].upper() for i in print_fields] + extra_fields]
+
+    prev = [''] * len(print_fields)
+    prev_commit = None
+    commit_cnt = 0
+    commit_field = fields.index('commit')
     for rev in revs:
         # Only use fields that we want to print
-        rev = [rev[i] for i in print_fields]
+        cols = [rev[i] for i in print_fields]
+
+
+        if cols != prev:
+            commit_cnt = 1
+            test_run_cnt = 1
+            new_row = [''] * (len(print_fields) + len(extra_fields))
 
-        if rev != prev:
-            new_row = [''] * len(print_fields) + [1]
             for i in print_fields:
-                if rev[i] != prev[i]:
+                if cols[i] != prev[i]:
                     break
-            new_row[i:-1] = rev[i:]
+            new_row[i:-len(extra_fields)] = cols[i:]
             rows.append(new_row)
         else:
-            rows[-1][-1] += 1
-        prev = rev
+            if rev[commit_field] != prev_commit:
+                commit_cnt += 1
+            test_run_cnt += 1
+
+        if verbosity < 2:
+            new_row[-2] = commit_cnt
+        new_row[-1] = test_run_cnt
+        prev = cols
+        prev_commit = rev[commit_field]
 
     print_table(rows)
 
@@ -408,7 +429,7 @@ Examine build performance test results from a Git repository"""
                         help="Verbose logging")
     parser.add_argument('--repo', '-r', required=True,
                         help="Results repository (local git clone)")
-    parser.add_argument('--list', '-l', action='store_true',
+    parser.add_argument('--list', '-l', action='count',
                         help="List available test runs")
     parser.add_argument('--html', action='store_true',
                         help="Generate report in html format")
@@ -444,7 +465,7 @@ def main(argv=None):
     repo = GitRepo(args.repo)
 
     if args.list:
-        list_test_revs(repo, args.tag_name)
+        list_test_revs(repo, args.tag_name, args.list)
         return 0
 
     # Determine hostname which to use
-- 
2.12.0


