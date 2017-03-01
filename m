Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7212477576
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2pSA011995; Wed, 1 Mar 2017 16:02:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C1fUm_0dxwqA; Wed,  1 Mar 2017 16:02:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2kax011981
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004oK-Qg; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:40 +0000
Message-Id: <1488384162-18397-10-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/12] oeqa: add output to subprocess exceptions
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
X-List-Received-Date: Wed, 01 Mar 2017 16:03:00 -0000

From: Ross Burton <ross.burton@intel.com>

Out of the box subprocess.CalledProcessError.__str__() just displays the command
and exit code, which isn't very useful for debugging.

Add a function to oeqa.utils.subprocesstweak to monkey-patch __str__() so that
it can also display the value of stdout and stderr.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/oetest.py                |  9 ---------
 meta/lib/oeqa/utils/subprocesstweak.py | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 9 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/subprocesstweak.py

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index a89bd11..1dad763 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -135,15 +135,6 @@ class oeRuntimeTest(oeTest):
             if status != 0:
                 return status
 
-class OETestCalledProcessError(subprocess.CalledProcessError):
-    def __str__(self):
-        if hasattr(self, "stderr"):
-            return "Command '%s' returned non-zero exit status %d with output %s and stderr %s" % (self.cmd, self.returncode, self.output, self.stderr)
-        else:
-            return "Command '%s' returned non-zero exit status %d with output %s" % (self.cmd, self.returncode, self.output)
-
-subprocess.CalledProcessError = OETestCalledProcessError
-
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
diff --git a/meta/lib/oeqa/utils/subprocesstweak.py b/meta/lib/oeqa/utils/subprocesstweak.py
new file mode 100644
index 0000000..1f7d11b
--- /dev/null
+++ b/meta/lib/oeqa/utils/subprocesstweak.py
@@ -0,0 +1,19 @@
+import subprocess
+
+class OETestCalledProcessError(subprocess.CalledProcessError):
+    def __str__(self):
+        def strify(o):
+            if isinstance(o, bytes):
+                return o.decode("utf-8", errors="replace")
+            else:
+                return o
+
+        s = "Command '%s' returned non-zero exit status %d" % (self.cmd, self.returncode)
+        if hasattr(self, "output") and self.output:
+            s = s + "\nStandard Output: " + strify(self.output)
+        if hasattr(self, "stderr") and self.stderr:
+            s = s + "\nStandard Error: " + strify(self.stderr)
+        return s
+
+def errors_have_output():
+    subprocess.CalledProcessError = OETestCalledProcessError
-- 
2.7.4


