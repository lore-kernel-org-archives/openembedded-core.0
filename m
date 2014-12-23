Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DE8647276F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 16:10:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2014 08:08:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,632,1413270000"; d="scan'208";a="628280283"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.178])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2014 08:08:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 16:08:46 +0000
Message-Id: <2812202181243d7d4ebcbf9c3d5ccf2200816f4b.1419350817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] oeqa/selftest: improve failure messages for devtool tests
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
X-List-Received-Date: Tue, 23 Dec 2014 16:10:09 -0000

assertTrue prints "False is not True" if it fails, which is pretty much
useless. Use a more appropriate assertion test where practical and add a
message where it isn't.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index e8ff536..e158ad9 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -25,15 +25,15 @@ class DevtoolTests(oeSelfTest):
         result = runCmd('devtool create-workspace %s' % tempdir)
         self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')))
         result = runCmd('bitbake-layers show-layers')
-        self.assertTrue(tempdir in result.output)
+        self.assertIn(tempdir, result.output)
         # Try creating a workspace layer with the default path
         self.track_for_cleanup(workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool create-workspace')
         self.assertTrue(os.path.isfile(os.path.join(workspacedir, 'conf', 'layer.conf')))
         result = runCmd('bitbake-layers show-layers')
-        self.assertTrue(tempdir not in result.output)
-        self.assertTrue(workspacedir in result.output)
+        self.assertNotIn(tempdir, result.output)
+        self.assertIn(workspacedir, result.output)
 
     def test_recipetool_create(self):
         # Try adding a recipe
@@ -74,7 +74,7 @@ class DevtoolTests(oeSelfTest):
         recipefile = os.path.join(tempdir, 'libmatchbox.bb')
         srcuri = 'git://git.yoctoproject.org/libmatchbox'
         result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
-        self.assertTrue(os.path.isfile(recipefile))
+        self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
         checkvars['LICENSE'] = 'LGPLv2.1'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
@@ -111,7 +111,7 @@ class DevtoolTests(oeSelfTest):
         result = runCmd('wget %s' % url, cwd=tempdir)
         result = runCmd('tar xfv pv-1.5.3.tar.bz2', cwd=tempdir)
         srcdir = os.path.join(tempdir, 'pv-1.5.3')
-        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')))
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')), 'Unable to find configure script in source directory')
         # Test devtool add
         self.track_for_cleanup(workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate pv')
@@ -127,9 +127,9 @@ class DevtoolTests(oeSelfTest):
         # Test devtool build
         result = runCmd('devtool build pv')
         installdir = get_bb_var('D', 'pv')
-        self.assertTrue(installdir)
+        self.assertTrue(installdir, 'Could not query installdir variable')
         bindir = get_bb_var('bindir', 'pv')
-        self.assertTrue(bindir)
+        self.assertTrue(bindir, 'Could not query bindir variable')
         if bindir[0] == '/':
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
@@ -167,9 +167,9 @@ class DevtoolTests(oeSelfTest):
         result = runCmd("sed -i 's!^\.TH.*!.TH MDADM 8 \"\" v9.999-custom!' %s" % os.path.join(tempdir, 'mdadm.8.in'))
         bitbake('mdadm -c package')
         pkgd = get_bb_var('PKGD', 'mdadm')
-        self.assertTrue(pkgd)
+        self.assertTrue(pkgd, 'Could not query PKGD variable')
         mandir = get_bb_var('mandir', 'mdadm')
-        self.assertTrue(mandir)
+        self.assertTrue(mandir, 'Could not query mandir variable')
         if mandir[0] == '/':
             mandir = mandir[1:]
         with open(os.path.join(pkgd, mandir, 'man8', 'mdadm.8'), 'r') as f:
@@ -223,7 +223,7 @@ class DevtoolTests(oeSelfTest):
             elif re.search('minicom_[^_]*.bb$', line):
                 self.assertEqual(line[:3], ' M ', 'Unexpected status in line: %s' % line)
             else:
-                self.assertTrue(False, 'Unexpected modified file in status: %s' % line)
+                raise AssertionError('Unexpected modified file in status: %s' % line)
 
     def test_devtool_extract(self):
         # Check preconditions
-- 
1.9.3


