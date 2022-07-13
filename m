Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E426C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 01:41:33 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.17332.1657676490656014620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 18:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=UlgnqLsU;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 41DF4204DE8C; Tue, 12 Jul 2022 18:41:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 41DF4204DE8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657676490;
	bh=pQEwse91fa3R5yJUAL66l4GQtvLnBM/2XINPu2k4Ms0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UlgnqLsUQ4lV/bOnXLRNxwHFxn9xdI1iiNxaRsac4OSFvEKEhjemj9slj/QB27SLY
	 8+DlGEDkFGcW0w6QVZNC9rygQJHI0RVhDpnpTMPMRnQuPu4kjJfnU6GMOYVeAJ3X5D
	 i4d1+wAsmhvHPSyEjOqSBad7ZvSFCw0gTMulDDW4=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] oe-selftest: devtool: test modify git recipe building
 from a subdir
Date: Tue, 12 Jul 2022 18:41:25 -0700
Message-Id: 
 <8b0bd61a35b7803ce79ab670156da8a66b04dd15.1657676159.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1657676159.git.paul.eggleton@linux.microsoft.com>
References: <cover.1657676159.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 01:41:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167950

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a test that verifies that devtool modify + devtool finish do the
right thing on a recipe that fetches from git and sets S to point to
a subdirectory of the source tree. We have a few examples among the core
recipes, dos2unix is a convenient one so let's use that. (The test first
verifies that that is still true in case the recipe is changed in
future.)

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 114 +++++++++++++++++++++++++++-----
 1 file changed, 97 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ddf6c0c..34fc791 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -218,6 +218,34 @@ class DevtoolTestCase(OESelftestTestCase):
             filelist.append(' '.join(splitline))
         return filelist
 
+    def _check_diff(self, diffoutput, addlines, removelines):
+        """Check output from 'git diff' matches expectation"""
+        remaining_addlines = addlines[:]
+        remaining_removelines = removelines[:]
+        for line in diffoutput.splitlines():
+            if line.startswith('+++') or line.startswith('---'):
+                continue
+            elif line.startswith('+'):
+                matched = False
+                for item in addlines:
+                    if re.match(item, line[1:].strip()):
+                        matched = True
+                        remaining_addlines.remove(item)
+                        break
+                self.assertTrue(matched, 'Unexpected diff add line: %s' % line)
+            elif line.startswith('-'):
+                matched = False
+                for item in removelines:
+                    if re.match(item, line[1:].strip()):
+                        matched = True
+                        remaining_removelines.remove(item)
+                        break
+                self.assertTrue(matched, 'Unexpected diff remove line: %s' % line)
+        if remaining_addlines:
+            self.fail('Expected added lines not found: %s' % remaining_addlines)
+        if remaining_removelines:
+            self.fail('Expected removed lines not found: %s' % remaining_removelines)
+
 
 class DevtoolBase(DevtoolTestCase):
 
@@ -718,6 +746,7 @@ class DevtoolModifyTests(DevtoolBase):
 
         self.assertTrue(bbclassextended, 'None of these recipes are BBCLASSEXTENDed to native - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
         self.assertTrue(inheritnative, 'None of these recipes do "inherit native" - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
+
     def test_devtool_modify_localfiles_only(self):
         # Check preconditions
         testrecipe = 'base-files'
@@ -930,23 +959,7 @@ class DevtoolUpdateTests(DevtoolBase):
         srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
         srcurilines.append('"')
         removelines = ['SRCREV = ".*"'] + srcurilines
-        for line in result.output.splitlines():
-            if line.startswith('+++') or line.startswith('---'):
-                continue
-            elif line.startswith('+'):
-                matched = False
-                for item in addlines:
-                    if re.match(item, line[1:].strip()):
-                        matched = True
-                        break
-                self.assertTrue(matched, 'Unexpected diff add line: %s' % line)
-            elif line.startswith('-'):
-                matched = False
-                for item in removelines:
-                    if re.match(item, line[1:].strip()):
-                        matched = True
-                        break
-                self.assertTrue(matched, 'Unexpected diff remove line: %s' % line)
+        self._check_diff(result.output, addlines, removelines)
         # Now try with auto mode
         runCmd('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
         result = runCmd('devtool update-recipe %s' % testrecipe)
@@ -1316,6 +1329,73 @@ class DevtoolUpdateTests(DevtoolBase):
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
+        # Now try updating original recipe
+        recipefile = bb_vars['FILE']
+        recipedir = os.path.dirname(recipefile)
+        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (recipedir, testrecipe))
+        result = runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('??', '.*/%s/%s/$' % (testrecipe, testrecipe))]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
+        removelines = ['SRC_URI = "git://.*"']
+        addlines = [
+            'SRC_URI = "git://.* \\\\',
+            'file://0001-Add-a-comment.patch;patchdir=.. \\\\',
+            '"'
+        ]
+        self._check_diff(result.output, addlines, removelines)
+        # Put things back so we can run devtool finish on a different layer
+        runCmd('cd %s; rm -f %s/*.patch; git checkout .' % (recipedir, testrecipe))
+        # Run devtool finish
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
+
 class DevtoolExtractTests(DevtoolBase):
 
     def test_devtool_extract(self):
-- 
1.8.3.1


