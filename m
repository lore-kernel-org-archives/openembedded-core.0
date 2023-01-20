Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19D5C38A23
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:45:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.75991.1674225900228690739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdV-006KUi-Tw; Fri, 20 Jan 2023 16:44:58 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdV-00CEPa-KC; Fri, 20 Jan 2023 16:44:57 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 02/14] oeqa ssh.py: fix hangs in run() and add debug prints
Date: Fri, 20 Jan 2023 16:44:38 +0200
Message-Id: <20230120144450.2913935-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
References: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230120144450.2913935-3-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176193

When qemu machine hangs, the ssh commands done by tests
are not timing out. do_testimage() task has last logs like this:

DEBUG: time: 1673531086.3155053, endtime: 1673531686.315502

The test process is stuck for hours, or for ever if the
executing command or test case did not set a timeout correctly.
The default 300 second timeout is not working when target hangs.
Note that timeout is really a "inactive timeout" since data returned
by the process will reset the timeout.

Added debug prints help to identify which calls are hanging and
not timing out.

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
 meta/lib/oeqa/core/target/ssh.py | 42 ++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 13fd5b2a49..11f4ec6de0 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -229,29 +229,41 @@ def SSHCall(command, logger, timeout=None, **opts):
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
+                        logger.debug('Reading from process stdout')
+                        data = process.stdout.read()
                         if not data:
-                            process.stdout.close()
+                            logger.debug('End of file from process stdout')
                             eof = True
                         else:
-                            output += data
-                            logger.debug('Partial data from SSH call:\n%s' % data)
+                            # ignore errors to capture as much as possible
+                            string = data.decode('utf-8', errors='ignore')
+                            output += string
+                            logger.debug('Partial data from SSH call:\n%s' % string)
                             endtime = time.time() + timeout
                 except InterruptedError:
+                    logger.debug('InterruptedError')
                     continue
 
+            logger.debug('Closing process stdout')
+            process.stdout.close()
+
             # process hasn't returned yet
             if not eof:
+                logger.debug('Terminating process')
                 process.terminate()
                 time.sleep(5)
                 try:
+                    logger.debug('Killing process')
                     process.kill()
                 except OSError:
+                    logger.debug('OSError when killing process')
                     pass
                 endtime = time.time() - starttime
                 lastline = ("\nProcess killed - no output for %d seconds. Total"
@@ -263,6 +275,19 @@ def SSHCall(command, logger, timeout=None, **opts):
             output = process.communicate()[0].decode('utf-8', errors='ignore')
             logger.debug('Data from SSH call:\n%s' % output.rstrip())
 
+        # timout or not, make sure process exits and is not hanging
+        if process.returncode == None:
+            try:
+                logger.debug('Process still running, waiting for it to end')
+                process.wait(timeout=5)
+            except TimeoutExpired:
+                try:
+                    logger.debug('Timeout, killing process')
+                    process.kill()
+                except OSError:
+                    logger.debug('OSError')
+                    pass
+
     options = {
         "stdout": subprocess.PIPE,
         "stderr": subprocess.STDOUT,
@@ -282,12 +307,15 @@ def SSHCall(command, logger, timeout=None, **opts):
     options['env'] = env
 
     try:
+        logger.debug('run')
         run()
     except:
+        logger.debug('except from run()')
         # Need to guard against a SystemExit or other exception ocurring
         # whilst running and ensure we don't leave a process behind.
         if process.poll() is None:
             process.kill()
         logger.debug('Something went wrong, killing SSH process')
         raise
-    return (process.wait(), output.rstrip())
+
+    return (process.returncode, output.rstrip())
-- 
2.34.1


