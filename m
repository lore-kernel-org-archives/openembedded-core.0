Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C284A6B013
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:27:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2013 02:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="340862072"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2013 02:27:45 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 1352D6A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 02:27:43 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 12:27:45 +0300
Message-Id: <bd98e4ef7399611ac9ddd8e9c21c85f53ea511ef.1373013888.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH v2 4/8] lib/oeqa/utils/oeqemuconsole.py: handle qemu serial console connection
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
X-List-Received-Date: Fri, 05 Jul 2013 09:27:43 -0000

Python's telnetlib Telnet class connects only to AF_INET sockets, but we
want to use Unix domain socket for the qemu serial connection, so that's
why we override it.
Also we add a new read_all_timeout method similar to Telnet's read_all,
that read until a match or timeout and logs all output.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/oeqemuconsole.py | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/oeqemuconsole.py

diff --git a/meta/lib/oeqa/utils/oeqemuconsole.py b/meta/lib/oeqa/utils/oeqemuconsole.py
new file mode 100644
index 0000000..95a2133
--- /dev/null
+++ b/meta/lib/oeqa/utils/oeqemuconsole.py
@@ -0,0 +1,45 @@
+import socket
+import time
+import re
+from telnetlib import Telnet
+
+class oeQemuConsole(Telnet):
+
+    """
+    Override Telnet class to use unix domain sockets,
+    Telnet uses AF_INET for socket, we don't want that.
+    Also, provide a read_all variant with timeout, that
+    returns whatever output there is.
+    """
+
+    def __init__(self, stream, logfile):
+
+        Telnet.__init__(self, host=None)
+        self.stream = stream
+        self.logfile = logfile
+        self.eof = 0
+        self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+        self.sock.connect(stream)
+
+    def log(self, msg):
+        if self.logfile:
+            with open(self.logfile, "a") as f:
+                f.write("%s\n" % msg)
+
+
+    def read_all_timeout(self, match, timeout=200):
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


