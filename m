Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5701EC433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Mar 2022 05:18:41 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.633.1648271919308369858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 22:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=LE8otExe;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648271919;
  x=1679807919;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5igoMJTPmbZ/CnQd7PR9tl1nOqW8OQ9EraREJreCm1g=;
  b=LE8otExemOzW/E4O+M58GPzwIveaOs88YR5pMZ1x8sayA8VaYi6zya+V
   sjeCy+lS5ew4PC5xfNY4TJ8Xav3F7OqsJf0ohq7+ToVNJsqSLvXxVQQPc
   ILypylMxarxaoYyg/mSbizVwUgj/KYoTUT/S4g4NctZIG9ho3UkQGPKVV
   hcMZaNnVeH3d/JkbQMSthQxnsmIYcEw1/UcGOF+WA9X3dval0USnN5nX9
   ufYhuggL5aOSriz96288nDvQGdYj0Jye0GhgsFFGtE4pT0L7ZpQTQnYk9
   tNmYui7Um9vJs3TL0yeo85ChROBbg4LZUeXSJzBqg3WvyXuIrv6DFeFfp
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC][PATCH] server/process: Avoid hanging if a parser process is
 terminated
Date: Sat, 26 Mar 2022 06:18:34 +0100
Message-ID: <20220326051834.7244-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Mar 2022 05:18:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163657

If a parser process is terminated while holding a write lock, then it
will lead to a deadlock (see
https://docs.python.org/3/library/multiprocessing.html#multiprocessing.Process.terminate).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

After the discussion on IRC about the hanging parsing processes, I
just had to understand the code and what happens. This is a solution to
the problem, though I am not sure it is THE solution. It may also be
that the rlock in ConnectionReader should be handled the same way.
Anyway, even if this is not accepted as a solution to the problem, I now
at least know a lot more about how the parsing processes in bitbake
work... :)

 bitbake/lib/bb/server/process.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bitbake/lib/bb/server/process.py b/bitbake/lib/bb/server/process.py
index 1636616660..544b00f2cd 100644
--- a/bitbake/lib/bb/server/process.py
+++ b/bitbake/lib/bb/server/process.py
@@ -20,6 +20,7 @@ import os
 import sys
 import time
 import select
+import signal
 import socket
 import subprocess
 import errno
@@ -728,6 +729,10 @@ class ConnectionReader(object):
     def close(self):
         return self.reader.close()
 
+terminated = False
+def catch_sigterm(signum, frame):
+    global terminated
+    terminated = True
 
 class ConnectionWriter(object):
 
@@ -739,8 +744,12 @@ class ConnectionWriter(object):
 
     def send(self, obj):
         obj = multiprocessing.reduction.ForkingPickler.dumps(obj)
+        oldsig = signal.signal(signal.SIGTERM, catch_sigterm)
         with self.wlock:
             self.writer.send_bytes(obj)
+        signal.signal(signal.SIGTERM, oldsig)
+        if terminated:
+            os.kill(os.getpid(), signal.SIGTERM)
 
     def fileno(self):
         return self.writer.fileno()

