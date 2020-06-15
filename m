Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.26708.1592249802501077207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZDRcK87r;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id v24so7209705plo.6
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zyJUlbzbQ1iYD4M1DsUQ9eyyEQqaaZ2oYwtvAJ233Uc=;
        b=ZDRcK87r4Y3nHXYzWLPw1vxCnC0hwcI/uhstKPhs5QESb/dnWrmVX4VvVnL6/eyWml
         H6x5lxFhkMhJ5cAg6AMfRZK0fnw0H7lVrK+S3Db1yUACilFcGj3C5n6DAItOk1vTtIN6
         XrGB7fbWxUf7CaSOq8G1SjLvhFl5WQNLoNtP7iM+TRqkVEwJUzSEoV6aQGVj9FVud0dD
         JX4YyXalc8Ge7RYbS5/fDupcPDKdEocqIMU8vQdAm9dldOPa18xKyaoscSWd5fbnzXne
         bN4tAznSh+piV/tiQewGd7R3v0DudIfbQWXCA5zako2ZeW5imyNxCgbrICAc1lLAFzQj
         3f3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zyJUlbzbQ1iYD4M1DsUQ9eyyEQqaaZ2oYwtvAJ233Uc=;
        b=oAOmhfzg/5iU+aplS+lvy8By6h/sHoEeUgjRCaBqvIPYaR25hTBQnbPu/bYxECYbDV
         PK44vlbsM9jeLrmr072M+qI7XQP6cjKrfYC8bxjoGOwP/wDM+3H3jyi20e1usbxpv/vT
         weDeFY9WWMNkrydF7YZXUINE1rhpJTfpr10PIXd3yLCybt1iscNpI9ysm6Rc7igyImM2
         v5vnG8XQCjfDmWHW8qX3vQUYOS+7Q+sD8vH177CQZJ0QHg9FJKuVivaABQAA4JXOfLXJ
         YqmTmfqOHFtfp+ZgxIzkdXlFq22pHHkEAFnGbiZowyDXgGdYtf7KUOXpQgKyZCekkcbt
         U0wg==
X-Gm-Message-State: AOAM533b8SKfzTTGdXcp7YWbl8FnVbdgFZH3K9zHdv15OTolLxEihq2G
	8FF72cj1lWqiRBWL+O04px3LjYctlyI=
X-Google-Smtp-Source: ABdhPJzg2Fqac49BmquEkWRSvFTrTul0yNH6Mbd5TJ8aJ9pe9LTHSjCVW5QTKk3guV7w2py4fN0vAQ==
X-Received: by 2002:a17:90a:888:: with SMTP id v8mr756305pjc.95.1592249801517;
        Mon, 15 Jun 2020 12:36:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/21] oe-selftest: Recursively patch test case paths
Date: Mon, 15 Jun 2020 09:35:35 -1000
Message-Id: <a28f369ce0a04939cf9d98d6002b5351c0b9ea51.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Paul Barker <pbarker@konsulko.com>

This ensures that builddir is updated correctly to point to the new
selftest build directory when we're given a list of test suites instead
of a list of test cases.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56e211d0f3c6cb84f5982e5de00faeeed69c1912)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 17f2a0cf6b..ba13732253 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -10,6 +10,7 @@ import glob
 import sys
 import importlib
 import subprocess
+import unittest
 from random import choice
 
 import oeqa
@@ -60,9 +61,9 @@ class OESelftestTestContext(OETestContext):
 
         os.chdir(newbuilddir)
 
-        for t in suite:
+        def patch_test(t):
             if not hasattr(t, "tc"):
-                continue
+                return
             cp = t.tc.config_paths
             for p in cp:
                 if selftestdir in cp[p] and newselftestdir not in cp[p]:
@@ -70,6 +71,15 @@ class OESelftestTestContext(OETestContext):
                 if builddir in cp[p] and newbuilddir not in cp[p]:
                     cp[p] = cp[p].replace(builddir, newbuilddir)
 
+        def patch_suite(s):
+            for x in s:
+                if isinstance(x, unittest.TestSuite):
+                    patch_suite(x)
+                else:
+                    patch_test(x)
+
+        patch_suite(suite)
+
         return (builddir, newbuilddir)
 
     def prepareSuite(self, suites, processes):
-- 
2.17.1

