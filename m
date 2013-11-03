Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA166D2E4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Nov 2013 12:26:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Nov 2013 04:26:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="402879112"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 03 Nov 2013 04:26:54 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 7325D6A400F;
	Sun,  3 Nov 2013 04:26:53 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Nov 2013 14:27:16 +0200
Message-Id: <1383481636-30346-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/utils: sshcontrol: make timeout depend on output
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
X-List-Received-Date: Sun, 03 Nov 2013 12:26:53 -0000

Instead of running the commands with a fixed timeout,
we should kill the command if there is no output
for timeout seconds.
Also changed some strings/comments.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 41 ++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 1539ff2..07257b8 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -9,6 +9,7 @@
 import subprocess
 import time
 import os
+import select
 
 class SSHControl(object):
 
@@ -50,32 +51,44 @@ class SSHControl(object):
         if self.host:
             sshconn = self._internal_run(cmd)
         else:
-            raise Exception("Remote IP hasn't been set: '%s'" % actualcmd)
+            raise Exception("Remote IP/host hasn't been set, I can't run ssh without one.")
 
+        # run the command forever
         if timeout == 0:
-            self._out = sshconn.communicate()[0]
-            self._ret = sshconn.poll()
+            output = sshconn.communicate()[0]
         else:
+            # use the default timeout
             if timeout is None:
                 tdelta = self.timeout
+            # use the specified timeout
             else:
                 tdelta = timeout
             endtime = self._starttime + tdelta
-            while sshconn.poll() is None and time.time() < endtime:
-                time.sleep(1)
+            output = ''
+            eof = False
+            while time.time() < endtime and not eof:
+                if select.select([sshconn.stdout], [], [], 5)[0] != []:
+                    data = os.read(sshconn.stdout.fileno(), 1024)
+                    if not data:
+                        sshconn.stdout.close()
+                        eof = True
+                    else:
+                        output += data
+                        endtime = time.time() + tdelta
+
             # process hasn't returned yet
             if sshconn.poll() is None:
-                self._ret = 255
                 sshconn.terminate()
-                sshconn.kill()
-                self._out = sshconn.stdout.read()
-                sshconn.stdout.close()
-                self._out += "\n[!!! SSH command timed out after %d seconds and it was killed]" % tdelta
-            else:
-                self._out = sshconn.stdout.read()
-                self._ret = sshconn.poll()
+                time.sleep(3)
+                try:
+                    sshconn.kill()
+                except OSError:
+                    pass
+                output += "\n[!!! SSH command killed - no output for %d seconds. Total running time: %d seconds." % (tdelta, time.time() - self._starttime)
+
+        self._ret = sshconn.poll()
         # strip the last LF so we can test the output
-        self._out = self._out.rstrip()
+        self._out = output.rstrip()
         self.log("%s" % self._out)
         self.log("[SSH command returned after %d seconds]: %s" % (time.time() - self._starttime, self._ret))
         return (self._ret, self._out)
-- 
1.8.3.1


