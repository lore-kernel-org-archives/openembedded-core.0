Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C068FC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 14:50:58 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.16831.1676472650387287273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 06:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSJ7O-005TAz-EU; Wed, 15 Feb 2023 16:50:46 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSJ7O-003jZZ-4q; Wed, 15 Feb 2023 16:50:46 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 1/2] oeqa ssh.py: fix hangs in run()
Date: Wed, 15 Feb 2023 16:50:40 +0200
Message-Id: <20230215145041.889942-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230215145041.889942-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 14:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177198

When qemu machine hangs, the ssh commands done by tests
are not timing out. do_testimage() task has last logs like this:

DEBUG: time: 1673531086.3155053, endtime: 1673531686.315502

The test process is stuck for hours, or for ever if the
executing command or test case did not set a timeout correctly.
The default 300 second timeout is not working when target hangs.
Note that timeout is really a "inactive timeout" since data returned
by the process will reset the timeout.

Make the process stdout non-blocking so read() will always return
right away using os.set_blocking() available in python 3.5 and later.

Then change from python codec reader to plain read() and make
the ssh subprocess stdout non-blocking. Even with select()
making sure the file had input to be read, the codec reader was
trying to find more stuff and blocking for ever when process hangs.

While at it, add a small timeout to read data in larger chunks if
possible. This avoids reading data one or few characters at a time
and makes the debug logs more readable.

close() the stdout file in all cases after read loop is complete.

Then make sure to wait or kill the ssh subprocess in all cases.
Just reading the output stream and receiving EOF there does not mean
that the process exited, and wait() needs a timeout if the process
is hanging. In the end kill the process and return the return value
and captured output utf-8 encoded, just like before these changes.

This fixes ssh run() related deadlocks when a qemu target hangs
completely.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/target/ssh.py | 39 ++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

v3: reading raw data in chunks and converting to utf-8 in the end

v2: removed all debug prints,
https://lists.openembedded.org/g/openembedded-core/message/176921

v1: https://lists.openembedded.org/g/openembedded-core/message/176192

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 2597256c91..51079075b5 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -226,27 +226,33 @@ def SSHCall(command, logger, timeout=None, **opts):
     def run():
         nonlocal output
         nonlocal process
+        output_raw = b''
         starttime = time.time()
         process = subprocess.Popen(command, **options)
         if timeout:
             endtime = starttime + timeout
             eof = False
+            os.set_blocking(process.stdout.fileno(), False)
             while time.time() < endtime and not eof:
-                logger.debug('time: %s, endtime: %s' % (time.time(), endtime))
                 try:
+                    logger.debug('Waiting for process output: time: %s, endtime: %s' % (time.time(), endtime))
                     if select.select([process.stdout], [], [], 5)[0] != []:
-                        reader = codecs.getreader('utf-8')(process.stdout, 'ignore')
-                        data = reader.read(1024, 4096)
+                        # wait a bit for more data, tries to avoid reading single characters
+                        time.sleep(0.2)
+                        data = process.stdout.read()
                         if not data:
-                            process.stdout.close()
                             eof = True
                         else:
-                            output += data
-                            logger.debug('Partial data from SSH call:\n%s' % data)
+                            output_raw += data
+                            # ignore errors to capture as much as possible
+                            logger.debug('Partial data from SSH call:\n%s' % data.decode('utf-8', errors='ignore'))
                             endtime = time.time() + timeout
                 except InterruptedError:
+                    logger.debug('InterruptedError')
                     continue
 
+            process.stdout.close()
+
             # process hasn't returned yet
             if not eof:
                 process.terminate()
@@ -254,6 +260,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 try:
                     process.kill()
                 except OSError:
+                    logger.debug('OSError when killing process')
                     pass
                 endtime = time.time() - starttime
                 lastline = ("\nProcess killed - no output for %d seconds. Total"
@@ -262,8 +269,21 @@ def SSHCall(command, logger, timeout=None, **opts):
                 output += lastline
 
         else:
-            output = process.communicate()[0].decode('utf-8', errors='ignore')
-            logger.debug('Data from SSH call:\n%s' % output.rstrip())
+            output_raw = process.communicate()[0]
+
+        output = output_raw.decode('utf-8', errors='ignore')
+        logger.debug('Data from SSH call:\n%s' % output.rstrip())
+
+        # timout or not, make sure process exits and is not hanging
+        if process.returncode == None:
+            try:
+                process.wait(timeout=5)
+            except TimeoutExpired:
+                try:
+                    process.kill()
+                except OSError:
+                    logger.debug('OSError')
+                    pass
 
     options = {
         "stdout": subprocess.PIPE,
@@ -292,4 +312,5 @@ def SSHCall(command, logger, timeout=None, **opts):
             process.kill()
         logger.debug('Something went wrong, killing SSH process')
         raise
-    return (process.wait(), output.rstrip())
+
+    return (process.returncode, output.rstrip())
-- 
2.34.1


