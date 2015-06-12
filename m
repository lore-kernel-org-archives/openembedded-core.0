Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D2A8875978
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 12:15:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2015 05:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,601,1427785200"; d="scan'208";a="745528911"
Received: from lpalcu-linux.rb.intel.com ([10.237.104.62])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2015 05:15:18 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Ross Burton <ross.burton@intel.com>
Date: Fri, 12 Jun 2015 15:15:18 +0300
Message-Id: <1434111318-12593-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434111318-12593-1-git-send-email-laurentiu.palcu@intel.com>
References: <1434111318-12593-1-git-send-email-laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] scripts: Add cleanup-downloads-dir tool
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
X-List-Received-Date: Fri, 12 Jun 2015 12:15:24 -0000

The tool will remove obsolete files/directories from the downloads
directory(DL_DIR): tarballs belonging to old versions of a certain
package, .done files that are no longer needed, git repos. This way, you
don't have to delete the entire downloads directory to make some space
on disk!

Warning: The tool works fine if DL_DIR is not shared. If you share
         DL_DIR among various Yocto versions, only the files belonging to
         the Yocto version you run this script on will be kept.

Users that have the same downloads directory since the early versions of
Yocto, will benefit the most. :)

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/cleanup-downloads-dir | 158 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100755 scripts/cleanup-downloads-dir

diff --git a/scripts/cleanup-downloads-dir b/scripts/cleanup-downloads-dir
new file mode 100755
index 0000000..b48b24d
--- /dev/null
+++ b/scripts/cleanup-downloads-dir
@@ -0,0 +1,158 @@
+#!/usr/bin/env python
+
+# This script will compute a list of obsolete/unused files in downloads directory
+# (DL_DIR) and will wait for the user to acknowledge their removal. Also, the
+# user can manually alter the contents of the list, before removal, if some of
+# the directories/files are not to be removed.
+#
+# Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
+#
+# Copyright (c) 2015 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# See the GNU General Public License for more details.
+
+import os
+import sys
+import tempfile
+import shutil
+
+sys.path.insert(0, os.path.join(os.path.dirname(__file__), "lib"))
+import scriptpath
+
+sys.path.insert(0, scriptpath.add_bitbake_lib_path())
+import bb.tinfoil
+import bb.fetch2 as fetcher
+
+
+# This function looks at the URLs and computes the list of files in DL_DIR,
+# adding also the donestamp files to the list.
+def compute_paths(bb_hdlr, fetcher_hdlr):
+    dl_dir = bb_hdlr.config_data.getVar('DL_DIR', True)
+    paths = []
+
+    for url in fetcher_hdlr.urls:
+        ud = fetcher_hdlr.ud[url]
+        ud.setup_localpath(fetcher_hdlr.d)
+
+        if ud.localpath.startswith(dl_dir):
+            paths.append(ud.localpath)
+
+        if ud.mirrortarball is not None:
+            if not ud.mirrortarball.startswith(dl_dir):
+                mirrortarball_path = os.path.join(dl_dir, ud.mirrortarball)
+            else:
+                mirrortarball_path = ud.mirrortarball
+
+            paths.append(mirrortarball_path)
+            paths.append(mirrortarball_path + ".done")
+
+        paths.append(ud.donestamp)
+
+    return paths
+
+
+# Go through all recipe providers and return a list of files that should belong
+# to DL_DIR.
+def get_used_dldir_paths(bb_hdlr):
+    pkg_providers = bb.providers.allProviders(bb_hdlr.cooker.recipecache)
+    pnlist = sorted(pkg_providers)
+    used_paths = []
+    pkgs_no = len(pnlist)
+    pkgs_scanned = 0
+    cache = bb.cache.Cache
+
+    for pn in pnlist:
+        sys.stderr.write("Computing used paths: %d%%\r" % (pkgs_scanned * 100 / pkgs_no))
+
+        for provider in pkg_providers[pn]:
+            fn = provider[1]
+
+            data = cache.loadDataFull(fn,
+                                      bb_hdlr.cooker.collection.get_file_appends(fn),
+                                      bb_hdlr.config_data)
+
+            used_paths += compute_paths(bb_hdlr, fetcher.Fetch([], data))
+
+        pkgs_scanned += 1
+
+    # return the list with no duplicates
+    return list(set(used_paths))
+
+
+# Go through all files in DL_DIR and return those files that are not in the
+# used_paths list. These files/directories are the ones that can be removed.
+def get_unused_dldir_paths(bb_hdlr, used_paths):
+    dl_dir = bb_hdlr.config_data.getVar('DL_DIR', True)
+    used_dirs = set()
+    unused_paths = []
+
+    sys.stderr.write("Generating unused files list... ")
+    # Do a quick scan of all used files and extract the directories in which
+    # they are located. We'll use these when we scan the downloads directory, so
+    # we don't descend, to subdirectories,unnecessarily.
+    for up in used_paths:
+        used_dirs.add(os.path.dirname(up))
+
+    for root, dirs, files in os.walk(dl_dir):
+        dirs_copy = list(dirs)
+        for d in dirs_copy:
+            path = os.path.join(root, d)
+
+            if path in used_dirs:
+                continue
+
+            dirs[:] = [dr for dr in dirs if dr != d]
+
+            if path not in used_paths:
+                unused_paths.append(path)
+
+        for f in files:
+            path = os.path.join(root, f)
+
+            if path not in used_paths:
+                unused_paths.append(path)
+
+    sys.stderr.write("done\n")
+
+    return unused_paths
+
+if __name__ == '__main__':
+    bb_hdlr = bb.tinfoil.Tinfoil()
+    bb_hdlr.prepare()
+
+    used_paths = get_used_dldir_paths(bb_hdlr)
+    unused_paths = get_unused_dldir_paths(bb_hdlr, used_paths)
+
+    with tempfile.NamedTemporaryFile() as tmp_file:
+        if len(unused_paths) == 0:
+            print("\nNo obsolete files found in %s." %
+                  bb_hdlr.config_data.getVar('DL_DIR', True))
+            sys.exit(0)
+
+        tmp_file.write('\n'.join(unused_paths))
+        tmp_file.flush()
+
+        print("\nPlease take a look at %s file and review the files/directories" % tmp_file.name)
+        print("that will be removed. You can delete entries, if you wish.")
+        print("Press Y to continue (remove the files), any other key to abort.")
+
+        ans = raw_input().upper()
+        if len(ans) == 0 or ans[0] != 'Y':
+            print("User abort! Nothing has changed!")
+            sys.exit(0)
+
+        tmp_file.seek(0)
+        for line in tmp_file.readlines():
+            path = line.strip()
+            sys.stderr.write("Removing: %s\n" % path)
+            if os.path.isdir(path):
+                shutil.rmtree(path)
+            elif os.path.isfile(path):
+                os.remove(path)
-- 
1.9.1


