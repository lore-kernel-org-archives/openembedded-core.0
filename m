Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E8D6C78663
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:54:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 05:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1014792765"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2017 05:55:00 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:54:52 +0300
Message-Id: <ad5c3d813e5577524fc1a10f511ef149c03b87a7.1505479710.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/7] scripts/oe-build-perf-report: use --hostname in --list
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
X-List-Received-Date: Fri, 15 Sep 2017 12:55:00 -0000

Makes it possible to list test results for certain host only, instead of
always listing all results from all hosts.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index defd930b04..89d9d6f6b5 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -85,7 +85,9 @@ def get_test_runs(repo, tag_name, **kwargs):
 
 def list_test_revs(repo, tag_name, verbosity, **kwargs):
     """Get list of all tested revisions"""
-    fields, revs = get_test_runs(repo, tag_name, **kwargs)
+    valid_kwargs = dict([(k, v) for k, v in kwargs.items() if v is not None])
+
+    fields, revs = get_test_runs(repo, tag_name, **valid_kwargs)
     ignore_fields = ['tag_number']
     if verbosity < 2:
         extra_fields = ['COMMITS', 'TEST RUNS']
@@ -509,7 +511,7 @@ def main(argv=None):
     repo = GitRepo(args.repo)
 
     if args.list:
-        list_test_revs(repo, args.tag_name, args.list)
+        list_test_revs(repo, args.tag_name, args.list, hostname=args.hostname)
         return 0
 
     # Determine hostname which to use
-- 
2.12.3


