Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0663F71B27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:47:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:47:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735119"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:47:49 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:08 -0500
Message-Id: <c1df289f11cc91ba6c46d05566c95e8ca7cd5bd0.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 08/17] oeqa/core/threaded: Add OEStreamLoggerThreaded class
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
X-List-Received-Date: Wed, 10 May 2017 19:47:49 -0000
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


