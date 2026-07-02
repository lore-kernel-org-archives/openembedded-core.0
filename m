Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8DCC43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:22:39 +0000 (UTC)
Received: from par08s09-in-f0.1e100.net (par08s09-in-f0.1e100.net [74.125.230.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72294.1783005752013832220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 08:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=JJByEIlm;
 spf=pass (domain: baylibre.com, ip: 74.125.230.192, mailfrom: tgamblin@baylibre.com)
Received: by par08s09-in-f0.1e100.net with SMTP id d75a77b69052e-51c169d90cdso4048731cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783005751; x=1783610551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93jJEijk+8CRJGhoEYZXYhlpQAoVgiNW+/eACcagFOw=;
        b=JJByEIlm+ogQxG5R7yng853Wtt3+0CECgHzUOAEOenDqo5vss5/NQ+721lOJNT8QpU
         s8ixNOrFmitHwle6n+BGPA37dEW/SwuWax0vty/Q6FEeYXGzEhRInNJ9z81vV4HSbtfv
         5OUOzZJSsWkRUPP0RdXmz3w8ddr43ERnicOXnSPymKb2YspP4m6EGJt0y5pUd6cCBOGL
         nc3j32OdEdzJeFpOevoezQyyBwKrfCbD8fbPtXCvTsBc5NWuqwNrJdl6WolPTbr68bC7
         XQeVmckTUOuA0a12IjdSBOk0rAGL0FHCRIiZJZcz0W6YmhulZAjt1I80garTrvnWiBVD
         pAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005751; x=1783610551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93jJEijk+8CRJGhoEYZXYhlpQAoVgiNW+/eACcagFOw=;
        b=Mbh2cWqli0fKYjqNldNgFdafcNObhhaSDKPGnoF/S8A3QQCD7vQ/WCAAzSUEbCLqWp
         LVbie7/GpT1EToApSoc6UJClyO8rqRsB4gpO/8YtERzDIza1qLRfF7tk3yduKmikaDtM
         BkVGyWVwVTZp0VdTHXfv/sFy9nKt0VF7OtY1cBZcsYhr1BwGWy5nZVxRnQy4VuFLo3ZX
         B66ZoSsmT8fZBxKASMd10irUGhMl9WqQ3U/iQbIiO4qXsh2vku9XoFeZ172PdCN4kgzy
         PQlySwnY5h+j8Vm8003btWtrW0TghnYZ2DusmNCsATM7iQL4L6nZyL4pog5Z5XKU+dWG
         Z2wg==
X-Gm-Message-State: AOJu0Yyf86I2UNeDjhPJNACSXYjdbk947agQ/4V76IpLD6wJvy9Y8SLZ
	jMDIh73PpllJj9a5xrtULKzx7qUJqRVHHFbHh8aYXgNOPLszdaERtWK/hIqEwMZdvwvMQwstIXo
	stWzxW5LXh3mw
X-Gm-Gg: AfdE7cm6xZshJjh2F86kdxePo0I6wtBI5QiDzwn2YdBcn+PiDJrTSMu6WIAM1OIXYML
	U4lSE57Ts5E5oIEw6xgZfdZ6jhriSyPHHANppUn/S/Ut8wiXpktHuKhyLyYL8JM6mx3g3gDkYyg
	W3LQyBMdBntV5hp1sIY1PDMVc9lsG5RaYidzbG+AKD351Db4jk6qPsSdBaKJFW7IvGMen1Bp3oN
	mDnakXoLxTdFvb4EbMOeyacwktZfN8tCHFJ9C7EofzrwI+OW4o/D5m1nIg2IJUN0V0FSgB8jn4e
	K+LysbXmekKuce8+brzVJg7GXBeuc1SC4bplj1nVoEI1TuHelx21anXLr+LPLCV77Id7BuVmGwW
	rdPANY3VjGwT9v/A2J8qaEjQqbZYfRi8JYsDfOor/sw29n2zDJS6Ctxb/dI5dR5wn1bYPOWWbRe
	uqi7ZVUCEagk+LHfeh
X-Received: by 2002:a05:622a:4c05:b0:517:21c9:a22a with SMTP id d75a77b69052e-51c26b25663mr83083911cf.54.1783005750319;
        Thu, 02 Jul 2026 08:22:30 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c30c165casm16234361cf.17.2026.07.02.08.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:22:29 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 6/6] patchtest: correctly abort --directory test
Date: Thu,  2 Jul 2026 11:22:13 -0400
Message-ID: <20260702152213.1439717-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702152213.1439717-1-tgamblin@baylibre.com>
References: <20260702152213.1439717-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 15:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240064

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
 scripts/patchtest                      | 32 ++++++++++++++++++++++----
 3 files changed, 33 insertions(+), 5 deletions(-)

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
index b5a9bc2a51..17a3cebb48 100755
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
@@ -139,9 +140,6 @@ def _runner(resultklass, prefix=None):
 
 def run(patch, logfile=None):
     """ Load, setup and run pre and post-merge tests """
-    # Get the result class and install the control-c handler
-    unittest.installHandler()
-
     premerge_result = _runner(getResult(patch, False, logfile), 'pretest')
     postmerge_result = _runner(getResult(patch, True, logfile), 'test')
 
@@ -190,10 +188,26 @@ def main():
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
@@ -204,8 +218,18 @@ def main():
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


