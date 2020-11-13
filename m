Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.5307.1605279189921451417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VXv6Vzzf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id t21so932202pgl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zN9xHXil4XRfcAf91BuzdxIf9mAgCdPsLK5blvCLkGc=;
        b=VXv6Vzzfnt95msUO+ScKyNCLigqI13IgDBkt0BRt6N4UxuoJzPtPK9gK4Rwazzy2h9
         fHYEIgql28Fe60D77SefV+rztCoMW6NDjyS11H2k+cIJosvZlQ3HRGvuQllxsfz77Qfi
         HKhrh9oCzvcqUpc5UO02I9uJn+ceggNbU0I6M6+Pl5+Yq3TKGXxKTxsg/7mH8jHAH3Sb
         yVSB8GMqSE/AsNLhc0vZW3ipD9O0TgbgtnhGTA/rr7LcN5Ddt/2sdr9H6Tu/aBB9G4Zv
         jZngli48q9vzKH7XqIapSx8ObEEfsPgxMue7xTraiHTYHwgJe0zmyFq1SVqH8wOOsios
         mSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zN9xHXil4XRfcAf91BuzdxIf9mAgCdPsLK5blvCLkGc=;
        b=rSpqCaWdOi1VnKQOJLMAwnfbHmNDhplVV21V+XR21Y6pq6sD918jVOGqhvMU/X97JI
         idv2BHvO4JXTbvJfWGPvWAdMnH+rZfP8C2l70gB9DwJYCSUIDHLRmm8qWK/vPwxVIQJ/
         LOaX8qRdsr91bCdmkYCZ2b1PNkID2/L6l9lA/5UjF6UUX0w4xltTesAI//1IQd+FqX1t
         B+e2upF2kb/1E9Tr9bsl9ycLHatVOoOybpYt837507fx92TsU0SfhuVK+No/xl/iEGct
         8q+B4+kRFW9hWd55tQM4YVs2b7y5zCXUYnlFoyOsUilpHnx0r4EiUyTeXPp1xkZ3JEiw
         DPwA==
X-Gm-Message-State: AOAM533itGJ5VQ5QSgbb9jagz1laREkpnTkxxnx38qrL6QxC9iBScE7o
	tSIgyDpGusri5RbWy4xRSEPoRGOhy2NY7c5B
X-Google-Smtp-Source: ABdhPJzz5o73jl5N4Wf7hNFwsa3Vk37bzBdrutAVLHV4X8vZYaoIN3S2QAcRZdPpauFD+CEg3m03ww==
X-Received: by 2002:a17:90a:4497:: with SMTP id t23mr3377107pjg.39.1605279189082;
        Fri, 13 Nov 2020 06:53:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:08 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/18] testimage: print results for interrupted runs
Date: Fri, 13 Nov 2020 04:52:17 -1000
Message-Id: <aca4b863c2878b31c3cb506b05d1e19ef525e4af.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

When a run is ended by overall timeout, print the already executed
testcases, to provide some hints which testcase might made the
test suite reach global timeout.
Nonetheless make the testrun exit with an error

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2bcc643195a3b3c66d698fac8b7af037c08545ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 00f0c29836..c709384b91 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -364,6 +364,7 @@ def testimage_main(d):
     package_extraction(d, tc.suites)
 
     results = None
+    complete = False
     orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
     try:
         # We need to check if runqemu ends unexpectedly
@@ -375,6 +376,7 @@ def testimage_main(d):
         except ValueError:
             pass
         results = tc.runTests()
+        complete = True
     except (KeyboardInterrupt, BlockingIOError) as err:
         if isinstance(err, KeyboardInterrupt):
             bb.error('testimage interrupted, shutting down...')
@@ -382,20 +384,21 @@ def testimage_main(d):
             bb.error('runqemu failed, shutting down...')
         if results:
             results.stop()
-            results = None
+        results = tc.results
     finally:
         signal.signal(signal.SIGTERM, orig_sigterm_handler)
         tc.target.stop()
 
     # Show results (if we have them)
-    if not results:
+    if results:
+        configuration = get_testimage_configuration(d, 'runtime', machine)
+        results.logDetails(get_testimage_json_result_dir(d),
+                        configuration,
+                        get_testimage_result_id(configuration),
+                        dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
+        results.logSummary(pn)
+    if not results or not complete:
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
-    configuration = get_testimage_configuration(d, 'runtime', machine)
-    results.logDetails(get_testimage_json_result_dir(d),
-                       configuration,
-                       get_testimage_result_id(configuration),
-                       dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
-    results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
 
-- 
2.17.1

