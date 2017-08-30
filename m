Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8626278397
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494479"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:10 +1200
Message-Id: <24c8377855081d81e03b475d693e65c3661f06fe.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/13] oe-selftest: devtool: test find-recipe and edit-recipe
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:15 -0000

We weren't testing the devtool find-recipe and edit-recipe subcommands,
with the result that when they regressed recently we didn't notice. Add
some code into the test_devtool_add to test this (since we need a
recipe in the workspace, and adding a new test with all that preamble
would seem a bit excessive for these simple checks). Also take the
opportunity to refactor the test a little bit so that the recipe name
and version are variables rather than hardcoding them everywhere.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 88d6972..c17131a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -194,26 +194,35 @@ class DevtoolTests(DevtoolBase):
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
+        pn = 'pv'
+        pv = '1.5.3'
         url = 'http://www.ivarch.com/programs/sources/pv-1.5.3.tar.bz2'
         result = runCmd('wget %s' % url, cwd=tempdir)
-        result = runCmd('tar xfv pv-1.5.3.tar.bz2', cwd=tempdir)
-        srcdir = os.path.join(tempdir, 'pv-1.5.3')
+        result = runCmd('tar xfv %s' % os.path.basename(url), cwd=tempdir)
+        srcdir = os.path.join(tempdir, '%s-%s' % (pn, pv))
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')), 'Unable to find configure script in source directory')
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake -c cleansstate pv')
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % pn)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add pv %s' % srcdir)
+        result = runCmd('devtool add %s %s' % (pn, srcdir))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Test devtool status
         result = runCmd('devtool status')
-        self.assertIn('pv', result.output)
+        recipepath = '%s/recipes/%s/%s_%s.bb' % (self.workspacedir, pn, pn, pv)
+        self.assertIn(recipepath, result.output)
         self.assertIn(srcdir, result.output)
+        # Test devtool find-recipe
+        result = runCmd('devtool -q find-recipe %s' % pn)
+        self.assertEqual(recipepath, result.output.strip())
+        # Test devtool edit-recipe
+        result = runCmd('EDITOR="echo 123" devtool -q edit-recipe %s' % pn)
+        self.assertEqual('123 %s' % recipepath, result.output.strip())
         # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
-        bitbake('pv -c cleansstate')
+        bitbake('%s -c cleansstate' % pn)
         # Test devtool build
-        result = runCmd('devtool build pv')
-        bb_vars = get_bb_vars(['D', 'bindir'], 'pv')
+        result = runCmd('devtool build %s' % pn)
+        bb_vars = get_bb_vars(['D', 'bindir'], pn)
         installdir = bb_vars['D']
         self.assertTrue(installdir, 'Could not query installdir variable')
         bindir = bb_vars['bindir']
-- 
2.9.5


