Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816FCCD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:17 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19885.1778787733082468346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=KQmRdOp2;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8b98482b253so111529956d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787732; x=1779392532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVoUZiRJ0gsx1vHCooFoI5IwMpQUoj/9ia9BAu/KPBs=;
        b=KQmRdOp2WEf1ImoPL4cIvySsV5jv115MXfFpNn00UJjK7j3L1JK5g+IVAWshsB0BJk
         X1Xa3VprrAgSM4Rdzj0ev3PSkmyttQKDER/t5Dm9fSHQEL0jLGlLLss/mN5CC8rGQOp1
         7kWzcwYXxGkLgxgH6TRKOqTVwZCa24O4+c0bOKOPa2X1wpcTF46YtxBHtoTv29wI9O+W
         +NMgQMTgBFhL+41jVTPEe/ALQoY7Vr0zDvjYH0D4crRcxvfgfkhLGTNJN0NO6oY7ZV7w
         HWOMVf+k5XNp6aJUizAa8sOpchXpO91RTyXtEJEcIZjEERjvAGyEPFiRULx7tKEytPDM
         NLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787732; x=1779392532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oVoUZiRJ0gsx1vHCooFoI5IwMpQUoj/9ia9BAu/KPBs=;
        b=qSA18j2q+KshlEnrN85EtDXMiu+UdpxkwyLtD7DJa5C7lASN5eLv7k5PKHkHkzDY9B
         nuVHMmTod+pokSWENDTKCvQYBkA5qMogn7IjxlOXZlbj9kvt5KdnuM0aq8jKeJPtKJTJ
         wR7AET967+TxGr5A7HfGpUt3/apAebMrVTcyIUObXUXun6+yIzLqPyi9Hmi7KCh8UuGZ
         cRhZ7e/emFdptimp7/HiNMO+xOz+fFYXxJt263e9x4J7pP+VpTEf0D/jClf1OYLDPbKV
         3Xoaieu4frVv0v24ZGdKWcHIvEl9HObtgytn/k5xrxbFPHWh1RCEGxesEthd/0gPnGED
         hKVg==
X-Gm-Message-State: AOJu0YxcnAws940L4qYSRnkJo8hgrsGTDTvvbKwpeIgWos4aGBmqdcka
	9u0RIEh/PYLeavwam5mgIiyiltcB3PJcPye1EFB8RQ/ZU+EVNAL1AcF+GvoCR1du/chEgkcWx7V
	pIJdscwM=
X-Gm-Gg: Acq92OG8jfQduGi3majFF41Tn084lX9XvsFLOiwjPBkdCNmSShleAkyOJtZG3xME/Av
	i1iHPrAu5NSZQyokjLryKbTX2qFSz24aaGgqZ4tLeHa/lfuVfY9Mv2x512AadotcT/D9Qc7ii6A
	q7Osm92J3P+vSEm2O3M2/faFrB5+c+P9vRg5S678Oy/Ctinx7Pqf2bwiVa/VYwt6TqzKYEL185M
	ytIjAuz+C1j6yg8Oeg4SiRWM5s9qZoskDwNiligQtgcuEe/FptS0QTnNOkMk+dq4fAp4zpOKNcT
	AinmRavUc+V5qjvizYHal2YUa0n75YzbYHpLtazJDxJuCUT+bwIDTb0/tH8XoKVsi/Nh5QU6D5s
	gcp/qFtXHGGGrJPs74nMdf8KIcevVUzMlx0CNEbl32yX2hDCKQPUtNIsoSyT9WRnC3XKCOc7Cl9
	nhlQlqOUsKykhnAy7XGeh1hUMYTA==
X-Received: by 2002:a05:6214:398a:b0:8ac:ae56:b493 with SMTP id 6a1803df08f44-8ca0f6c434dmr16292186d6.40.1778787731840;
        Thu, 14 May 2026 12:42:11 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908f0601asm33511106d6.17.2026.05.14.12.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:11 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 01/11] patchtest: check for meta-selftest, cleanup script
Date: Thu, 14 May 2026 15:41:57 -0400
Message-ID: <20260514194207.1958325-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237048

- Stop immediately and print a warning if meta-selftest isn't in
  bblayers.conf:
  |patchtest: meta-selftest layer not found in /home/tgamblin/workspace/yocto/openembedded-core/build/conf/bblayers.conf - add it to BBLAYERS before running patchtest
- Remove a variety of unused code blocks and inconsistent formatting,
  then simplify the results-generation logic. This includes removing the
  'finally:' block which was never actually reached.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 170 ++++++++++++++++++++--------------------------
 1 file changed, 73 insertions(+), 97 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 143cf08572..e8ace03905 100755
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
@@ -183,24 +156,34 @@ def print_result_message(preresult, postresult):
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
 
+    builddir = os.environ.get('BUILDDIR')
+    if builddir:
+        bblayers_conf = os.path.join(builddir, 'conf', 'bblayers.conf')
+        if os.path.exists(bblayers_conf):
+            with open(bblayers_conf) as f:
+                if 'meta-selftest' not in f.read():
+                    logger.error(
+                        "patchtest: meta-selftest layer not found in %s - add it to BBLAYERS before running patchtest" % bblayers_conf
+                    )
+                    return 1
+
     if os.path.isdir(patch_path):
-        patch_list = [os.path.join(patch_path, filename) for filename in sorted(os.listdir(patch_path))]
+        patch_list = [os.path.join(patch_path, f) for f in sorted(os.listdir(patch_path))]
     else:
         patch_list = [patch_path]
 
+    ret = 0
     for patch in patch_list:
         if os.path.getsize(patch) == 0:
             logger.error('patchtest: patch is empty')
@@ -208,19 +191,13 @@ def main():
 
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
 
@@ -241,7 +218,6 @@ if __name__ == '__main__':
     try:
         ret = main()
     except Exception:
-        import traceback
         traceback.print_exc(5)
 
     sys.exit(ret)
-- 
2.54.0


