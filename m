Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A614DCCA486
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:52 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.28054.1658155850643119054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VJ0Klqs4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id p9so11954458pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nGpHytKa+m6/Oyyc4A+pirJjh15BWLqcgj/Y9GTEKh8=;
        b=VJ0Klqs4qWlxlaSMGz7bAQcu8QIIKzX0YtX6octWFLmM/NzETEwPOXPLgxi+Ir+2QQ
         Ba+q7yVU3P1i9Ziny62OGv8obBG8aWpTds7QKud5aoTLNYnS1ws6eMM+5C+kktfUuhzq
         FrHu9Xmm9kI3kM3jH10KFeT8biumGjmF48Avi2kpFSekvMx5FsbY3Kk4exTz2vtVENzI
         V0lPI8AJ9SCjsoAnEnCwNZKOdZ1dK9Qr4gZFK5tkH1GWA1DMxDp0jpyqbJMbRfFHwQO9
         Q/cONwqDsrkE7k2LjkT7FVIKermkO4VhDFbb038V2Il8EBuYAJma3f5ZCXSQ38RVe74G
         +nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nGpHytKa+m6/Oyyc4A+pirJjh15BWLqcgj/Y9GTEKh8=;
        b=TRhb7440QC3JHtpYFK26JGupkqs5FykQzNTRt2kZFFrMZFMh4Bu1Npo+J7ap4Jcm+h
         eO4c5WSTkatvNge6AENPwv9jjDYO27fDRuo14Y2GJpqqlRo/e8swndhCQQ8SXxwIhfeS
         7Dx5ZGFmtxPfqwwCrxL0n11D0MxF29SnCR2/29sHQfCP9XzoF/DyTT3XtLeD67+FwTkx
         gRhK6PV5mFyvgScozaWO1SEL3P12LEjKwqoZTms2Pw4pRTcj3E8NbFCwN6Zx1Zxn1DZ0
         kHq/oGycNbAZEuFIMSqdg3TvML4qfjs9lWomOcqBT3dOPvZeTnmygYnLOTihZqGF8g7M
         PajA==
X-Gm-Message-State: AJIora/JQ+mIxhmc/qf9gajsytcBc8EeixvlDsSDTydYpaHkaUoSck7w
	tyJtltDRlGv0Te2x4TwJerRYvMYR5pPGUOC+
X-Google-Smtp-Source: 
 AGRyM1txEOCIs9y8BGoF/g0TQZA6XEtfkXPO/sR50eR7+rWZiPqrN8di/z92vD3DFtvmjINyBomSxQ==
X-Received: by 2002:a17:90b:1004:b0:1ef:9f33:2df4 with SMTP id
 gm4-20020a17090b100400b001ef9f332df4mr39385309pjb.31.1658155849444;
        Mon, 18 Jul 2022 07:50:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/35] oe-selftest: devtool: test modify git
 recipe building from a subdir
Date: Mon, 18 Jul 2022 04:48:54 -1000
Message-Id: 
 <a994dbe517246cbc0bf359cd990efd6437e07a56.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168229

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a test that verifies that devtool modify + devtool finish do the
right thing on a recipe that fetches from git and sets S to point to
a subdirectory of the source tree. We have a few examples among the core
recipes, dos2unix is a convenient one so let's use that. (The test first
verifies that that is still true in case the recipe is changed in
future.)

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a84d9ed14173b0bf467ea78dff4f0f7bae0bc082)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 114 ++++++++++++++++++++----
 1 file changed, 97 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ddf6c0c9f8..34fc791f3a 100644
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
2.25.1


