Return-Path: <costin.c.constantin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BAB21731AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 18 Dec 2015 04:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="843990146"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2015 04:28:36 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id B8F366A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:37 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:40:54 +0200
Message-Id: <cc3c84fac65210a37769e2057bf1d4db10f42965.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
Subject: [PATCH 02/12] classes/testimage.bbclass: add support for binaries export
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:37 -0000

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
 meta/classes/testimage.bbclass | 126 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e833db4..bcf113f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -263,7 +263,133 @@ def exportTests(d,tc):
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
+def read_test_files(file_pth):
+    """
+    The only way to read what binaries are to be included in the tarball file(s) is to search for each
+    test file (.py) and see if the decorator TestNeedsBin is present. If yes, just extract the information
+    from there. The lib/oeqa/runtime dir is taken as default to read files from. The result is a list 
+    containing needed information like binary name, binary, version etc. in a string of values separated 
+    by "_". This aproach was taken because it helps when TestNeedsBin contains multiple binaries and some
+    are with identical name and different version or when same binary is needed both in extracted and 
+    packaged mode. A dictionary would have eliminated the duplicate same key (in our case binary name) 
+    fields.
+    """
+    import re
+    bin_ver = list()
+    f_to_list = list()
+    #the actual reading part of the file:
+    with open(file_pth, 'r') as fl:
+        f_to_list = list(fl)
+    def process_found_tuple(list_of_tuples):
+        for params in eval("{}".format(list_of_tuples)): # in our case, value is a list of values
+            ver = ""
+            packaged = ""
+            t = ""
+            for item in eval("{}".format(params)):
+                if re.match("[0-9]+\.",item):
+                    ver = item
+                elif item == "rpm":
+                    packaged = "rpm"
+                elif item == "native":
+                    t = item
+            bin_ver.append("{}_{}_{}_{}".format(params[0],ver,packaged,t))
+
+    def search_for_tuples_of_params(i):
+        read_tuple = ""
+        ind = i
+        if re.search('\(\(', f_to_list[ind]) and not f_to_list[ind].startswith("#"): # the line is sure to be a valid one, not a comment
+            read_tuple += f_to_list[ind].strip()
+            while True:
+                if re.search('\)\)', read_tuple):
+                    read_tuple = read_tuple.replace("@TestNeedsBin","")#read_tuple[read_tuple.find('((')+1:read_tuple.find('))')+1]
+                    break
+                else:
+                    ind += 1
+                    read_tuple += f_to_list[ind].strip()
+            process_found_tuple(read_tuple)
+            return ind
+        return
+
+    # parsing all found lists
+    for index,line in enumerate(f_to_list): 
+        line=line.strip()
+        if re.search("@TestNeedsBin", line) and not line.startswith("#") and not (re.search('\(\(', line) or re.search('\)\)', line)):
+            packaged = ""
+            version = ""
+            t = ""
+            for index, value in enumerate(eval(line.replace("@TestNeedsBin", ""))):
+                if index == 0:
+                    bin_name = value
+                elif index == 1 and re.match("[0-9]+\.",value):
+                    version = value
+                elif value == "rpm":
+                    packaged = value
+                elif value == "native":
+                    t = value
+            bin_ver.append("{}_{}_{}_{}".format(bin_name,version,packaged,t))
+        elif re.search("@TestNeedsBin", line) and not line.startswith("#") and (re.search('\(\(', line) or re.search('\)\)', line)):
+            search_for_tuples_of_params(index)
+
+    return bin_ver
+
+def populate_binaries(d):
+    default_pth_to_files = os.path.join(d.getVar("COREBASE",True), "meta/lib/oeqa/runtime")
+    pth_to_file = list()
+    pth_to_file.append(default_pth_to_files)
+    bin_with_version = list()
+    bbpath = d.getVar("BBPATH", True).split(':')
+    testlist = get_tests_list(d)
+    for pth in bbpath:
+        for item in testlist:
+            test_file_pth = os.path.join(pth, "lib", item.replace(".", os.sep) + ".py")
+            if os.path.exists(test_file_pth):
+                bin_with_version.extend(read_test_files(test_file_pth))
+    for item in set(bin_with_version):
+        obtain_binaries(d,item)
 
 
 def testimage_main(d):
-- 
2.5.0


