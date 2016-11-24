Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0803371B68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:52:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 12:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063828214"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 12:52:54 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:58:09 -0600
Message-Id: <682b1f49deb3072e793080f84228fa0e6ef35542.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 09/13] selftest: recipetool: use mraa instead of libmatchbox to lessen distro requirements
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
X-List-Received-Date: Thu, 24 Nov 2016 20:52:53 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

libmatchbox requires x11 distro feature to be present, so use another recipe
(mraa) with no extra requirements, allowing test execution of all supported
distros.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index db1f8de..e5e7e43 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -383,22 +383,31 @@ class RecipetoolTests(RecipetoolBase):
     @testcase(1194)
     def test_recipetool_create_git(self):
         # Ensure we have the right data in shlibs/pkgdata
-        bitbake('libpng pango libx11 libxext jpeg libcheck')
+        bitbake('swig-native')
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
-        recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
-        srcuri = 'git://git.yoctoproject.org/libmatchbox'
-        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
+        recipefile = os.path.join(self.tempdir, 'mraa.bb')
+        srcuri = 'git://git.yoctoproject.org/mraa'
+        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=a2277e9f8ca0b4562a42ce3476adf8be71886571", '-x', tempsrc])
+        # MRAA has MIT license (http://git.yoctoproject.org/cgit/cgit.cgi/mraa/tree/COPYING), set it instead of "MIT & Unknown & LGPLv2.1" found by the tool
+        result = runCmd(['sed', '-i', '-e', 's/^LICENSE =.*/LICENCE = "MIT"/', recipefile])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
-        checkvars['LICENSE'] = 'LGPLv2.1'
-        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
+        checkvars['LICENSE'] = 'MIT'
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=66493d54e65bfc12c7983ff2e884f37f \
+                    file://cmake/modules/LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
+                    file://cmake/modules/LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
+                    file://cmake/modules/Copyright.txt;md5=3ba5a6c34481652ce573e5c4e1d707e4 \
+                    file://cmake/modules/COPYING-CMAKE-SCRIPTS;md5=2d149a0f4588c9f5e60c729e786dad45 \
+                    file://src/i2c/LICENSE;md5=48c7b6208b3868cd901b3248010b4d5d \
+                    file://doxygen2jsdoc/COPYING;md5=e8db6501ed294e65418a933925d12058 \
+                    file://doxygen2jsdoc/generators/yuidoc/tmpl/LICENSE;md5=7bd082d54c3a2328a1844a1d8b797f77'
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.11+git${SRCPV}'
+        checkvars['PV'] = '1.0+git${SRCPV}'
         checkvars['SRC_URI'] = srcuri
-        checkvars['DEPENDS'] = set(['libcheck', 'libjpeg-turbo', 'libpng', 'libx11', 'libxext', 'pango'])
-        inherits = ['autotools', 'pkgconfig']
+        checkvars['DEPENDS'] = set(['swig-native'])
+        inherits = ['cmake', 'pythonnative', 'python-dir']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     @testcase(1392)
-- 
2.1.4


