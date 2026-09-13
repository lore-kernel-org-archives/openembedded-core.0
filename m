Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C98C88E6B
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:06:45 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5786.1789329997495452122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Uugc4I60;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202609132006349cad4a3552000207ce-xmuou6@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202609132006349cad4a3552000207ce
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7yoBTnUaWfyo0+29tE0Er3Tc4Lw5frBqh2Ww7XJBO3Q=;
 b=Uugc4I603xmpEQsJweVa267jdYNc9OaJjEjsnPC0QoHC0p2YcyTq9mzij0u8alP6JkSGJu
 0f0p9toYbn6EIsUfiwHLm+blgaobNLdloUcMhF9JhfkPrqxL3sT/eAPZBViLav010xfp3FSs
 fHOjk3VfxThs8xNUbpdQqnSLXWUSZa3fzvostv+UznThLeGM7JOK9eGcoN4lw6NtmoqwFVXv
 oD3oG28a4JXmF/2WqBaVA1IFEiWwx4WPF5fbUByhBSrPcOA49/+nrqS2lIi5xf5mcf3UhG9N
 cl9tbzPiAacwydtY8ipodNNJOTdVOPCsqtHHwWjiOdgBvIBbkvh16wFQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/6] oe-selftest: devtool update: recipe drop dead code
Date: Sun, 13 Sep 2026 22:05:50 +0200
Message-ID: <20260913200624.331753-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260913200624.331753-1-adrian.freihofer@siemens.com>
References: <20260913200624.331753-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245722

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Drop _test_devtool_update_recipe_local_files_2 which is dead code since
commit ce8190c519 "devtool: Drop oe-local-files and simplify", 2024-05-21.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 40 -------------------------
 1 file changed, 40 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ec257f9859..59d9de26a9 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1685,46 +1685,6 @@ class DevtoolUpdateTests(DevtoolBase):
         self.assertExists(local_file, 'File makedevs.c not created')
         self.assertExists(patchfile, 'File new_local not created')
 
-    def _test_devtool_update_recipe_local_files_2(self):
-        """Check local source files support when editing local files in Git"""
-        testrecipe = 'devtool-test-local'
-        recipefile = get_bb_var('FILE', testrecipe)
-        recipedir = os.path.dirname(recipefile)
-        result = runCmd('git status --porcelain .', cwd=recipedir)
-        if result.output.strip():
-            self.fail('Recipe directory for %s contains uncommitted changes' % testrecipe)
-        # Setup srctree for modifying the recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        # Check git repo
-        self._check_src_repo(tempdir)
-        # Edit / commit local sources
-        runCmd('echo "# Foobar" >> file1', cwd=tempdir)
-        runCmd('git commit -am "Edit existing file"', cwd=tempdir)
-        runCmd('git rm file2', cwd=tempdir)
-        runCmd('git commit -m"Remove file"', cwd=tempdir)
-        runCmd('echo "Foo" > new-local', cwd=tempdir)
-        runCmd('git add new-local', cwd=tempdir)
-        runCmd('git commit -m "Add new local file"', cwd=tempdir)
-        runCmd('echo "Gar" > new-file', cwd=tempdir)
-        runCmd('git add new-file', cwd=tempdir)
-        runCmd('git commit -m "Add new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
-                                     os.path.dirname(recipefile))
-        # Checkout unmodified file to working copy -> devtool should still pick
-        # the modified version from HEAD
-        runCmd('git checkout HEAD^ -- file1', cwd=tempdir)
-        runCmd('devtool update-recipe %s' % testrecipe)
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
-                           (' M', '.*/file1$'),
-                           (' D', '.*/file2$'),
-                           ('??', '.*/new-local$'),
-                           ('??', '.*/0001-Add-new-file.patch$')]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-
     def test_devtool_update_recipe_with_gitignore(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-ignored'
-- 
2.55.0


