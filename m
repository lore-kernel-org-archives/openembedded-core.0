Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D01CEB2C9
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 07:41:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4926.1763192503279279464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 23:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gfG5Id9N;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 60FAC1A1ACD
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 07:41:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 378D2606F6
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 07:41:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE74C10371C2D;
	Sat, 15 Nov 2025 08:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763192500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1kXlchZvu2339e/hLFsdLkmNQBdI43B/jOG3d0ihoRU=;
	b=gfG5Id9NIO152oa4dKqYGzxdn5QwV1mPicb0gYymgQs3JKSyPIZkizwsHUwb+sJGggFIJ5
	wMuB57YCqHD4yn2CpYhhq9qG2//mXXf9UbCzWY/Bqen6q5jtBQRVjClAv5QzrlvuP9SwjD
	5q6upH1SHpU2AlzVX2gnE4ImGy3CoTwzpQSHMynMmR6NMUe3R7/kVNqqd4fgJhHms0MFR7
	Zjrn4wGu2zSrUqc4IJQQjBQCu5pp6FcDqejS/CoLJ2EDfOu7uGsYpm2whiN3EKLXJtoY5v
	jSFtdw6u9Ub/w0D675wlsV4cnq7UFCr4iwY0oJeWyr/Q1O/9W243qjKyVZ6YLg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 15 Nov 2025 08:41:31 +0100
Subject: [PATCH v2] terminal: Show a warning when launched terminal quickly
 exits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-mathieu-too_quick_devshell-v2-1-da3c4f5f8d7b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKouGGkC/43NQQ6CMBCF4auQrq1pixBwxT0MIdAOdiIw2pZGQ
 7i7lRO4/N7ifxvz4BA8u2YbcxDRIy0J6pQxbfvlDhxNMlNCFVLKC5/7YBFWHoi614r60RmI3sI
 0cV2LqjB5kVejYCnwdDDi+4jf2mSLPpD7HF9R/ta/slFyyYUaSl2CqcGUzUAUJlzOmmbW7vv+B
 RJFMFvGAAAA
X-Change-ID: 20251114-mathieu-too_quick_devshell-c9085d3538f0
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763192499; l=2650;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=BV0wCOG2wkjt2NPq8Q+Y8DAS6L1XlBofnLF6BVdYilY=;
 b=YCgykXdGTw0Y5Mhis4jWkyjAgQ+b2dDoeKunIumzfkX2L2z6DYGQJh4ITfRAkSZCAXR2MsD8K
 R923OTypAEtBOX0pv9k0lhlgoMm2O51FZnDwLqLI9OXFvztGvxmzXMZ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 07:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226302

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
Changes in v2:
- Fix warning message
- Link to v1: https://lore.kernel.org/r/20251114-mathieu-too_quick_devshell-v1-1-02b6c6ed9ed6@bootlin.com
---
 meta/lib/oe/terminal.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 4412bc14c1d1..013d77581d5a 100644
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
+                bb.warn("Terminal \"%s\" started but stopped after only %.2fs while running \"%s\""
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


