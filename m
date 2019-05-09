Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 543DC7DFEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 13:55:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c5so3164920wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yTS2RtGylFLn/oFoeUGAH06l0bE6CmHYW/YC8EKaXrU=;
	b=QA2rH2HBRaEwW7CNgKdDM9kHvM42FQFzja1jVDFKvPjN6ihyFDjdTJVGDgmkMWTXmk
	/CThGdnxzctQyAN2huqHVYi0RkMQ++ZlBk9VUnnIKzS41m4YyN05lTI5nhBLfr8YoqKu
	Rh8YuvAd30VA/oAhptPb/YwTAywmE//oAXhWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yTS2RtGylFLn/oFoeUGAH06l0bE6CmHYW/YC8EKaXrU=;
	b=IevtothIYRwIqgl2NAxCuae7DeuHjKmRFIJy8DNctVrxTp0Xsdm/nhcl3BsVrBcpFP
	Uh1UzdUUkAD6Syn66tqnEdEapSvFyRW/+2f+gw4rK0J2c41qGXcJ5KEqlwOCt/yyT4LH
	R2nP/SZ0D/RMi9lLJISvyRzTE/H46GEFqHe8c3mdrnlonydpwNhA0+qx4BaNhBHEKzEj
	AOMDEmgzykVQBDcHAKQJENMri30rTISe8VMawZbDP79YiJcSwyaYME+SI3MQ76kx0UYS
	Xq6yFJ8nZESozQVwq7mkasKZZJpVJCUtZek90qk3yJ22SbEnO2KiQ2Nduk2693hKTkSo
	ctDA==
X-Gm-Message-State: APjAAAXLzzDbb3ArwXPSGwQilu6VlqznCTv+wxX3TQ/z+5xzZj39pJxa
	hjBW3pGrTSE2zS6X2yO4pvd3tyK6l/0=
X-Google-Smtp-Source: APXvYqyMG6DTvfE3T8hyti0zUGsXU6bSHdqTSwaKHT0IP4sxkI14B1dqGN5Si5Ao9kV9JkZYbWxOpA==
X-Received: by 2002:adf:9084:: with SMTP id i4mr3097387wri.259.1557410146006; 
	Thu, 09 May 2019 06:55:46 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c131sm2625095wma.31.2019.05.09.06.55.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 06:55:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 14:55:42 +0100
Message-Id: <20190509135542.6033-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509135542.6033-1-richard.purdie@linuxfoundation.org>
References: <20190509135542.6033-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/concurrenttest: Patch subunit module to handle classSetup failures
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
X-List-Received-Date: Thu, 09 May 2019 13:55:46 -0000
Content-Transfer-Encoding: 8bit

Currently setupClass errors were not being mapped back to the failing tests
and they were hence being marked as UNKNOWN and the test statistics were
inaccurate.

This is because whilst the errors were being encoded into the test results
stream, the decoder doesn't cope with an error outside a testStart event.

We patch in an addError handler to the outsideTest parser so that this
does get handled in a way similar to the non-concurrent case.

It would be nice if we didn't have to do this but there doesn't seem
to be any other way to fix this other than forking subunit.

We also make a minor change so another of our changes can cope with
tests without a start time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 27 ++++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 535b11e2d95..6bf7718863f 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -21,6 +21,7 @@ import testtools
 import threading
 import time
 import io
+import subunit
 
 from queue import Queue
 from itertools import cycle
@@ -53,10 +54,11 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
     def _add_result_with_semaphore(self, method, test, *args, **kwargs):
         self.semaphore.acquire()
         try:
-            self.result.starttime[test.id()] = self._test_start.timestamp()
-            self.result.threadprogress[self.threadnum].append(test.id())
-            totalprogress = sum(len(x) for x in self.result.threadprogress.values())
-            self.result.progressinfo[test.id()] = "%s: %s/%s %s/%s (%ss) (%s)" % (
+            if self._test_start:
+                self.result.starttime[test.id()] = self._test_start.timestamp()
+                self.result.threadprogress[self.threadnum].append(test.id())
+                totalprogress = sum(len(x) for x in self.result.threadprogress.values())
+                self.result.progressinfo[test.id()] = "%s: %s/%s %s/%s (%ss) (%s)" % (
                     self.threadnum,
                     len(self.result.threadprogress[self.threadnum]),
                     self.totalinprocess,
@@ -68,6 +70,23 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
             self.semaphore.release()
         super(BBThreadsafeForwardingResult, self)._add_result_with_semaphore(method, test, *args, **kwargs)
 
+#
+# We have to patch subunit since it doesn't understand how to handle addError
+# outside of a running test case. This can happen if classSetUp() fails
+# for a class of tests. This unfortunately has horrible internal knowledge.
+#
+def outSideTestaddError(self, offset, line):
+    """An 'error:' directive has been read."""
+    test_name = line[offset:-1].decode('utf8')
+    self.parser._current_test = subunit.RemotedTestCase(test_name)
+    self.parser.current_test_description = test_name
+    self.parser._state = self.parser._reading_error_details
+    self.parser._reading_error_details.set_simple()
+    self.parser.subunitLineReceived(line)
+
+subunit._OutSideTest.addError = outSideTestaddError
+
+
 #
 # A dummy structure to add to io.StringIO so that the .buffer object
 # is available and accepts writes. This allows unittest with buffer=True
-- 
2.20.1


