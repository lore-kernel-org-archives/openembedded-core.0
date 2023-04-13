Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2CAC77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 06:46:41 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6296.1681368394176573668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 23:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eWVsbohZ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1681368394;
  x=1712904394;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QrFNexorvF1fPh4zXwr8Uz8jLY+1V7IgNWIPMw8TylY=;
  b=eWVsbohZAH6LUNor7yRtAVOAomgqHj1tjSujIClYxILHDZFqDkpOD/Qy
   hhUwGeYn3xo/hxcj0Qo+6wsq9pXXRiaRIVrCq+nzXlfKrjM2Ig4jRPp72
   0BjyW8O2wxWaZJMzZe1IEyx0VuyoX3J7L+nbsJJm3pomCrGYeBnLSVXm9
   E6AJzCf4sQnGA2g9VF1voU95Ih1Jbek2KpocxI6og83rSdg3MYNhCJHHh
   x4vImi2D6q63OyiGUBKkTMKYoS+Wafri7XPUeC6zlNR47iUsf1rEY3tvo
   uRuHHLUiRDPIpV40it2GJ69Hj1e2rMLX6PhPfGxcJ/4G7BGh+AttNP3jY
   Q==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] patch.py: Use shlex instead of deprecated pipe
Date: Thu, 13 Apr 2023 08:46:31 +0200
Message-ID: <20230413064632.3239129-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 06:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179959

The pipe library is deprecated in Python 3.11 and will be removed in
Python 3.13.  pipe.quote is just an import of shlex.quote anyway.

Clean up imports while we're at it.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oe/patch.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index d047b3b947..5990896fdc 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -4,9 +4,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
+import shlex
+import subprocess
 import oe.path
 import oe.types
-import subprocess
 
 class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
@@ -27,8 +29,6 @@ class CmdError(bb.BBHandledException):
 
 
 def runcmd(args, dir = None):
-    import pipes
-
     if dir:
         olddir = os.path.abspath(os.curdir)
         if not os.path.exists(dir):
@@ -37,7 +37,7 @@ def runcmd(args, dir = None):
         # print("cwd: %s -> %s" % (olddir, dir))
 
     try:
-        args = [ pipes.quote(str(arg)) for arg in args ]
+        args = [ shlex.quote(str(arg)) for arg in args ]
         cmd = " ".join(args)
         # print("cmd: %s" % cmd)
         proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
@@ -217,7 +217,7 @@ class PatchTree(PatchSet):
         with open(self.seriespath, 'w') as f:
             for p in patches:
                 f.write(p)
-         
+
     def Import(self, patch, force = None):
         """"""
         PatchSet.Import(self, patch, force)
@@ -952,4 +952,3 @@ def should_apply(parm, d):
             return False, "applies to later version"
 
     return True, None
-
-- 
2.39.2


