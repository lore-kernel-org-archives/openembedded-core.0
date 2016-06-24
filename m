Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6C38B70018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:37:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410343"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:55 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:22 +0300
Message-Id: <1466764661-24544-10-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 09/28] oeqa.buildperf: add BuildPerfTest class
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
X-List-Received-Date: Fri, 24 Jun 2016 10:37:56 -0000

The new class will be used as an abstract base class for build
performance tests. This implementation contains some common
functionality used in multiple tests, "copied" from the
build-perf-test.sh shell script.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/__init__.py |  2 +-
 meta/lib/oeqa/buildperf/base.py     | 78 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index bab122e..3bee5b9 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -10,4 +10,4 @@
 # more details.
 #
 """Build performance tests"""
-from .base import KernelDropCaches
+from .base import BuildPerfTest, KernelDropCaches
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 3cbdfa7..3ef0384 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -10,7 +10,16 @@
 # more details.
 #
 """Build performance test base classes and functionality"""
-from oeqa.utils.commands import runCmd
+import logging
+import os
+import shutil
+import time
+from datetime import datetime
+
+from oeqa.utils.commands import runCmd, get_bb_vars
+
+# Get logger for this module
+log = logging.getLogger('build-perf')
 
 
 class KernelDropCaches(object):
@@ -44,3 +53,70 @@ class KernelDropCaches(object):
         cmd += ['tee', '/proc/sys/vm/drop_caches']
         input_data += b'3'
         runCmd(cmd, data=input_data)
+
+
+class BuildPerfTest(object):
+    """Base class for build performance tests"""
+    name = None
+    description = None
+
+    def __init__(self, out_dir):
+        self.out_dir = out_dir
+        self.results = {'name':self.name,
+                        'description': self.description,
+                        'status': 'NOTRUN',
+                        'start_time': None,
+                        'elapsed_time': None,
+                        'measurements': []}
+        if not os.path.exists(self.out_dir):
+            os.makedirs(self.out_dir)
+        if not self.name:
+            self.name = self.__class__.__name__
+        self.bb_vars = get_bb_vars()
+
+    def run(self):
+        """Run test"""
+        self.results['status'] = 'FAILED'
+        self.results['start_time'] = datetime.now()
+        self._run()
+        self.results['elapsed_time'] = (datetime.now() -
+                                        self.results['start_time'])
+        # Test is regarded as completed if it doesn't raise an exception
+        self.results['status'] = 'COMPLETED'
+
+    def _run(self):
+        """Actual test payload"""
+        raise NotImplementedError
+
+    @staticmethod
+    def force_rm(path):
+        """Equivalent of 'rm -rf'"""
+        if os.path.isfile(path) or os.path.islink(path):
+            os.unlink(path)
+        elif os.path.isdir(path):
+            shutil.rmtree(path)
+
+    def rm_tmp(self):
+        """Cleanup temporary/intermediate files and directories"""
+        log.debug("Removing temporary and cache files")
+        for name in ['bitbake.lock', 'conf/sanity_info',
+                     self.bb_vars['TMPDIR']]:
+            self.force_rm(name)
+
+    def rm_sstate(self):
+        """Remove sstate directory"""
+        log.debug("Removing sstate-cache")
+        self.force_rm(self.bb_vars['SSTATE_DIR'])
+
+    def rm_cache(self):
+        """Drop bitbake caches"""
+        self.force_rm(self.bb_vars['PERSISTENT_DIR'])
+
+    @staticmethod
+    def sync():
+        """Sync and drop kernel caches"""
+        log.debug("Syncing and dropping kernel caches""")
+        KernelDropCaches.drop()
+        os.sync()
+        # Wait a bit for all the dirty blocks to be written onto disk
+        time.sleep(3)
-- 
2.6.6


