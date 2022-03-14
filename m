Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58D7C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:03:06 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.21809.1647223382157051029
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=eCYwZNwz;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647223385; x=1678759385;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PRLXXMmDX7l+WfUohlQWqcTPB/JbupI5KP6DqhDfgEI=;
  b=eCYwZNwzbbMqrZ8D1nCO4DD8bcqFEImh6BAF+a1B8JndqLKA+k5r3UtZ
   5S881Hz8Rzl0EPhohBn2yoDrJ6gFS8hgG00wyfZxOm4pvXKbCCrB2upK7
   kBdumH3J8HJa7LZ0acevAEi3QEBX7cz17T30Y3qS4v5G1zUxtZBhIfHEz
   XAG0OLzwIs+BmZ5Vr8SUVKKXukgW8Qf7LQTSRj3JakZiW6riOxMz7T58W
   Q+oRf7+HcpGccz14Tg/cQ7m6RO2oyqDYsPogcy3EPg1yky0VmW7+Qowit
   Rx2mwmV1n3zvExMXQ7kjhCkFJbao3wNlrNiaBVHYSg0KJsdeKMywwjh31
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="316641583"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="316641583"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="515229582"
Received: from lsim7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.229.232])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:21 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 6/6] patch.py: Prevent git repo reinitialization
Date: Mon, 14 Mar 2022 10:02:05 +0800
Message-Id: 
 <427f4ef11beb8ceee007b5c7e152f2383a114aca.1647222224.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647222224.git.anuj.mittal@intel.com>
References: <cover.1647222224.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 02:03:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163121

From: Pavel Zhukov <pavel@zhukoff.net>

There were few bugs in the _isInitialized() function which might trigger
git repo to be reinitialized and patches failing to apply.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-test/gitrepotest/gitrepotest.bb    | 16 ++++++++++++++++
 .../gitrepotest/0001-testpatch.patch           |  9 +++++++++
 meta/lib/oe/patch.py                           | 11 ++++++++---
 meta/lib/oeqa/selftest/cases/bbtests.py        | 18 ++++++++++++++++--
 4 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch

diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
new file mode 100644
index 0000000000..f1b6c55833
--- /dev/null
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Test recipe for git repo initialization"
+HOMEPAGE = "https://git.yoctoproject.org/git/matchbox-panel-2"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+PATCHTOOL="git"
+
+SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https \
+           file://0001-testpatch.patch \
+          "
+
+SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
+
+S = "${WORKDIR}/git"
diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
new file mode 100644
index 0000000000..bccda17ee9
--- /dev/null
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
@@ -0,0 +1,9 @@
+diff --git a/Makefile.am b/Makefile.am
+index 432a9b4..bbf7c74 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,3 +1,4 @@
++## This is useless comment to test if patch works
+ ACLOCAL_AMFLAGS = -I m4
+ 
+ SUBDIRS = matchbox-panel applets data po
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dc..9034fcae03 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -304,14 +304,19 @@ class GitApplyTree(PatchTree):
 
     def _isInitialized(self):
         cmd = "git rev-parse --show-toplevel"
-        (status, output) = subprocess.getstatusoutput(cmd.split())
+        try:
+            output = runcmd(cmd.split(), self.dir).strip()
+        except CmdError as err:
+            ## runcmd returned non-zero which most likely means 128
+            ## Not a git directory
+            return False
         ## Make sure repo is in builddir to not break top-level git repos
-        return status == 0 and os.path.samedir(output, self.dir)
+        return os.path.samefile(output, self.dir)
 
     def _initRepo(self):
         runcmd("git init".split(), self.dir)
         runcmd("git add .".split(), self.dir)
-        runcmd("git commit -a --allow-empty -m Patching_started".split(), self.dir)
+        runcmd("git commit -a --allow-empty -m bitbake_patching_started".split(), self.dir)
 
     @staticmethod
     def extractPatchHeader(patchfile):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 31962b92d7..a08001a173 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -310,8 +310,22 @@ INHERIT:remove = \"report-error\"
         src = get_bb_var("SRC_URI",test_recipe)
         gitscm = re.search("git://", src)
         self.assertFalse(gitscm, "test_git_patchtool pre-condition failed: {} test recipe contains git repo!".format(test_recipe))
-        result = bitbake('man-db -c patch', ignore_status=False)
+        result = bitbake('{} -c patch'.format(test_recipe), ignore_status=False)
         fatal = re.search("fatal: not a git repository (or any of the parent directories)", result.output)
         self.assertFalse(fatal, "Failed to patch using PATCHTOOL=\"git\"")
         self.delete_recipeinc(test_recipe)
-        bitbake('-cclean man-db')
+        bitbake('-cclean {}'.format(test_recipe))
+
+    def test_git_patchtool2(self):
+        """ Test if PATCHTOOL=git works with git repo and doesn't reinitialize it
+        """
+        test_recipe = "gitrepotest"
+        src = get_bb_var("SRC_URI",test_recipe)
+        gitscm = re.search("git://", src)
+        self.assertTrue(gitscm, "test_git_patchtool pre-condition failed: {} test recipe doesn't contains git repo!".format(test_recipe))
+        result = bitbake('{} -c patch'.format(test_recipe), ignore_status=False)
+        srcdir = get_bb_var('S', test_recipe)
+        result = runCmd("git log", cwd = srcdir)
+        self.assertFalse("bitbake_patching_started" in result.output, msg = "Repository has been reinitialized. {}".format(srcdir))
+        self.delete_recipeinc(test_recipe)
+        bitbake('-cclean {}'.format(test_recipe))
-- 
2.35.1


