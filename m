Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3E5CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 13:43:05 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33785.1792414694949959939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=JKa+oTko;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=na/27jYc;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792414693; x=1793019493;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=0ONnoncEY3h4Mi4u3zwoaGxnAWdi+FfeyLIHmkS0SkI=;
	b=JKa+oTkooZEsRVX0P5mT3hN56KfKXJlfRkzavjOqjBMRZjKkC5A1/e2bIsxxqWvmSlsRtBeBVW/EA
	 je/dqBgEMrZTyWFzdse3b2qbnMQqUYFBEoP8Yf52SSB5VudEjNejVyTYVMYXhmK9I0iTy4PdRylpMQ
	 UF2oxNHOMDN98TpIDHer36NxoFr9IHqY5vjHQHTHJqVmNQs+GS8fEeSWT7eB/ttuTf4XtPrnxuk5ow
	 gI6rbwz0UWEf0MTc6OckniLoohwEupjfbmr6k9tTPnW3QdErMz/uN7IjaCw8CGh73eACkQaBXcKLhu
	 A4davh3BSMdbk43IVD/Y8075hMGJMqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792414693; x=1793019493;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=0ONnoncEY3h4Mi4u3zwoaGxnAWdi+FfeyLIHmkS0SkI=;
	b=na/27jYcMN0xGSeHuwa/p48HbzFHPjeF9lb4TNFImDIwxWjbx4qbM9fBSL/Ky1U3eyVOcatzahc/i
	 d6aOEI0CA==
X-HalOne-ID: bcfbc648-cbbc-11f1-b852-33fc7c51c1c8
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-8ef1-f8eb-0f1e-99b9.310.pool.telefonica.de [2a02:3102:8c10:1ae0:8ef1:f8eb:f1e:99b9])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id bcfbc648-cbbc-11f1-b852-33fc7c51c1c8;
	Mon, 19 Oct 2026 12:58:12 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [wrynose][PATCH] oeqa/selftest/devtool: handle existing patch directories in recipe tests
Date: Mon, 19 Oct 2026 14:58:10 +0200
Message-ID: <20261019125810.492968-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 13:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248169

Recipe update and finish tests assume generated patches live in a
directory named after the recipe. Existing files/ or versioned directories
can instead cause staging failures and leave generated files for later
tests. Cleanup can also delete tracked patches that should be preserved.

Share recipe-directory cleanup that resets the index, removes untracked
files and restores tracked files. Stage recipe changes and check generated
patch filenames without assuming a subdirectory, including the
--initial-rev cases. Keep paths that describe known fixture contents.

Validated with devtool.DevtoolUpdateTests.test_devtool_update_recipe and
isolated staging and cleanup checks on both target branches.

AI-Generated: Uses OpenAI Codex
Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 65 +++++++++++++------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b485d752e7..a6fd050a34 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -139,6 +139,13 @@ class DevtoolTestCase(OESelftestTestCase):
         if expected_status:
             self.fail('Missing file changes: %s' % expected_status)
 
+    def _add_recipe_cleanup(self, recipefile):
+        """Restore a recipe directory in the test checkout, including its index."""
+        cleanup_cmd = ('cd %s && git reset HEAD -- . && git clean -fd -- . '
+                       '&& git checkout -- .' % shlex.quote(os.path.dirname(recipefile)))
+        self.add_command_to_tearDown(cleanup_cmd)
+        return cleanup_cmd
+
     def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
         with open(recipefile, 'r') as f:
             invar = None
@@ -1209,11 +1216,10 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
         result = runCmd('git add devtool-new-file', cwd=tempdir)
         result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
-        cleanup_cmd = 'cd %s; rm %s/*.patch; git add %s; git checkout %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile))
-        self.add_command_to_tearDown(cleanup_cmd)
+        cleanup_cmd = self._add_recipe_cleanup(recipefile)
         result = runCmd('devtool update-recipe %s' % testrecipe)
