Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3E776F9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:56:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,574,1437462000"; d="scan'208";a="566366101"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.166])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2015 09:56:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 11:56:22 -0500
Message-Id: <1442940983-5475-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/utils/qemurunner.py: Fix HIGH CPU usage on LoggingThread
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
X-List-Received-Date: Tue, 22 Sep 2015 16:56:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LoggingThread is used for receive console output from QEMU
over TCP, so add filter to only wake poll on read events,
also change the event mask variable name to be more descriptive.

This fixes HIGH CPU consume caused by wake on ready to write
events.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index d32c9db..6edd374 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -440,9 +440,9 @@ class LoggingThread(threading.Thread):
 
     def eventloop(self):
         poll = select.poll()
-        eventmask = self.errorevents | self.readevents
+        event_read_mask = self.errorevents | self.readevents
         poll.register(self.serversock.fileno())
-        poll.register(self.readpipe, eventmask)
+        poll.register(self.readpipe, event_read_mask)
 
         breakout = False
         self.running = True
@@ -466,7 +466,7 @@ class LoggingThread(threading.Thread):
                     self.readsock, _ = self.serversock.accept()
                     self.readsock.setblocking(0)
                     poll.unregister(self.serversock.fileno())
-                    poll.register(self.readsock.fileno())
+                    poll.register(self.readsock.fileno(), event_read_mask)
 
                     self.logger.info("Setting connection established event")
                     self.connection_established.set()
-- 
1.9.1


