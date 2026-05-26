Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90637CD5BD5
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:33:39 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4341.1779824011649329328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 12:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=iybJfY44;
 spf=pass (domain: baylibre.com, ip: 209.85.219.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso186559886d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779824011; x=1780428811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn1BjXyFVGNnfSHz7r25Zr8s13XXZed/5vWqHlM9M9c=;
        b=iybJfY44Y34VgBQ3FRFGrRZScw6CBlrWC2rdF+BA8w8XkW2LmItWMYM5zVQ3Iw9bJ0
         8+IlRZWLloBOa21Zw4iqTUSfcdvqkzBVLIn6sVDKuitYg0GARGlXJ/H5KBFqbRH9Jljs
         UI2UINkE3naxPdaB06OlTBudBY5wcGDJ3zMxSYTMBFcfXqN1iSw8kP+vZJ79xSxcuscc
         F7T7JxNDLKRA+kdzNZVFZgP8a1VL8qE0MVTiUoX1pFnOGeTyDOmAqyN083gwF2SCid6j
         p0L1UPfVLYXGuP49SpB0Fj9vo6c97DBUS3BgdXnwfPxjaw6jpnDoo0fBCHaWXyJ5ft1X
         TWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824011; x=1780428811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pn1BjXyFVGNnfSHz7r25Zr8s13XXZed/5vWqHlM9M9c=;
        b=WQqPMsQYYjie0q7/UkWTfveG8/hvgAtmjGpJEt+MlzEUhrc3sR6/I+IzhtS53fITRw
         73YgnswVzsht+ruzBSomVOxdZ5OGVHCwPxXpDdtAzcxBvZwRDm9MZexmevrqG7y0T/1S
         Gno+crwru2sFGncNAPNLUrQi7ByaPPtq1Yj9nyeHdIa8gHkiEk9EBpjK9SLS5fmNNU26
         9LY/RBz2OalmRs8YqxRNCzuOnNQllbbsa3i3kAPsL2/VTBrmher7wYNma3DoY8/W+kc9
         twN8g0QQ/XJEwBu0cO5JItKHODkQoL2yInztjmTc5b/ANPF2v8TTq0V3SZJCDK7WROr1
         htnw==
X-Gm-Message-State: AOJu0Yx4Er+kaQZob9CF1cJwubENUWgtzhFwf6PreoZgQt9++d3mBB1k
	/Jznf1AYpef/hfIN/tuCU/tdZHd9KpzHZlSHgq9a5Wq9pN/urcQys5uvanLPNrIPNAsj+ryxhry
	Vs+7gUg8=
X-Gm-Gg: Acq92OG8poLpP6xJVZ5+eIJyzIHzSyiNeIZKyb5xzMI1CH4NyP2UNwxaC5Dl0+xcrAN
	DduNWpxzs3gpD5TgNHlkxMdqWjU1spB8WfWUBSDeWPD+QyWAPvhcdon60YSpisgN8kShWwz6dPD
	He2aIl+X+4Da06rjKzLwAou6K96wr2WyOYxG+2mom5N/b0D8Aktx57xBDa+OH4Zcc77C/e+jxwF
	UnmABRwbfoyHNPs5zukPOHKre7l1TkLHv1nS5u79ZI29ekF5BJzPO06mkLDIe46S5YU5Pydst0s
	Pzo9Ne0AOban4PE0aAW+FLUYaOdSwi3E1hcW1g7dMJ6gseuzr5fs2y+RnODTEwNkKKn7hTNKNrY
	g8aSmNWjMcobsbe96zphSZP0ezABq34C/6SVe0x7pXf3Y9M5ZerICttYrjcbhaftv4nQ90nvH8S
	9ZwatsqC+BPTId1lMFieZjOtGGNUejobZ5h9R5
X-Received: by 2002:a05:622a:480d:b0:516:d66e:7b1f with SMTP id d75a77b69052e-516d66ebfe7mr262354931cf.31.1779824010626;
        Tue, 26 May 2026 12:33:30 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc8131fc67sm152521136d6.45.2026.05.26.12.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:33:29 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 4/6] patchtest: correctly abort --directory test
