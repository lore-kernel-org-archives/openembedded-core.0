Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFDC788BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 16:56:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 09:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,462,1515484800"; d="scan'208";a="23835530"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2018 09:56:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 18:49:43 +0200
Message-Id: <20180312164944.39923-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
References: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/4] oe-selftest: add a test for failing package post-installation scriptlets
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
X-List-Received-Date: Mon, 12 Mar 2018 16:56:21 -0000

The test runs a scriptlet that has an intentionally failing command in the middle
and checks for two things:
1) that bitbake does warn the user about the failure
2) that scriptlet execution stops at that point.

The test is run for all three package types: rpm, deb, ipk.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-test/postinst/postinst_1.0.bb          | 14 +++++++-
 meta/lib/oeqa/selftest/cases/runtime_test.py       | 37 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/postinst/postinst_1.0.bb b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
index d4bab6dcc22..913bfabf89e 100644
--- a/meta-selftest/recipes-test/postinst/postinst_1.0.bb
+++ b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
@@ -3,11 +3,12 @@ LICENSE = "MIT"
 
 inherit allarch
 
-PACKAGES = "${PN}-rootfs ${PN}-delayed-a ${PN}-delayed-b"
+PACKAGES = "${PN}-rootfs ${PN}-delayed-a ${PN}-delayed-b ${PN}-rootfs-failing"
 
 ALLOW_EMPTY_${PN}-rootfs = "1"
 ALLOW_EMPTY_${PN}-delayed-a = "1"
 ALLOW_EMPTY_${PN}-delayed-b = "1"
+ALLOW_EMPTY_${PN}-rootfs-failing = "1"
 
 RDEPENDS_${PN}-delayed-a = "${PN}-rootfs"
 RDEPENDS_${PN}-delayed-b = "${PN}-delayed-a"
@@ -58,3 +59,14 @@ pkg_postinst_ontarget_${PN}-delayed-b () {
 
     touch ${TESTDIR}/delayed-b
 }
+
+# This scriptlet intentionally includes a bogus command in the middle to test 
+# that we catch and report such errors properly.
+pkg_postinst_${PN}-rootfs-failing () {
+    mkdir -p $D${TESTDIR}
+    touch $D${TESTDIR}/rootfs-before-failure
+    run_a_really_broken_command
+    # Scriptlet execution should stop here; the following commands are NOT supposed to run.
+    # (oe-selftest checks for it).
+    touch $D${TESTDIR}/rootfs-after-failure
+}
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 1c69255b568..9c9b4b34111 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -221,3 +221,40 @@ class Postinst(OESelftestTestCase):
                         for filename in ("rootfs", "delayed-a", "delayed-b"):
                             status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
                             self.assertEqual(output, "found", "%s was not present on boot" % filename)
+
+
+
+    def test_failing_postinst(self):
+        """
+        Summary:        The purpose of this test case is to verify that post-installation
+                        scripts that contain errors are properly reported.
+        Expected:       The scriptlet failure is properly reported.
+                        The file that is created after the error in the scriptlet is not present.
+        Product: oe-core
+        Author: Alexander Kanavin <alexander.kanavin@intel.com>
+        """
+
+        import oe.path
+
+        vars = get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image-minimal")
+        rootfs = vars["IMAGE_ROOTFS"]
+        self.assertIsNotNone(rootfs)
+        sysconfdir = vars["sysconfdir"]
+        self.assertIsNotNone(sysconfdir)
+        # Need to use oe.path here as sysconfdir starts with /
+        hosttestdir = oe.path.join(rootfs, sysconfdir, "postinst-test")
+
+        for classes in ("package_rpm", "package_deb", "package_ipk"):
+            with self.subTest(package_class=classes):
+                features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-rootfs-failing"\n'
+                features += 'PACKAGE_CLASSES = "%s"\n' % classes
+                self.write_config(features)
+                bb_result = bitbake('core-image-minimal')
+                self.assertGreaterEqual(bb_result.output.find("Intentionally failing postinstall scriptlets of ['postinst-rootfs-failing'] to defer them to first boot is deprecated."), 0,
+                    "Warning about a failed scriptlet not found in bitbake output: %s" %(bb_result.output))
+
+                self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs-before-failure")),
+                                    "rootfs-before-failure file was not created")
+                self.assertFalse(os.path.isfile(os.path.join(hosttestdir, "rootfs-after-failure")),
+                                    "rootfs-after-failure file was created")
+
-- 
2.16.1


