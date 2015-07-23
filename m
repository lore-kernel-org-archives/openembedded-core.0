Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 530AA7623F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 20:07:43 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so1339383pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=k67DOh19dVVXoRxouJ0hxMYyXTcO604+NyGjPRraVLw=;
	b=N7QrekY9hMJSlUQGvwdEtujphAN4EAgx3up3pTdDKr7BSfV3j9NA5P/iRMCMMsSjNi
	RbH6+nvu4/XaEPBSFgYaYADFVu2Ts9CBL/a9cp385nwBgTLdWqN7qFqSINPweH68/tMg
	y/+HLM0pa5hM6zkoNeNqSAN5kbFdBwRgqKaz+vS8XSwKUeJcAUjSaIr5hvTXKOKyfJvs
	PG2f7qQjsHEUoJZr96DZu/riP5Mfx9GhTyad8WWZKlSJa9uazf+mdTTzCSMTVQ5TQWeH
	e+nHC8sWPMJoUZUn5TkkJuWX+UCgXADmNtTcENmiYu6UHmjMRvxxY2qR4MaXnf5A6hQw
	bQgA==
X-Received: by 10.66.155.36 with SMTP id vt4mr22490144pab.32.1437682064015;
	Thu, 23 Jul 2015 13:07:44 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	k9sm10475524pdp.60.2015.07.23.13.07.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 13:07:43 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 13:08:36 -0700
Message-Id: <97dcd3c3e44840196962b2f5a909c5a7f016b99b.1437681596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <037704ac325d534a663d16ce5e79a0fdf270076b.1437681596.git.chris_larson@mentor.com>
References: <037704ac325d534a663d16ce5e79a0fdf270076b.1437681596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437681596.git.chris_larson@mentor.com>
References: <cover.1437681596.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] oeqa/recipetool: allow templayerdir override
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
X-List-Received-Date: Thu, 23 Jul 2015 20:07:44 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is provided for use by subclasses.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index bebc1d6..689d41b 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -8,7 +8,7 @@ from oeqa.utils.decorators import testcase
 from oeqa.selftest import devtool
 
 
-templayerdir = ''
+templayerdir = None
 
 
 def setUpModule():
@@ -25,6 +25,7 @@ def tearDownModule():
 
 class RecipetoolBase(devtool.DevtoolBase):
     def setUpLocal(self):
+        self.templayerdir = templayerdir
         self.tempdir = tempfile.mkdtemp(prefix='recipetoolqa')
         self.track_for_cleanup(self.tempdir)
         self.testfile = os.path.join(self.tempdir, 'testfile')
@@ -32,7 +33,7 @@ class RecipetoolBase(devtool.DevtoolBase):
             f.write('Test file\n')
 
     def tearDownLocal(self):
-        runCmd('rm -rf %s/recipes-*' % templayerdir)
+        runCmd('rm -rf %s/recipes-*' % self.templayerdir)
 
     def _try_recipetool_appendcmd(self, cmd, testrecipe, expectedfiles, expectedlines=None):
         result = runCmd(cmd)
@@ -40,7 +41,7 @@ class RecipetoolBase(devtool.DevtoolBase):
 
         # Check the bbappend was created and applies properly
         recipefile = get_bb_var('FILE', testrecipe)
-        bbappendfile = self._check_bbappend(testrecipe, recipefile, templayerdir)
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
 
         # Check the bbappend contents
         if expectedlines is not None:
@@ -76,11 +77,11 @@ class RecipetoolTests(RecipetoolBase):
         bitbake('-c cleansstate selftest-recipetool-appendfile')
 
     def _try_recipetool_appendfile(self, testrecipe, destfile, newfile, options, expectedlines, expectedfiles):
-        cmd = 'recipetool appendfile %s %s %s %s' % (templayerdir, destfile, newfile, options)
+        cmd = 'recipetool appendfile %s %s %s %s' % (self.templayerdir, destfile, newfile, options)
         return self._try_recipetool_appendcmd(cmd, testrecipe, expectedfiles, expectedlines)
 
     def _try_recipetool_appendfile_fail(self, destfile, newfile, checkerror):
-        cmd = 'recipetool appendfile %s %s %s' % (templayerdir, destfile, newfile)
+        cmd = 'recipetool appendfile %s %s %s' % (self.templayerdir, destfile, newfile)
         result = runCmd(cmd, ignore_status=True)
         self.assertNotEqual(result.status, 0, 'Command "%s" should have failed but didn\'t' % cmd)
         self.assertNotIn('Traceback', result.output)
