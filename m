Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9771BC6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:26 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.69614.1677431000391315377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=U2f/EvTv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id y2so3795476pjg.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x71DFzhhSm4+JuGsgdS0QsmScltUHu+REDnOgwQsvys=;
        b=U2f/EvTvh98NZVzHAfp8C9iTNs7hD5iu3QjqZTlXq7XhDeSu3giEmDXDcUajw7rHb7
         OQruduQJP91tPiIN2sqg0ctVfQBFYeYdqp8S3YJK1R3fV/9xuY36ClT834gH3WHV/K4D
         iEs2iwAFwxbGY9sW/Kl0v+g2ixkXkl2VDJAjGSdBbk4DERxbt0zDEHpcmmpQl0EeFIrY
         Gqs0l5U+GIM5xnJHQ52t2PmDVh2BR+N3iOXSLdwh2P7JCI1jIsO6dGK8IjHV38zDWjSf
         qsjfZRt3fpMIRyYhrujTeSKAPcaI9gnYKrtT2zoMNYsonwh1d95H7Vzajz4rKP7tN/SY
         FXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x71DFzhhSm4+JuGsgdS0QsmScltUHu+REDnOgwQsvys=;
        b=QfwGwUl5cQGX91vfURIF90ZTn28QcJbTcXu19Q3Lz1f++/2u2UBWkHsHZbOP9uYEO/
         rCI4o1xbN6Hsas+8BAySAwl1K0IKJk6rAkXH7gWLRBdPrQMF7vpcHjRznKG3qzq7chi0
         I4MAuf5WcHUSlau9RmpggKPYDoNXTDxNkkhUAwZVOI1ZD6iJ6SArDvnL4ggmuKocQVjq
         G+A+xppRES0nHYPKBaltqTmm/jjuzfM/aL0c68z2b3F+YL3N+/S57PJF76BKZzPRRx4D
         dZ+7bSzkeMZkl9tzlsql3yECBg+QTnBWarnkHUxdpSAYfBtt7TWlTYezg8pNGf4TbJsa
         6mMA==
X-Gm-Message-State: AO0yUKUVRylzuv4Xc+9tx+iBuiSuSfYUbNnPMeg6LfvpT92xSD/rtq9i
	NCcK7z++/VZ38CyYgoSjM3eEr1jOzGxN9ci3VK4=
X-Google-Smtp-Source: AK7set80vcacAxba/GhFtoZkhHiNO6/wCY88JV/S8bZV+BltBErCe6A8R5uuIbckLXa3yP6jxfpYaA==
X-Received: by 2002:a17:90b:4a06:b0:234:1a60:a6b0 with SMTP id kk6-20020a17090b4a0600b002341a60a6b0mr23206453pjb.34.1677430999354;
        Sun, 26 Feb 2023 09:03:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 27/28] oeqa ssh.py: fix hangs in run()
Date: Sun, 26 Feb 2023 07:02:23 -1000
Message-Id: <3e1a4d572922eadc85ff6ac169722ad7ab118cf4.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177765

From: Mikko Rapeli <mikko.rapeli@linaro.org>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9c63970fce3a3d6029745252a6ec2bf9b9da862d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 39 ++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 48a463861d..4ab0cddb43 100644
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


