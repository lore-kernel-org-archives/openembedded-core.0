Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78896E7D0B3
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 22:37:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9341.1695335832422335610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 15:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=awlXpsrl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40528376459so15453165e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695335830; x=1695940630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwYJZcT4uvCKqjNspD3guplMdhd3aW41K5/RiGXcHJM=;
        b=awlXpsrlH5IVqZvhpDFjoY2KE9tAtsmAxiVdcoiVssboTtleVguIc8/VhjKcq1BUty
         r0L5zb3UiI3xVS0T1/IwJAsLVO4+toY9MM93ibNVmjJYbL1jmzzCqlTKySJ6Uyu1LvmW
         jIT5SAULxQcN8VD38EzCmSOp3Y6s9UCT2EL9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695335830; x=1695940630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwYJZcT4uvCKqjNspD3guplMdhd3aW41K5/RiGXcHJM=;
        b=O3+OM1N3iB2/7Yf+XQ+wtfGhPEM2wIJEQlHvISTgzUUOs4mO8iFWafBC1U9rcDf/om
         ts374B2Znfn7cveJ1ujox64Ls88ZdpZ43navBRRwX8jb33JrkS+sGGugI1wLg2XQfCmQ
         tAGC5bpr4zAteCGmbbPpFJO7M+pDk9ILR6xgUpG5tGHtzRcsj1hpaYtabcdWG8SfxhxK
         Mz6Rf2I0fo/+iuZaUoM4jOJeUSnfJ5i1QaZTMI0vNQoAK3C/Dtw7Nb8H3+1vs0AJ/p9m
         aCu0ZWnqMhJB0U6xAWNa4O1+txLdflKC72OoyzwJSM6N5tzmQkW71y0K9P+idlZUyIrX
         YfNg==
X-Gm-Message-State: AOJu0YyNNc0F+b0K86fXXIB0DDs4pLmevVJJ7/EFOQAURZJDsGDnOr36
	33enL+9weHafDIRw6/vpXOTsbOlN5QEANMzR8lE=
X-Google-Smtp-Source: AGHT+IFjELoSjLbCgW/kvM4EHgA1X/aQ8LCjV5M3nGLDJYZzn+oDxWl9R0lW8nqsFRiSYTlrWEx53Q==
X-Received: by 2002:a05:600c:850e:b0:405:3a14:aa1a with SMTP id gw14-20020a05600c850e00b004053a14aa1amr1476467wmb.18.1695335830525;
        Thu, 21 Sep 2023 15:37:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c05cb00b003fc06169ab3sm947410wmd.20.2023.09.21.15.37.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 15:37:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] oeqa: Streamline oe-selftest startup time
Date: Thu, 21 Sep 2023 23:37:06 +0100
Message-Id: <20230921223708.1333390-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
References: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 22:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188031

"bitbake -e" executions from get_bb_var calls are slow and slow down oe-selftest
startup. Rationalise the code to avoid them and minimise the number of "parsing"
locations we use by caching key variables and passing them around more.

This was particularly problematic with oe-selftest -j usage since it would
have multiple bitbake -e executions per process making parallel usage
particularly slow.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py |  5 +--
 meta/lib/oeqa/selftest/context.py           | 35 ++++++++++++---------
 meta/lib/oeqa/utils/commands.py             |  6 ++--
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 4f77589b005..5e20b0e1266 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -193,11 +193,12 @@ class dummybuf(object):
 #
 class ConcurrentTestSuite(unittest.TestSuite):
 
-    def __init__(self, suite, processes, setupfunc, removefunc):
+    def __init__(self, suite, processes, setupfunc, removefunc, bb_vars):
         super(ConcurrentTestSuite, self).__init__([suite])
         self.processes = processes
         self.setupfunc = setupfunc
         self.removefunc = removefunc
+        self.bb_vars = bb_vars
 
     def run(self, result):
         testservers, totaltests = fork_for_tests(self.processes, self)
@@ -243,7 +244,7 @@ class ConcurrentTestSuite(unittest.TestSuite):
 def fork_for_tests(concurrency_num, suite):
     testservers = []
     if 'BUILDDIR' in os.environ:
-        selftestdir = get_test_layer()
+        selftestdir = get_test_layer(suite.bb_vars['BBLAYERS'])
 
     test_blocks = partition_tests(suite, concurrency_num)
     # Clear the tests from the original suite so it doesn't keep them alive
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 16486e7eb99..5a09aeedffe 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -35,12 +35,13 @@ def get_oeselftest_metadata(args):
     return result
 
 class NonConcurrentTestSuite(unittest.TestSuite):
