Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16496CD5BD1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:33:30 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4337.1779824004817618018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 12:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=FQJ592LP;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-516d65a15f6so46690421cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779824004; x=1780428804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuZq/V4VDEhysWnMGKe/+mPgKXQw1dWcpdid9hcwc/Y=;
        b=FQJ592LP1vHOP28GDRp2aUyqp+as/ISgfFxk4ku3VdX4cZOmZlBxCnlBXPQhOAXa+x
         aHTkXsU30zN0fBj4GQzJqRiuJsTjNl+AVvrAygj8lY011fVEroNkyhPrznttRkT6UydQ
         HwZybOfzKY7bwMUQzH7HfIkbsUTNO8vE53ENiqV2QsGXASjSnh304hy1DiAbh7KdmZpb
         v+PQd1qyUBswOFICCoRTChQ7bCQwoZwbJjrSouxFx0H4Z9p6ewfWnbLhp4Yd7ZY/1uar
         cOiRtiFZxMcMzQh5e9KuUBZqBVkbRifVBz3dSWpNIXiCnJslLwT58g5XZI0amzBBRzOn
         2ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824004; x=1780428804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuZq/V4VDEhysWnMGKe/+mPgKXQw1dWcpdid9hcwc/Y=;
        b=aFk9YToQ+7HiWesiVZKXm7zk5y21UQ9ieBz5XbHuvZp3cSBOEvvogq98V+wPmITsmH
         odJZ8W5UKy4Yvgbflm7brl7Yy4oEemM3e8y78JLtRC/tdWqZpFDcXAC4j7WQ8giZh5TS
         ndwXDv7SAhO7rlEIHmM6SwdnaozBJF1I/CoWgVlYRFjelvGsa5D+Fo1Wky/FQO/VJXvM
         g8lNOQcDYTDod1AKMkaeI2Ae2jyeIGiDgJSONqO6mUoE+DfLIDjwYO+W+EgmzWSFeriS
         OD8SagtRJWgVgEMpix/mbWtKhwggD60kjIPzedvKlvKhr9JoJcNHgn4P1AtKbI4X4ghP
         qJPQ==
X-Gm-Message-State: AOJu0Yx9gHABRoqYQiuwutMpzDKJHg7t5XLPC+ipZ2yqWZbDuJt77YWk
	0EuWXd7pHvGq5s99Fi5jMlB5xKCF8HC/LhJm4/HEO2gfq0IBjZ4F+qOUxGdohzxT+VpJh9kuzA/
	iogh9sVw=
X-Gm-Gg: Acq92OHfMoHtKmnrYAYfaWVOOhr7ld4oPVdpckxq2d5zHw2KTeOG9ln846QTTb9H48B
	CCBENc4Pi9d7EjXCSo7BJKLo5oZTNuYaNjiDJGgkJ/Ze68JqPl4qcnBSXFcIxiHCq6q+Xufzwwx
	VnT/jphR30GexT8QbK1Fm3f2ADzfOpcILegOu2vego86wII1p8CALCkFf4xju8H1kgDPDimdA2U
	FdAB/nwoJirnYGN8dLjRti2LGkcOLg8L+PdW/qhkMyc2rguRZCLiuwKmRGukbe/OhSXhZonJJ2h
	/d/ZypoyFKffeGm1mxqAlEejt+7nfOryVr0BE8lox67UAN4Q7m4A/ETKG11VITQ5vPMNb+gfbYR
	+mrFFCx8/WkaCzAP0i80fy7QsPIGvVzVglpWCuosRPOaUBVLUrq4ZOulDg03s/sgclZ/S5SnvIb
	lKcDL8uVaVCuJosC15WyrU81W+SA==
X-Received: by 2002:a05:622a:a90d:b0:516:6818:6d74 with SMTP id d75a77b69052e-516c5628070mr224617621cf.34.1779824003731;
        Tue, 26 May 2026 12:33:23 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517069ecb93sm30062471cf.4.2026.05.26.12.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:33:22 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 1/6] patchtest: refactor and simplify script
Date: Tue, 26 May 2026 15:33:12 -0400
Message-ID: <20260526193317.807459-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526193317.807459-1-tgamblin@baylibre.com>
References: <20260526193317.807459-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 19:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237619

