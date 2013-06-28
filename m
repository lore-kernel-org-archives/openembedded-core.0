Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 34CA86AD1C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:13:06 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 03:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323846656"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 03:04:29 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id E7E576A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:04:28 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 13:04:39 +0300
Message-Id: <36e54d3b192d38100cdb795da0ff7b53ee2ad63c.1372413711.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 4/8] lib/oeqa/utils/oetelnetlib.py: override Telnet class to use Unix domain sockets
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
X-List-Received-Date: Fri, 28 Jun 2013 10:13:07 -0000

Python's telnetlib Telnet class connects only to AF_INET sockets, but we
want to use Unix domain socket for the qemu serial connection.
Also add a new read_all_timeout method similar to Telnet's read_all

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/oetelnetlib.py | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/oetelnetlib.py

diff --git a/meta/lib/oeqa/utils/oetelnetlib.py b/meta/lib/oeqa/utils/oetelnetlib.py
new file mode 100644
index 0000000..cdebac1
--- /dev/null
+++ b/meta/lib/oeqa/utils/oetelnetlib.py
@@ -0,0 +1,49 @@
+import socket
+import time
+import re
+from telnetlib import Telnet
+
+class oeTelnet(Telnet):
+
+    """
+    Override Telnet class to use unix domain sockets,
+    Telnet uses AF_INET for socket, we don't want that.
+    Also, provide a read_all variant with timeout, that
+    returns whatever output there is.
+    """
+
+    def __init__(self, stream=None, logfile=None):
+
+        Telnet.__init__(self, host=None)
+        self.stream = stream
+        self.logfile = logfile
+        if stream is not None:
+            self.open(stream)
+
+    def log(self, msg):
+        if self.logfile:
+            with open(self.logfile, "a") as f:
+                f.write("%s\n" % msg)
+
+    def open(self, stream):
+
+        self.eof = 0
+        self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+        self.sock.connect(stream)
+
+    def read_all_timeout(self, match, timeout=120):
+        """Read until EOF or until timeout or until match.
+        """
+        ret = False
+        self.process_rawq()
+        endtime = time.time() + timeout
+        while not self.eof and time.time() < endtime:
+            self.fill_rawq()
+            self.process_rawq()
+            if re.search(match, self.cookedq):
+                ret = True
+                break
+        buf = self.cookedq
+        self.cookedq = ''
+        self.log(buf)
+        return (ret, buf)
-- 
1.8.1.4


