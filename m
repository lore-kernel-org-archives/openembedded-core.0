Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 23068787C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:42:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181356276"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:42:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:20 +1300
Message-Id: <8b8a491a037ad5a214b412dcaae999466d4aea64.1512438001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/12] oe-selftest: devtool: add test for multiple source trees
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
X-List-Received-Date: Tue, 05 Dec 2017 01:42:12 -0000

Add two synthetic tests for devtool modify + devtool finish: first with
multiple source trees side-by-side, and second to test with one as a
subdirectory of the main source tree. These also test devtool finish's
recently added dry-run option and that detects and errors on uncommitted
changes without being forced.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../devtool/devtool-test-multisrc-subdir_1.0.bb    |  13 +++
 .../devtool-test-multisrc/example-files.tar.gz     | Bin 0 -> 236 bytes
 .../devtool/devtool-test-multisrc/example.patch    |   7 ++
 .../devtool-test-multisrc/mypackage-1.0.tar.gz     | Bin 0 -> 903 bytes
 .../devtool/devtool-test-multisrc_1.0.bb           |  11 +++
 meta/lib/oeqa/selftest/cases/devtool.py            | 109 +++++++++++++++++++++
 6 files changed, 140 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc-subdir_1.0.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc/example-files.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc/example.patch
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc/mypackage-1.0.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc_1.0.bb

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multisrc-subdir_1.0.bb b/meta-selftest/recipes-test/devtool/devtool-test-multisrc-subdir_1.0.bb
new file mode 100644
index 0000000..0430382
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-multisrc-subdir_1.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Recipe to test multiple source trees"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://settings-daemon.c;beginline=1;endline=26;md5=8d77ba1c7a55df48d8d06c5f3d86b49d"
+
+SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;name=xsettings-daemon \
+           git://git.yoctoproject.org/libfakekey;name=libfakekey;destsuffix=git/libfakekey \
+"
+
+SRCREV_xsettings-daemon = "b2e5da502f8c5ff75e9e6da771372ef8e40fd9a2"
+SRCREV_libfakekey = "7ad885912efb2131e80914e964d5e635b0d07b40"
+
+S = "${WORKDIR}/git"
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multisrc/example-files.tar.gz b/meta-selftest/recipes-test/devtool/devtool-test-multisrc/example-files.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..fdab4b7367cda3613468c7813f47acaaac74368c
GIT binary patch
literal 236
zcmV<I02BWoiwFR^niN_91MSt{3W6{c25_%^ioHOzKOT4OV|2NTMS+><gdV>c2AY--
zQ;ELc&A<)LfwRxqo4J&^-5t-lt@qI)xTiI>tI)*z>r*6@<Rk=1(h(O@`A>|NX=kXZ
zov9d$O4H<@&du%rC_9+Hv$a#fYqSGS)8zg9Rr)f2CH-;6gLg9F&*y)zj+x@>PPSs*
zU1059h+`kZc<b(9Y2*Bh;5BCRFMI$0L_YGL5c0o<tQf|A>waKe<NV9uHRkhAz5I9Y
mKS%!8kWIb)TQ>y&000000000000000U%3O3K98mVC;$MDWO;W0

literal 0
HcmV?d00001

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multisrc/example.patch b/meta-selftest/recipes-test/devtool/devtool-test-multisrc/example.patch
new file mode 100644
index 0000000..2e48bf1
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-multisrc/example.patch
@@ -0,0 +1,7 @@
+diff -udNr example-files/test2 example-files2/test2
+--- example-files/test2	2017-11-22 10:29:11.766891385 +1300
++++ example-files2/test2	2017-11-22 10:30:08.920094705 +1300
+@@ -1 +1,3 @@
+ Another example file
++
++More content added here
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multisrc/mypackage-1.0.tar.gz b/meta-selftest/recipes-test/devtool/devtool-test-multisrc/mypackage-1.0.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..b513b283e9adece54a2495ad5f9eaf8eb9eebdd0
GIT binary patch
literal 903
zcmV;219<!&iwFP}s}x!Q1MOE!Z`(K!_F2DTkkf9Vb!^8Epf|>%V`62=kmP1_lqK5Y
zt|bbh+-&~+&M0=XF3{$ZwkXOE0R#?bzIla1x_qkB?4NWm{}}cM*S&9o0b(|r(04eS
z4F3N;qc^-64JO0UWIP=82E*ZOHtxaX+k|t8qiNFypjW5I!`Jj)+y6;XUi5z+t{+5j
z*I$X`4Si69r_=G5`ac>BZ$9h)&3JOtgTWid@J0OM{a?$bRK_S>fih6YMsA;A-=tM5
za~F1vl%RKz6=}1VF0>lb>IrJu7&Oq^HdU3X_K-rR>nCtfwJngx=w17mHWIaSNR82%
zN|6w9ogGVAwP{NZcj_Pw{MHr{uHuu$)$g5`T&4$bR0Xto-h)Tg7W&viBTd_=j7VHi
zRdzV$6vcV_ph|UeLFSFx7p(yYX^#ezpio^Xb*^^wm0f1_aeGjva3NR3y*;)lG$hPq
zMOK)}wQj)30|tf^3PbPGeTlDAqUdWXYI`b^A<1K*%gbD_O3v=sROnQ8M!Ckabw2-=
zSxXYq-|53aKT>v?u5v|5nfH#9;8wcTA7z(KmmyTT#bBRfpeEEWtvzj-BE{&p@>DbQ
zixqZAc21}v|9B#*R$&8b-E<B=PqdE#EIGvCBDrS~2NA<M3O@*sdvL{KTwl3xFOp@r
zNdPq>79<Z4E`S9O@TUko7x-W6h{rL65jbMC_60|w2<HCA!vO@hXc&YE_yR`}vL+#r
z#}k*}F|n<9G+*M9-3nhM4=y+hkp#rLKw1WC7A0c7@mU1xO|%YUjsbYc8;D>Lp&P#9
zLDEOJC<Fch7Z5L*?{~f&w!s9VE<~D(k+@qXunc{VqwtnvZ0y$O&%Q9PxzEJP1&^)R
z9q+6{q`~w^?-bzul6Nxn$nbBTh%lf`=3$UTxO6emDEVZ2FJkTji$qK{Swtc7J5*CN
z2|E@v4EQq*)f+C_f-1D$#QY^1k24?1VluvHV&D1EqsZb1;PU=2ah}su?q_f5<CXg#
zUjUQy{XZU02Xz0>M)v;yF1UUNbeB-$yZad4T|0IX{5rTi{}E^2iodmwSI_@+`04yl
zMs)s1Q{1-a|2u#IzIH#-V^98@mNgE5)Bl4@kH&%?p7;_q_%nch8}#jLu&}VOu&}VO
du&}VOu&}VOu&}VOu(0?E@E>2ucu@c-008QizRdst

literal 0
HcmV?d00001

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multisrc_1.0.bb b/meta-selftest/recipes-test/devtool/devtool-test-multisrc_1.0.bb
new file mode 100644
index 0000000..2b81f83
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-multisrc_1.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Recipe to test multiple source trees"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://mypackage-${PV}.tar.gz \
+           file://example-files.tar.gz \
+           file://example.patch;patchdir=../example-files \
+"
+
+S = "${WORKDIR}/mypackage-${PV}"
+
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 96072be..b051b7c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1568,6 +1568,115 @@ class DevtoolTests(DevtoolBase):
         if files:
             self.fail('Unexpected file(s) copied next to bbappend: %s' % ', '.join(files))
 
+    def test_devtool_finish_modify_multisrc(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Try modifying a recipe
+        self.track_for_cleanup(self.workspacedir)
+        recipe = 'devtool-test-multisrc'
+        recipefile = get_bb_var('FILE', recipe)
+        recipedir = os.path.dirname(recipefile)
+        result = runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s %s' % (recipe, tempdir))
+        mainsrc = os.path.join(tempdir, 'mypackage-1.0')
+        extrasrc = os.path.join(tempdir, 'example-files')
+        self.assertExists(os.path.join(mainsrc, 'mainfile.c'), 'Extracted main source tree could not be found')
+        self.assertExists(os.path.join(extrasrc, 'test2'), 'Extracted extra source tree could not be found')
+        # Try dry-run finishing without changes
+        result = runCmd('devtool finish %s meta-selftest -N' % recipe)
+        self.assertIn('No patches or files need updating', result.output)
+        # Make some changes to both the main and extra source trees
+        with open(os.path.join(mainsrc, 'mainfile.c'), 'a') as f:
+            f.write('\n/* Additional comment */\n')
+        result = runCmd('git commit -a -m "Add a comment"', cwd=mainsrc)
+        with open(os.path.join(extrasrc, 'test2'), 'a') as f:
+            f.write('\nAnother line\n')
+        result = runCmd('git commit -a -m "Add another line"', cwd=extrasrc)
+        # Try finishing now with dry-run to see if it reports what we expect
+        result = runCmd('devtool finish %s meta-selftest -N' % recipe)
+        self.assertNotIn('No patches or files need updating', result.output)
+        self.assertIn('+           file://0001-Add-a-comment.patch \\', result.output)
+        self.assertIn('+           file://0001-Add-another-line.patch;patchdir=../example-files \\', result.output)
+        self.assertNotIn('Removing', result.output)
+        # Now really finish
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        result = runCmd('devtool finish %s meta-selftest' % recipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('??', '.*/.*-Add-a-comment.patch$'),
+                           ('??', '.*/.*-Add-another-line.patch$')]
+        self._check_repo_status(recipedir, expected_status)
+
+    def test_devtool_finish_modify_multisrc_subdir(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Try modifying a recipe
+        self.track_for_cleanup(self.workspacedir)
+        recipe = 'devtool-test-multisrc-subdir'
+        recipefile = get_bb_var('FILE', recipe)
+        recipedir = os.path.dirname(recipefile)
+        result = runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s %s' % (recipe, tempdir))
+        mainsrc = tempdir
+        extrasrc = os.path.join(tempdir, 'libfakekey')
+        self.assertExists(os.path.join(mainsrc, 'xsettings-client.c'), 'Extracted main source tree could not be found')
+        self.assertExists(os.path.join(extrasrc, 'configure.ac'), 'Extracted extra source tree could not be found')
+        # Try dry-run finishing without changes
+        result = runCmd('devtool finish %s meta-selftest -N' % recipe)
+        self.assertIn('No patches or files need updating', result.output)
+        # Make some changes to both the main and extra source trees
+        with open(os.path.join(mainsrc, 'xsettings-client.c'), 'a') as f:
+            f.write('\n/* Additional comment */\n')
+        result = runCmd('git commit -a -m "Add a comment"', cwd=mainsrc)
+        with open(os.path.join(extrasrc, 'README'), 'a') as f:
+            f.write('\nAnother line\n')
+        result = runCmd('git commit -a -m "Add another line to README"', cwd=extrasrc)
+        # Try finishing now with dry-run to see if it reports what we expect
+        # However, the first time it will fail because git treats sub-repositories
+        # the same as submodules, so the parent will appear to have uncommitted changes
+        failed = False
+        try:
+            result = runCmd('devtool finish %s meta-selftest -N' % recipe, assert_error=False)
+        except CommandError as err:
+            if err.retcode != 1:
+                self.fail('Unexpected failure from devtool finish:\n%s' % err.output)
+            lines = []
+            collecting = False
+            for line in err.output.splitlines():
+                if collecting:
+                    if line:
+                        lines.append(line)
+                elif line.startswith('ERROR: Source tree %s is not clean' % mainsrc):
+                    collecting = True
+            lines = lines[:-1]
+            self.assertEqual(lines, [' M libfakekey'], 'Unexpected modifications to main source tree')
+            if not collecting:
+                self.fail('devtool finish did not report uncommitted changes as expected:\n%s' % err.output)
+            failed = True
+        if not failed:
+            self.fail('devtool finish was expected to fail but did not:\n%s' % result.output)
+        result = runCmd('devtool finish %s meta-selftest -N -f' % recipe)
+        self.assertNotIn('No patches or files need updating', result.output)
+        self.assertIn('+           file://0001-Add-a-comment.patch \\', result.output)
+        self.assertIn('+           file://0001-Add-another-line-to-README.patch;patchdir=libfakekey \\', result.output)
+        self.assertNotIn('Removing', result.output)
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        result = runCmd('devtool finish %s -f meta-selftest' % recipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('??', '.*/%s/$' % recipe)]
+        self._check_repo_status(recipedir, expected_status)
+        self.assertExists(os.path.join(os.path.dirname(recipefile), recipe, '0001-Add-a-comment.patch'))
+        self.assertExists(os.path.join(os.path.dirname(recipefile), recipe, '0001-Add-another-line-to-README.patch'))
+
     @OETestID(1626)
     def test_devtool_rename(self):
         # Check preconditions
-- 
2.9.5


