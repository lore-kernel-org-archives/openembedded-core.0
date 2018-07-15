Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 886B875534
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id m1-v6so16737193wrg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+mHm4kM8XAlSNzIiL3r/Y4ZhZpcvdof1SjasAmcz7dw=;
	b=KLp7AhFZJ03VeFrxz4uOD9BZjffsZdF7Eh9usyvrqrct6DgJ5PhsEbOmk4ls9gymoC
	+sqoH7AgFL4HSNLdXCpsBHZL6+zk/uRSP2Tg/UZg2Pzxb6J/YM3v94X9Apb060TnW7qo
	QsLVoz7yv4hSNfVU7vnRSM2ECCmWOtCimCbHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+mHm4kM8XAlSNzIiL3r/Y4ZhZpcvdof1SjasAmcz7dw=;
	b=VuHR7H/OsLovli1hSJDLux4kdQ+CDEetcH9quisEWJ0oKx99+lXTAz9Zi0bQ6QlQVI
	fwZ49xC2TJpWE2l0eMNQMmw0LE0+5NY13NQ8SfEi0uUlfvfEGZ7Bo0sHPGzLC1M9S6Vo
	3AbPOaz6atAzZGI5Qbq9/bYHZ+4N8M65tOsnjF4hnTCnnPSzytY0Oj7NcDsJ7w2NSVqF
	Z/VWwMRHUany3OzEcjZFE2sYRr0ACQ23jlGfSftDtgw6i1/kz5t7bXruCdHLkqpq2mCu
	Ll/TzpOroi2C79a72WLGogLQlDzumWUqdfOixLfR1squN6TDN8byApmeQ3uIco+PjW1/
	NsFA==
X-Gm-Message-State: AOUpUlG+5yA6JMWqaXhl1bCRCF7HeHBOdsdO2zmdpqJVkbS372s1o9O5
	wzymxnkb3fcZtRG84maC7LF2faNq4mE=
X-Google-Smtp-Source: AAOMgpcT6mj75BNl+468FdIsNO1IWRHa8b4axNRBLsOXaf2gxbe/GZLN42jgXqg7gwULw55C1rgoSA==
X-Received: by 2002:adf:a963:: with SMTP id
	u90-v6mr10762656wrc.248.1531669018924; 
	Sun, 15 Jul 2018 08:36:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:39 +0100
Message-Id: <20180715153641.21029-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/12] devtool: Split tests into multiple classes
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
X-List-Received-Date: Sun, 15 Jul 2018 15:36:58 -0000

This allows better parallelism between the different tests as currently
this block takes the longest time to execute. devtool tests are still
all grouped into the "devtool" module for ease of exection.

This also makes it easier to execute some subset of devtool tests for
testing devtool changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 113 +++++++++++++-----------
 1 file changed, 61 insertions(+), 52 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f2b0f596771..43a66c8e283 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -13,6 +13,58 @@ from oeqa.core.decorator.oeid import OETestID
 
 class DevtoolBase(OESelftestTestCase):
 
+    @classmethod
+    def setUpClass(cls):
+        super(DevtoolBase, cls).setUpClass()
+        bb_vars = get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
+        cls.original_sstate = bb_vars['SSTATE_DIR']
+        cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
+        cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
+        cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
+                            % cls.original_sstate)
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.logger.debug('Deleting devtool sstate cache on %s' % cls.devtool_sstate)
+        runCmd('rm -rf %s' % cls.devtool_sstate)
+        super(DevtoolBase, cls).tearDownClass()
+
+    def setUp(self):
+        """Test case setup function"""
+        super(DevtoolBase, self).setUp()
+        self.workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(self.workspacedir),
+                        'This test cannot be run with a workspace directory '
+                        'under the build directory')
+        self.append_config(self.sstate_conf)
+
+    def _check_src_repo(self, repo_dir):
+        """Check srctree git repository"""
+        self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
+                        'git repository for external source tree not found')
+        result = runCmd('git status --porcelain', cwd=repo_dir)
+        self.assertEqual(result.output.strip(), "",
+                         'Created git repo is not clean')
+        result = runCmd('git symbolic-ref HEAD', cwd=repo_dir)
+        self.assertEqual(result.output.strip(), "refs/heads/devtool",
+                         'Wrong branch in git repo')
+
+    def _check_repo_status(self, repo_dir, expected_status):
+        """Check the worktree status of a repository"""
+        result = runCmd('git status . --porcelain',
+                        cwd=repo_dir)
+        for line in result.output.splitlines():
+            for ind, (f_status, fn_re) in enumerate(expected_status):
+                if re.match(fn_re, line[3:]):
+                    if f_status != line[:2]:
+                        self.fail('Unexpected status in line: %s' % line)
+                    expected_status.pop(ind)
+                    break
+            else:
+                self.fail('Unexpected modified file in line: %s' % line)
+        if expected_status:
+            self.fail('Missing file changes: %s' % expected_status)
+
     def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
         with open(recipefile, 'r') as f:
             invar = None
