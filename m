Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA7A73D64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 22:14:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 15:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,664,1432623600"; d="scan'208";a="540760386"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 15:14:13 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 14:05:53 +0000
Message-Id: <c22da31de84fe598531dcc665cfab5af945a68d9.1439387979.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/6] qemurunner.py: Added raw mode in run_serial
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
X-List-Received-Date: Wed, 12 Aug 2015 22:14:14 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Raw mode allows to send the command without sending
'echo $?' for validation; Also this doesn't remove the
command or the prompt from the output returned. In raw
mode validation is done if there is output.

This raw mode would be useful for validate the prompt
when a user logs in.

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index fc2e244..3e604d8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -177,7 +177,7 @@ class QemuRunner:
                 self.stop()
                 return False
 
-            (status, output) = self.run_serial("root\n")
+            (status, output) = self.run_serial("root\n", raw=True)
             if re.search("root@[a-zA-Z0-9\-]+:~#", output):
                 self.logged = True
                 logger.info("Logged as root in serial console")
@@ -274,9 +274,11 @@ class QemuRunner:
             if "qemu-system" in basecmd and "-serial tcp" in commands[p]:
                 return [int(p),commands[p]]
 
-    def run_serial(self, command):
+    def run_serial(self, command, raw=False):
         # We assume target system have echo to get command status
-        self.server_socket.sendall("%s; echo $?\n" % command)
+        if not raw:
+            command = "%s; echo $?\n" % command
+        self.server_socket.sendall(command)
         data = ''
         status = 0
         stopread = False
@@ -291,15 +293,18 @@ class QemuRunner:
                                 sock.close()
                                 stopread = True
         if data:
-            # Remove first line (command line) and last line (prompt)
-            data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
-            index = data.rfind('\r\n')
-            if index == -1:
-                status_cmd = data
-                data = ""
-            else:
-                status_cmd = data[index+2:]
-                data = data[:index]
-            if (status_cmd == "0"):
+            if raw:
                 status = 1
+            else:
+                # Remove first line (command line) and last line (prompt)
+                data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
+                index = data.rfind('\r\n')
+                if index == -1:
+                    status_cmd = data
+                    data = ""
+                else:
+                    status_cmd = data[index+2:]
+                    data = data[:index]
+                if (status_cmd == "0"):
+                    status = 1
         return (status, str(data))
-- 
1.8.4.5


