Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3042B771CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 18:51:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jun 2016 11:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,402,1459839600"; d="scan'208";a="989084362"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 01 Jun 2016 11:51:46 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 10:46:44 +0000
Message-Id: <7f20f8bee3fd201bae22f82fb7309573bce458b4.1464768925.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464768925.git.mariano.lopez@linux.intel.com>
References: <cover.1464768925.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464768925.git.mariano.lopez@linux.intel.com>
References: <cover.1464768925.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 5/5] testexport.bbclass: Create tarballs for easy release
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
X-List-Received-Date: Wed, 01 Jun 2016 18:51:45 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This create tarballs in the testexport directory in order
to make easier to distribute the test in another systems.

There are three tarballs, one for the metadata that is not
arch dependant, another for packages needed by the DUT
(this depends of target MACHINE), and the last one for the
SDK needed by the systems that perform the tests.

[YOCTO #8481]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 33acadd..d519f22 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -127,6 +127,9 @@ def exportTests(d,tc):
         for f in files:
             shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
 
+    # Create tar file for common parts of testexport
+    create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR", True))
+
     # Copy packages needed for runtime testing
     export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True), "packages")
     test_pkg_dir = d.getVar("TEST_NEEDED_PACKAGES_DIR", True)
@@ -141,6 +144,9 @@ def exportTests(d,tc):
             dst_f = os.path.join(export_pkg_dir, root.replace(test_pkg_dir, "").lstrip("/"), f)
             shutil.copy2(src_f, dst_f)
 
+    # Create tar file for packages needed by the DUT
+    create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE", True), export_pkg_dir)
+
     # Copy SDK
     if d.getVar("TEST_EXPORT_SDK_ENABLED", True) == "1":
         sdk_deploy = d.getVar("SDK_DEPLOY", True)
@@ -151,6 +157,9 @@ def exportTests(d,tc):
         bb.utils.mkdirhier(export_sdk_dir)
         shutil.copy2(tarball_path, export_sdk_dir)
 
+    # Create tar file for the sdk
+    create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARCH", True), export_sdk_dir)
+
     bb.plain("Exported tests to: %s" % exportpath)
 
 def testexport_main(d):
@@ -182,6 +191,23 @@ def testexport_main(d):
     tc.extract_packages()
     exportTests(d,tc)
 
+def create_tarball(d, tar_name, src_dir):
+
+    import tarfile
+
+    tar_path = os.path.join(d.getVar("TEST_EXPORT_DIR", True), tar_name)
+    current_dir = os.getcwd()
+    src_dir = src_dir.rstrip('/')
+    dir_name = os.path.dirname(src_dir)
+    base_name = os.path.basename(src_dir)
+
+    os.chdir(dir_name)
+    tar = tarfile.open(tar_path, "w:gz")
+    tar.add(base_name)
+    tar.close()
+    os.chdir(current_dir)
+
+
 testexport_main[vardepsexclude] =+ "BB_ORIGENV"
 
 inherit testimage
-- 
2.6.6


