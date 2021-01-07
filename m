Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.9330.1610031413236684990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 06:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=khMOIcxh;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id r7so5915944wrc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 06:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W5iaL14XSOpQXx2IXnI+BgdmMV1eBMSMjDmiROngPLw=;
        b=khMOIcxhKXsoHxB4gNADAK0GnbVLUYcgS3BkF3CRVfLBvcfQ5cNmoA/HfNA2KmmoVD
         5NYCvxSfMAJZgGWG0D2o9GxqXBiACiZZkLBg3Py2lSge1MWfAa/t9kodTa0x8D8TpIU7
         Ejzylvt40JsBUEqKhKT9yry9NT1mih17iJibo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W5iaL14XSOpQXx2IXnI+BgdmMV1eBMSMjDmiROngPLw=;
        b=KxefBuXD/n4YViyFajR6rtRIGPimRO8C1KyImIR72E2reqYxQB2t+4oukGER/uuHkP
         0GEn77l+js1/Ty++YvJZPAg3fZ8zORo2qWU6N6hsugdRaUYe9Dj96HRGOFL2T5rmeqL9
         goSxUNu5NClzXi1GIq9i1KWpcQci6ncZNoPL+2Tc9Gsqo197QXugCN8MGM4BxBfeYtxR
         7JvTtlowA2qi9JhI47i+a7sMSTODrpC9jVozw52j4/vc//XZfW35XDm1u9rekyD1H3Am
         7SoWHoY1HOm93xD8d8SAOhLxtSJpQ6p8THfuBwLeuN5n2WzTaJx4cNML0szRitH5CimL
         M5rg==
X-Gm-Message-State: AOAM530mgoIerrpFtGiXzUBdnr5a5xvmbmTv5j/QNjp7EmYk7u/okWV3
	y9WUuCQugHLjvowaMqwOj3F6SjmeECQQRA==
X-Google-Smtp-Source: ABdhPJxOA/9hrWqHXu24EMk9xIgPfFgykGWC4tV5g6eT6GoxT9sYZY5leAjCRjkbFZJ+YXjgk13Fzg==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr9331031wrj.325.1610031411349;
        Thu, 07 Jan 2021 06:56:51 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id l1sm8680278wrq.64.2021.01.07.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 06:56:50 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] selftest: Add argument to keep build dir
Date: Thu,  7 Jan 2021 14:56:12 +0000
Message-Id: <20210107145612.23665-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The oe-selftest code already keeps the selftest build directory in place
if any tests failed. By default the build directory is deleted if all
tests pass but there may be cases where it's desirable to keep this
directory around, for example to compare intermediate files between
passing and failing test runs.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/lib/oeqa/selftest/context.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index dd3609c1d6..1659926975 100644
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
         parser.add_argument('-v', '--verbose', action='store_true')
         parser.set_defaults(func=self.run)
@@ -236,6 +244,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc_kwargs['init']['config_paths']['localconf'] = os.path.join(builddir, "conf/local.conf")
         self.tc_kwargs['init']['config_paths']['bblayers'] = os.path.join(builddir, "conf/bblayers.conf")
         self.tc_kwargs['init']['newbuilddir'] = args.newbuilddir
+        self.tc_kwargs['init']['keep_builddir'] = args.keep_builddir
 
         def tag_filter(tags):
             if args.exclude_tags:
-- 
2.26.2