@@ -116,58 +168,6 @@ class DevtoolBase(OESelftestTestCase):
 
 class DevtoolTests(DevtoolBase):
 
-    @classmethod
-    def setUpClass(cls):
-        super(DevtoolTests, cls).setUpClass()
-        bb_vars = get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
-        cls.original_sstate = bb_vars['SSTATE_DIR']
-        cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
-        cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
-        cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
-                            % cls.original_sstate)
-
-    @classmethod
-    def tearDownClass(cls):
-        cls.logger.debug('Deleting devtool sstate cache on %s' % cls.devtool_sstate)
-        runCmd('rm -rf %s' % cls.devtool_sstate)
-        super(DevtoolTests, cls).tearDownClass()
-
-    def setUp(self):
-        """Test case setup function"""
-        super(DevtoolTests, self).setUp()
-        self.workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(self.workspacedir),
-                        'This test cannot be run with a workspace directory '
-                        'under the build directory')
-        self.append_config(self.sstate_conf)
-
-    def _check_src_repo(self, repo_dir):
-        """Check srctree git repository"""
-        self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
-                        'git repository for external source tree not found')
-        result = runCmd('git status --porcelain', cwd=repo_dir)
-        self.assertEqual(result.output.strip(), "",
-                         'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=repo_dir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool",
-                         'Wrong branch in git repo')
-
-    def _check_repo_status(self, repo_dir, expected_status):
-        """Check the worktree status of a repository"""
-        result = runCmd('git status . --porcelain',
-                        cwd=repo_dir)
-        for line in result.output.splitlines():
-            for ind, (f_status, fn_re) in enumerate(expected_status):
-                if re.match(fn_re, line[3:]):
-                    if f_status != line[:2]:
-                        self.fail('Unexpected status in line: %s' % line)
-                    expected_status.pop(ind)
-                    break
-            else:
-                self.fail('Unexpected modified file in line: %s' % line)
-        if expected_status:
-            self.fail('Missing file changes: %s' % expected_status)
-
     @OETestID(1158)
     def test_create_workspace(self):
         # Check preconditions
@@ -189,6 +189,8 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(tempdir, result.output)
         self.assertIn(self.workspacedir, result.output)
 
+class DevtoolAddTests(DevtoolBase):
+
     @OETestID(1159)
     def test_devtool_add(self):
         # Fetch source
@@ -444,6 +446,8 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRC_URI'] = url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
 
+class DevtoolModifyTests(DevtoolBase):
+
     @OETestID(1164)
     def test_devtool_modify(self):
         import oe.path
@@ -689,6 +693,7 @@ class DevtoolTests(DevtoolBase):
         self._check_src_repo(tempdir)
         # This is probably sufficient
 
+class DevtoolUpdateTests(DevtoolBase):
 
     @OETestID(1169)
     def test_devtool_update_recipe(self):
@@ -1105,6 +1110,8 @@ class DevtoolTests(DevtoolBase):
         expected_status = []
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+class DevtoolExtractTests(DevtoolBase):
+
     @OETestID(1163)
     def test_devtool_extract(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -1274,6 +1281,8 @@ class DevtoolTests(DevtoolBase):
         if reqpkgs:
             self.fail('The following packages were not present in the image as expected: %s' % ', '.join(reqpkgs))
 
+class DevtoolUpgradeTests(DevtoolBase):
+
     @OETestID(1367)
     def test_devtool_upgrade(self):
         # Check preconditions
-- 
2.17.1


