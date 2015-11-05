Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 020C775A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 17:19:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 05 Nov 2015 09:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="594645836"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2015 09:19:55 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 09:08:58 +0000
Message-Id: <abfed61dfa4daed43b909d57f07a20318ad63484.1446713792.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1446713792.git.mariano.lopez@linux.intel.com>
References: <cover.1446713792.git.mariano.lopez@linux.intel.com>
Cc: randy.e.witt@intel.com
Subject: [PATCH 1/1] qemurunner: Remove the timeout in run_serial
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
X-List-Received-Date: Thu, 05 Nov 2015 17:19:56 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Sometmes when there is high load in the server the
commands executed in the target take a lot of time
to complete and this lead to incorrect dump files or
empty files. This is caused because run_serial has a
timeout of five seconds when running the commands in
the target.

This change removes the timeout and just keep reading
the socket until it finds the prompt from the target
or when the socket is not ready to be read.

[YOCTO #8510]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index bdc6e0a..e1e4057 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -366,23 +366,25 @@ class QemuRunner:
         # We assume target system have echo to get command status
         if not raw:
             command = "%s; echo $?\n" % command
-        self.server_socket.sendall(command)
+
         data = ''
         status = 0
-        stopread = False
-        endtime = time.time()+5
-        while time.time()<endtime and not stopread:
+        self.server_socket.sendall(command)
+        keepreading = True
+        while keepreading:
             sread, _, _ = select.select([self.server_socket],[],[],5)
-            for sock in sread:
-                answer = sock.recv(1024)
+            if sread:
+                answer = self.server_socket.recv(1024)
                 if answer:
                     data += answer
                     # Search the prompt to stop
                     if re.search("[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):
-                        stopread = True
-                        break
+                        keepreading = False
                 else:
                     raise Exception("No data on serial console socket")
+            else:
+                keepreading = False
+
         if data:
             if raw:
                 status = 1
-- 
1.8.4.5


