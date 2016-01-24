Return-Path: <costin.c.constantin@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6D976FF5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:37:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2016 11:37:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="867558804"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 24 Jan 2016 11:37:51 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 073722C8001;
	Sun, 24 Jan 2016 12:25:43 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:40 +0200
Message-Id: <1453664991-31706-2-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Subject: [PATCH 02/13] classes/testimage.bbclass: add support for binaries export
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
X-List-Received-Date: Sun, 24 Jan 2016 19:37:51 -0000

Some test cases require support for target and native binaries.
This enhancement is designed to help exporting testing environment
for machines where poky/bitbake environment is not available.
At the same time, tarball files are created that encapsulate
native, target specific and runner related files separatelly.
This helps deployment of separate functionality files in
their own tarballs.

Partial fix for [YOCTO #7850].

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/classes/testimage.bbclass | 74 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 37af46f..2e963f8 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -1,6 +1,9 @@
 # Copyright (C) 2013 Intel Corporation
 #
 # Released under the MIT license (see COPYING.MIT)
+#from inspect import isclass
+#import importlib
+
 
 
 # testimage.bbclass enables testing of qemu images using python unittests.
@@ -170,7 +173,6 @@ def get_tests_list(d, type="runtime"):
             bb.debug(2, 'Searching for tests in %s' % testpath)
             if os.path.exists(testpath):
                 add_auto_list(testpath)
-
     return testslist
 
 
@@ -263,7 +265,77 @@ def exportTests(d,tc):
         for f in files:
             shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
 
+    #integrating binaries too
+    # creting needed directory structure
+    arch = te.get_dest_folder(d.getVar("TUNE_FEATURES", True), os.listdir(d.getVar("DEPLOY_DIR_RPM", True)))
+    bb.utils.mkdirhier(os.path.join(exportpath,"tar_files"))
+    bb.utils.mkdirhier(os.path.join(exportpath,"binaries", arch, "packaged_binaries"))
+    bb.utils.mkdirhier(os.path.join(exportpath,"binaries", "native"))
+    bb.utils.mkdirhier(os.path.join(exportpath,"binaries", arch, "extracted_binaries"))
+    with open(os.path.join(exportpath,"binaries",arch, "mapping.cfg"), "a") as mapping_file:
+        #prepare the needed info for the mapping file
+        mapping_params = dict()
+        mapping_params[d.getVar("MACHINE",True)] = (d.getVar("TARGET_SYS",True), d.getVar("TUNE_FEATURES",True))
+        mapping_file.write(mapping_params.__str__())
+
+    populate_binaries(d)
+
+    # create the "runner" tar file, but before that erase them if created in a previous run
+    [runner_tar, bin_tar, native_tar] = [os.path.join(exportpath,"tar_files", item) for item in ("runner_files.tar", "{}_binaries.tar".format(arch), "native_binaries.tar")]
+    for item in os.listdir(exportpath): # create the runner tarball
+        if item not in ('binaries','tar_files'):
+            create_tar(runner_tar, os.path.join(exportpath,item), item.replace(exportpath, ""))
+    #create the binaries tar file
+    for item in os.listdir(os.path.join(exportpath, "binaries")):
+        if re.search("native", item): # creating native binaries tarfile
+            create_tar(os.path.join(exportpath,"tar_files", os.path.basename(native_tar)), os.path.join(exportpath,"binaries", "native"), os.path.join("binaries", item.replace(exportpath, "")))
+        else: # creating target binaries tar file
+            create_tar(os.path.join(exportpath,"tar_files",os.path.basename(bin_tar)), os.path.join(exportpath,"binaries", arch), os.path.join("binaries", item.replace(exportpath, "")))
     bb.plain("Exported tests to: %s" % exportpath)
+    for item in os.listdir(exportpath):
+        if item == "tar_files":
+            bb.plain("Exported tarballs to: {}".format(exportpath + "/tar_files"))
+
+def create_tar(tar_fl,file_to_add, a_name=None):
+    import tarfile as tar
+    with tar.open(tar_fl,"a") as tar_file:
+        tar_file.add(file_to_add, arcname=a_name) 
+
+def obtain_binaries(d, param):
+    """
+    this func. will extract binaries based on their version (if required)
+    """
+    import oeqa.utils.testexport as te
+    te.process_binaries(d, param) # for native packages, this is not extracting binaries, but only copies them
+                                  # for a local machine with poky on it the user should build native binaries
+
+def populate_binaries(d):
+    from oeqa.oetest import oeRuntimeTest
+    import importlib, re
+    testlist = get_tests_list(d)
+    bin_list = list()
+    for module in testlist:
+        test_module = importlib.import_module(module)
+        for item in vars(test_module).values():
+            if isinstance(item, type(oeRuntimeTest)) and issubclass(item, oeRuntimeTest) and item is not oeRuntimeTest:
+                for test in dir(item):
+                    if test.startswith('test_') and hasattr(vars(item)[test], '__call__'):
+                        bin_list.extend(vars(item)[test].args)                  
+    for item in list(set(bin_list)):
+        bin_name = ""
+        packaged = ""
+        version = ""
+        t = ""
+        for index, value in enumerate(item):
+            if index == 0:
+                bin_name = value
+            elif index == 1 and re.match("[0-9]+\.",value):
+                version = value
+            elif value == "rpm":
+                packaged = value
+            elif value == "native":
+                t = value
+        obtain_binaries(d,(bin_name,version,packaged,t))
 
 
 def testimage_main(d):
-- 
2.5.0


