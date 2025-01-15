Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB4BC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:35:54 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.22589.1736951748351056577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DGhGfPke;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202501151435496e03edb2ad644136b6-hc9kpe@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202501151435496e03edb2ad644136b6
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jan 2025 15:35:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ijTMGqAGkegcDIx8F2YUpMRrgcwJn2J+wzL8AdulQXs=;
 b=DGhGfPkeBzAYOcN9w8HPogBTQuPUecSNLjZSQlzALK/Q+eJb2JHWDEsAnkmg62GPMnbsq5
 NR9FPprgQj6k+eu9C9NgJQlCCA/hkAKN3DTP+bulxomciaJv8bTmuIzZBUrbe7S4MVgcYzfS
 g0YYWNAz4CaYNInhBEVEhLQYht6E4xM/9Im6m6FkLts2a8Z9u2Xx8ZxOLVktz6JMkpQPBmzw
 u464ALWJh5L9ZHn8LQrrJvt7znOBeaWwdeZg7wlxlNXjvVu6t0YsHw2azHTGlRkhUpsU/KWf
 i1V130mdurffH7jMUdT6R4qimW4kMAWXbEr5gqtmbmCE9SZs1PqLA/0g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/1] oeqa/ssh: allow to retrieve raw, unformatted ouput
Date: Wed, 15 Jan 2025 15:34:43 +0100
Message-Id: <20250115143443.24741-2-peter.marko@siemens.com>
In-Reply-To: <20250115143443.24741-1-peter.marko@siemens.com>
References: <20250115143443.24741-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209904

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
---
 meta/lib/oeqa/core/target/ssh.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 09cdd14c759..d4734693848 100644
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
2.30.2


