Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.27009.1610326007317084871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RPBrEShj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 15so11524288pgx.7
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=G2xKOUKSpHB9Chq4JkIpfraR0iCOXKJNge52hOX9VCI=;
        b=RPBrEShjE9RCiT4jEK+EZDqXLo0NFc/3UILUwMzF8sBBLQJ7CJn3kOuQSR6S0ADUyi
         NCLun2ylizYkS/EpuVUZANBQruj+jQ7Bpt9kQ1odxYXdEXXf6GdGfoPGrbocMNPoKGgf
         8QKyIe/jtEMi6BlZ9QCUkf5rkFsBE3Hjt6f4GnoS1xQbuKi6/kAqtNJ1qVFpfwlIgAJg
         1sC/j3dMkLRqEKNChCPpLhoA1UUEW0A1BE3ot2jRqM7/cnnhG+O4nQ71zkt9mAtGqVYc
         oegm6of0Nex8PNf9/t9RUL1ryBWpA6IdihOFRkYF4mp5z5+Q9ovDuEpV1//MGIymDi3m
         0XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=G2xKOUKSpHB9Chq4JkIpfraR0iCOXKJNge52hOX9VCI=;
        b=oIgXau9Erabrg0r/7dECd4+MzAAZRmASg9ZcFM9xDN+Q8dgzejI1Tp+zHGSe31J+I6
         YYXGssUbuc0r5fmpLfWigxW41w32SDnw3uApQhgnvsHgBl9ze3uMFoPl0cldBt1/roo3
         CMVrkqF9F7WOgtRNT7H40aztLlxtJ7+H7dWyu0os1CbcQikhZBwlz/XlYhNJT8olrfZi
         xS99rhsU33v/kqLDMDHIuXoHCAUC/msFGjtP5fwMKAu111Qs+XwwpB7oJvkHjQA5T4gG
         ByOPoHq3m+YoyyFKHp3qCChhx3JHoWFGlJtxcgkzaSnQvP0atZJc3iPAWnddRg94cyBX
         z3ag==
X-Gm-Message-State: AOAM530p/jYjEgF/H4OyQQX85NvnvLexjXpK5nxO/hOmu1o/bZ/hS5yC
	5TUm9bPSgitkwwDPHEPywqyTNfZ05qpCvudy7xk=
X-Google-Smtp-Source: ABdhPJxoUR8vgbWG9HhixDb1NeH6Dp+jjyrtjGvmadyX+oUEi8ENcMbiIwQbB8Xebefnk/EGER4kRA==
X-Received: by 2002:aa7:8a99:0:b029:1a6:c8b8:1414 with SMTP id a25-20020aa78a990000b02901a6c8b81414mr13753097pfc.66.1610326006475;
        Sun, 10 Jan 2021 16:46:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:45 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] selftest: Add argument to keep build dir
Date: Sun, 10 Jan 2021 14:45:52 -1000
Message-Id: <51fa76c699517ad63f8d6c4db4b6938d894f5c6c.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Paul Barker <pbarker@konsulko.com>

The oe-selftest code already keeps the selftest build directory in place
if any tests failed. By default the build directory is deleted if all
tests pass but there may be cases where it's desirable to keep this
directory around, for example to compare intermediate files between
passing and failing test runs.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67aa7069dbe8f5f5f186eb67708ece5c4bd42976)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 33557b1240..be3ec6401f 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -34,7 +34,7 @@ class NonConcurrentTestSuite(unittest.TestSuite):
         (builddir, newbuilddir) = self.setupfunc("-st", None, self.suite)
         ret = super().run(result)
         os.chdir(builddir)
-        if newbuilddir and ret.wasSuccessful():
+        if newbuilddir and ret.wasSuccessful() and self.removefunc:
             self.removefunc(newbuilddir)
 
 def removebuilddir(d):
@@ -54,7 +54,7 @@ def removebuilddir(d):
     bb.utils.prunedir(d, ionice=True)
 
 class OESelftestTestContext(OETestContext):
-    def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None):
+    def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None, keep_builddir=None):
         super(OESelftestTestContext, self).__init__(td, logger)
 
         self.machines = machines
@@ -62,6 +62,11 @@ class OESelftestTestContext(OETestContext):
         self.config_paths = config_paths
         self.newbuilddir = newbuilddir
 
+        if keep_builddir:
+            self.removebuilddir = None
+        else:
+            self.removebuilddir = removebuilddir
+
     def setup_builddir(self, suffix, selftestdir, suite):
         builddir = os.environ['BUILDDIR']
         if not selftestdir:
@@ -119,9 +124,9 @@ class OESelftestTestContext(OETestContext):
         if processes:
             from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
 
-            return ConcurrentTestSuite(suites, processes, self.setup_builddir, removebuilddir)
+            return ConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir)
         else:
-            return NonConcurrentTestSuite(suites, processes, self.setup_builddir, removebuilddir)
+            return NonConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir)
 
     def runTests(self, processes=None, machine=None, skips=[]):
         if machine:
@@ -179,6 +184,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 action='append', default=None,
                 help='Exclude all (unhidden) tests that match any of the specified tag(s). (exclude applies before select)')
 
+        parser.add_argument('-K', '--keep-builddir', action='store_true',
+                help='Keep the test build directory even if all tests pass')
+
         parser.add_argument('-B', '--newbuilddir', help='New build directory to use for tests.')
         parser.set_defaults(func=self.run)
 
@@ -235,6 +243,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc_kwargs['init']['config_paths']['localconf'] = os.path.join(builddir, "conf/local.conf")
         self.tc_kwargs['init']['config_paths']['bblayers'] = os.path.join(builddir, "conf/bblayers.conf")
         self.tc_kwargs['init']['newbuilddir'] = args.newbuilddir
+        self.tc_kwargs['init']['keep_builddir'] = args.keep_builddir
 
         def tag_filter(tags):
             if args.exclude_tags:
-- 
2.17.1

