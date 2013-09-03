Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C834C6010E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 13:01:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2013 06:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1014,1367996400"; d="scan'208";a="390373303"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2013 06:01:21 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 7EABD2C8001;
	Tue,  3 Sep 2013 06:01:18 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2013 16:01:11 +0300
Message-Id: <1378213271-12755-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: smart: serve repo on host ip only and increase timeout
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
X-List-Received-Date: Tue, 03 Sep 2013 13:01:21 -0000

Don't start the http server on 0.0.0.0, listen on host ip (end of tap interface) only.
Also use the timeout option (default is 300s for ssh commands) for all the commands
run in this module (mostly because smart update timeouts on mips).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/smart.py    | 4 ++--
 meta/lib/oeqa/utils/httpserver.py | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 6e20f96..59083ca 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -17,7 +17,7 @@ class SmartTest(oeRuntimeTest):
     @skipUnlessPassed('test_smart_help')
     def smart(self, command, expected = 0):
         command = 'smart %s' % command
-        status, output = self.target.run(command)
+        status, output = self.target.run(command, 500)
         message = os.linesep.join([command, output])
         self.assertEqual(status, expected, message)
         self.assertFalse("Cannot allocate memory" in output, message)
@@ -48,7 +48,7 @@ class SmartRepoTest(SmartTest):
 
     @classmethod
     def setUpClass(self):
-        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True))
+        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), oeRuntimeTest.tc.qemu.host_ip)
         self.repo_server.start()
 
     @classmethod
diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index d4b6154..f161a1b 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -15,12 +15,13 @@ class HTTPRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
 
 class HTTPService(object):
 
-    def __init__(self, root_dir):
+    def __init__(self, root_dir, host=''):
         self.root_dir = root_dir
+        self.host = host
         self.port = 0
 
     def start(self):
-        self.server = HTTPServer(('', self.port), HTTPRequestHandler)
+        self.server = HTTPServer((self.host, self.port), HTTPRequestHandler)
         if self.port == 0:
             self.port = self.server.server_port
         self.process = multiprocessing.Process(target=self.server.server_start, args=[self.root_dir])
-- 
1.8.3.1


