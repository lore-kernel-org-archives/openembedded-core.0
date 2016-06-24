Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A03CA73193
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410409"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:04 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:28 +0300
Message-Id: <1466764661-24544-16-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 15/28] oeqa.buildperf: add test Test1P1
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:04 -0000

Re-implement "test1_p1" from build-perf-test.sh which measures
'bitbake core-image-sato'.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/__init__.py    |  3 ++-
 meta/lib/oeqa/buildperf/basic_tests.py | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/buildperf/basic_tests.py

diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index d6065e8..ad5b37c 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -10,5 +10,6 @@
 # more details.
 #
 """Build performance tests"""
-from .base import (build_perf_test, BuildPerfTest, BuildPerfTestRunner,
+from .base import (perf_test_case, BuildPerfTest, BuildPerfTestRunner,
                    KernelDropCaches)
+from .basic_tests import *
diff --git a/meta/lib/oeqa/buildperf/basic_tests.py b/meta/lib/oeqa/buildperf/basic_tests.py
new file mode 100644
index 0000000..95bb8d8
--- /dev/null
+++ b/meta/lib/oeqa/buildperf/basic_tests.py
@@ -0,0 +1,31 @@
+# Copyright (c) 2016, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+"""Basic set of build performance tests"""
+from . import BuildPerfTest, perf_test_case
+
+
+@perf_test_case
+class Test1P1(BuildPerfTest):
+    name = "test1"
+    build_target = 'core-image-sato'
+    description = "Measure wall clock of bitbake {} and size of tmp dir".format(build_target)
+
+    def _run(self):
+        self.log_cmd_output("bitbake {} -c fetchall".format(self.build_target))
+        self.rm_tmp()
+        self.rm_sstate()
+        self.rm_cache()
+        self.sync()
+        self.measure_cmd_resources(['bitbake', self.build_target], 'build',
+                                   'bitbake ' + self.build_target)
+        self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
+        self.save_buildstats()
-- 
2.6.6


