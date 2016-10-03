Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B0087719B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 14:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u93EuIGD013677 for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Oct 2016 15:56:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rlaFwlqzCDDO
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 15:56:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u93EuDqs013673
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Oct 2016 15:56:14 +0100
Message-ID: <1475506573.30475.331.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 03 Oct 2016 15:56:13 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/sshcontrol: Handle interrupted system call error
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
X-List-Received-Date: Mon, 03 Oct 2016 14:56:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Deal with an interrupted system call gracefully:

|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-systemd/build/meta/lib/oeqa/utils/sshcontrol.py", line 55, in _run
|     if select.select([self.process.stdout], [], [], 5)[0] != []:
| InterruptedError: [Errno 4] Interrupted system call

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index da485ee..05d6502 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -52,17 +52,19 @@ class SSHProcess(object):
             endtime = self.starttime + timeout
             eof = False
             while time.time() < endtime and not eof:
-                if select.select([self.process.stdout], [], [], 5)[0] != []:
-                    data = os.read(self.process.stdout.fileno(), 1024)
-                    if not data:
-                        self.process.stdout.close()
-                        eof = True
-                    else:
-                        data = data.decode("utf-8")
-                        output += data
-                        self.log(data)
-                        endtime = time.time() + timeout
-
+                try:
+                    if select.select([self.process.stdout], [], [], 5)[0] != []:
+                        data = os.read(self.process.stdout.fileno(), 1024)
+                        if not data:
+                            self.process.stdout.close()
+                            eof = True
+                        else:
+                            data = data.decode("utf-8")
+                            output += data
+                            self.log(data)
+                            endtime = time.time() + timeout
+                except InterruptedError:
+                    continue
 
             # process hasn't returned yet
             if not eof:



