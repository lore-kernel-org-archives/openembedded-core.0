Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BBEC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 21:05:30 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.36072.1650920724628757338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 14:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=VnwwuPGB;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650920725;
  x=1682456725;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X+bI83S0Jz1ZNCHB3W9clpkDgIMjuutFEBpV3Mdmn98=;
  b=VnwwuPGBdgekdysI6CzPorhCpCQ9esXfGSwpHVFJKtrAlEqfJ1x+sgCa
   zQkn2VUCXn7v6iy9rUrOwGMDIu9dPJvwm7BmlWLdH1gc6EB2bY0UOZR6x
   VqCp3mtGBpRLTlcVxoRda+M3QycTdDG6iGqCgaYyDY0HjL0fEwr8Aehup
   AjFozUYiJLMY2PBj6Ojkf8Z3bsky/5WUAnz7APU/WkDn1+UnGpuYbwH3j
   35Sk6uBk3Gfx32Eto1Vjcn1nHHEK8fd+9WkjsNmenJVh6/pYsIRaPxWcW
   bZg7Jv0fnMBF+9REt51qthHODtsYnc28UfMXf8pX86u1OWEWLKuTLSfXX
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][kirkstone][PATCH] terminal.py: Restore error output from
 Terminal
Date: Mon, 25 Apr 2022 23:05:19 +0200
Message-ID: <20220425210519.11162-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 21:05:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164842

In bitbake commit 1ecc1d94 (process: Do not mix stderr with stdout),
bb.process.Popen() was changed to no longer combine stdout and stderr by
default. However, the Terminal class was not updated to reflect this and
subsequently only output stdout in case of failures.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/terminal.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 53186c4a3e..de8dcebf94 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -30,9 +30,10 @@ class Registry(oe.classutils.ClassRegistry):
 
 class Terminal(Popen, metaclass=Registry):
     def __init__(self, sh_cmd, title=None, env=None, d=None):
+        from subprocess import STDOUT
         fmt_sh_cmd = self.format_command(sh_cmd, title)
         try:
-            Popen.__init__(self, fmt_sh_cmd, env=env)
+            Popen.__init__(self, fmt_sh_cmd, env=env, stderr=STDOUT)
         except OSError as exc:
             import errno
             if exc.errno == errno.ENOENT:

