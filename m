Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6588AD711D1
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:06:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.20902.1732125995959755234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gXiQn1PE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43159c9f617so20423185e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 10:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732125994; x=1732730794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=utX+I5ggFA8lyQxeV1ZrOLNXDpR8thmjM2uNC/tXaRk=;
        b=gXiQn1PEn/Y+iyT+TRdv1FZtzekPRz1R7fdKmFYcFcq/se7WguYsfgjvgdpitx1qO4
         NGmyU918f49vuPrl1r8ANujbe2akJh8lXBkRZhRuAzZi0rSBDSEG2Z0zejBdHtrj5UiV
         Zjt4IB7pvqF/332QrYFdrcPNAPS2QmUoiOTuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732125994; x=1732730794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utX+I5ggFA8lyQxeV1ZrOLNXDpR8thmjM2uNC/tXaRk=;
        b=GXEcCtRQPp9Ih2KEKAY3xq60EuZUrYAZxkzlS8G+2tCIdzRigW5Xd92I6DjwlX+Pwb
         kKWDWoDTKG22Ukb87nYoo0OP5HfbmB1bBi1zmWKxwPFRXY5GO3BC6UT429cgG6sHnHqH
         CjqgCP5BjDg/wW1Hof84DuhivHy/snQ1WYGKumqmbAc2sYMjO07vfDwsSmZCiH8A24Tt
         9GK+EMij+q2jQQKU3fa9umKclUkeeKA1O2fnPyTNtaaZ6bUqNiZHF1XkNx6SxyUWSRg2
         8yhEWSDVgdfNpy1OsLQgdx+R2P8H+7GlubLm7+ViVY7Lv5+YvdoAQ4Q+34DHBsNmU6ik
         zeMA==
X-Gm-Message-State: AOJu0Yy4PTmGDWiesLhjubinAiDOSAzMDkWrqsxhrceeEFX0X6S/ExG0
	td1X38tV1dnq9mF/+MWHHlfEg2WtmXRjJ6biWFyBOqSzmfsc6AYElRRvHyhi8EwGOZRTAu0VQs8
	5nmQ=
X-Gm-Gg: ASbGncu/AnOF5qVvtXmfc7kFJn2wc8vziWdAJi7m5UA5Aeoc+ngDaKkTEXtc150UXsf
	Rj4G/3GCh55drdnT3t30bkcQ6B854YYvHnCmPRibPrdTRgG29civBMFtkqVb8tnqixrac5OFjJK
	4fwJVbQS7RLaeZITfKBC425QGchI+DeqcI69FtM6AhB/HlOv9iEtnVjHgYaa15fBaX32qch14Hb
	z5vMqWSzZMaF+9y/17JzpMy41wvQkBNxjnXTTuGUollIVdduDwk6FZzzi17L2SnUKtU9zZQqlBW
	X9A=
X-Google-Smtp-Source: AGHT+IEZpLz6sn3i2uFGpsYR9G5Kqw1Bml40DmR/YTp5Xe+cc1jnm1Q3XCNgzH6BZ2YQavBbBWnW0g==
X-Received: by 2002:a05:600c:1e24:b0:42c:a580:71cf with SMTP id 5b1f17b1804b1-4334f027a99mr36429045e9.30.1732125993526;
        Wed, 20 Nov 2024 10:06:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254933c85sm2691087f8f.65.2024.11.20.10.06.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 10:06:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/ssh: Improve performance and log sizes
Date: Wed, 20 Nov 2024 18:06:29 +0000
Message-ID: <20241120180631.2437985-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 18:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207467

The current code is not fit for purpose when handling large files via ssh. In the strace
ptest case, we can end up with a 1.4GB archive being transferred for which every
byte is printed into the task logfile twice over. This is then sent over bitbake IPC
which compounds the problems.

