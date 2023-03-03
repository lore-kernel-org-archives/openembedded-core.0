Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208B8C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:27 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.27592.1677860299935788879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LLbSsITm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso6660323pjb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x71DFzhhSm4+JuGsgdS0QsmScltUHu+REDnOgwQsvys=;
        b=LLbSsITm45ewt3BGIC2roDhv6lGb+MCHejnQ8r45E0ir96ke3qRAYKjfEy8i3Df4lE
         a/LUKNtL/Yucb53nY+qVAhx4sT92gAIaPamNo6cJLybV21TEnk+mQpHAe9gTI+g9NaOd
         CU6jsiZjOzTfkSabClQ9d1l0K2clnjbA3SRU1y4CtlmAkLqTH33/E8N2/jemI12NDlDB
         7c5IR1+VFvURvCTzWVfcvMfODUp6FFRAnoa26ZNJB9mcxqDGGAN4Bdy0kXCoU7iQ2bPL
         dbZkccZ2shXqUkSwnuTGn8jzLn2zjpdmYOlacHvthIAv3feRzWU22BMx7q0gvGmVuX9D
         2E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x71DFzhhSm4+JuGsgdS0QsmScltUHu+REDnOgwQsvys=;
        b=FpOtfiqjwtezSIeHuTdTdL8yu8PTh7jfJYj3PGe3Ad+SJtNfluWj42NmTjEwKBsapL
         KBA5SXDds+1fml+CVEw1ok/0TkD6o4NOzakR4bN1IO6ATrKAw6afq2zqIPc8Aho3d8oE
         6agJ48xq8vV8/qvGOuMNgsa371y7vO4JRkqWpRKJdpt++NQDWelEHLWLgZCjpCmtc9vT
         mJsgrheW//GPU64fV2KYIyQSA5F7+0ZzEcnqy71heFhIKrWo/bU9fJ/F36NOvdpIt/59
         Myr5sotaPODNdR7n62OnMR69FbhmFnDf/2kGks5kD7zxE604FBuMKoQhuLbs3WT9clHz
         Gk0g==
X-Gm-Message-State: AO0yUKXsuulJclERW9q5VHIBy7OgKZu+sTE13cmCjUxpNHi4qqUhRVFJ
	zblDy3t2Ea9mmiZdLSKmXVSXmv3oyDqylOVd5ME=
X-Google-Smtp-Source: AK7set+hwY8QH9utpsIr6ofDx3qd4BjNwuHy9iiNoTJ05XzfwMVh2h3r1AqxcR593ZXOb3QqSNMV1Q==
X-Received: by 2002:a17:902:d2c5:b0:19e:6969:b142 with SMTP id n5-20020a170902d2c500b0019e6969b142mr2983917plc.3.1677860298967;
        Fri, 03 Mar 2023 08:18:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/29] oeqa ssh.py: fix hangs in run()
Date: Fri,  3 Mar 2023 06:17:25 -1000
Message-Id: <875a1cc6cecf28c0f5ffbbac6627af3e6dfd30d6.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178016

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


