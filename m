Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9673EC38150
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 14:47:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18861.1720190846017143836
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 07:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HiFVz5+k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 523D3240007;
	Fri,  5 Jul 2024 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720190844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fbFzla7cMRg7Y6cQp5b1+Dg2yG0K17NDLgH1NqhM70=;
	b=HiFVz5+kMX9df1wMFxU7jCtg03c2pQNQZoi6rubPApE8zA+adoeX/0gI4fqCcvqa5fxnPN
	fAv8O33tQ0NQ/XczaWU7ZZF8vxHBBoUNI8ea7yKlrUF2BbZ6rjy6mkU1AM+0TmtTCLvTAi
	PLenwsCpzA9t0cWQahbIWb6aMnPHNdTRjWKfVJUc/N1XZ1xTAZo39WzUPI+D4hOQgbYp+z
	NGGlmTWNuGk+p7PKE6oqxxIMlBtNi9EzbdKebyzcHoIyu61n9jQVnaVe7K/g62yGOpqIDW
	MH+Igw3TgQwJYqbXkb3GAMrrFmTAKNRqPAHVqRltr1UyB9VvHtSYX0djVJZLcg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] oeqa/ssh: allow to retrieve raw, unformatted ouput
Date: Fri,  5 Jul 2024 16:46:37 +0200
Message-ID: <20240705144638.441976-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705144638.441976-1-alexis.lothore@bootlin.com>
References: <20240705144638.441976-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 14:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201611

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

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/core/target/ssh.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 09cdd14c759d..d4734693848e 100644
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
2.45.2


