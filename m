Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 906D87DE54
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:14:57 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id f7so18538087wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kUvlsGEMqdAVlgAwwUb8ib+GEwX1GtP1BiXjfdroeV8=;
	b=e87xHVIdERr8qh14cxYD1425+1jckpxJtO7KJ4jlzMmv4wntItm0AlPKaInjCsjjuq
	N4PErwiAwiKwBonGlSmW33g0xj5qExksF1hC6cFMbTk2jW6U7OdRNghCOxL9j/Rr9MUr
	cQKYFemL1W+aXx6juSxi9UGTOqylk+PAsNnZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kUvlsGEMqdAVlgAwwUb8ib+GEwX1GtP1BiXjfdroeV8=;
	b=IOyIUsJeazhCGCGAfRgEXtgilkJ59sdDMDKy9NaS92xodA/G3VUOVcpY4w4wRqbQrG
	uUbnmOG3YDRVwqywyyLu1hfWm8vEydEHeFh1sDz2B2LUVyIOsWuSk5QyabqD4U8phypl
	bk47ljrUwfv6qs/b6TOyuNe8p+lGodFX+lxF/GA2QZGJVlGEuOBhJPIgwXzsSA6Q1mg/
	BL4tX2LfVO7e3RRQjfvfN1AsyBVas6OblOCQzzGqw52Bckf3odVciQlVDkCwmrPAtHRz
	d4phBZZpwEV9YYi8fzb0rH4LiwvV6VycDqv80tQuTWSxKX87ihrugaSgXwcavXYZvbX3
	TQOg==
X-Gm-Message-State: APjAAAXVxBEHObxNJbuHBRWFDyLfAsGvKtd9tmwle+fF3PSXGGteBr9s
	IFg+t1fZWZpOnoZGlKe6ehJ7zkSYGOk=
X-Google-Smtp-Source: APXvYqyBJo7DxGzfDiYJr0kfrwdAQFX6SbW81GYW7cC2750gqgaOGbmaWkIPLjc5vppCBGtwrHUTng==
X-Received: by 2002:a5d:4109:: with SMTP id l9mr10477962wrp.204.1557346498046; 
	Wed, 08 May 2019 13:14:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a15sm4230355wru.88.2019.05.08.13.14.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 13:14:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 21:14:56 +0100
Message-Id: <20190508201456.11129-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/core/runner: Handle unexpectedSucesses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 20:14:57 -0000
Content-Transfer-Encoding: 8bit

Instead of showing:
RESULTS - ptest.PtestRunnerTest.test_ptestrunner - Testcase 1600: UNKNOWN (32.30s)

map unexpectedSuccesses to PASSED and improve the way they're displayed. We
expect/allow ptest runner to fail but if it passes we should handle it correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 5f708730eda..ca61de8cc0a 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -91,11 +91,17 @@ class OETestResult(_TestResult):
 
     def _getTestResultDetails(self, case):
         result_types = {'failures': 'FAILED', 'errors': 'ERROR', 'skipped': 'SKIPPED',
-                        'expectedFailures': 'EXPECTEDFAIL', 'successes': 'PASSED'}
+                        'expectedFailures': 'EXPECTEDFAIL', 'successes': 'PASSED',
+                        'unexpectedSuccesses' : 'PASSED'}
 
         for rtype in result_types:
             found = False
-            for (scase, msg) in getattr(self, rtype):
+            for resultclass in getattr(self, rtype):
+                # unexpectedSuccesses are just lists, not lists of tuples
+                if isinstance(resultclass, tuple):
+                    scase, msg = resultclass
+                else:
+                    scase, msg = resultclass, None
                 if case.id() == scase.id():
                     found = True
                     break
-- 
2.20.1