Remove a variety of unused code blocks and inconsistent formatting, then
simplify the results-generation logic. This includes removing the
'finally:' block which was never actually reached.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 159 ++++++++++++++++++----------------------------
 1 file changed, 62 insertions(+), 97 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 143cf08572..6dbb5adb15 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -12,6 +12,7 @@
 import json
 import logging
 import os
+import subprocess
 import sys
 import traceback
 import unittest
@@ -30,37 +31,50 @@ loggerhandler = logging.StreamHandler()
 loggerhandler.setFormatter(logging.Formatter("%(message)s"))
 logger.addHandler(loggerhandler)
 logger.setLevel(logging.INFO)
-info = logger.info
-error = logger.error
 
-def getResult(patch, mergepatch, logfile=None):
+
+def _format_test_description(test):
+    return (test.id().split('.')[-1]
+            .replace('_', ' ')
+            .replace("cve", "CVE")
+            .replace("signed off by", "Signed-off-by")
+            .replace("upstream status", "Upstream-Status")
+            .replace("non auh", "non-AUH")
+            .replace("presence format", "presence"))
+
+
+def _emit(line, logfile=None):
+    print(line)
+    if logfile:
+        with open(logfile, "a") as f:
+            f.write(line + "\n")
+
+
+def make_result_class(patch, mergepatch, logfile=None):
 
     class PatchTestResult(unittest.TextTestResult):
         """ Patchtest TextTestResult """
         shouldStop  = True
         longMessage = False
 
-        success     = 'PASS'
-        fail        = 'FAIL'
-        skip        = 'SKIP'
+        success = 'PASS'
+        fail    = 'FAIL'
+        skip    = 'SKIP'
 
         def startTestRun(self):
-            # let's create the repo already, it can be used later on
-            repoargs = {
-                "repodir": PatchtestParser.repodir,
-                "commit": PatchtestParser.basecommit,
-                "branch": PatchtestParser.basebranch,
-                "patch": patch,
-            }
-
-            self.repo_error    = False
-            self.test_error    = False
-            self.test_failure  = False
+            self.repo_error   = False
+            self.test_error   = False
+            self.test_failure = False
 
             try:
-                self.repo = PatchtestParser.repo = PatchTestRepo(**repoargs)
-            except:
-                logger.error(traceback.print_exc())
+                self.repo = PatchtestParser.repo = PatchTestRepo(
+                    patch=patch,
+                    repodir=PatchtestParser.repodir,
+                    commit=PatchtestParser.basecommit,
+                    branch=PatchtestParser.basebranch,
+                )
+            except Exception:
+                traceback.print_exc()
                 self.repo_error = True
                 self.stop()
                 return
@@ -70,100 +84,59 @@ def getResult(patch, mergepatch, logfile=None):
 
         def addError(self, test, err):
             self.test_error = True
-            (ty, va, trace) = err
-            logger.error(traceback.print_exc())
+            traceback.print_exc()
 
         def addFailure(self, test, err):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
             self.test_failure = True
-            fail_str = '{}: {}: {} ({})'.format(self.fail,
-            test_description, json.loads(str(err[1]))["issue"],
-            test.id())
-            print(fail_str)
-            if logfile:
-                with open(logfile, "a") as f:
-                    f.write(fail_str + "\n")
+            desc = _format_test_description(test)
+            issue = json.loads(str(err[1]))["issue"]
+            _emit('{}: {}: {} ({})'.format(self.fail, desc, issue, test.id()), logfile)
 
         def addSuccess(self, test):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
-            success_str = '{}: {} ({})'.format(self.success,
-            test_description, test.id())
-            print(success_str)
-            if logfile:
-                with open(logfile, "a") as f:
-                    f.write(success_str + "\n")
+            desc = _format_test_description(test)
+            _emit('{}: {} ({})'.format(self.success, desc, test.id()), logfile)
 
         def addSkip(self, test, reason):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
-            skip_str = '{}: {}: {} ({})'.format(self.skip,
-            test_description, json.loads(str(reason))["issue"],
-            test.id())
-            print(skip_str)
-            if logfile:
-                with open(logfile, "a") as f:
-                    f.write(skip_str + "\n")
+            desc = _format_test_description(test)
+            issue = json.loads(str(reason))["issue"]
+            _emit('{}: {}: {} ({})'.format(self.skip, desc, issue, test.id()), logfile)
 
         def stopTestRun(self):
