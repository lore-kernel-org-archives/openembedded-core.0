Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 260E577AB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491479994; x=1523015994;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=2isqaseAWDJ/d0yUwE5/UCGk+CLOIS+NmPuRqpUKlvw=;
	b=RR9/5J8dqWMIvkL+rEaUVy92DRklMHyZ5Nh/WIOgqwrP1oYAaKD2Siuf
	OJ3GJq8l7cDQxQRiTmgUrYwiHuWC9Q==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 04:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,159,1488873600"; d="scan'208";a="85602996"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2017 04:59:54 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D61886A4082;
	Thu,  6 Apr 2017 04:59:44 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:58:49 +0300
Message-Id: <1491479929-11794-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1491477186.17200.31.camel@rpsys.net>
References: <1491477186.17200.31.camel@rpsys.net>
Subject: [PATCH v2] oe-selftest: test wic sparse_copy API
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
X-List-Received-Date: Thu, 06 Apr 2017 11:59:53 -0000

Added new parameter 'api' to sparse_copy function to specify
underlying filemap API to use. By default sparse_copy will
try both available APIs.

Added test case for sparse_copy to wic test suite.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 29 +++++++++++++++++++++++++++++
 scripts/lib/wic/filemap.py    |  6 ++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index df5e060..0a2f7ff 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -24,6 +24,7 @@
 """Test cases for wic."""
 
 import os
+import sys
 import unittest
 
 from glob import glob
@@ -758,3 +759,31 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(0, runCmd(cmd).status)
         self.remove_config(config)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
+
+    def test_sparse_copy(self):
+        """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
+        libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'wic')
+        sys.path.insert(0, libpath)
+        from  filemap import FilemapFiemap, FilemapSeek, sparse_copy, ErrorNotSupp
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
+                try:
+                    sparse_copy(sparse.name, dest, api=api)
+                except ErrorNotSupp:
+                    continue # skip unsupported API
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