@@ -132,7 +133,7 @@ class RecipetoolTests(RecipetoolBase):
         # Try appending a binary file
         # /bin/ls can be a symlink to /usr/bin/ls
         ls = os.path.realpath("/bin/ls")
-        result = runCmd('recipetool appendfile %s /bin/ls %s -r coreutils' % (templayerdir, ls))
+        result = runCmd('recipetool appendfile %s /bin/ls %s -r coreutils' % (self.templayerdir, ls))
         self.assertIn('WARNING: ', result.output)
         self.assertIn('is a binary', result.output)
 
@@ -341,17 +342,17 @@ class RecipetoolTests(RecipetoolBase):
     def test_recipetool_appendfile_wildcard(self):
 
         def try_appendfile_wc(options):
-            result = runCmd('recipetool appendfile %s /etc/profile %s %s' % (templayerdir, self.testfile, options))
+            result = runCmd('recipetool appendfile %s /etc/profile %s %s' % (self.templayerdir, self.testfile, options))
             self.assertNotIn('Traceback', result.output)
             bbappendfile = None
-            for root, _, files in os.walk(templayerdir):
+            for root, _, files in os.walk(self.templayerdir):
                 for f in files:
                     if f.endswith('.bbappend'):
                         bbappendfile = f
                         break
             if not bbappendfile:
                 self.assertTrue(False, 'No bbappend file created')
-            runCmd('rm -rf %s/recipes-*' % templayerdir)
+            runCmd('rm -rf %s/recipes-*' % self.templayerdir)
             return bbappendfile
 
         # Check without wildcard option
@@ -403,7 +404,7 @@ class RecipetoolTests(RecipetoolBase):
 
 class RecipetoolAppendsrcBase(RecipetoolBase):
     def _try_recipetool_appendsrcfile(self, testrecipe, newfile, destfile, options, expectedlines, expectedfiles):
-        cmd = 'recipetool appendsrcfile %s %s %s %s %s' % (options, templayerdir, testrecipe, newfile, destfile)
+        cmd = 'recipetool appendsrcfile %s %s %s %s %s' % (options, self.templayerdir, testrecipe, newfile, destfile)
         return self._try_recipetool_appendcmd(cmd, testrecipe, expectedfiles, expectedlines)
 
     def _try_recipetool_appendsrcfiles(self, testrecipe, newfiles, expectedlines=None, expectedfiles=None, destdir=None, options=''):
@@ -414,11 +415,11 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
         if expectedfiles is None:
             expectedfiles = [os.path.basename(f) for f in newfiles]
 
-        cmd = 'recipetool appendsrcfiles %s %s %s %s' % (options, templayerdir, testrecipe, ' '.join(newfiles))
+        cmd = 'recipetool appendsrcfiles %s %s %s %s' % (options, self.templayerdir, testrecipe, ' '.join(newfiles))
         return self._try_recipetool_appendcmd(cmd, testrecipe, expectedfiles, expectedlines)
 
     def _try_recipetool_appendsrcfile_fail(self, testrecipe, newfile, destfile, checkerror):
-        cmd = 'recipetool appendsrcfile %s %s %s %s' % (templayerdir, testrecipe, newfile, destfile or '')
+        cmd = 'recipetool appendsrcfile %s %s %s %s' % (self.templayerdir, testrecipe, newfile, destfile or '')
         result = runCmd(cmd, ignore_status=True)
         self.assertNotEqual(result.status, 0, 'Command "%s" should have failed but didn\'t' % cmd)
         self.assertNotIn('Traceback', result.output)
@@ -484,7 +485,7 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
                 self.assertIn('file://%s' % f, src_uri)
 
         recipefile = get_bb_var('FILE', testrecipe)
-        bbappendfile = self._check_bbappend(testrecipe, recipefile, templayerdir)
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
         filesdir = os.path.join(os.path.dirname(bbappendfile), testrecipe)
         filesextrapaths = get_bb_var('FILESEXTRAPATHS', testrecipe).split(':')
         self.assertIn(filesdir, filesextrapaths)
@@ -498,7 +499,7 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         testrecipe = 'base-files'
         self._test_appendsrcfile(testrecipe, 'a-file', options='-w')
         recipefile = get_bb_var('FILE', testrecipe)
-        bbappendfile = self._check_bbappend(testrecipe, recipefile, templayerdir)
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
         self.assertEqual(os.path.basename(bbappendfile), '%s_%%.bbappend' % testrecipe)
 
     def test_recipetool_appendsrcfile_subdir_basic(self):
-- 
2.2.1


