Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3282977560
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 21:54:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 24 Feb 2017 13:54:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,201,1484035200"; d="scan'208";a="52500915"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2017 13:54:48 -0800
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id CF5CB6A4080;
	Fri, 24 Feb 2017 13:54:47 -0800 (PST)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 15:57:47 -0600
Message-Id: <1f66cc6879051458f2ca8265d6861f701b232c0d.1487971654.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1487971654.git.humberto.ibarra.lopez@intel.com>
References: <cover.1487971654.git.humberto.ibarra.lopez@intel.com>
Subject: [PATCH 1/1] oelib/buildhistory.py: Add unittest for buildhistory_analysis
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
X-List-Received-Date: Fri, 24 Feb 2017 21:54:48 -0000

The buildhistory_analysis module (in which buildhistory-diff is
based) was lacking unittest for its functions. Created selftest
module for this and a few testcases to cover basic cases.

[YOCTO #10727]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 meta/lib/oeqa/selftest/oelib/buildhistory.py | 88 ++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/oelib/buildhistory.py

diff --git a/meta/lib/oeqa/selftest/oelib/buildhistory.py b/meta/lib/oeqa/selftest/oelib/buildhistory.py
new file mode 100644
index 0000000..8d1fa93
--- /dev/null
+++ b/meta/lib/oeqa/selftest/oelib/buildhistory.py
@@ -0,0 +1,88 @@
+import os
+import unittest
+from git import Repo
+from oeqa.utils.commands import get_bb_var
+from oe.buildhistory_analysis import blob_to_dict, compare_dict_blobs
+
+class TestBlobParsing(unittest.TestCase):
+
+    def setUp(self):
+        import time
+        tmp_repo = "bhrepo_%s" % time.strftime("%Y%m%d%H%M%S")
+        self.repo_path = os.path.join(get_bb_var('TOPDIR'), tmp_repo)
+        os.mkdir(self.repo_path)
+
+        self.repo = Repo.init(self.repo_path)
+        self.test_file = "test"
+        self.var_map = {}
+
+    def tearDown(self):
+        import shutil
+        shutil.rmtree(self.repo_path)
+
+    def commit_vars(self, to_add={}, to_remove = [], msg="A commit message"):
+        if len(to_add) == 0 and len(to_remove) == 0:
+            return
+
+        for k in to_remove:
+            self.var_map.pop(x,None)
+        for k in to_add:
+            self.var_map[k] = to_add[k]
+
+        with open(os.path.join(self.repo_path, self.test_file), 'w') as repo_file:
+            for k in self.var_map:
+                repo_file.write("%s = %s\n" % (k, self.var_map[k]))
+
+        self.repo.git.add("--all")
+        self.repo.git.commit(message=msg)
+
+    def test_blob_to_dict(self):
+        """
+        Test convertion of git blobs to dictionary
+        """
+        valuesmap = { "foo" : "1", "bar" : "2" }
+        self.commit_vars(to_add = valuesmap)
+
+        blob = self.repo.head.commit.tree.blobs[0]
+        self.assertEqual(valuesmap, blob_to_dict(blob),
+            "commit was not translated correctly to dictionary")
+
+    def test_compare_dict_blobs(self):
+        """
+        Test comparisson of dictionaries extracted from git blobs
+        """
+        changesmap = { "foo-2" : ("2", "8"), "bar" : ("","4"), "bar-2" : ("","5")}
+
+        self.commit_vars(to_add = { "foo" : "1", "foo-2" : "2", "foo-3" : "3" })
+        blob1 = self.repo.heads.master.commit.tree.blobs[0]
+
+        self.commit_vars(to_add = { "foo-2" : "8", "bar" : "4", "bar-2" : "5" })
+        blob2 = self.repo.heads.master.commit.tree.blobs[0]
+
+        change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
+            blob1, blob2, False, False)
+
+        var_changes = { x.fieldname : (x.oldvalue, x.newvalue) for x in change_records}
+        self.assertEqual(changesmap, var_changes, "Changes not reported correctly")
+
+    def test_compare_dict_blobs_default(self):
+        """
+        Test default values for comparisson of git blob dictionaries
+        """
+        defaultmap = { x : ("default", "1")  for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
+
+        self.commit_vars(to_add = { "foo" : "1" })
+        blob1 = self.repo.heads.master.commit.tree.blobs[0]
+
+        self.commit_vars(to_add = { "PKG" : "1", "PKGE" : "1", "PKGV" : "1", "PKGR" : "1" })
+        blob2 = self.repo.heads.master.commit.tree.blobs[0]
+
+        change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
+            blob1, blob2, False, False)
+
+        var_changes = {}
+        for x in change_records:
+            oldvalue = "default" if ("default" in x.oldvalue) else x.oldvalue
+            var_changes[x.fieldname] = (oldvalue, x.newvalue)
+
+        self.assertEqual(defaultmap, var_changes, "Defaults not set properly")
-- 
2.7.4


