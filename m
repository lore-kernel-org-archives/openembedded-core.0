Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12312C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5668.1639013411655338325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504120"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504120"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298323"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 31/33] patch.py: Initialize git repo before patching
Date: Thu,  9 Dec 2021 09:29:30 +0800
Message-Id: 
 <4b567a984fe805b779bc59ce32635d32618e7170.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159431

From: Pavel Zhukov <pavel.zhukov@huawei.com>

If PATCHTOOL="git" has been specified but workdir is not git repo
bitbake fails to apply the patches with error message:
Command Error: 'git rev-parse --show-toplevel' exited with 0  Output:
fatal: not a git repository (or any of the parent directories): .git

Fix this by initializing the repo before patching.
This allows binary git patches to be applied.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6184b56a7a0fc6f5d19fdfb81e7453667f7da940)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/patch.py                    | 16 +++++++++++++++-
 meta/lib/oeqa/selftest/cases/bbtests.py | 15 +++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index fccbedb519..950fe723dc 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -4,6 +4,7 @@
 
 import oe.path
 import oe.types
+import subprocess
 
 class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
@@ -25,7 +26,6 @@ class CmdError(bb.BBHandledException):
 
 def runcmd(args, dir = None):
     import pipes
-    import subprocess
 
     if dir:
         olddir = os.path.abspath(os.curdir)
@@ -56,6 +56,7 @@ def runcmd(args, dir = None):
         if dir:
             os.chdir(olddir)
 
+
 class PatchError(Exception):
     def __init__(self, msg):
         self.msg = msg
@@ -298,6 +299,19 @@ class GitApplyTree(PatchTree):
         PatchTree.__init__(self, dir, d)
         self.commituser = d.getVar('PATCH_GIT_USER_NAME')
         self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL')
+        if not self._isInitialized():
+            self._initRepo()
+
+    def _isInitialized(self):
+        cmd = "git rev-parse --show-toplevel"
+        (status, output) = subprocess.getstatusoutput(cmd.split())
+        ## Make sure repo is in builddir to not break top-level git repos
+        return status == 0 and os.path.samedir(output, self.dir)
+
+    def _initRepo(self):
+        runcmd("git init".split(), self.dir)
+        runcmd("git add .".split(), self.dir)
+        runcmd("git commit -a --allow-empty -m Patching_started".split(), self.dir)
 
     @staticmethod
     def extractPatchHeader(patchfile):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 6562364074..9cd14aca4b 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -300,3 +300,18 @@ INHERIT:remove = \"report-error\"
 
         test_recipe_summary_after = get_bb_var('SUMMARY', test_recipe)
         self.assertEqual(expected_recipe_summary, test_recipe_summary_after)
+
+    def test_git_patchtool(self):
+        """ PATCHTOOL=git should work with non-git sources like tarballs
+            test recipe for the test must NOT containt git:// repository in SRC_URI
+        """
+        test_recipe = "man-db"
+        self.write_recipeinc(test_recipe, 'PATCHTOOL=\"git\"')
+        src = get_bb_var("SRC_URI",test_recipe)
+        gitscm = re.search("git://", src)
+        self.assertFalse(gitscm, "test_git_patchtool pre-condition failed: {} test recipe contains git repo!".format(test_recipe))
+        result = bitbake('man-db -c patch', ignore_status=False)
+        fatal = re.search("fatal: not a git repository (or any of the parent directories)", result.output)
+        self.assertFalse(fatal, "Failed to patch using PATCHTOOL=\"git\"")
+        self.delete_recipeinc(test_recipe)
+        bitbake('-cclean man-db')
-- 
2.33.1


