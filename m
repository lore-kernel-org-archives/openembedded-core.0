Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9059278684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:28:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vADGSfHk006557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 08:28:41 -0800 (PST)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 08:28:41 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Nov 2017 11:28:31 -0500
Message-ID: <1510590512-17590-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510590512-17590-1-git-send-email-mark.asselstine@windriver.com>
References: <1510590512-17590-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] utils: qemurunner.py: Log both 'failed to reach login banner" reasons
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
X-List-Received-Date: Mon, 13 Nov 2017 16:28:40 -0000
Content-Type: text/plain

The current logging always assumes the boot timeout has expired yet
there is a second reason we might have ended up in a position where no
login banner was found, that being a socket disconnect. Add logging
for the disconnect case and make the timeout expiration conditional on
the timeout being exhausted.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 2121a0d..f31c2ca 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -311,14 +311,18 @@ class QemuRunner:
                         except UnicodeDecodeError:
                             continue
                     else:
+                        # no need to check if reachedlogin unless we support multiple connections
+                        self.logger.debug("QEMU socket disconnected before login banner reached. (%s)" %
+                                          time.strftime("%D %H:%M:%S"))
                         socklist.remove(sock)
                         sock.close()
                         stopread = True
 
 
         if not reachedlogin:
-            self.logger.debug("Target didn't reached login boot in %d seconds (%s)" %
-                              (self.boottime, time.strftime("%D %H:%M:%S")))
+            if time.time() >= endtime:
+                self.logger.debug("Target didn't reached login boot in %d seconds (%s)" %
+                                  (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
             # in case bootlog is empty, use tail qemu log store at self.msg
             lines = tail(bootlog if bootlog else self.msg)
-- 
2.7.4