-    def __init__(self, suite, processes, setupfunc, removefunc):
+    def __init__(self, suite, processes, setupfunc, removefunc, bb_vars):
         super().__init__([suite])
         self.processes = processes
         self.suite = suite
         self.setupfunc = setupfunc
         self.removefunc = removefunc
+        self.bb_vars = bb_vars
 
     def run(self, result):
         (builddir, newbuilddir) = self.setupfunc("-st", None, self.suite)
@@ -79,16 +80,15 @@ class OESelftestTestContext(OETestContext):
         else:
             self.removebuilddir = removebuilddir
 
+    def set_variables(self, vars):
+        self.bb_vars = vars
+
     def setup_builddir(self, suffix, selftestdir, suite):
-        # Get SSTATE_DIR from the parent build dir
-        with bb.tinfoil.Tinfoil(tracking=True) as tinfoil:
-            tinfoil.prepare(quiet=2, config_only=True)
-            d = tinfoil.config_data
-            sstatedir = str(d.getVar('SSTATE_DIR'))
+        sstatedir = self.bb_vars['SSTATE_DIR']
 
         builddir = os.environ['BUILDDIR']
         if not selftestdir:
-            selftestdir = get_test_layer()
+            selftestdir = get_test_layer(self.bb_vars['BBLAYERS'])
         if self.newbuilddir:
             newbuilddir = os.path.join(self.newbuilddir, 'build' + suffix)
         else:
@@ -155,9 +155,9 @@ class OESelftestTestContext(OETestContext):
         if processes:
             from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
 
-            return ConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir)
+            return ConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir, self.bb_vars)
         else:
-            return NonConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir)
+            return NonConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir, self.bb_vars)
 
     def runTests(self, processes=None, machine=None, skips=[]):
         if machine:
@@ -270,7 +270,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         builddir = os.environ.get("BUILDDIR")
         self.tc_kwargs['init']['config_paths'] = {}
-        self.tc_kwargs['init']['config_paths']['testlayer_path'] = get_test_layer()
+        self.tc_kwargs['init']['config_paths']['testlayer_path'] = get_test_layer(bbvars["BBLAYERS"])
         self.tc_kwargs['init']['config_paths']['builddir'] = builddir
         self.tc_kwargs['init']['config_paths']['localconf'] = os.path.join(builddir, "conf/local.conf")
         self.tc_kwargs['init']['config_paths']['bblayers'] = os.path.join(builddir, "conf/bblayers.conf")
@@ -310,10 +310,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 meta_selftestdir = os.path.join(
                     self.tc.td["BBLAYERS_FETCH_DIR"], 'meta-selftest')
                 if os.path.isdir(meta_selftestdir):
-                    runCmd("bitbake-layers add-layer %s" %meta_selftestdir)
+                    runCmd("bitbake-layers add-layer %s" % meta_selftestdir)
                     # reload data is needed because a meta-selftest layer was add
                     self.tc.td = get_bb_vars()
-                    self.tc.config_paths['testlayer_path'] = get_test_layer()
+                    self.tc.config_paths['testlayer_path'] = get_test_layer(self.tc.td["BBLAYERS"])
                 else:
                     self.tc.logger.error("could not locate meta-selftest in:\n%s" % meta_selftestdir)
                     raise OEQAPreRun
@@ -351,8 +351,15 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         _add_layer_libs()
 
-        self.tc.logger.info("Running bitbake -e to test the configuration is valid/parsable")
-        runCmd("bitbake -e")
+        self.tc.logger.info("Checking base configuration is valid/parsable")
+
+        with bb.tinfoil.Tinfoil(tracking=True) as tinfoil:
+            tinfoil.prepare(quiet=2, config_only=True)
+            d = tinfoil.config_data
+            vars = {}
+            vars['SSTATE_DIR'] = str(d.getVar('SSTATE_DIR'))
+            vars['BBLAYERS'] = str(d.getVar('BBLAYERS'))
+        self.tc.set_variables(vars)
 
     def get_json_result_dir(self, args):
         json_result_dir = os.path.join(self.tc.td["LOG_DIR"], 'oeqa')
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index c1f533802e2..575e3800175 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -285,8 +285,10 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
 def get_bb_var(var, target=None, postconfig=None):
     return get_bb_vars([var], target, postconfig)[var]
 
-def get_test_layer():
-    layers = get_bb_var("BBLAYERS").split()
+def get_test_layer(bblayers=None):
+    if bblayers is None:
+        bblayers = get_bb_var("BBLAYERS")
+    layers = bblayers.split()
     testlayer = None
     for l in layers:
         if '~' in l:
-- 
2.39.2


