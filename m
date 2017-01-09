Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 28B9671A15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 06:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id AD3B211A022
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qb79-qbD+c7u
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:50 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 39E6911A016
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:50 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 255DF1A05E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:50 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AA6D1A05C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:50 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:50 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id 0ECE6477
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:50 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 034557C066; Mon,  9 Jan 2017 07:51:49 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 07:51:27 +0100
Message-Id: <1483944688-7756-2-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1483944688-7756-1-git-send-email-ola.x.nilsson@axis.com>
References: <1483944688-7756-1-git-send-email-ola.x.nilsson@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH v2 1/2] oe-selftest: devtool: Reverting a change should trigger rebuild
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
X-List-Received-Date: Mon, 09 Jan 2017 06:51:53 -0000

Add code to verify that not only does a change trigger a build, but so
does reverting that change.

Reverting a change in a devtool managed git repo may cause the current
checksum to match the checksum of a previous build, which will cause
bitbake to skip builds that are needed.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 meta/lib/oeqa/selftest/devtool.py | 54 +++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 19c5ccf..a3beefa 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -437,17 +437,33 @@ class DevtoolTests(DevtoolBase):
         # Check git repo
         self._check_src_repo(tempdir)
         # Try building
-        bitbake('mdadm')
+        def list_stamps(globsuffix='*'):
+            stampprefix = get_bb_var('STAMP', 'mdadm')
+            self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe mdadm')
+            return glob.glob(stampprefix + globsuffix)
+
+        numstamps = len(list_stamps('.do_compile.*'))
+        self.assertEqual(numstamps, 0, 'do_compile stamps before first build')
+        for x in range(10):
+            bitbake('mdadm')
+            nowstamps = len(list_stamps('.do_compile.*'))
+            if nowstamps == numstamps:
+                break
+            numstamps = nowstamps
+        else:
+            self.fail('build did not stabilize in 10 iterations')
+
         # Try making (minor) modifications to the source
         modfile = os.path.join(tempdir, 'mdadm.8.in')
         result = runCmd("sed -i 's!^\.TH.*!.TH MDADM 8 \"\" v9.999-custom!' %s" % modfile)
-        sedline = ''
-        with open(modfile, 'r') as f:
-            for line in f:
-                if line.startswith('.TH'):
-                    sedline = line.rstrip()
-                    break
-        self.assertEqual(sedline, '.TH MDADM 8 "" v9.999-custom', 'man .in file not modified (sed failed)')
+
+        def check_TH_line(checkfile, expected, message):
+            with open(checkfile, 'r') as f:
+                for line in f:
+                    if line.startswith('.TH'):
+                        self.assertEqual(line.rstrip(), expected, message)
+
+        check_TH_line(modfile, '.TH MDADM 8 "" v9.999-custom', 'man .in file not modified (sed failed)')
         bitbake('mdadm -c package')
         pkgd = get_bb_var('PKGD', 'mdadm')
         self.assertTrue(pkgd, 'Could not query PKGD variable')
@@ -456,18 +472,24 @@ class DevtoolTests(DevtoolBase):
         if mandir[0] == '/':
             mandir = mandir[1:]
         manfile = os.path.join(pkgd, mandir, 'man8', 'mdadm.8')
-        with open(manfile, 'r') as f:
-            for line in f:
-                if line.startswith('.TH'):
-                    self.assertEqual(line.rstrip(), '.TH MDADM 8 "" v9.999-custom', 'man file not modified. man searched file path: %s' % manfile)
+        check_TH_line(manfile, '.TH MDADM 8 "" v9.999-custom', 'man file not modified. man searched file path: %s' % manfile)
+        # Test reverting the change
+        result = runCmd("git -C %s checkout -- %s" % (tempdir, modfile))
+        check_TH_line(modfile, '.TH MDADM 8 "" v3.4', 'man .in file not restored (git failed)')
+        bitbake('mdadm -c package')
+        pkgd = get_bb_var('PKGD', 'mdadm')
+        self.assertTrue(pkgd, 'Could not query PKGD variable')
+        mandir = get_bb_var('mandir', 'mdadm')
+        self.assertTrue(mandir, 'Could not query mandir variable')
+        if mandir[0] == '/':
+            mandir = mandir[1:]
+        manfile = os.path.join(pkgd, mandir, 'man8', 'mdadm.8')
+        check_TH_line(manfile, '.TH MDADM 8 "" v3.4', 'man file not updated. man searched file path: %s' % manfile)
         # Test devtool reset
-        stampprefix = get_bb_var('STAMP', 'mdadm')
         result = runCmd('devtool reset mdadm')
         result = runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
-        self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe mdadm')
-        matches = glob.glob(stampprefix + '*')
-        self.assertFalse(matches, 'Stamp files exist for recipe mdadm that should have been cleaned')
+        self.assertFalse(list_stamps(), 'Stamp files exist for recipe mdadm that should have been cleaned')
 
     @testcase(1166)
     def test_devtool_modify_invalid(self):
-- 
2.1.4


