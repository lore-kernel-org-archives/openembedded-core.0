Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0B371ADA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 16:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6FDB418300
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:20:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8o29FwByFiHB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:20:34 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 190751821F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:20:34 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E00C81E086
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:20:33 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D55FD1E085
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:20:33 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:20:33 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id C9C7B2C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:20:33 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id B17697C065; Mon,  9 Jan 2017 17:20:33 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 17:20:33 +0100
Message-Id: <1483978833-20276-2-git-send-email-olani@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1483978833-20276-1-git-send-email-olani@axis.com>
References: <1483978833-20276-1-git-send-email-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH v2 2/2] oe-selftest: devtool: Add test for externalsrc buildclean
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
X-List-Received-Date: Mon, 09 Jan 2017 16:20:43 -0000

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oeqa/selftest/devtool.py | 46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 19c5ccf..c37d194 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -469,6 +469,52 @@ class DevtoolTests(DevtoolBase):
         matches = glob.glob(stampprefix + '*')
         self.assertFalse(matches, 'Stamp files exist for recipe mdadm that should have been cleaned')
 
+    def test_devtool_buildclean(self):
+        def assertFile(path, *paths):
+            f = os.path.join(path, *paths)
+            self.assertTrue(os.path.exists(f), "%r does not exist" % f)
+        def assertNoFile(path, *paths):
+            f = os.path.join(path, *paths)
+            self.assertFalse(os.path.exists(os.path.join(f)), "%r exists" % f)
+
+        # Clean up anything in the workdir/sysroot/sstate cache
+        bitbake('mdadm m4 -c cleansstate')
+        # Try modifying a recipe
+        tempdir_mdadm = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir_m4 = tempfile.mkdtemp(prefix='devtoolqa')
+        builddir_m4 = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir_mdadm)
+        self.track_for_cleanup(tempdir_m4)
+        #self.track_for_cleanup(builddir_m4)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake -c clean mdadm m4')
+        self.write_recipeinc('m4', 'EXTERNALSRC_BUILD = "%s"\ndo_clean() {\n\t:\n}\n' % builddir_m4)
+        try:
+            runCmd('devtool modify mdadm -x %s' % tempdir_mdadm)
+            runCmd('devtool modify m4 -x %s' % tempdir_m4)
+            assertNoFile(tempdir_mdadm, 'mdadm')
+            assertNoFile(builddir_m4, 'src/m4')
+            result = bitbake('m4 -e')
+            result = bitbake('mdadm m4 -c compile')
+            self.assertEqual(result.status, 0)
+            assertFile(tempdir_mdadm, 'mdadm')
+            assertFile(builddir_m4, 'src/m4')
+            # Check that buildclean task exists and does call make clean
+            bitbake('mdadm m4 -c buildclean')
+            assertNoFile(tempdir_mdadm, 'mdadm')
+            assertNoFile(builddir_m4, 'src/m4')
+            bitbake('mdadm m4 -c compile')
+            assertFile(tempdir_mdadm, 'mdadm')
+            assertFile(builddir_m4, 'src/m4')
+            bitbake('mdadm m4 -c clean')
+            # Check that buildclean task is run before clean for B == S
+            assertNoFile(tempdir_mdadm, 'mdadm')
+            # Check that buildclean task is not run before clean for B != S
+            assertFile(builddir_m4, 'src/m4')
+        finally:
+            self.delete_recipeinc('m4')
+
     @testcase(1166)
     def test_devtool_modify_invalid(self):
         # Try modifying some recipes
-- 
2.1.4


