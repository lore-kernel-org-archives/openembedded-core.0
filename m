Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21617601F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:10:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vALDAoUX017584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 21 Nov 2017 13:10:51 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eH8KA-0004Tw-1e; Tue, 21 Nov 2017 13:10:50 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 13:10:47 +0000
Message-Id: <1511269847-17161-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 6/6] qemurunner: Simplify binary data handling
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
X-List-Received-Date: Tue, 21 Nov 2017 13:10:51 -0000

I have concerns that bad timing of the flow of data from the logger
might corrupt the output due to the way binary strings are handled
in qemurunner.

This simplifies the code to do the same thing it did before but much
more safely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 82335d8..0631d43 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -275,7 +275,7 @@ class QemuRunner:
         reachedlogin = False
         stopread = False
         qemusock = None
-        bootlog = ''
+        bootlog = b''
         data = b''
         while time.time() < endtime and not stopread:
             try:
@@ -292,17 +292,13 @@ class QemuRunner:
                 else:
                     data = data + sock.recv(1024)
                     if data:
-                        try:
-                            data = data.decode("utf-8", errors="surrogateescape")
-                            bootlog += data
-                            data = b''
-                            if re.search(".* login:", bootlog):
-                                self.server_socket = qemusock
-                                stopread = True
-                                reachedlogin = True
-                                self.logger.debug("Reached login banner")
-                        except UnicodeDecodeError:
-                            continue
+                        bootlog += data
+                        data = b''
+                        if b' login:' in bootlog:
+                            self.server_socket = qemusock
+                            stopread = True
+                            reachedlogin = True
+                            self.logger.debug("Reached login banner")
                     else:
                         socklist.remove(sock)
                         sock.close()
-- 
2.7.4


