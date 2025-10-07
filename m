Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1773BCCD187
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 17:38:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.25066.1759858700857135838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 10:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O9wX+Tmi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 34CD54E40F62
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0424C606E5
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A022102F2176;
	Tue,  7 Oct 2025 19:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759858698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VqYIXcjbYi1yMYIATlweK7Cw+lrMnKm18pbx0Tp2Po8=;
	b=O9wX+TmixBufTsghr5J6hKztRHA2lmXtAjpyYfELP1o/XGsyLQkDHxwU/pRZjOrRA8KJFG
	0gXk57RHMRJD9vXBGpD9jIr72SodJWY4Mh4qF835XNjRK6joIo6hqPx5crkp2Rjzd8q+Em
	AyYVvbwIXWtbskwr61ORqmUM9sxxZ9tkfBob+sFAOA5130RMzkkq8igg+ITltjT6rExWzD
	/L2bG2IOvWnSEs0CGM1JShdThYBSeZWiuocUw7CYPzhcrUk3PnE73Fx0KiAVzj5UmG7QPb
	tSVfU4fmVSUuYr9GhlavNevdhr1UMtUPDoSgHNRwKbj6t2/2IBAdTiMF7dzSfw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 07 Oct 2025 19:38:06 +0200
Subject: [PATCH 1/4] oeqa: target: ssh: Fail on SSH error even when errors
 are ignored
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-mathieu-ssh-fails-v1-1-a6affee3571b@bootlin.com>
References: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
In-Reply-To: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759858696; l=3114;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=kS6W95WkE26eZ1QwymKiYYYZkfmbaMoYSwqqt48EUpw=;
 b=BChzXtzPsWIhdFFdp8+iHFnArj1yUMWlVwxzX/OfXf0aaLPUY+P9pA0NvU6kjc6VnaiRdGq8y
 6KdRnqg02M5BJzJDTGODadzC6/Vx0JJ+0HWIctDkOK7HtOyUaOJ/yOK
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 17:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224545

Most tests running SSH commands ask for no error to be raised when the
returned status is not 0. As run() will return this status, they may
later use its value to do a similar check on their own, or completely
ignore it. But most of the tests do not check if the non-zero status is
caused by a fail of the command run on the target or by a fail of SSH
itself.

This can lead to confusion when the error does not come from the command
executed on the target but from SSH itself: test might wrongfully be
marked as PASSED or might fail with incoherent errors.

As SSH errors are always reported with exit code 255, we can easily
filter these.

Modify OESSHTarget.run() behaviour so an AssertionError is raised on SSH
failures, even when ignore_status parameter is True. Still allow to
explicitly ignore this error for the rare cases where this can be
needed.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/core/target/ssh.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 8b5c450a058fd172f36af6cbd9569983aa3d2d51..0ac3ae438895c97e89599b2dfb2797dabbf383dd 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -55,7 +55,7 @@ class OESSHTarget(OETarget):
     def stop(self, **kwargs):
         pass
 
-    def _run(self, command, timeout=None, ignore_status=True, raw=False):
+    def _run(self, command, timeout=None, ignore_status=True, raw=False, ignore_ssh_fails=False):
         """
             Runs command in target using SSHProcess.
         """
@@ -66,13 +66,17 @@ class OESSHTarget(OETarget):
         self.logger.debug("[Command returned '%d' after %.2f seconds]"
                  "" % (status, time.time() - starttime))
 
-        if status and not ignore_status:
+        if status == 255 and not ignore_ssh_fails:
+            raise AssertionError("ssh exited with status '255' for command "
+                                 "'%s': this is likely an SSH failure\n%s"
+                                 % (command, output))
+        elif status and not ignore_status:
             raise AssertionError("Command '%s' returned non-zero exit "
                                  "status %d:\n%s" % (command, status, output))
 
         return (status, output)
 
-    def run(self, command, timeout=None, ignore_status=True, raw=False):
+    def run(self, command, timeout=None, ignore_status=True, raw=False, ignore_ssh_fails=False):
         """
             Runs command in target.
 
@@ -91,7 +95,7 @@ class OESSHTarget(OETarget):
         else:
             processTimeout = self.timeout
 
-        status, output = self._run(sshCmd, processTimeout, ignore_status, raw)
+        status, output = self._run(sshCmd, processTimeout, ignore_status, raw, ignore_ssh_fails)
         if len(output) > (64 * 1024):
             self.logger.debug('Command: %s\nStatus: %d Output length:  %s\n' % (command, status, len(output)))
         else:

-- 
2.47.3