-
-            # in case there was an error on repo object creation, just return
-            if self.repo_error:
-                return
-
-            self.repo.clean()
+            if not self.repo_error:
+                self.repo.clean()
 
     return PatchTestResult
 
 def _runner(resultklass, prefix=None):
-    # load test with the corresponding prefix
     loader = unittest.TestLoader()
     if prefix:
         loader.testMethodPrefix = prefix
 
-    # create the suite with discovered tests and the corresponding runner
     suite = loader.discover(
         start_dir=PatchtestParser.testdir,
         pattern=PatchtestParser.pattern,
         top_level_dir=PatchtestParser.topdir,
     )
-    ntc = suite.countTestCases()
 
-    # if there are no test cases, just quit
-    if not ntc:
+    if not suite.countTestCases():
         return 2
-    runner = unittest.TextTestRunner(resultclass=resultklass, verbosity=0)
 
+    runner = unittest.TextTestRunner(resultclass=resultklass, verbosity=0)
     try:
         result = runner.run(suite)
-    except:
-        logger.error(traceback.print_exc())
+    except Exception:
+        traceback.print_exc()
         logger.error('patchtest: something went wrong')
         return 1
-    if result.test_failure or result.test_error:
-        return 1 
 
-    return 0
+    return 1 if (result.test_failure or result.test_error) else 0
 
 def run(patch, logfile=None):
     """ Load, setup and run pre and post-merge tests """
-    # Get the result class and install the control-c handler
     unittest.installHandler()
 
-    # run pre-merge tests, meaning those methods with 'pretest' as prefix
-    premerge_resultklass = getResult(patch, False, logfile)
-    premerge_result = _runner(premerge_resultklass, 'pretest')
-
-    # run post-merge tests, meaning those methods with 'test' as prefix
-    postmerge_resultklass = getResult(patch, True, logfile)
-    postmerge_result = _runner(postmerge_resultklass, 'test')
+    premerge_result = _runner(make_result_class(patch, False, logfile), 'pretest')
+    postmerge_result = _runner(make_result_class(patch, True, logfile), 'test')
 
     print_result_message(premerge_result, postmerge_result)
     return premerge_result or postmerge_result
@@ -183,24 +156,23 @@ def print_result_message(preresult, postresult):
     print("----------------------------------------------------------------------\n")
 
 def main():
-    ret = 0
-    tmp_patch = False
     patch_path = PatchtestParser.patch_path
-    log_results = PatchtestParser.log_results
-    log_path = None
-    patch_list = None
 
-    git_status = os.popen("(cd %s && git status)" % PatchtestParser.repodir).read()
+    git_status = subprocess.run(
+        ['git', '-C', PatchtestParser.repodir, 'status'],
+        capture_output=True, text=True,
+    ).stdout
     status_matches = ["Changes not staged for commit", "Changes to be committed"]
-    if any([match in git_status for match in status_matches]):
+    if any(match in git_status for match in status_matches):
         logger.error("patchtest: there are uncommitted changes in the target repo that would be overwritten. Please commit or restore them before running patchtest")
         return 1
 
     if os.path.isdir(patch_path):
-        patch_list = [os.path.join(patch_path, filename) for filename in sorted(os.listdir(patch_path))]
+        patch_list = [os.path.join(patch_path, f) for f in sorted(os.listdir(patch_path))]
     else:
         patch_list = [patch_path]
 
+    ret = 0
     for patch in patch_list:
         if os.path.getsize(patch) == 0:
             logger.error('patchtest: patch is empty')
@@ -208,19 +180,13 @@ def main():
 
         logger.info('Testing patch %s' % patch)
 
-        if log_results:
+        log_path = None
+        if PatchtestParser.log_results:
             log_path = patch + ".testresult"
             with open(log_path, "a") as f:
                 f.write("Patchtest results for patch '%s':\n\n" % patch)
 
-        try:
-            if log_path:
-                ret = run(patch, log_path)
-            else:
-                ret = run(patch)
-        finally:
-            if tmp_patch:
-                os.remove(patch)
+        ret = run(patch, log_path)
 
     return ret
 
@@ -241,7 +207,6 @@ if __name__ == '__main__':
     try:
         ret = main()
     except Exception:
-        import traceback
         traceback.print_exc(5)
 
     sys.exit(ret)
-- 
2.54.0


