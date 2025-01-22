Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72397C0218B
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.34434.1737515023658148619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2XhiEZlG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso8422193a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515023; x=1738119823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2fVzVr1dNuVnZD8giE1wYiu0rmJB/bbocXNFh7pQPs=;
        b=2XhiEZlGVZ5/XrwKeEdZPjQi+G8n0RS8U6qxIvaTKhlAFwggfYOEGe8rH8dM8cL3l0
         UIY5qHzfTowAzXq1WyQr5HEwTynMurNe+v70o7YBucHiS8buDZc9xr7jb3Vk1HWJL+5V
         iVbwl0rm1vZ2LO9PWkq3qp0UpENHeT/DMiJSW1PZHUjPAaXXxJLOS7IToQtgBieRu+IG
         GF/tLnglhLDV7rqq+rHGlJ/c+X/ZzdNLnQVuwHzyBMTH6REsgYwyAMol7u3emrjPXADP
         Wp02M+iuW/LG/Ps38yILLzkeHXklqWm14cl7NXoip3i0r2pD8exNcCifmZkkebA1g38d
         WSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515023; x=1738119823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2fVzVr1dNuVnZD8giE1wYiu0rmJB/bbocXNFh7pQPs=;
        b=QBaDQPz8E7Aya26sS7lBsvVEHrJ66F5DSRHzkdjQ5rU8ceM82702CXWKLw/Tv+LJ9r
         0RPI+947iJ/u7ABZhkuFtawB8FxMketSYN/gI6bijJoTcFVsWM/5siKeg7CH0gDCuxF+
         AhngQ0SQ0D5XJyR2zVPrnDz5detvZXj6j3umdhZ5tAEBXfgs0kg8BsdWEcDALG2FMvd4
         xlbVG92MA3Fd9vXFanHdX7baBXzRo1w7M59wpvveBmzBbe+6bg4WmpQrK8mjpRFkAuCD
         yegIvDkE6+UXQmUb7yQI3Yg7TNnEDa5luQM4p0Cq0lUjY7+tYCimk1S6yjSYrT4MjgNe
         NIDA==
X-Gm-Message-State: AOJu0Yw1fgMcrDBfVQ2DkP/PVJCP+4boD2vFQ3Wp4ViPfxvn/Voqam5K
	LtfiimENa5N0NOLGsQEl6OtO3KI222+AlrSU97vz2VV6Bj0dJjIttMudn1rfMqQ8ngMajZm6Zom
	6J6k=
X-Gm-Gg: ASbGncs25gSOxqwS0ytR1QbY4XZAlofbqTSOb9jE9zoAaqJZKapY/7VBXuuqkR5nwT6
	/IhAoqb1Z2QLrnbLudOfPVrMXY3iPOKEcuwAkiBtwv1qCyA9kviVCH8Yn3sOivOBpcLo4o2zta9
	sxVZDa39VylyKIMSTWeHefBm4kmjAmnKmJw2EItuEwWznUKUkaLBI9CErOpHZnAEZccf3ESW6PL
	RhezpL1mVO2otGgS9qLDPGTZvr2rJQXB+K5GwyA4+RLtj/GzmFQenM9byM=
X-Google-Smtp-Source: AGHT+IE0DlFYgyMAK8wTo57mJRiVh+ZBpxlop+DMKIAdZhbR0Mh9/zJjp3tjW4iRr+pP0wJRgSZeeQ==
X-Received: by 2002:a05:6a00:84f:b0:725:df1a:288 with SMTP id d2e1a72fcca58-72dafaf8ab3mr33843302b3a.24.1737515022869;
        Tue, 21 Jan 2025 19:03:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/14] oeqa/ssh: allow to retrieve raw, unformatted ouput
Date: Tue, 21 Jan 2025 19:03:05 -0800
Message-ID: <d09187db648053a763036a5209efd584b352cf31.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210123

From: Alexis Lothoré <alexis.lothore@bootlin.com>

The ssh target is currently well tailored to easily retrieve textual output
from a command run on a remote target. It could also be used to retrieve
raw data from a command run onto a remote target (for example, to feed this
data directly to another program), but it currently suffers two minor
issues preventing such use case:
- stderr is piped to stdout, so any error log will be mixed in the program
  output
- the final output is decoded as utf-8 and stripped

Allow to return the raw, unmodified output by adding an optional "raw"
parameter. Keep it to False by default to preserve the current behavior.
When enabled, do not return a string but the raw output as bytes.

(From OE-Core rev: 8d05dc6e2284b7ed7c32a8215b9c8bf6f7dabf00)

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 09cdd14c75..d473469384 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -55,14 +55,14 @@ class OESSHTarget(OETarget):
     def stop(self, **kwargs):
         pass
 
-    def _run(self, command, timeout=None, ignore_status=True):
+    def _run(self, command, timeout=None, ignore_status=True, raw=False):
         """
             Runs command in target using SSHProcess.
         """
         self.logger.debug("[Running]$ %s" % " ".join(command))
 
         starttime = time.time()
-        status, output = SSHCall(command, self.logger, timeout)
+        status, output = SSHCall(command, self.logger, timeout, raw)
         self.logger.debug("[Command returned '%d' after %.2f seconds]"
                  "" % (status, time.time() - starttime))
 
@@ -72,7 +72,7 @@ class OESSHTarget(OETarget):
 
         return (status, output)
 
-    def run(self, command, timeout=None, ignore_status=True):
+    def run(self, command, timeout=None, ignore_status=True, raw=False):
         """
             Runs command in target.
 
@@ -91,7 +91,7 @@ class OESSHTarget(OETarget):
         else:
             processTimeout = self.timeout
 
-        status, output = self._run(sshCmd, processTimeout, ignore_status)
+        status, output = self._run(sshCmd, processTimeout, ignore_status, raw)
         self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (command, status, output))
 
         return (status, output)
@@ -206,7 +206,7 @@ class OESSHTarget(OETarget):
                 remoteDir = os.path.join(remotePath, tmpDir.lstrip("/"))
                 self.deleteDir(remoteDir)
 
-def SSHCall(command, logger, timeout=None, **opts):
+def SSHCall(command, logger, timeout=None, raw=False, **opts):
 
     def run():
         nonlocal output
@@ -265,7 +265,7 @@ def SSHCall(command, logger, timeout=None, **opts):
         else:
             output_raw = process.communicate()[0]
 
-        output = output_raw.decode('utf-8', errors='ignore')
+        output = output_raw if raw else output_raw.decode('utf-8', errors='ignore')
         logger.debug('Data from SSH call:\n%s' % output.rstrip())
 
         # timout or not, make sure process exits and is not hanging
@@ -292,7 +292,7 @@ def SSHCall(command, logger, timeout=None, **opts):
 
     options = {
         "stdout": subprocess.PIPE,
-        "stderr": subprocess.STDOUT,
+        "stderr": subprocess.STDOUT if not raw else None,
         "stdin": None,
         "shell": False,
         "bufsize": -1,
@@ -320,4 +320,4 @@ def SSHCall(command, logger, timeout=None, **opts):
         logger.debug('Something went wrong, killing SSH process')
         raise
 
-    return (process.returncode, output.rstrip())
+    return (process.returncode, output if raw else output.rstrip())
-- 
2.43.0


