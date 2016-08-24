Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DEAC0731B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620640"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:22 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:01 +0300
Message-Id: <1472022789-13028-12-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 11/19] oe-build-perf-test: pre-check Git repo when using --commit-results
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

Do a pre-check on the path that is specified with --commit-results
before running any tests. The script will create and/or initialize a
fresh Git repository if the given directory does not exist or if it is
an empty directory. It fails if it finds a non-empty directory that is
not a Git repository.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 390e4c9..437611c 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -31,6 +31,7 @@ import oeqa.buildperf
 from oeqa.buildperf import (BuildPerfTestLoader, BuildPerfTestResult,
                             BuildPerfTestRunner, KernelDropCaches)
 from oeqa.utils.commands import runCmd
+from oeqa.utils.git import GitRepo, GitError
 
 
 # Set-up logging
@@ -68,7 +69,30 @@ def pre_run_sanity_check():
     if ret.status:
         log.error("bitbake command not found")
         return False
+    return True
 
+def init_git_repo(path):
+    """Check/create Git repository where to store results"""
+    path = os.path.abspath(path)
+    if os.path.isfile(path):
+        log.error("Invalid Git repo %s: path exists but is not a directory", path)
+        return False
+    if not os.path.isdir(path):
+        try:
+            os.mkdir(path)
+        except (FileNotFoundError, PermissionError) as err:
+            log.error("Failed to mkdir %s: %s", path, err)
+            return False
+    if not os.listdir(path):
+        log.info("Initializing a new Git repo at %s", path)
+        GitRepo.init(path)
+    try:
+        GitRepo(path, is_topdir=True)
+    except GitError:
+        log.error("No Git repository but a non-empty directory found at %s.\n"
+                  "Please specify a Git repository, an empty directory or "
+                  "a non-existing directory", path)
+        return False
     return True
 
 
@@ -137,6 +161,9 @@ def main(argv=None):
 
     if not pre_run_sanity_check():
         return 1
+    if args.commit_results:
+        if not init_git_repo(args.commit_results):
+            return 1
 
     # Check our capability to drop caches and ask pass if needed
     KernelDropCaches.check()
-- 
2.6.6


