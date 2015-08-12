Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D8A8073231
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 22:14:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 15:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,664,1432623600"; d="scan'208";a="540760353"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 15:14:08 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 14:05:51 +0000
Message-Id: <63d274ce660acaff20471374c53e8f0168857be1.1439387979.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/6] qemurunner.py: Add method run_serial
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
X-List-Received-Date: Wed, 12 Aug 2015 22:14:10 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The only need for the console before this patch was
to check if the target has booted. This allows to send
commands to the terminal.

This new method is based on the method with the same name
of the QemuTinyRunner class. The difference here is it will
remove the command and the prompt. The other diference is
it will send an echo $? to check if the last command was
successful.

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 9bb1f4b..81ca32e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -262,3 +262,33 @@ class QemuRunner:
             basecmd = os.path.basename(basecmd)
             if "qemu-system" in basecmd and "-serial tcp" in commands[p]:
                 return [int(p),commands[p]]
+
+    def run_serial(self, command):
+        # We assume target system have echo to get command status
+        self.server_socket.sendall("%s; echo $?\n" % command)
+        data = ''
+        status = 0
+        stopread = False
+        endtime = time.time()+5
+        while time.time()<endtime and not stopread:
+                sread, _, _ = select.select([self.server_socket],[],[],5)
+                for sock in sread:
+                        answer = sock.recv(1024)
+                        if answer:
+                                data += answer
+                        else:
+                                sock.close()
+                                stopread = True
+        if data:
+            # Remove first line (command line) and last line (prompt)
+            data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
+            index = data.rfind('\r\n')
+            if index == -1:
+                status_cmd = data
+                data = ""
+            else:
+                status_cmd = data[index+2:]
+                data = data[:index]
+            if (status_cmd == "0"):
+                status = 1
+        return (status, str(data))
-- 
1.8.4.5


