Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 105B1762A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 22:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t88MaHWe012447 for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 23:36:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ahlU8BbhzxEy
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:36:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t88Ma41G012436
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 23:36:15 +0100
Message-ID: <1441751764.24871.293.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Sep 2015 23:36:04 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] qemurunner: Fix killpg pid usage
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
X-List-Received-Date: Tue, 08 Sep 2015 22:36:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

killpg should be being called with a pgid, not a pid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1fd07a8..e506ca5 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -264,7 +264,7 @@ class QemuRunner:
             os.kill(self.monitorpid, signal.SIGKILL)
             logger.info("Sending SIGTERM to runqemu")
             try:
-                os.killpg(self.runqemu.pid, signal.SIGTERM)
+                os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
             except OSError as e:
                 if e.errno != errno.ESRCH:
                     raise
@@ -273,7 +273,7 @@ class QemuRunner:
                 time.sleep(1)
             if self.runqemu.poll() is None:
                 logger.info("Sending SIGKILL to runqemu")
-                os.killpg(self.runqemu.pid, signal.SIGKILL)
+                os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             self.runqemu = None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()



