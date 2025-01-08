Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADC6E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.32456.1736371065795207868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aTG2pqmr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21636268e43so3415185ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371065; x=1736975865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfs/N+6F4a7dNHT2I819hLLdDGaqtBqBaQUgusTsdac=;
        b=aTG2pqmrDZruaLj/mJD6xjXa32D1E2JmbbiEyvRIXVZEBFM5Jrb/xDGIg2ytJlwaVI
         QgKOAFa1Aaa2DtGTujIq0N+1ZU8CCrEKguY2nva70WCSD/9Y3nWBIscB5n5qaqPfaeQz
         u6zXij5lIICOguuw3FHAfkbqbylzLFta3Zc1Yhdwgehkfgy/I3lBK39cfs26q1Xd7aVH
         5oPTDh4b6evTp5jx0hGGq6ox98E7SBW/DK/Nlom1k7RdjHBqIuaxxUIp5wRhRWiZTwck
         gpfWW5Vc1i0ejvkhipZ5fgnDqiqVB1L/+UoTIuvUEpimUVDlwQHX3eKC8o4YiZbBDrgD
         dflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371065; x=1736975865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfs/N+6F4a7dNHT2I819hLLdDGaqtBqBaQUgusTsdac=;
        b=MrP9+FuOSSQOqXuwe0TUt3q52QIN7Ly7T7EuPBXtzsJNhnaWHnxhQF+sn5TiUsPQaG
         isHGtbnpXOuxnuAf/S286eCdSO+GATWxRJ5X+FJ3NS4kOyr7P+hG+OYeMB8ZvKsrwWcW
         C4kBcTQBBtmBvx5MkDkPkDhQlPsnjJKkNMzpNJoCJOslKR/sjvMh5+vJv36aHNVBhmMt
         YvouVTfZqCqiTMOtWL7XYNqY6B1kp6LNg4TjwJRKWsn0jSYVAHbYYt6Ewv1ITbw0sxIt
         obkutuXW88HZM2EfASSBNYzVudf4YBuJDxCtJFsIJ/j9kyu8RMRZYjreq/ugu0n3Tuyl
         yXDw==
X-Gm-Message-State: AOJu0YzHseY3Nj9snp56TsH9zb2AbJOEuAsKtldZAm0r52oYk1MqCR/N
	vdgyeKIIMJLewy5f2J5OMidrxQ7mRpf5PrSoazAHJz2Dr/ahinXTRBkxiRLCfA1KS4FQ1+oGidj
	+HaQ=
X-Gm-Gg: ASbGncvqfrPQUZZHeZvhYuIR6XtnlBmpGSbVe4KlJpxaEABT5+iLygOlFCDk3+yj367
	nvWQ//uDsYkQD5JGSJB5rv0FozzPSUwgYXfpLPvUN2JvZMvMFC0d9jt0hqzqtfhW1fcUBDgmXpl
	4SCeL697QU6LDvM1qSXpRvYBR0vU+6nyU9pda2pAPdYWxHS33es9Sqp5Jn/lkr3y/41yFL+i3GX
	n5jbGROthDcDd3H6kELnWZzGVtLc69I0TL6UothsafAdw==
X-Google-Smtp-Source: AGHT+IH/9mkOeU/bT4Zmdnl0RUzTZo9wkDrB393E3/A6kVSJcfY1Iv+nV7WwJqHP10BoUSS8tIk1Zw==
X-Received: by 2002:a17:902:cccc:b0:216:6769:9eea with SMTP id d9443c01a7336-21a83ffc47dmr75621345ad.37.1736371065014;
        Wed, 08 Jan 2025 13:17:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 17/18] oeqa/ssh: Improve performance and log sizes
Date: Wed,  8 Jan 2025 13:17:07 -0800
Message-ID: <f762f4278fb05f3cee9762028aac412931c968f6.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209607

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit e7dd009a17dc902852983a82bce41bf78bb1e242)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 44 +++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index d473469384..8b5c450a05 100644
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
-- 
2.43.0


