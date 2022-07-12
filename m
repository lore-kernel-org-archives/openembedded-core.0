Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E4ACCA481
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 04:07:07 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.5209.1657598821445308587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 21:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=BnyjJSMJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id EA89220B9F90; Mon, 11 Jul 2022 21:07:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EA89220B9F90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657598820;
	bh=1aLgdZemoSdJq/MQuW+5jvnJ06pYqfZeVq5SQviHbkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BnyjJSMJFbrvEmhoRYd8IHzZTR4V434pxIBPV/eUaz/qCRHgfZpj/qorq3TbFMT/r
	 P+Pm6sCmy6RgkR4M8aeeZOjnZDo1OcxQALiNF+66VrLYcUNIAwjEMTYBIpZzprH2wh
	 BNXs4STidQhYB85wdTbxCbAzFL+CWQn2lw/ThQgc=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oe-selftest: devtool: test modify git recipe building
 from a subdir
Date: Mon, 11 Jul 2022 21:06:57 -0700
Message-Id: 
 <6f3c50c671694c1e98185266a64857d6370ab624.1657597513.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
References: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 04:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167890

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a test that verifies that devtool modify + devtool finish do the
right thing on a recipe that fetches from git and sets S to point to
a subdirectory of the source tree. We have a few examples among the core
recipes, dos2unix is a convenient one so let's use that. (The test first
verifies that that is still true in case the recipe is changed in
future.)

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ddf6c0c..ddab150 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -718,6 +718,7 @@ class DevtoolModifyTests(DevtoolBase):
 
         self.assertTrue(bbclassextended, 'None of these recipes are BBCLASSEXTENDed to native - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
         self.assertTrue(inheritnative, 'None of these recipes do "inherit native" - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
+
     def test_devtool_modify_localfiles_only(self):
         # Check preconditions
         testrecipe = 'base-files'
@@ -1316,6 +1317,56 @@ class DevtoolUpdateTests(DevtoolBase):
         expected_status = []
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+    def test_devtool_finish_modify_git_subdir(self):
+        # Check preconditions
+        testrecipe = 'dos2unix'
+        bb_vars = get_bb_vars(['SRC_URI', 'S', 'WORKDIR', 'FILE'], testrecipe)
+        self.assertIn('git://', bb_vars['SRC_URI'], 'This test expects the %s recipe to be a git recipe' % testrecipe)
+        workdir_git = '%s/git/' % bb_vars['WORKDIR']
+        if not bb_vars['S'].startswith(workdir_git):
+            self.fail('This test expects the %s recipe to be building from a subdirectory of the git repo' % testrecipe)
+        subdir = bb_vars['S'].split(workdir_git, 1)[1]
+        # Clean up anything in the workdir/sysroot/sstate cache
+        bitbake('%s -c cleansstate' % testrecipe)
+        # Try modifying a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        testsrcfile = os.path.join(tempdir, subdir, 'dos2unix.c')
+        self.assertExists(testsrcfile, 'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
+        self.assertNotExists(os.path.join(tempdir, subdir, '.git'), 'Subdirectory has been initialised as a git repo')
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Modify file
+        runCmd("sed -i '1s:^:/* Add a comment */\\n:' %s" % testsrcfile)
+        result = runCmd('git commit -a -m "Add a comment"', cwd=tempdir)
+        # Run devtool finish
+        recipefile = bb_vars['FILE']
+        recipedir = os.path.dirname(recipefile)
+        res = re.search('recipes-.*', recipedir)
+        self.assertTrue(res, 'Unable to find recipe subdirectory')
+        recipesubdir = res[0]
+        self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, recipesubdir))
+        result = runCmd('devtool finish %s meta-selftest' % testrecipe)
+        # Check bbappend file contents
+        appendfn = os.path.join(self.testlayer_path, recipesubdir, '%s_%%.bbappend' % testrecipe)
+        with open(appendfn, 'r') as f:
+            appendlines = f.readlines()
+        expected_appendlines = [
+            'FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"\n',
+            '\n',
+            'SRC_URI += "file://0001-Add-a-comment.patch;patchdir=.."\n',
+            '\n'
+        ]
+        self.assertEqual(appendlines, expected_appendlines)
+        self.assertExists(os.path.join(os.path.dirname(appendfn), testrecipe, '0001-Add-a-comment.patch'))
+        # Try building
+        bitbake('%s -c patch' % testrecipe)
+
 class DevtoolExtractTests(DevtoolBase):
 
     def test_devtool_extract(self):
-- 
1.8.3.1


