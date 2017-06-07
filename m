Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E43C271B69
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:42:00 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 07 Jun 2017 07:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="111522451"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2017 07:42:01 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 07:41:55 -0700
Message-Id: <20170607144155.3073-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] buildhistory: skip tests if GitPython module is missing
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
X-List-Received-Date: Wed, 07 Jun 2017 14:42:01 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Catching a possible exception when importing the git module,
allows us to skip test if the latter is missing on the host.
Also, import oe.buildhistory_analysis inside fuctions
because this module also needs git to work correctly.

[YOCTO #11620]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 4e877517c1..f9bec53d4a 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -1,9 +1,7 @@
 import os
 from oeqa.selftest.case import OESelftestTestCase
 import tempfile
-from git import Repo
 from oeqa.utils.commands import get_bb_var
-from oe.buildhistory_analysis import blob_to_dict, compare_dict_blobs
 
 class TestBlobParsing(OESelftestTestCase):
 
@@ -12,7 +10,12 @@ class TestBlobParsing(OESelftestTestCase):
         self.repo_path = tempfile.mkdtemp(prefix='selftest-buildhistory',
             dir=get_bb_var('TOPDIR'))
 
-        self.repo = Repo.init(self.repo_path)
+        try:
+            from git import Repo
+            self.repo = Repo.init(self.repo_path)
+        except ImportError:
+            self.skipTest('Python module GitPython is not present')
+
         self.test_file = "test"
         self.var_map = {}
 
@@ -40,6 +43,7 @@ class TestBlobParsing(OESelftestTestCase):
         """
         Test convertion of git blobs to dictionary
         """
+        from oe.buildhistory_analysis import blob_to_dict
         valuesmap = { "foo" : "1", "bar" : "2" }
         self.commit_vars(to_add = valuesmap)
 
@@ -51,6 +55,8 @@ class TestBlobParsing(OESelftestTestCase):
         """
         Test comparisson of dictionaries extracted from git blobs
         """
+        from oe.buildhistory_analysis import compare_dict_blobs
+
         changesmap = { "foo-2" : ("2", "8"), "bar" : ("","4"), "bar-2" : ("","5")}
 
         self.commit_vars(to_add = { "foo" : "1", "foo-2" : "2", "foo-3" : "3" })
@@ -69,6 +75,7 @@ class TestBlobParsing(OESelftestTestCase):
         """
         Test default values for comparisson of git blob dictionaries
         """
+        from oe.buildhistory_analysis import compare_dict_blobs
         defaultmap = { x : ("default", "1")  for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
 
         self.commit_vars(to_add = { "foo" : "1" })
-- 
2.12.0


