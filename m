Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A38E7782D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887642"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:20 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:34 -0500
Message-Id: <14a627636444d9af5a07aa63f902d4f054fceee4.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 08/36] oeqa/core/threaded: Add OEStreamLoggerThreaded class
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
X-List-Received-Date: Fri, 26 May 2017 20:38:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OEStreamLoggerThreaded overrides OEStreamLogger to redirect
the PyUnit output to a logger.

Instead of log every line when comes the OEStreamLoggerThreaded
will buffer the PyUnit output and write everything at end of every
suite execution to don't have mixed suite outputs.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/threaded.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
index e6f2140..73b7f2f 100644
--- a/meta/lib/oeqa/core/threaded.py
+++ b/meta/lib/oeqa/core/threaded.py
@@ -1,10 +1,13 @@
 # Copyright (C) 2017 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
+import threading
 import multiprocessing
 
 from unittest.suite import TestSuite
+
 from oeqa.core.loader import OETestLoader
+from oeqa.core.runner import OEStreamLogger
 
 class OETestLoaderThreaded(OETestLoader):
     def __init__(self, tc, module_paths, modules, tests, modules_required,
@@ -89,3 +92,25 @@ class OETestLoaderThreaded(OETestLoader):
 
         return suites
 
+class OEStreamLoggerThreaded(OEStreamLogger):
+    _lock = threading.Lock()
+    buffers = {}
+
+    def write(self, msg):
+        tid = threading.get_ident()
+
+        if not tid in self.buffers:
+            self.buffers[tid] = ""
+
+        if msg:
+            self.buffers[tid] += msg
+
+    def finish(self):
+        tid = threading.get_ident()
+        
+        self._lock.acquire()
+        self.logger.info('THREAD: %d' % tid)
+        self.logger.info('-' * 70)
+        for line in self.buffers[tid].split('\n'):
+            self.logger.info(line)
+        self._lock.release()
-- 
2.1.4


