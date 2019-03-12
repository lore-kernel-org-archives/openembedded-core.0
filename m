Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 62A877C741
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 05:36:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Mar 2019 22:36:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,469,1544515200"; d="scan'208";a="154177546"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2019 22:36:31 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 13:05:28 +0800
Message-Id: <1552367128-85252-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] resulttool/report: Enable roll-up report for a commit
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
X-List-Received-Date: Tue, 12 Mar 2019 05:36:31 -0000

Enable roll-up all test results belong to a commit
and to provide a roll-up report.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/report.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index ff1b32c..9008620 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -107,9 +107,17 @@ class ResultsTextReport(object):
                                  maxlen=maxlen)
         print(output)
 
-    def view_test_report(self, logger, source_dir, tag):
+    def view_test_report(self, logger, source_dir, branch, commit, tag):
         test_count_reports = []
-        if tag:
+        if commit:
+            if tag:
+                logger.warning("Ignoring --tag as --commit was specified")
+            tag_name = "{branch}/{commit_number}-g{commit}/{tag_number}"
+            repo = GitRepo(source_dir)
+            revs = gitarchive.get_test_revs(logger, repo, tag_name, branch=branch)
+            rev_index = gitarchive.rev_find(revs, 'commit', commit)
+            testresults = resultutils.git_get_result(repo, revs[rev_index][2])
+        elif tag:
             repo = GitRepo(source_dir)
             testresults = resultutils.git_get_result(repo, [tag])
         else:
@@ -125,7 +133,7 @@ class ResultsTextReport(object):
 
 def report(args, logger):
     report = ResultsTextReport()
-    report.view_test_report(logger, args.source_dir, args.tag)
+    report.view_test_report(logger, args.source_dir, args.branch, args.commit, args.tag)
     return 0
 
 def register_commands(subparsers):
@@ -136,5 +144,7 @@ def register_commands(subparsers):
     parser_build.set_defaults(func=report)
     parser_build.add_argument('source_dir',
                               help='source file/directory that contain the test result files to summarise')
+    parser_build.add_argument('--branch', '-B', default='master', help="Branch to find commit in")
+    parser_build.add_argument('--commit', help="Revision to report")
     parser_build.add_argument('-t', '--tag', default='',
                               help='source_dir is a git repository, report on the tag specified from that repository')
-- 
2.7.4


