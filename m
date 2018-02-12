Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E8461780B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 11:11:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 03:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17464970"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 12 Feb 2018 03:11:44 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 13:05:19 +0200
Message-Id: <20180212110521.16974-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
References: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/10] oe-selftest: fix tests to reflect man->man-db transition
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
X-List-Received-Date: Mon, 12 Feb 2018 11:11:45 -0000

Rather than apply a patch twice, an incorrect patch is applied
(as the new man-db recipe does not have any patches yet).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../man-db/files/0001-Test-patch-here.patch        | 22 ++++++++++++++++
 .../man_1.6g.bbappend => man-db/man-db_%.bbappend} |  0
 .../recipes-test/man/man/man-1.5h1-make.patch      | 16 ------------
 meta/lib/oeqa/selftest/cases/bbtests.py            | 29 +++++++++++-----------
 4 files changed, 36 insertions(+), 31 deletions(-)
 create mode 100644 meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
 rename meta-selftest/recipes-test/{man/man_1.6g.bbappend => man-db/man-db_%.bbappend} (100%)
 delete mode 100644 meta-selftest/recipes-test/man/man/man-1.5h1-make.patch

diff --git a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
new file mode 100644
index 00000000000..b1d5eab2b8c
--- /dev/null
+++ b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
@@ -0,0 +1,22 @@
+From efc8831f33106e6b48de8e612c2d816fe7d1ae68 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 9 Feb 2018 17:37:48 +0200
+Subject: [PATCH] Test patch here!
+
+This is an invalid patch used by oe-selftest
+---
+ README | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/README b/README
+index 48fff57..26d1234 100644
+--- a/README
++++ b/README
+@@ -1,3 +1,4 @@
++This is a test patch for purposes of oe-selftest
+ THIS LINE MAKES THIS PATCH INVALID README for the man-db manual pager suite
+ ========================================
+ 
+-- 
+2.15.1
+
diff --git a/meta-selftest/recipes-test/man/man_1.6g.bbappend b/meta-selftest/recipes-test/man-db/man-db_%.bbappend
similarity index 100%
rename from meta-selftest/recipes-test/man/man_1.6g.bbappend
rename to meta-selftest/recipes-test/man-db/man-db_%.bbappend
diff --git a/meta-selftest/recipes-test/man/man/man-1.5h1-make.patch b/meta-selftest/recipes-test/man/man/man-1.5h1-make.patch
deleted file mode 100644
index a0d59b78cef..00000000000
--- a/meta-selftest/recipes-test/man/man/man-1.5h1-make.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Test patch here!
-This is invalid patch used by tests in scripts/lib/selftests.
-
---- man-1.5g/man/Makefile.in.mike	Fri Apr  9 13:35:54 1999
-+++ man-1.5g/man/Makefile.in	Fri Apr  9 13:36:45 1999
-@@ -1,8 +1,8 @@
- #MAKE THIS PATCH INVALID
- MAN1 = man whatis apropos
--MAN5 = man.conf
-+MAN5 = man.config
- MAN8 = makewhatis
--ALL = man.1 whatis.1 apropos.1 man.conf.5
-+ALL = man.1 whatis.1 apropos.1 man.config.5
- MAYBE8 = makewhatis
- 
- .SUFFIXES: .man .1 .5 .8
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 4c82049032b..350614967c9 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -64,15 +64,14 @@ class BitbakeTests(OESelftestTestCase):
 
     @OETestID(108)
     def test_invalid_patch(self):
-        # This patch already exists in SRC_URI so adding it again will cause the
-        # patch to fail.
-        self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
+        # This patch should fail to apply.
+        self.write_recipeinc('man-db', 'FILESEXTRAPATHS_prepend := "${THISDIR}/files:"\nSRC_URI += "file://0001-Test-patch-here.patch"')
         self.write_config("INHERIT_remove = \"report-error\"")
-        result = bitbake('man -c patch', ignore_status=True)
-        self.delete_recipeinc('man')
-        bitbake('-cclean man')
+        result = bitbake('man-db -c patch', ignore_status=True)
+        self.delete_recipeinc('man-db')
+        bitbake('-cclean man-db')
         line = self.getline(result, "Function failed: patch_do_patch")
-        self.assertTrue(line and line.startswith("ERROR:"), msg = "Repeated patch application didn't fail. bitbake output: %s" % result.output)
+        self.assertTrue(line and line.startswith("ERROR:"), msg = "Incorrectly formed patch application didn't fail. bitbake output: %s" % result.output)
 
     @OETestID(1354)
     def test_force_task_1(self):
@@ -132,17 +131,17 @@ class BitbakeTests(OESelftestTestCase):
     @OETestID(168)
     def test_invalid_recipe_src_uri(self):
         data = 'SRC_URI = "file://invalid"'
-        self.write_recipeinc('man', data)
+        self.write_recipeinc('man-db', data)
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 INHERIT_remove = \"report-error\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        bitbake('-ccleanall man')
-        result = bitbake('-c fetch man', ignore_status=True)
-        bitbake('-ccleanall man')
-        self.delete_recipeinc('man')
+        bitbake('-ccleanall man-db')
+        result = bitbake('-c fetch man-db', ignore_status=True)
+        bitbake('-ccleanall man-db')
+        self.delete_recipeinc('man-db')
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
         self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output, msg = "\"invalid\" file \
 doesn't exist, yet no error message encountered. bitbake output: %s" % result.output)
@@ -222,9 +221,9 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 INHERIT_remove = \"report-error\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
-        self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
-        runCmd('bitbake -c cleanall man xcursor-transparent-theme')
-        result = runCmd('bitbake -c unpack -k man xcursor-transparent-theme', ignore_status=True)
+        self.write_recipeinc('man-db',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
+        runCmd('bitbake -c cleanall man-db xcursor-transparent-theme')
+        result = runCmd('bitbake -c unpack -k man-db xcursor-transparent-theme', ignore_status=True)
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
         manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
-- 
2.15.1