Date: Tue, 26 May 2026 15:33:15 -0400
Message-ID: <20260526193317.807459-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526193317.807459-1-tgamblin@baylibre.com>
References: <20260526193317.807459-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 19:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237622

Currently, patchtest run with --directory responds to a CTRL+C press by
aborting only the current patch being tested, and moves onto the next.
Instead, this key press should stop the test entirely. Remove usage of
the unittest.installHandler() function (which intercepts the signal) and
handle it ourselves.

Also make sure that the branch is properly reset with git am --abort
afterwards, and that the return code is properly set in the sigint
handler function. Finally, update patchtest_parser.py so that the helper
info reflects this change.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/patchtest_parser.py |  2 +-
 meta/lib/patchtest/repo.py             |  4 ++++
 scripts/patchtest                      | 31 +++++++++++++++++++++++---
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/meta/lib/patchtest/patchtest_parser.py b/meta/lib/patchtest/patchtest_parser.py
index 2a11cb76c2..69bcb4b8e5 100644
--- a/meta/lib/patchtest/patchtest_parser.py
+++ b/meta/lib/patchtest/patchtest_parser.py
@@ -37,7 +37,7 @@ class PatchtestParser(object):
                             help='The patch to be tested')
 
         target_patch_group.add_argument('--directory', metavar='DIRECTORY', dest='patch_path',
-                            help='The directory containing patches to be tested')
+                            help='The directory containing patches to be tested. CTRL+C aborts the entire directory test.')
 
         parser.add_argument('--repodir', metavar='REPO',
                             default=default_repodir,
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 6a7d7d2d3b..b4cf9e8ded 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -85,6 +85,10 @@ class PatchTestRepo(object):
             self._patchmerged = True
 
     def clean(self):
+        try:
+            self.repo.git.execute(['git', 'am', '--abort'])
+        except git.exc.GitCommandError:
+            pass
         self.repo.git.execute(['git', 'checkout', self.current_branch if self.current_branch else self.current_commit])
         self.repo.git.execute(['git', 'branch', '-D', self._workingbranch])
         self._patchmerged = False
diff --git a/scripts/patchtest b/scripts/patchtest
index e8ace03905..435610b54f 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -12,6 +12,7 @@
 import json
 import logging
 import os
+import signal
 import subprocess
 import sys
 import traceback
@@ -133,8 +134,6 @@ def _runner(resultklass, prefix=None):
 
 def run(patch, logfile=None):
     """ Load, setup and run pre and post-merge tests """
-    unittest.installHandler()
-
     premerge_result = _runner(make_result_class(patch, False, logfile), 'pretest')
     postmerge_result = _runner(make_result_class(patch, True, logfile), 'test')
 
@@ -183,10 +182,26 @@ def main():
     else:
         patch_list = [patch_path]
 
+    interrupted = False
+    previous_sigint = signal.getsignal(signal.SIGINT)
+
+    def _sigint_handler(signum, frame):
+        nonlocal interrupted
+        interrupted = True
+        # Restore previous handler so a second CTRL+C exits immediately
+        signal.signal(signal.SIGINT, previous_sigint)
+        signal.default_int_handler(signum, frame)
+
+    signal.signal(signal.SIGINT, _sigint_handler)
+
     ret = 0
     for patch in patch_list:
+        if interrupted:
+            break
+
         if os.path.getsize(patch) == 0:
             logger.error('patchtest: patch is empty')
+            signal.signal(signal.SIGINT, previous_sigint)
             return 1
 
         logger.info('Testing patch %s' % patch)
@@ -197,8 +212,18 @@ def main():
             with open(log_path, "a") as f:
                 f.write("Patchtest results for patch '%s':\n\n" % patch)
 
-        ret = run(patch, log_path)
+        try:
+            result = run(patch, log_path)
+            ret = ret or result
+        except KeyboardInterrupt:
+            interrupted = True
+
+        if interrupted:
+            logger.error('\npatchtest: interrupted')
+            signal.signal(signal.SIGINT, previous_sigint)
+            return 1
 
+    signal.signal(signal.SIGINT, previous_sigint)
     return ret
 
 if __name__ == '__main__':
-- 
2.54.0