-        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+        result = runCmd('git add .', cwd=os.path.dirname(recipefile))
+        expected_status = [('M ', '.*/%s$' % os.path.basename(recipefile)),
                            ('A ', '.*/0001-Change-the-README.patch$'),
                            ('A ', '.*/0002-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
@@ -1225,8 +1231,8 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('git rev-parse devtool-base', cwd=tempdir)
         initial_rev = result.output.strip()
         result = runCmd('devtool update-recipe --initial-rev %s %s' % (initial_rev, testrecipe))
-        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+        result = runCmd('git add .', cwd=os.path.dirname(recipefile))
+        expected_status = [('M ', '.*/%s$' % os.path.basename(recipefile)),
                            ('A ', '.*/0001-Change-the-README.patch$'),
                            ('A ', '.*/0002-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
@@ -1235,8 +1241,8 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('git rev-parse HEAD~1', cwd=tempdir)
         midpoint_rev = result.output.strip()
         result = runCmd('devtool update-recipe --initial-rev %s %s' % (midpoint_rev, testrecipe))
-        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+        result = runCmd('git add .', cwd=os.path.dirname(recipefile))
+        expected_status = [('M ', '.*/%s$' % os.path.basename(recipefile)),
                            ('A ', '.*/0001-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
         result = runCmd(cleanup_cmd)
@@ -1271,7 +1277,7 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
         result = runCmd('git add devtool-new-file', cwd=tempdir)
         result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; rm -rf %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        cleanup_cmd = self._add_recipe_cleanup(recipefile)
         result = runCmd('devtool update-recipe -m srcrev %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile))] + \
                           [(' D', '.*/%s$' % patch) for patch in patches]
@@ -1285,14 +1291,12 @@ class DevtoolUpdateTests(DevtoolBase):
         removelines = ['SRCREV = ".*"'] + srcurilines
         self._check_diff(result.output, addlines, removelines)
         # Now try with auto mode
-        runCmd('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
+        runCmd(cleanup_cmd)
         result = runCmd('devtool update-recipe %s' % testrecipe)
-        result = runCmd('git rev-parse --show-toplevel', cwd=os.path.dirname(recipefile))
-        topleveldir = result.output.strip()
-        relpatchpath = os.path.join(os.path.relpath(os.path.dirname(recipefile), topleveldir), testrecipe)
-        expected_status = [(' M', os.path.relpath(recipefile, topleveldir)),
-                           ('??', '%s/0001-Change-the-Makefile.patch' % relpatchpath),
-                           ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
+        result = runCmd('git add .', cwd=os.path.dirname(recipefile))
+        expected_status = [('M ', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Change-the-Makefile.patch$'),
+                           ('A ', '.*/0002-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
     def test_devtool_update_recipe_append(self):
@@ -1317,7 +1321,7 @@ class DevtoolUpdateTests(DevtoolBase):
         # Add a commit
         result = runCmd('echo "Additional line" >> README', cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
-        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
+        self._add_recipe_cleanup(recipefile)
         # Create a temporary layer and add it to bblayers.conf
         self._create_temp_layer(templayerdir, True, 'selftestupdaterecipe')
         # Create the bbappend
@@ -1391,7 +1395,7 @@ class DevtoolUpdateTests(DevtoolBase):
         # Add a commit
         result = runCmd('echo "# Additional line" >> Makefile.am', cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
-        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
+        self._add_recipe_cleanup(recipefile)
         # Create a temporary layer
         os.makedirs(os.path.join(templayerdir, 'conf'))
         with open(os.path.join(templayerdir, 'conf', 'layer.conf'), 'w') as f:
@@ -1557,7 +1561,7 @@ class DevtoolUpdateTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s' % testrecipe)
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        self._add_recipe_cleanup(recipefile)
         result = runCmd('devtool finish --force-patch-refresh %s meta-selftest' % testrecipe)
         # Check recipe got changed as expected
         with open(newpatchfile, 'r') as f:
@@ -1584,7 +1588,7 @@ class DevtoolUpdateTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s' % testrecipe)
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        self._add_recipe_cleanup(recipefile)
         result = runCmd('devtool finish --force-patch-refresh %s meta-selftest' % testrecipe)
         # Check recipe got changed as expected
         with open(newpatchfile, 'r') as f:
@@ -1611,7 +1615,7 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('devtool modify %s' % testrecipe)
         # Modify one file
         runCmd('echo "Another line" >> file2', cwd=os.path.join(self.workspacedir, 'sources', testrecipe))
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        self._add_recipe_cleanup(recipefile)
         result = runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
@@ -1634,7 +1638,7 @@ class DevtoolUpdateTests(DevtoolBase):
         srctree = os.path.join(self.workspacedir, 'sources', testrecipe)
         runCmd('echo "Another line" >> README', cwd=srctree)
         runCmd('git commit -a --amend --no-edit --no-verify', cwd=srctree)
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        self._add_recipe_cleanup(recipefile)
         result = runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s/readme.patch.gz$' % testrecipe)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
@@ -1664,7 +1668,7 @@ class DevtoolUpdateTests(DevtoolBase):
             contents = f.read().rstrip()
         self.assertEqual(contents, 'Modified version', 'File has apparently not been overwritten as it should have been')
         # Test devtool update-recipe without modifying any files
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        self._add_recipe_cleanup(recipefile)
         result = runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = []
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
@@ -1700,12 +1704,13 @@ class DevtoolUpdateTests(DevtoolBase):
         # Now try updating original recipe
         recipefile = bb_vars['FILE']
         recipedir = os.path.dirname(recipefile)
-        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (recipedir, testrecipe))
+        cleanup_cmd = self._add_recipe_cleanup(recipefile)
         result = runCmd('devtool update-recipe %s' % testrecipe)
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
-                           ('??', '.*/%s/%s/$' % (testrecipe, testrecipe))]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-        result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
+        result = runCmd('git add .', cwd=recipedir)
+        expected_status = [('M ', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Add-a-comment.patch$')]
+        self._check_repo_status(recipedir, expected_status)
+        result = runCmd('git diff --cached %s' % os.path.basename(recipefile), cwd=recipedir)
         removelines = ['SRC_URI = "git://.*"']
         addlines = [
             'SRC_URI = "git://.* \\\\',
@@ -1714,7 +1719,7 @@ class DevtoolUpdateTests(DevtoolBase):
         ]
         self._check_diff(result.output, addlines, removelines)
         # Put things back so we can run devtool finish on a different layer
-        runCmd('cd %s; rm -f %s/*.patch; git checkout .' % (recipedir, testrecipe))
+        runCmd(cleanup_cmd)
         # Run devtool finish
         res = re.search('recipes-.*', recipedir)
         self.assertTrue(res, 'Unable to find recipe subdirectory')
@@ -2437,7 +2442,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify %s %s' % (recipe, tempdir))
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (recipedir, recipe, recipe, os.path.basename(recipefile)))
+        self._add_recipe_cleanup(recipefile)
         self.assertExists(os.path.join(tempdir, 'CMakeLists.txt'), 'Extracted source could not be found')
         # Make a change to one of the existing commits
         result = runCmd('echo "# A comment " >> CMakeLists.txt', cwd=tempdir)
-- 
2.53.0


