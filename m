Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhj1-0007kU-6L
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgdB005214; Tue, 7 May 2013 13:58:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CW2d4gmg-8qT; Tue,  7 May 2013 13:58:43 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47Cwdj4005189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:40 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRH-0005c4-29; Tue, 07 May 2013 13:56:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:55:59 +0100
Message-Id: <1367931368-21504-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/15] bin/bitbake: Ensure early errors are shown to the user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000

Currently if errors occur early in the init process, the errors may
not be shown to the user. This change ensures that if a failure does
occur, the messages are flushed from the queue and shown to the user.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/bin/bitbake |   21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/bitbake/bin/bitbake b/bitbake/bin/bitbake
index 0e69207..e05ff5b 100755
--- a/bitbake/bin/bitbake
+++ b/bitbake/bin/bitbake
@@ -240,11 +240,22 @@ Default BBFILES are the .bb files in the current directory.""")
 
     idle = server.getServerIdleCB()
 
-    cooker = bb.cooker.BBCooker(configuration, idle, initialenv)
-    cooker.parseCommandLine()
-
-    server.addcooker(cooker)
-    server.saveConnectionDetails()
+    try:
+        cooker = bb.cooker.BBCooker(configuration, idle, initialenv)
+        cooker.parseCommandLine()
+
+        server.addcooker(cooker)
+        server.saveConnectionDetails()
+    except:
+        while True:
+            import queue
+            try:
+                event = server.event_queue.get(block=False)
+            except (queue.Empty, IOError):
+                break
+            if isinstance(event, logging.LogRecord):
+                logger.handle(event)
+        raise
     server.detach()
 
     # Should no longer need to ever reference cooker
-- 
1.7.10.4



