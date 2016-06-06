Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA30731CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 17:20:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jun 2016 10:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,428,1459839600"; d="scan'208";a="822747444"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga003.jf.intel.com with ESMTP; 06 Jun 2016 10:20:58 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 09:15:54 +0000
Message-Id: <1465204554-4392-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <8f4f5951c235aa47f16edd0454512e2ca8be0264.1465196934.git.mariano.lopez@linux.intel.com>
References: <8f4f5951c235aa47f16edd0454512e2ca8be0264.1465196934.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 7/7] testexport.bbclass: Create tarballs for easy release
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
X-List-Received-Date: Mon, 06 Jun 2016 17:20:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This create tarballs in the testexport directory in order
to make easier to distribute the test in another systems.

There are three tarballs, one for the metadata that is not
arch dependant, another for packages needed by the DUT
(this depends of target MACHINE), and the last one for the
SDK needed by the systems that perform the tests.

This also create only the tarballs that are needed.

[YOCTO #8481]

(From OE-Core rev: f8a0456e100b07a966cc24a78f197400c5a2ccab)

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 6009349..15fa470 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -128,9 +128,13 @@ def exportTests(d,tc):
         for f in files:
             shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
 
+    # Create tar file for common parts of testexport
+    create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR", True))
+
     # Copy packages needed for runtime testing
     export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True), "packages")
     test_pkg_dir = d.getVar("TEST_NEEDED_PACKAGES_DIR", True)
+    need_pkg_dir = False
     for root, subdirs, files in os.walk(test_pkg_dir):
         for subdir in subdirs:
             tmp_dir = os.path.join(root.replace(test_pkg_dir, "").lstrip("/"), subdir)
@@ -138,10 +142,18 @@ def exportTests(d,tc):
             bb.utils.mkdirhier(new_dir)
 
         for f in files:
+            need_pkg_dir = True
             src_f = os.path.join(root, f)
             dst_f = os.path.join(export_pkg_dir, root.replace(test_pkg_dir, "").lstrip("/"), f)
             shutil.copy2(src_f, dst_f)
 
+    if need_pkg_dir:
+        # Create tar file for packages needed by the DUT
+        create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE", True), export_pkg_dir)
+    else:
+        # Remov packages dir from exported test
+        bb.utils.remove(export_pkg_dir, True)
+
     # Copy SDK
     if d.getVar("TEST_EXPORT_SDK_ENABLED", True) == "1":
         sdk_deploy = d.getVar("SDK_DEPLOY", True)
@@ -152,6 +164,9 @@ def exportTests(d,tc):
         bb.utils.mkdirhier(export_sdk_dir)
         shutil.copy2(tarball_path, export_sdk_dir)
 
+        # Create tar file for the sdk
+        create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARCH", True), export_sdk_dir)
+
     bb.plain("Exported tests to: %s" % exportpath)
 
 def testexport_main(d):
@@ -183,6 +198,23 @@ def testexport_main(d):
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


