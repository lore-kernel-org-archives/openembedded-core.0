Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E46B719C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491304304; x=1522840304;
	h=from:to:cc:subject:date:message-id;
	bh=dbTspJKZwegmwjdLrJ/JZDf7sS2saL5/ucpiDs2rfC4=;
	b=lAa7peUyEcATxVswVR6R1zFLNJzeOrP5OK+hPwNMrfxBEdDIfKWMHo6n
	FxjQ7rh/k79rONK+1f/YlpKUveke4Q==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 04:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,275,1486454400"; d="scan'208";a="243829577"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 04 Apr 2017 04:11:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D6DDE2C8001;
	Tue,  4 Apr 2017 04:11:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 14:10:45 +0300
Message-Id: <1491304245-7194-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-selftest: test wic sparse_copy API
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
X-List-Received-Date: Tue, 04 Apr 2017 11:11:42 -0000

Added new parameter 'api' to sparse_copy function to specify
underlying filemap API to use. By default sparse_copy will
try both available APIs.

Added test case for sparse_copy to wic test suite.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 26 ++++++++++++++++++++++++++
 scripts/lib/wic/filemap.py    |  6 ++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index df5e060..7e26dde 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -24,6 +24,7 @@
 """Test cases for wic."""
 
 import os
+import sys
 import unittest
 
 from glob import glob
@@ -758,3 +759,28 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(0, runCmd(cmd).status)
         self.remove_config(config)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
+
+    def test_sparse_copy(self):
+        """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
+        libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'wic')
+        sys.path.insert(0, libpath)
+        from  filemap import FilemapFiemap, FilemapSeek, sparse_copy
+        with NamedTemporaryFile("w", suffix=".wic-sparse") as sparse:
+            src_name = sparse.name
+            src_size = 1024 * 10
+            sparse.truncate(src_size)
+            # write one byte to the file
+            with open(src_name, 'r+b') as sfile:
+                sfile.seek(1024 * 4)
+                sfile.write(b'\x00')
+            dest = sparse.name + '.out'
+            # copy src file to dest using different filemap APIs
+            for api in (FilemapFiemap, FilemapSeek, None):
+                if os.path.exists(dest):
+                    os.unlink(dest)
+                sparse_copy(sparse.name, dest, api=api)
+                dest_stat = os.stat(dest)
+                self.assertEqual(dest_stat.st_size, src_size)
+                # 8 blocks is 4K (physical sector size)
+                self.assertEqual(dest_stat.st_blocks, 8)
+            os.unlink(dest)
diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 080668e..1f1aacc 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -530,9 +530,11 @@ def filemap(image, log=None):
     except ErrorNotSupp:
         return FilemapSeek(image, log)
 
-def sparse_copy(src_fname, dst_fname, offset=0, skip=0):
+def sparse_copy(src_fname, dst_fname, offset=0, skip=0, api=None):
     """Efficiently copy sparse file to or into another file."""
-    fmap = filemap(src_fname)
+    if not api:
+        api = filemap
+    fmap = api(src_fname)
     try:
         dst_file = open(dst_fname, 'r+b')
     except IOError:
-- 
2.1.4


