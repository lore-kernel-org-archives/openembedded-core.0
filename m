Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.38124.1591020713680801693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NaOWHgwd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id ga6so2016072pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=UkcZnPvaO1K3kZ99W+ETL6IrorAETxjE93lNful1i10=;
        b=NaOWHgwdm0nw8Yt3mC51RIc0D0yBCYBkmRkQ5M188wUUBwAisdW0VPdrMZNeGYwB3v
         pCJDeRltr09MTVLejsZtxKLoSnoozV4MyKD3wJpn0vyOIHEX/2JN3gUqINn8VUNAHgGl
         aTqhxiqgP+HQITcJ+Ng5c7rXvJYUCbLnZaK7nvio556FX2F/l3e50rj9G+lNDODo8jAb
         Aet2R7O4vDxpk94S0AhSY2+QBRdA3yZ9UskPE1pRATj+DKhHR8w6HXJaxBSbiYFg5TpL
         eJh1WMoF2svRLmfagzgm1s8bI7/fpz+JpTulajP/eC2lh/Ul/wSLWgWx7zIfZS63YAzx
         6gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=UkcZnPvaO1K3kZ99W+ETL6IrorAETxjE93lNful1i10=;
        b=DPFAZryILjppGfVEyA9jHSEzxfTcR2eh01JFgw92cCrJT9/Pv3oevfHF8kXb7r4VMz
         qs1y5dA04Sxgi2CIpnoRAs0qb6mC65JFDTDBo002HFB204COR5YoQreLCQcSh6WeaXsO
         b3p/bCgCr4csdyvkeiBfT/QGDLmZGPGF4NSqU0pNS+nxlAEq+LvAHxWvYEAxTyIo37pl
         drQENkQRmdFR+H8tJzc2a0T6uoTjmHYtPttQAEn9WQbbsddFXdnRdW293moxsU/0D1O5
         lIIzPQjEJIm/mYi0EGpFmmqYw396DiXaRWcL0MftFhl1oeYHQi8LBgnAyaDyDIYsLjHZ
         +CSA==
X-Gm-Message-State: AOAM531cUA8d5ped98CUftvyHToEBCT9/xjRn81i26v7ra1lUNbRfV5z
	9A/gdQ0GJFUs+KhuoQHOt1bzLLgc7gA=
X-Google-Smtp-Source: ABdhPJwMiK+QcmqhTQBJtUR2//rqLnP8buIjclY8Dv+fYek8Us2aAozniWo3zDx6ULjMt00G/h6vTA==
X-Received: by 2002:a17:902:7d85:: with SMTP id a5mr20965892plm.106.1591020711894;
        Mon, 01 Jun 2020 07:11:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.11.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:11:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/16] oeqa/concurrencytest: don't delete build directory for failed tests
Date: Mon,  1 Jun 2020 04:11:11 -1000
Message-Id: <be24033acee75526a3a66c12606ef67dcb52a7ee.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d5aa170d2e88b852bd2a4452aab9311a24badef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index fac59f765a..01c39830f9 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -77,14 +77,17 @@ class ProxyTestResult:
     # a very basic TestResult proxy, in order to modify add* calls
     def __init__(self, target):
         self.result = target
+        self.failed_tests = 0
 
     def _addResult(self, method, test, *args, exception = False, **kwargs):
         return method(test, *args, **kwargs)
 
     def addError(self, test, err = None, **kwargs):
+        self.failed_tests += 1
         self._addResult(self.result.addError, test, err, exception = True, **kwargs)
 
     def addFailure(self, test, err = None, **kwargs):
+        self.failed_tests += 1
         self._addResult(self.result.addFailure, test, err, exception = True, **kwargs)
 
     def addSuccess(self, test, **kwargs):
@@ -96,6 +99,9 @@ class ProxyTestResult:
     def addUnexpectedSuccess(self, test, **kwargs):
         self._addResult(self.result.addUnexpectedSuccess, test, **kwargs)
 
+    def wasSuccessful(self):
+        return self.failed_tests == 0
+
     def __getattr__(self, attr):
         return getattr(self.result, attr)
 
@@ -287,10 +293,10 @@ def fork_for_tests(concurrency_num, suite):
                 # as per default in parent code
                 subunit_client.buffer = True
                 subunit_result = AutoTimingTestResultDecorator(subunit_client)
-                process_suite.run(ExtraResultsEncoderTestResult(subunit_result))
+                unittest_result = process_suite.run(ExtraResultsEncoderTestResult(subunit_result))
                 if ourpid != os.getpid():
                     os._exit(0)
-                if newbuilddir:
+                if newbuilddir and unittest_result.wasSuccessful():
                     removebuilddir(newbuilddir)
             except:
                 # Don't do anything with process children
-- 
2.17.1

