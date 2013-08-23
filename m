Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5916B9E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2013 11:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="392339219"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2013 11:04:38 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 20F002C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:35 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:21 +0300
Message-Id: <fedab248a89370e4dee46addb159102bbb29aedc.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 11/19] lib/oeqa/utils: new file: httpserver.py useful for serving files over HTTP to the target
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:37 -0000

From: Mihai Lindner <mihaix.lindner@linux.intel.com>

It can be used by smart repo/channel tests to serve deploy_dir.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/httpserver.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/httpserver.py

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
new file mode 100644
index 0000000..d4b6154
--- /dev/null
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -0,0 +1,32 @@
+import SimpleHTTPServer
+import multiprocessing
+import os
+
+class HTTPServer(SimpleHTTPServer.BaseHTTPServer.HTTPServer):
+
+    def server_start(self, root_dir):
+        os.chdir(root_dir)
+        self.serve_forever()
+
+class HTTPRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
+
+    def log_message(self, format_str, *args):
+        pass
+
+class HTTPService(object):
+
+    def __init__(self, root_dir):
+        self.root_dir = root_dir
+        self.port = 0
+
+    def start(self):
+        self.server = HTTPServer(('', self.port), HTTPRequestHandler)
+        if self.port == 0:
+            self.port = self.server.server_port
+        self.process = multiprocessing.Process(target=self.server.server_start, args=[self.root_dir])
+        self.process.start()
+
+    def stop(self):
+        self.server.server_close()
+        self.process.terminate()
+        self.process.join()
-- 
1.8.3.1


