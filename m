Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5247176244
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 20:07:41 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so1347987pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=b6nLUFfnE6CRCZ1RlDWYnbf1GX8/Qk7bpttKbJSHE+w=;
	b=Uy7YCHs8WYyPWrR1ATE6/nXxtFmnnltrJEaJerecG8z2Nj216+mDEHtSPrY4SDbXtx
	hErfycsQ2ttqaUeDljXScnGxa9M92oTkJj8dn6G9NHba0zgL2+ICaocZInsHLxty0I/M
	Ro3MHX4q44Cccn2rP1boxFb/BxV+lC1O8hQhs/g3TogAlMhdGYamCN9OBj/sFwbfA3QS
	v7A71w3vudyHjqXDVbUiNBDeT0Kw7cOyExk8layKtBwy2H/2IEsOdhfVxS0Y8Y4q9PyR
	YC+Y8TiwxfAgV4wRwl51wPhHRKQFKG9claCtpFCqpDzjIGrQqDHtbG34U82zfGldYaXj
	CgtA==
X-Received: by 10.66.66.166 with SMTP id g6mr21881000pat.114.1437682062245;
	Thu, 23 Jul 2015 13:07:42 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	k9sm10475524pdp.60.2015.07.23.13.07.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 13:07:41 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 13:08:35 -0700
Message-Id: <b266794d605ea5ade29c8b84ce5aefb36ed56464.1437681596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <037704ac325d534a663d16ce5e79a0fdf270076b.1437681596.git.chris_larson@mentor.com>
References: <037704ac325d534a663d16ce5e79a0fdf270076b.1437681596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437681596.git.chris_larson@mentor.com>
References: <cover.1437681596.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] oeqa/recipetool: add tests for appendsrcfile(s)
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
X-List-Received-Date: Thu, 23 Jul 2015 20:07:42 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 152 +++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 854ebfa..bebc1d6 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -399,3 +399,155 @@ class RecipetoolTests(RecipetoolBase):
         checkvars['DEPENDS'] = 'libpng pango libx11 libxext jpeg'
         inherits = ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
