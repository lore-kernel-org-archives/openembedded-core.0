Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6C73E6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620646"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:25 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:03 +0300
Message-Id: <1472022789-13028-14-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 13/19] oe-build-perf-test: new {tag_num} keyword for --commit-results-tag
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:26 -0000

This makes it possible to create numbered tags, where the "basename" of
the tag is the same and the only difference is an (automatically)
increasing index number. This is useful if you do multiple test runs on
the same commit. For example, using:
--commit-results-tag {tester_host}/{git_commit}/{tag_num}

would give you tags something like:
myhost/decb3119dffd3fd38b800bebc1e510f9217a152e/0
myhost/decb3119dffd3fd38b800bebc1e510f9217a152e/1
...

The default tag format is updated to use this new keyword in order to
prevent unintentional tag name clashes.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 19 +++++++++++++++----
 scripts/oe-build-perf-test      |  2 +-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index a3cd3f3..faa30c7 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -226,10 +226,21 @@ class BuildPerfTestResult(unittest.TextTestResult):
 
             # Create (annotated) tag
             if tag:
-                # Replace keywords
-                tag = tag.format(git_branch=self.git_branch,
-                                 git_commit=self.git_commit,
-                                 tester_host=self.hostname)
+                # Find tags matching the pattern
+                tag_keywords = dict(git_branch=self.git_branch,
+                                    git_commit=self.git_commit,
+                                    tester_host=self.hostname,
+                                    tag_num='[0-9]{1,5}')
+                tag_re = re.compile(tag.format(**tag_keywords) + '$')
+                tag_keywords['tag_num'] = 0
+                for existing_tag in repo.run_cmd('tag').splitlines():
+                    if tag_re.match(existing_tag):
+                        tag_keywords['tag_num'] += 1
+
+                tag = tag.format(**tag_keywords)
+                msg = "Test run #{} of {}:{}\n".format(tag_keywords['tag_num'],
+                                                       self.git_branch,
+                                                       self.git_commit)
                 repo.run_cmd(['tag', '-a', '-m', msg, tag, commit])
 
         finally:
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 1ed5bdb..cd27584 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -140,7 +140,7 @@ def parse_args(argv):
                         default="{git_branch}",
                         help="Commit results to branch BRANCH.")
     parser.add_argument('--commit-results-tag', metavar='TAG',
-                        default="{git_branch}/{git_commit}",
+                        default="{git_branch}/{git_commit}/{tag_num}",
                         help="Tag results commit with TAG.")
 
     return parser.parse_args(argv)
-- 
2.6.6


