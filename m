Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B82C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:00:50 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web11.91119.1738598448709850962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmrnW3GXFzRsf;
	Mon,  3 Feb 2025 17:00:47 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmrnW0gXhzlBd;
	Mon,  3 Feb 2025 17:00:47 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 03 Feb 2025 17:00:33 +0100
Subject: [PATCH RFC 5/6] patchtest: allow malformed Mbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-patchtest-v1-5-ef6ee5fcdd78@cherry.de>
References: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
In-Reply-To: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
 openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210664

From: Quentin Schulz <quentin.schulz@cherry.de>

b4 strips the "From " field from the Mbox before sending it to stdin for
consumption, see
https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/__init__.py?h=stable-0.14.y#n3494

The issue is that patchtest Mbox parsing expects this field to know when
a patch starts and finishes.

Considering that we know only one patch will be sent over stdin (well,
not necessarily but we make the assumption here) then we allow this
malformed Mbox when this way of passing the patch is used.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/lib/patchtest/mbox.py |  9 +++++----
 meta/lib/patchtest/repo.py |  4 ++--
 scripts/patchtest          | 17 +++++++++++------
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/meta/lib/patchtest/mbox.py b/meta/lib/patchtest/mbox.py
index 1d95819b7aee5daa879eac0710827b45b2acfec3..640e74001490ba6a6234da4acf1b13094c280d37 100644
--- a/meta/lib/patchtest/mbox.py
+++ b/meta/lib/patchtest/mbox.py
@@ -15,9 +15,10 @@ import re
 
 # From: https://stackoverflow.com/questions/59681461/read-a-big-mbox-file-with-python
 class MboxReader:
-    def __init__(self, filepath):
+    def __init__(self, filepath, allow_malformed=False):
         self.handle = open(filepath, 'rb')
-        assert self.handle.readline().startswith(b'From ')
+        if not allow_malformed:
+            assert self.handle.readline().startswith(b'From ')
 
     def __enter__(self):
         return self
@@ -51,8 +52,8 @@ class Patch:
         self.diff = self.split_body[1]
 
 class PatchSeries:
-    def __init__(self, filepath):
-        with MboxReader(filepath) as mbox:
+    def __init__(self, filepath, allow_malformed=False):
+        with MboxReader(filepath, allow_malformed=allow_malformed) as mbox:
             self.patches = [Patch(message) for message in mbox]
 
         assert self.patches
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 8ec8f68a0bc61fc3b52b5d965663fa3bcfc0a684..9df50ef65f6a2fabc5ff7c5c06252ff44b2e6e9b 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -17,10 +17,10 @@ class PatchTestRepo(object):
     # prefixes used for temporal branches/stashes
     prefix = 'patchtest'
 
-    def __init__(self, patch, repodir, commit=None, branch=None):
+    def __init__(self, patch, repodir, commit=None, branch=None, allow_malformed=False):
         self.repodir = repodir
         self.repo = git.Repo.init(repodir)
-        self.patch = mbox.PatchSeries(patch)
+        self.patch = mbox.PatchSeries(patch, allow_malformed=allow_malformed)
         self.current_branch = self.repo.active_branch.name
 
         # targeted branch defined on the patch may be invalid, so make sure there
diff --git a/scripts/patchtest b/scripts/patchtest
index 82ce665c1a5c950dfaf02cda9ed70b935a9bfe25..2b0bda88cabec3812499f88bb3c4b68d7352bff0 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -33,7 +33,7 @@ logger.setLevel(logging.INFO)
 info = logger.info
 error = logger.error
 
-def getResult(patch, mergepatch, logfile=None):
+def getResult(patch, mergepatch, logfile=None, allow_malformed=False):
 
     class PatchTestResult(unittest.TextTestResult):
         """ Patchtest TextTestResult """
@@ -51,6 +51,7 @@ def getResult(patch, mergepatch, logfile=None):
                 "commit": PatchtestParser.basecommit,
                 "branch": PatchtestParser.basebranch,
                 "patch": patch,
+                "allow_malformed": allow_malformed,
             }
 
             self.repo_error    = False
@@ -152,17 +153,17 @@ def _runner(resultklass, prefix=None):
 
     return 0
 
-def run(patch, logfile=None):
+def run(patch, logfile=None, allow_malformed=False):
     """ Load, setup and run pre and post-merge tests """
     # Get the result class and install the control-c handler
     unittest.installHandler()
 
     # run pre-merge tests, meaning those methods with 'pretest' as prefix
-    premerge_resultklass = getResult(patch, False, logfile)
+    premerge_resultklass = getResult(patch, False, logfile, allow_malformed)
     premerge_result = _runner(premerge_resultklass, 'pretest')
 
     # run post-merge tests, meaning those methods with 'test' as prefix
-    postmerge_resultklass = getResult(patch, True, logfile)
+    postmerge_resultklass = getResult(patch, True, logfile, allow_malformed)
     postmerge_result = _runner(postmerge_resultklass, 'test')
 
     if not PatchtestParser.no_summary:
@@ -207,6 +208,7 @@ def main():
         patch_list = [patch_path]
 
     for patch in patch_list:
+        allow_malformed = False
         if patch == "-":
             import tempfile
 
@@ -216,6 +218,9 @@ def main():
             logger.info('Testing patch from stdin')
             tmp_patch = True
             patch = patch.name
+            # b4 strips the "From ", c.f.
+            # https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/__init__.py?h=stable-0.14.y#n3494
+            allow_malformed = True
         elif os.path.getsize(patch) == 0:
             logger.error('patchtest: patch is empty')
             return 1
@@ -229,9 +234,9 @@ def main():
 
         try:
             if log_path:
-                run(patch, log_path)
+                run(patch, log_path, allow_malformed=allow_malformed)
             else:
-                run(patch)
+                run(patch, allow_malformed=allow_malformed)
         finally:
             if tmp_patch:
                 os.remove(patch)

-- 
2.48.1


