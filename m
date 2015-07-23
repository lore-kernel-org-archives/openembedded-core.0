Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id DEB7376244
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 20:07:40 +0000 (UTC)
Received: by pacan13 with SMTP id an13so1417364pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0PysWJfNEfjNvKIva+jo9XWDWSxnHBu5VnBKnC2K8xs=;
	b=dXkfhHdNSd3LttYmfVuCmJggAGVK/sLZw99aDmlur0ZdE089VaWwZsD2zNI0MtTEBc
	vtSiexxjMDw9RjteVAQYN/04OBbXlSoo+Dx4IXyj6t+78Hf+4JkyZTYY6qKzGrmuSi3i
	yiqPl6js5+wHgsiVSSb5VcFuz/oIClqt5SVsKtEM1ETGK7i+eZ/76s0bvNRuB+H8v1Ff
	Hrs7jUHPmwZ5uTM3P8YHztjREUNPGiJ3SN9e7+un0Oz1Hveos9g8e+VGDBcZ7VHJrc9Z
	Ws9jM3k27KPszIHASVWCmYft/MosOH7j+/rGPyZLEImltLJ/OWpulMZoTjHJlNAuOkx1
	VovA==
X-Received: by 10.70.43.225 with SMTP id z1mr21930473pdl.45.1437682060483;
	Thu, 23 Jul 2015 13:07:40 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	k9sm10475524pdp.60.2015.07.23.13.07.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 13:07:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 13:08:34 -0700
Message-Id: <037704ac325d534a663d16ce5e79a0fdf270076b.1437681596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1437681596.git.chris_larson@mentor.com>
References: <cover.1437681596.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] oeqa/recipetool: refactor / split out RecipetoolBase
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
X-List-Received-Date: Thu, 23 Jul 2015 20:07:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 52 +++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 12c6b25..854ebfa 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -1,37 +1,29 @@
-import unittest
 import os
 import logging
-import re
 import tempfile
+import urlparse
 
-import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.decorators import testcase
-from oeqa.selftest.devtool import DevtoolBase
+from oeqa.selftest import devtool
 
 
 templayerdir = ''
 
+
 def setUpModule():
     global templayerdir
     templayerdir = tempfile.mkdtemp(prefix='recipetoolqa')
     create_temp_layer(templayerdir, 'selftestrecipetool')
-    result = runCmd('bitbake-layers add-layer %s' % templayerdir)
-    # Ensure we have the right data in shlibs/pkgdata
-    logger = logging.getLogger("selftest")
-    logger.info('Running bitbake to generate pkgdata')
-    bitbake('base-files coreutils busybox selftest-recipetool-appendfile')
+    runCmd('bitbake-layers add-layer %s' % templayerdir)
+
 
 def tearDownModule():
     runCmd('bitbake-layers remove-layer %s' % templayerdir, ignore_status=True)
     runCmd('rm -rf %s' % templayerdir)
-    # Shouldn't leave any traces of this artificial recipe behind
-    bitbake('-c cleansstate selftest-recipetool-appendfile')
 
 
-class RecipetoolTests(DevtoolBase):
-
+class RecipetoolBase(devtool.DevtoolBase):
     def setUpLocal(self):
         self.tempdir = tempfile.mkdtemp(prefix='recipetoolqa')
         self.track_for_cleanup(self.tempdir)
@@ -42,27 +34,51 @@ class RecipetoolTests(DevtoolBase):
     def tearDownLocal(self):
         runCmd('rm -rf %s/recipes-*' % templayerdir)
 
-    def _try_recipetool_appendfile(self, testrecipe, destfile, newfile, options, expectedlines, expectedfiles):
-        result = runCmd('recipetool appendfile %s %s %s %s' % (templayerdir, destfile, newfile, options))
+    def _try_recipetool_appendcmd(self, cmd, testrecipe, expectedfiles, expectedlines=None):
+        result = runCmd(cmd)
         self.assertNotIn('Traceback', result.output)
+
         # Check the bbappend was created and applies properly
         recipefile = get_bb_var('FILE', testrecipe)
         bbappendfile = self._check_bbappend(testrecipe, recipefile, templayerdir)
+
         # Check the bbappend contents
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines(), "Expected lines are not present in %s" % bbappendfile)
+        if expectedlines is not None:
+            with open(bbappendfile, 'r') as f:
+                self.assertEqual(expectedlines, f.readlines(), "Expected lines are not present in %s" % bbappendfile)
+
         # Check file was copied
         filesdir = os.path.join(os.path.dirname(bbappendfile), testrecipe)
         for expectedfile in expectedfiles:
             self.assertTrue(os.path.isfile(os.path.join(filesdir, expectedfile)), 'Expected file %s to be copied next to bbappend, but it wasn\'t' % expectedfile)
+
         # Check no other files created
         createdfiles = []
         for root, _, files in os.walk(filesdir):
             for f in files:
                 createdfiles.append(os.path.relpath(os.path.join(root, f), filesdir))
         self.assertTrue(sorted(createdfiles), sorted(expectedfiles))
+
         return bbappendfile, result.output
 
+
+class RecipetoolTests(RecipetoolBase):
+    @classmethod
+    def setUpClass(cls):
+        # Ensure we have the right data in shlibs/pkgdata
+        logger = logging.getLogger("selftest")
+        logger.info('Running bitbake to generate pkgdata')
+        bitbake('-c packagedata base-files coreutils busybox selftest-recipetool-appendfile')
+
+    @classmethod
+    def tearDownClass(cls):
+        # Shouldn't leave any traces of this artificial recipe behind
+        bitbake('-c cleansstate selftest-recipetool-appendfile')
+
+    def _try_recipetool_appendfile(self, testrecipe, destfile, newfile, options, expectedlines, expectedfiles):
+        cmd = 'recipetool appendfile %s %s %s %s' % (templayerdir, destfile, newfile, options)
+        return self._try_recipetool_appendcmd(cmd, testrecipe, expectedfiles, expectedlines)
+
     def _try_recipetool_appendfile_fail(self, destfile, newfile, checkerror):
         cmd = 'recipetool appendfile %s %s %s' % (templayerdir, destfile, newfile)
         result = runCmd(cmd, ignore_status=True)
-- 
2.2.1


