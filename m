Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.7647.1593486273745145388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Moc3hW3q;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id t6so9265750pgq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Gqd/an7UzhDd9fhS1MQuRpCduKHu36uPg1geEXKcvqg=;
        b=Moc3hW3qNdRQB+hx1LNbLI49/umy5YVhoOlK9Dn8nkn48+BHgB2ovyHetYXY0JWqXT
         /mTsw9+RNqpBJD5S1EqCjqKPzNb9KwETiZcLhyu790IFPA88QZg388J54QKUI5/qQ8PF
         cwe5es/x64+kS1O1BEfXPBiXDykbVp9soLv1XLS334tY7AfkZzl90ldSsghJdfUUHcx+
         cWA5MaMvldNXf2uRDVZ11n6BIkvtWhzCY7N/BQJO9Rwp6/B/h1vKazFVHGmDrCED5Nqp
         Yd6mHK4gx8wKFF/RuSwB/tSB7JeTCs4cltmSAnL5M/tnS9ESIg9xClMqihcgWNGOK28r
         sGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Gqd/an7UzhDd9fhS1MQuRpCduKHu36uPg1geEXKcvqg=;
        b=hcpwgyweweIOX5Ui5HJ3y9NfP+3tvFmxG+3A8ULmU6GLVFKnpfLl/O0mJ6tQZpCasU
         xqBQsgFl+bB43dbkj1byN7jhSPKM0ebQV8byIwqOGiPgBg5W7XE/k9BAhTbTX4CPrb3G
         jL9IorLK+2Vyc1l3G3avRRKaYPNRVG3BRDu7xhx/oMvDzCX+2E+6WsI+WykWp0JtiOf4
         oq53OcpPL4qvEncdLr85ccHpAQLvR5P3GGrQ5R97hjSrptV7O5cXuH2jGlLVum8DNUgr
         +27x5ZsadGxbDybSeBMDcFKMDedGu2yGj30HHYeoXkVsSHgLwHmXWQmhEsY+c+Bf8eyd
         WyLg==
X-Gm-Message-State: AOAM5338FxxQRI49FjWRrjCCWpaTPEY7qmhtKwhRlk9C9yt8CEXktlgh
	sRwHDTJEZeZqq93UcD/4k1ojS9JgeV39dQ==
X-Google-Smtp-Source: ABdhPJwP7gXp9yjkUgacjelrGlDWc2sygzNwbltOUXeVoAVTjfAzc9g5tyZNjKyfwjcMXgvHaN99bw==
X-Received: by 2002:a63:af50:: with SMTP id s16mr13612772pgo.365.1593486272876;
        Mon, 29 Jun 2020 20:04:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/22] oeqa/selftest/runcmd: Add better debug for thread count mismatch failures
Date: Mon, 29 Jun 2020 17:03:07 -1000
Message-Id: <773f97c6f56ed98a7b0821358d7435ed3ea7a3d6.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d15d0177d328fa3a126b9942bda177f6fae68505)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index 3755764ee7..a5ef1ea95f 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -81,7 +81,7 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
-        self.assertEqual(numthreads, threading.active_count())
+        self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
     def test_timeout_split(self):
         numthreads = threading.active_count()
@@ -91,13 +91,14 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
-        self.assertEqual(numthreads, threading.active_count())
+        self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
     def test_stdin(self):
         numthreads = threading.active_count()
         result = runCmd("cat", data=b"hello world", timeout=self.TIMEOUT)
         self.assertEqual("hello world", result.output)
-        self.assertEqual(numthreads, threading.active_count())
+        self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
+        self.assertEqual(numthreads, 1)
 
     def test_stdin_timeout(self):
         numthreads = threading.active_count()
@@ -106,7 +107,7 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
-        self.assertEqual(numthreads, threading.active_count())
+        self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
     def test_log(self):
         log = MemLogger()
-- 
2.17.1

