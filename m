Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD6E9731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900462111"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:36 +1300
Message-Id: <3d74ee1f0c87909b0ea0e599466495eded1551fe.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/11] oe-selftest: devtool: add another devtool add test
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:32 -0000

Add a test so we validate the following recently implemented/fixed
aspects of "devtool add":

* Adding from a local directory with no name specified
* Auto-detecting the name and version from autoconf files
* Setting SRC_URI and S from the local git repo
* Showing the recipe file path in "devtool status" if it has been
  created within the workspace

Incidentally also tests:

* LICENSE and LIC_FILES_CHKSUM detection (though just for this piece of
  software)
* Extracting a dependency from autoconf (though just for this narrow
  case since there's only one)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 345cabb..e5a2134 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -201,6 +201,43 @@ class DevtoolTests(DevtoolBase):
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
+    def test_devtool_add_git_local(self):
+        # Fetch source from a remote URL, but do it outside of devtool
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        pn = 'dbus-wait'
+        # We choose an https:// git URL here to check rewriting the URL works
+        url = 'https://git.yoctoproject.org/git/dbus-wait'
+        # Force fetching to "noname" subdir so we verify we're picking up the name from autoconf
+        # instead of the directory name
+        result = runCmd('git clone %s noname' % url, cwd=tempdir)
+        srcdir = os.path.join(tempdir, 'noname')
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure script in source directory')
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # Don't specify a name since we should be able to auto-detect it
+        result = runCmd('devtool add %s' % srcdir)
+        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        # Check the recipe name is correct
+        recipefile = get_bb_var('FILE', pn)
+        self.assertIn('%s_git.bb' % pn, recipefile, 'Recipe file incorrectly named')
+        self.assertIn(recipefile, result.output)
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(pn, result.output)
+        self.assertIn(srcdir, result.output)
+        self.assertIn(recipefile, result.output)
+        checkvars = {}
+        checkvars['LICENSE'] = 'GPLv2'
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
+        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['PV'] = '0.1+git${SRCPV}'
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https'
+        checkvars['SRCREV'] = '${AUTOREV}'
+        checkvars['DEPENDS'] = set(['dbus'])
+        self._test_recipe_contents(recipefile, checkvars, [])
+
     @testcase(1162)
     def test_devtool_add_library(self):
         # We don't have the ability to pick up this dependency automatically yet...
-- 
2.5.0