+
+
+class RecipetoolAppendsrcBase(RecipetoolBase):
+    def _try_recipetool_appendsrcfile(self, testrecipe, newfile, destfile, options, expectedlines, expectedfiles):
+        cmd = 'recipetool appendsrcfile %s %s %s %s %s' % (options, templayerdir, testrecipe, newfile, destfile)
+        return self._try_recipetool_appendcmd(cmd, testrecipe, expectedfiles, expectedlines)
+
+    def _try_recipetool_appendsrcfiles(self, testrecipe, newfiles, expectedlines=None, expectedfiles=None, destdir=None, options=''):
+
+        if destdir:
+            options += ' -D %s' % destdir
+
+        if expectedfiles is None:
+            expectedfiles = [os.path.basename(f) for f in newfiles]
+
+        cmd = 'recipetool appendsrcfiles %s %s %s %s' % (options, templayerdir, testrecipe, ' '.join(newfiles))
+        return self._try_recipetool_appendcmd(cmd, testrecipe, expectedfiles, expectedlines)
+
+    def _try_recipetool_appendsrcfile_fail(self, testrecipe, newfile, destfile, checkerror):
+        cmd = 'recipetool appendsrcfile %s %s %s %s' % (templayerdir, testrecipe, newfile, destfile or '')
+        result = runCmd(cmd, ignore_status=True)
+        self.assertNotEqual(result.status, 0, 'Command "%s" should have failed but didn\'t' % cmd)
+        self.assertNotIn('Traceback', result.output)
+        for errorstr in checkerror:
+            self.assertIn(errorstr, result.output)
+
+    @staticmethod
+    def _get_first_file_uri(recipe):
+        '''Return the first file:// in SRC_URI for the specified recipe.'''
+        src_uri = get_bb_var('SRC_URI', recipe).split()
+        for uri in src_uri:
+            p = urlparse.urlparse(uri)
+            if p.scheme == 'file':
+                return p.netloc + p.path
+
+    def _test_appendsrcfile(self, testrecipe, filename=None, destdir=None, has_src_uri=True, srcdir=None, newfile=None, options=''):
+        if newfile is None:
+            newfile = self.testfile
+
+        if srcdir:
+            if destdir:
+                expected_subdir = os.path.join(srcdir, destdir)
+            else:
+                expected_subdir = srcdir
+        else:
+            options += " -W"
+            expected_subdir = destdir
+
+        if filename:
+            if destdir:
+                destpath = os.path.join(destdir, filename)
+            else:
+                destpath = filename
+        else:
+            filename = os.path.basename(newfile)
+            if destdir:
+                destpath = destdir + os.sep
+            else:
+                destpath = '.' + os.sep
+
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        if has_src_uri:
+            uri = 'file://%s' % filename
+            if expected_subdir:
+                uri += ';subdir=%s' % expected_subdir
+            expectedlines[0:0] = ['SRC_URI += "%s"\n' % uri,
+                                  '\n']
+
+        return self._try_recipetool_appendsrcfile(testrecipe, newfile, destpath, options, expectedlines, [filename])
+
+    def _test_appendsrcfiles(self, testrecipe, newfiles, expectedfiles=None, destdir=None, options=''):
+        if expectedfiles is None:
+            expectedfiles = [os.path.basename(n) for n in newfiles]
+
+        self._try_recipetool_appendsrcfiles(testrecipe, newfiles, expectedfiles=expectedfiles, destdir=destdir, options=options)
+
+        src_uri = get_bb_var('SRC_URI', testrecipe).split()
+        for f in expectedfiles:
+            if destdir:
+                self.assertIn('file://%s;subdir=%s' % (f, destdir), src_uri)
+            else:
+                self.assertIn('file://%s' % f, src_uri)
+
+        recipefile = get_bb_var('FILE', testrecipe)
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, templayerdir)
+        filesdir = os.path.join(os.path.dirname(bbappendfile), testrecipe)
+        filesextrapaths = get_bb_var('FILESEXTRAPATHS', testrecipe).split(':')
+        self.assertIn(filesdir, filesextrapaths)
+
+
+class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
+    def test_recipetool_appendsrcfile_basic(self):
+        self._test_appendsrcfile('base-files', 'a-file')
+
+    def test_recipetool_appendsrcfile_basic_wildcard(self):
+        testrecipe = 'base-files'
+        self._test_appendsrcfile(testrecipe, 'a-file', options='-w')
+        recipefile = get_bb_var('FILE', testrecipe)
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, templayerdir)
+        self.assertEqual(os.path.basename(bbappendfile), '%s_%%.bbappend' % testrecipe)
+
+    def test_recipetool_appendsrcfile_subdir_basic(self):
+        self._test_appendsrcfile('base-files', 'a-file', 'tmp')
+
+    def test_recipetool_appendsrcfile_subdir_basic_dirdest(self):
+        self._test_appendsrcfile('base-files', destdir='tmp')
+
+    def test_recipetool_appendsrcfile_srcdir_basic(self):
+        testrecipe = 'bash'
+        srcdir = get_bb_var('S', testrecipe)
+        workdir = get_bb_var('WORKDIR', testrecipe)
+        subdir = os.path.relpath(srcdir, workdir)
+        self._test_appendsrcfile(testrecipe, 'a-file', srcdir=subdir)
+
+    def test_recipetool_appendsrcfile_existing_in_src_uri(self):
+        testrecipe = 'base-files'
+        filepath = self._get_first_file_uri(testrecipe)
+        self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
+        self._test_appendsrcfile(testrecipe, filepath, has_src_uri=False)
+
+    def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self):
+        testrecipe = 'base-files'
+        subdir = 'tmp'
+        filepath = self._get_first_file_uri(testrecipe)
+        self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
+
+        output = self._test_appendsrcfile(testrecipe, filepath, subdir, has_src_uri=False)
+        self.assertTrue(any('with different parameters' in l for l in output))
+
+    def test_recipetool_appendsrcfile_replace_file_srcdir(self):
+        testrecipe = 'bash'
+        filepath = 'Makefile.in'
+        srcdir = get_bb_var('S', testrecipe)
+        workdir = get_bb_var('WORKDIR', testrecipe)
+        subdir = os.path.relpath(srcdir, workdir)
+
+        self._test_appendsrcfile(testrecipe, filepath, srcdir=subdir)
+        bitbake('%s:do_unpack' % testrecipe)
+        self.assertEqual(open(self.testfile, 'r').read(), open(os.path.join(srcdir, filepath), 'r').read())
+
+    def test_recipetool_appendsrcfiles_basic(self, destdir=None):
+        newfiles = [self.testfile]
+        for i in range(1, 5):
+            testfile = os.path.join(self.tempdir, 'testfile%d' % i)
+            with open(testfile, 'w') as f:
+                f.write('Test file %d\n' % i)
+            newfiles.append(testfile)
+        self._test_appendsrcfiles('gcc', newfiles, destdir=destdir, options='-W')
+
+    def test_recipetool_appendsrcfiles_basic_subdir(self):
+        self.test_recipetool_appendsrcfiles_basic(destdir='testdir')
-- 
2.2.1


