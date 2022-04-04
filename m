Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69713C4708E
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.34383.1649074230318652535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=ZPxpYx7C;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649074230;
  x=1680610230;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O8bEoJo418qcQ1nCRTGreIF5N0izP6JDdCXiwiE5xpg=;
  b=ZPxpYx7CjEFkT6Q50FQU7B3JspLqu/u7sfY50y5f5k9i0mfNZ3CITq34
   v0VN1PyG0k5rYwHpIOig2FVqHUIs5jsqwpw7/HQpFfB+ozyudVUJvCu3T
   uJhdyx5NjbCnUhqdwOKds9zlC55fqDfkMpteM06VRyfHBn4Ym9wq9mjdF
   k3WVyHHmfUbCNP8WwmlyRx8sy89GqdfmiiFSoEWZh8JDFai56w5vz4sv2
   05hK/p6MrqVIzns2kx9ky639sby7MMvn4mLls4zaQW4BM/bgzCjj1zNsJ
   +0uHz8V4p5g4vCYNckYle8jbOCNHo9oPV6a4N5D7W+mAphUf/w6lYSRV4
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] knotty.py: Show elapsed time also for tasks with progress
 bars
Date: Mon, 4 Apr 2022 14:10:25 +0200
Message-ID: <20220404121025.24659-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163991

While the progress bar is good at conveying information about how much
of a task has executed, the elapsed time of the task is still very
much relevant to show.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/lib/bb/ui/knotty.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index b2e7520ee7..3f410fd525 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -252,26 +252,26 @@ class TerminalFilter(object):
             return
         tasks = []
         for t in runningpids:
+            start_time = activetasks[t].get("starttime", None)
+            if start_time:
+                msg = "%s - %s (pid %s)" % (activetasks[t]["title"], self.elapsed(currenttime - start_time), activetasks[t]["pid"])
+            else:
+                msg = "%s (pid %s)" % (activetasks[t]["title"], activetasks[t]["pid"])
             progress = activetasks[t].get("progress", None)
             if progress is not None:
                 pbar = activetasks[t].get("progressbar", None)
                 rate = activetasks[t].get("rate", None)
-                start_time = activetasks[t].get("starttime", None)
                 if not pbar or pbar.bouncing != (progress < 0):
                     if progress < 0:
-                        pbar = BBProgress("0: %s (pid %s)" % (activetasks[t]["title"], activetasks[t]["pid"]), 100, widgets=[' ', progressbar.BouncingSlider(), ''], extrapos=3, resize_handler=self.sigwinch_handle)
+                        pbar = BBProgress("0: %s" % msg, 100, widgets=[' ', progressbar.BouncingSlider(), ''], extrapos=3, resize_handler=self.sigwinch_handle)
                         pbar.bouncing = True
                     else:
-                        pbar = BBProgress("0: %s (pid %s)" % (activetasks[t]["title"], activetasks[t]["pid"]), 100, widgets=[' ', progressbar.Percentage(), ' ', progressbar.Bar(), ''], extrapos=5, resize_handler=self.sigwinch_handle)
+                        pbar = BBProgress("0: %s" % msg, 100, widgets=[' ', progressbar.Percentage(), ' ', progressbar.Bar(), ''], extrapos=5, resize_handler=self.sigwinch_handle)
                         pbar.bouncing = False
                     activetasks[t]["progressbar"] = pbar
-                tasks.append((pbar, progress, rate, start_time))
+                tasks.append((pbar, msg, progress, rate, start_time))
             else:
-                start_time = activetasks[t].get("starttime", None)
-                if start_time:
-                    tasks.append("%s - %s (pid %s)" % (activetasks[t]["title"], self.elapsed(currenttime - start_time), activetasks[t]["pid"]))
-                else:
-                    tasks.append("%s (pid %s)" % (activetasks[t]["title"], activetasks[t]["pid"]))
+                tasks.append(msg)
 
         if self.main.shutdown:
             content = pluralise("Waiting for %s running task to finish",
@@ -308,12 +308,12 @@ class TerminalFilter(object):
         if not self.quiet:
             for tasknum, task in enumerate(tasks[:(self.rows - 1 - lines)]):
                 if isinstance(task, tuple):
-                    pbar, progress, rate, start_time = task
+                    pbar, msg, progress, rate, start_time = task
                     if not pbar.start_time:
                         pbar.start(False)
                         if start_time:
                             pbar.start_time = start_time
-                    pbar.setmessage('%s:%s' % (tasknum, pbar.msg.split(':', 1)[1]))
+                    pbar.setmessage('%s: %s' % (tasknum, msg))
                     pbar.setextra(rate)
                     if progress > -1:
                         content = pbar.update(progress)

