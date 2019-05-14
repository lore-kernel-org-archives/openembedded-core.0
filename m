Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2A99C7DEF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:27 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id t187so7926852pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7OwSGrUYWu0/v+gTb1XnBEPpiGHdGnuG1B5X623dy8w=;
	b=pG9vTbQCE5IbQ64f8eE+WTYniNO9BuXgAfpndF8Z4DoUqx5LI6XirkNnov9Iw0cjtL
	978d+mrKAhQBSwfTIvxGrfv5A39UOVjuCHabjMI2W7byUthPg5nJhPwgL7raPvvMjMBV
	5936KkE+9bw/JIt6ZsEP7d+P1OlZw6T2MQi98CeggcrxZgcfArJ8KP1KVc02NQrAnJ15
	AyUh5AV9SFCH1BIW+GhK0elrzJK3ao6nbidrGsJVdNrCbbM6/3z8dT2imwiCHDcahYcL
	l34iBvgxgRsJLFKU3uVffja0xGnIy2Ndoy5Sj7t/jUGfjUYaphvkBqxGfwqoJ8xAUjj0
	tN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7OwSGrUYWu0/v+gTb1XnBEPpiGHdGnuG1B5X623dy8w=;
	b=MogXoqDFRthbxNlCJXMxlSHruwWt/Izz0vo2xIgpko+2NKZwxIHNc6mdivYX5tX1Dg
	3ZUdM8fytl1iAwWbTYXt5GkBW+LOQhKKBk8oxWYjG5lGBqGd1wj0H9F8+p/MzxaQg/CX
	9hNalvzNO9paC9iAOm71WB6xIGPDGxTdGRGySFeA16t3XJFV4LQDeIoM+9BuokYLfF0v
	nQO4mgkPXMrUsndFZXaKbaC2jJxW0+B6GeOuG0MvAmkXGCQkRYfOMsgQ7twMbXTaR1n0
	JIpJoMz/eZmhAw04NRTIk4tG04FKwlhYajftv6ONtNeHLF9vVXwzhdgl3IiIL9BnUobG
	RtKQ==
X-Gm-Message-State: APjAAAX6YmtI9bWBCAjPt7NsZl8XbXvl1beGtLr4ho/eZToUYQ5jz0s0
	k5PvqHy7b7mA3VJEi6W6jS72xZ2C
X-Google-Smtp-Source: APXvYqzokWI3QDKkbtKWymz5UHcAq8qhNTK6a4xpsxxgRTjIxghGPU5SQUW40MdjPTP4gowt/CswWA==
X-Received: by 2002:a62:8245:: with SMTP id w66mr38118598pfd.58.1557809668115; 
	Mon, 13 May 2019 21:54:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:54:04 -0700
Message-Id: <21079473e0cbd0e43682dc0d15a651e7e64db747.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 22/23] oeqa/core/runner: Handle unexpectedSucesses
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
X-List-Received-Date: Tue, 14 May 2019 04:54:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Instead of showing:
RESULTS - ptest.PtestRunnerTest.test_ptestrunner - Testcase 1600: UNKNOWN (32.30s)

map unexpectedSuccesses to PASSED and improve the way they're displayed. We
expect/allow ptest runner to fail but if it passes we should handle it correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/runner.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index ee1fb43..69743a4 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -88,11 +88,17 @@ class OETestResult(_TestResult):
 
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
2.7.4


