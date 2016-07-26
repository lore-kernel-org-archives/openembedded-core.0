Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ED10C731CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:58:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jul 2016 19:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,422,1464678000"; d="scan'208";a="1002452687"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.139.129])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2016 19:58:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 14:57:50 +1200
Message-Id: <2e1841dcd78cef43462c9b8d6264d16d37f90f9f.1469501778.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469501778.git.paul.eggleton@linux.intel.com>
References: <cover.1469501778.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469501778.git.paul.eggleton@linux.intel.com>
References: <cover.1469501778.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] oe-selftest: recipetool: add tests for git URL mangling
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
X-List-Received-Date: Tue, 26 Jul 2016 02:58:22 -0000

Add three tests to verify that the git URL mangling is working the way
it's supposed to. This should prevent us regressing on this again in
future.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index f8f6be3..db1f8de 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -442,6 +442,49 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_github(self):
+        # Basic test to see if github URL mangling works
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        recipefile = os.path.join(temprecipe, 'meson_git.bb')
+        srcuri = 'https://github.com/mesonbuild/meson'
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['Apache-2.0'])
+        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https'
+        inherits = ['setuptools']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+    def test_recipetool_create_github_tarball(self):
+        # Basic test to ensure github URL mangling doesn't apply to release tarballs
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pv = '0.32.0'
+        recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
+        srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['Apache-2.0'])
+        checkvars['SRC_URI'] = 'https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz'
+        inherits = ['setuptools']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+    def test_recipetool_create_git_http(self):
+        # Basic test to check http git URL mangling works
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        recipefile = os.path.join(temprecipe, 'matchbox-terminal_git.bb')
+        srcuri = 'http://git.yoctoproject.org/git/matchbox-terminal'
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['GPLv2'])
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/matchbox-terminal;protocol=http'
+        inherits = ['pkgconfig', 'autotools']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
 class RecipetoolAppendsrcBase(RecipetoolBase):
     def _try_recipetool_appendsrcfile(self, testrecipe, newfile, destfile, options, expectedlines, expectedfiles):
         cmd = 'recipetool appendsrcfile %s %s %s %s %s' % (options, self.templayerdir, testrecipe, newfile, destfile)
-- 
2.5.5


