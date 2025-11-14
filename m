Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D3CCE7B0E
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 13:30:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18034.1763127010346480805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 05:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kv7lD/DV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 101A81A1AA0
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 13:30:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D35C96060E
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 13:30:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B44B51037125A;
	Fri, 14 Nov 2025 14:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763127008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/dgL/mCTT/KiXGAglaQSKQhyZ1XEpYFcDLx3ZxG8/WQ=;
	b=kv7lD/DVEZYeJMILdB8mwnwi1qRsp8PPxfYlgFOZyxI0BlTADs8gZ7C6nU88heg5gNTAYp
	awlDYoCcai24G8MQEiWSX0jsDsO5bMMBMewjyHe7r3eJCKr+RjpjXkqMrIYOEbI2OSUHkN
	g/8M1nK0Ui+RN7/2ZlKlqYpj5pxEwCMZp+H/vQqPQRTDaY/oIk2jB1XrEiH+g6whQeySTS
	fTvceAuXgTMX7ottZPlPYv5e6jt/7KLCnZYx6zIfa+EYPlZxTCd9MtU1wesnqfZ+SkWLHN
	uJaurGuEQB4cTAkg8Xfml+JRXNhqtLgtU92PivH7nVtNirepjTH/8HRPO6IqfQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 14 Nov 2025 14:30:02 +0100
Subject: [PATCH] terminal: Show a warning when launched terminal quickly
 exits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mathieu-too_quick_devshell-v1-1-02b6c6ed9ed6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANkuF2kC/x3MSwqAIBAA0KvErBO0EqqrRETomEMfSyuC8O5Jy
 7d5LwT0hAHa7AWPNwVyW4LIM1B23CZkpJOh4IUUQlRsHU9LeLHTueG4SM2DxjtYXBamGl5LXcq
 yNhxSsHs09Px518f4ATj1b0lsAAAA
X-Change-ID: 20251114-mathieu-too_quick_devshell-c9085d3538f0
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763127007; l=2499;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=L2xY7va8U0nL8AraZFfOELgz2GLxsXYHgiTrC42ANGc=;
 b=GGMEGKl9x0iIJNLRpjHyVIDmOdZuV9JQIC3GSed9kiHX9LBB8NJsXo2aMhyPuqURMnIT6eUCi
 EPIo4fh9vNsA5H6yZmYRzQbgiROWQN6JSfE6T1rpFlImzEzXsschcSX
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 13:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226297

Terminals quitting in less than one second are likely the result of a
failure to execute the launched command: show a warning including the
command that was launched, so the user can try to debug this.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
I recently had issues launching devshell because of some environment
variables containing unsupported chars. While my specific issue probably
has to be fixed on the bitbake side [1], it was a bit tricky to
understand because no error was shown and the fail was so quick that I
was never able to see any terminal window popping.

Adding a warning in such a case should help the user to understand what
is going wrong.

[1]: https://lore.kernel.org/r/20251114-mathieu-back_quote_devshell-v1-0-45e83df2f362@bootlin.com
---
 meta/lib/oe/terminal.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 4412bc14c1d1..068269018dbb 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -240,6 +240,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
     import tempfile
     import time
     pidfile = tempfile.NamedTemporaryFile(delete = False).name
+    start_time = None
     try:
         sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
         pipe = terminal(sh_cmd, title, env, d)
@@ -249,6 +250,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
         if pipe.returncode != 0:
             raise ExecutionError(sh_cmd, pipe.returncode, output)
 
+        start_time = time.time()
         while os.stat(pidfile).st_size <= 0:
             time.sleep(0.01)
             continue
@@ -262,7 +264,10 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
             os.kill(pid, 0)
             time.sleep(0.1)
         except OSError:
-           return
+            if start_time and (time.time() - start_time < 1):
+                bb.warn("Terminal \"%s\" started but stopped only after %.2fs while running \"%s\""
+                        % (name, time.time() - start_time, sh_cmd))
+            return
 
 def check_tmux_version(desired):
     vernum = check_terminal_version("tmux")

---
base-commit: e556df28f47e754b53e1f46c97dde2b19fd8fad1
change-id: 20251114-mathieu-too_quick_devshell-c9085d3538f0

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


