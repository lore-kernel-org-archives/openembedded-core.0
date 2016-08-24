Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EFC8F76312
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2016 00:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620662"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:27 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:05 +0300
Message-Id: <1472022789-13028-16-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 15/19] oe-build-perf-test: add {git_commit_count} keyword for --commit-results-tag
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:35 -0000

Makes it possible to create easily sortable tags. Also, the default tag
format is updated to use the new keyword.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 1 +
 scripts/oe-build-perf-test      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index f29c167..97be58f 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -233,6 +233,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
                 # Find tags matching the pattern
                 tag_keywords = dict(git_branch=self.git_branch,
                                     git_commit=self.git_commit,
+                                    git_commit_count=self.git_commit_count,
                                     tester_host=self.hostname,
                                     tag_num='[0-9]{1,5}')
                 tag_re = re.compile(tag.format(**tag_keywords) + '$')
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index cd27584..35a4839 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -140,7 +140,7 @@ def parse_args(argv):
                         default="{git_branch}",
                         help="Commit results to branch BRANCH.")
     parser.add_argument('--commit-results-tag', metavar='TAG',
-                        default="{git_branch}/{git_commit}/{tag_num}",
+                        default="{git_branch}/{git_commit_count}-g{git_commit}/{tag_num}",
                         help="Tag results commit with TAG.")
 
     return parser.parse_args(argv)
-- 
2.6.6


