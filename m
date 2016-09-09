Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 352457715E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 12:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u89CJ4II006576 for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Sep 2016 13:19:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ectkpo47g0hs
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 13:19:04 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u89CJ2q8006567
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Sep 2016 13:19:03 +0100
Message-ID: <1473423542.20226.267.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 09 Sep 2016 13:19:02 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/parselogs: Don't use cwd for file transfers
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
X-List-Received-Date: Fri, 09 Sep 2016 12:19:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

If you run:

MACHINE=A bitbake <image> -c testimage
MACHINE=B bitbake <image> -c testimage

and A has errors in parselogs, machine B can pick these up and cause
immense confusion. This is because the test transfers the log files
to cwd which is usually TOPDIR. This is clearly bad and this patch
uses a subdir of WORKDIR to ensure machines don't contaminate each
other.

Also ensure any previous logs are cleaned up from any existing
transfer directory.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 98a959e..8238a77 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -180,6 +180,9 @@ class ParseLogsTest(oeRuntimeTest):
     def getMachine(self):
         return oeRuntimeTest.tc.d.getVar("MACHINE", True)
 
+    def getWorkdir(self):
+        return oeRuntimeTest.tc.d.getVar("WORKDIR", True)
+
     #get some information on the CPU of the machine to display at the beginning of the output. This info might be useful in some cases.
     def getHardwareInfo(self):
         hwi = ""
@@ -217,16 +220,19 @@ class ParseLogsTest(oeRuntimeTest):
 
     #copy the log files to be parsed locally
     def transfer_logs(self, log_list):
-        target_logs = 'target_logs'
+        workdir = self.getWorkdir()
+        self.target_logs = workdir + '/' + 'target_logs'
+        target_logs = self.target_logs
         if not os.path.exists(target_logs):
             os.makedirs(target_logs)
+        bb.utils.remove(self.target_logs + "/*")
         for f in log_list:
             self.target.copy_from(f, target_logs)
 
     #get the local list of logs
     def get_local_log_list(self, log_locations):
         self.transfer_logs(self.getLogList(log_locations))
-        logs = [ os.path.join('target_logs',f) for f in os.listdir('target_logs') if os.path.isfile(os.path.join('target_logs',f)) ]
+        logs = [ os.path.join(self.target_logs, f) for f in os.listdir(self.target_logs) if os.path.isfile(os.path.join(self.target_logs, f)) ]
         return logs
 
     #build the grep command to be used with filters and exclusions