Make the following improvements:
  * when the output is large (over 64kb), don't print it
  * use a bytearray for better concat performance since strings are slow for this
  * when there is no ssh output, say that
  * print periodic size status output rather than the data itself since this could be binary and/or large
  * fix the killed process message logic which appeared broken

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/ssh.py | 44 +++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index d4734693848..8b5c450a058 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -92,7 +92,10 @@ class OESSHTarget(OETarget):
             processTimeout = self.timeout
 
         status, output = self._run(sshCmd, processTimeout, ignore_status, raw)
-        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (command, status, output))
+        if len(output) > (64 * 1024):
+            self.logger.debug('Command: %s\nStatus: %d Output length:  %s\n' % (command, status, len(output)))
+        else:
+            self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (command, status, output))
 
         return (status, output)
 
@@ -211,17 +214,18 @@ def SSHCall(command, logger, timeout=None, raw=False, **opts):
     def run():
         nonlocal output
         nonlocal process
-        output_raw = b''
+        output_raw = bytearray()
         starttime = time.time()
+        progress = time.time()
         process = subprocess.Popen(command, **options)
         has_timeout = False
+        appendline = None
         if timeout:
             endtime = starttime + timeout
             eof = False
             os.set_blocking(process.stdout.fileno(), False)
             while not has_timeout and not eof:
                 try:
-                    logger.debug('Waiting for process output: time: %s, endtime: %s' % (time.time(), endtime))
                     if select.select([process.stdout], [], [], 5)[0] != []:
                         # wait a bit for more data, tries to avoid reading single characters
                         time.sleep(0.2)
@@ -229,9 +233,9 @@ def SSHCall(command, logger, timeout=None, raw=False, **opts):
                         if not data:
                             eof = True
                         else:
-                            output_raw += data
+                            output_raw.extend(data)
                             # ignore errors to capture as much as possible
-                            logger.debug('Partial data from SSH call:\n%s' % data.decode('utf-8', errors='ignore'))
+                            #logger.debug('Partial data from SSH call:\n%s' % data.decode('utf-8', errors='ignore'))
                             endtime = time.time() + timeout
                 except InterruptedError:
                     logger.debug('InterruptedError')
@@ -244,6 +248,10 @@ def SSHCall(command, logger, timeout=None, raw=False, **opts):
                     logger.debug('SSHCall has timeout! Time: %s, endtime: %s' % (time.time(), endtime))
                     has_timeout = True
 
+                if time.time() >= (progress + 60):
+                    logger.debug('Waiting for process output at time: %s with datasize: %s' % (time.time(), len(output_raw)))
+                    progress = time.time()
+
             process.stdout.close()
 
             # process hasn't returned yet
@@ -256,17 +264,29 @@ def SSHCall(command, logger, timeout=None, raw=False, **opts):
                     logger.debug('OSError when killing process')
                     pass
                 endtime = time.time() - starttime
-                lastline = ("\nProcess killed - no output for %d seconds. Total"
+                appendline = ("\nProcess killed - no output for %d seconds. Total"
                             " running time: %d seconds." % (timeout, endtime))
-                logger.debug('Received data from SSH call:\n%s ' % lastline)
-                output += lastline
+                logger.debug('Received data from SSH call:\n%s ' % appendline)
                 process.wait()
 
+            if raw:
+                output = bytes(output_raw)
+                if appendline:
+                    output += bytes(appendline, "utf-8")
+            else:
+                output = output_raw.decode('utf-8', errors='ignore')
+                if appendline:
+                    output += appendline
         else:
-            output_raw = process.communicate()[0]
-
-        output = output_raw if raw else output_raw.decode('utf-8', errors='ignore')
-        logger.debug('Data from SSH call:\n%s' % output.rstrip())
+            output = output_raw = process.communicate()[0]
+            if not raw:
+                output = output_raw.decode('utf-8', errors='ignore')
+
+        if len(output) < (64 * 1024):
+            if output.rstrip():
+                logger.debug('Data from SSH call:\n%s' % output.rstrip())
+            else:
+                logger.debug('No output from SSH call')
 
         # timout or not, make sure process exits and is not hanging
         if process.returncode == None:

