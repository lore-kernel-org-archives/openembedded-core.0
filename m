Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4547D92F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q16so2561753wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jEDVR3eHgBABvIzk6le5Cf5mp8yR8m67XsutW3Q+OAA=;
	b=Ax+e6zfaq03gVwX1Q/xbXGnZBBodNOAK5lJ5UqGNV2H4/d77TvgZ87UdMdSkBYzhCz
	kVgqHVjpaxNIZ6BRWYOIf8/vU4unjQQpPZo6xtKcOdink5ZzIrlOaMKshTnBo5vSmONG
	ZBEH8/54QxzaUeVnxOIsqEF5pFvIMNggSknAHVqBgCrVxF+U6R/14lSOG8izQ773UIAM
	r0UAz0A2rtCXLUW953qkfWxnPJYRvP6X+KpkBVcozDmA5CJBRckhdchQx+Z4uo+Sg1Nc
	HMjOnF7j9uzsvFOXAxfg/TvnWOdKyzrLskg/wHYkjgRggDHkWAcGVRBplOP+UNw76gle
	4itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jEDVR3eHgBABvIzk6le5Cf5mp8yR8m67XsutW3Q+OAA=;
	b=iJYWrywhgLHegCaaijBaUxzNN+soV3vVQp9nHf3fBIiTxqcd8Rnw3bzANzHKAspVz0
	9b7SyqxyRBoutp0nDakUFhIPKCITqnrCOhodTF2qfnRGvaFgLjhwRa5Ysw6J5ZZwQ7tR
	+ODtOjHGO6zglscHUkIYyxz2N0UrFpqQBQx2QDlKnR+smk5DIkEzw79bA01sLnETH8ow
	9Sw7cv55PlhqgNJj7o5oXLazY2Dr9iUzOp07msR9gL+4+Iw4QQfyaMyf8oX28zdZ0amz
	nSmmZWR6hAvh4E45A6ktGXT63E8ar6AuCK+RYRKH1z5DluTarVsXTLj34qrhwVcMX2rG
	BgBQ==
X-Gm-Message-State: APjAAAWKu60p2Yt/Ab4zNQmnGCtFG0FYiE106OGXAKBLr8AZYRul1baQ
	vO7bSVsXSQc574sGBkx4ClfPZMPwNsI=
X-Google-Smtp-Source: APXvYqwN+u6K+9GQBJLRUtJoEvtALA0N9H6Ncsjyqve/q+obdWAWvpNmZGiJjKr4R+yp+6F8WURNDA==
X-Received: by 2002:a7b:ce1a:: with SMTP id m26mr2871500wmc.131.1554901959255; 
	Wed, 10 Apr 2019 06:12:39 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:52 +0530
Message-Id: <84f19e78d9b1f3d634cf1d46ce48f24670199d0b.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 33/33] devtool: Split tests into multiple classes
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:41 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This allows better parallelism between the different tests as currently
this block takes the longest time to execute. devtool tests are still
all grouped into the "devtool" module for ease of exection.

This also makes it easier to execute some subset of devtool tests for
testing devtool changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 113 +++++++++++++++++---------------
 1 file changed, 61 insertions(+), 52 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 99bfcd3..9eb9bad 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -78,6 +78,58 @@ def tearDownModule():
 
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
@@ -181,58 +233,6 @@ class DevtoolBase(OESelftestTestCase):
 
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
@@ -254,6 +254,8 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(tempdir, result.output)
         self.assertIn(self.workspacedir, result.output)
 
+class DevtoolAddTests(DevtoolBase):
+
     @OETestID(1159)
     def test_devtool_add(self):
         # Fetch source
@@ -509,6 +511,8 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRC_URI'] = url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
 
+class DevtoolModifyTests(DevtoolBase):
+
     @OETestID(1164)
     def test_devtool_modify(self):
         import oe.path
@@ -754,6 +758,7 @@ class DevtoolTests(DevtoolBase):
         self._check_src_repo(tempdir)
         # This is probably sufficient
 
+class DevtoolUpdateTests(DevtoolBase):
 
     @OETestID(1169)
     def test_devtool_update_recipe(self):
@@ -1170,6 +1175,8 @@ class DevtoolTests(DevtoolBase):
         expected_status = []
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+class DevtoolExtractTests(DevtoolBase):
+
     @OETestID(1163)
     def test_devtool_extract(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -1339,6 +1346,8 @@ class DevtoolTests(DevtoolBase):
         if reqpkgs:
             self.fail('The following packages were not present in the image as expected: %s' % ', '.join(reqpkgs))
 
+class DevtoolUpgradeTests(DevtoolBase):
+
     @OETestID(1367)
     def test_devtool_upgrade(self):
         # Check preconditions
-- 
2.7.4


