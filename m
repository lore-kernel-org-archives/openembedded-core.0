Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id E7DA77E094
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:23 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a5so7552287pls.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GBFsN4JkNrgNtF3+RWjMS1feHmv6lRdFMwQsaRxnJtA=;
	b=ZM/r/b9ufESM5XFORGs53KW0ctq38iaUE/2Kz+6+I4nwtU+8jcbjIFze/Tto0c0o3p
	Hv/0D0ZKjsZCOGGABxMQI96wNKBH3qUpG/ZpOOw0n1CSiLR6rnxli1nmZL4SdLKKMWbf
	rKwGz+GFGxQBIidvTb0gtAlz+2Q7glNAkInXWsqjoMJD/Ydz/POQuhnLC/zFVafzVN2N
	cG6DrF0Kc+2wJvZ1Ej2kYy7n761U32LPoAhOq/o1fLDTo0hi6q9V+RHSBQoaBEd7oV+N
	YbpG0zTGGvZ4nRuPTQw7QoGfbxfIO3aTjM5DoHEa0w7rKohQr1BT3oLHvdn2JJc4kdeH
	8WAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GBFsN4JkNrgNtF3+RWjMS1feHmv6lRdFMwQsaRxnJtA=;
	b=IBUSfjQoGwoFhlt2Snu7kN/+swlTvgyvwqUjmUnqo7MNyJaRd79QqngHzB2WKmM/iv
	ZiB2T+PCJASiewuQ2R1zCNu/M1OZQJHD3Re17+30DrLixsaMJuD8FU9cbMj5z/4JRBvm
	2Q/kBKU4nFQ4D4FwuZvM9HluY0tDNHJkDnF9SSD9KbK/AE1wM0k8Sico2XKgpNuYjCpn
	1C5lwdKGO11ihVUqTLb2mSly2I8ctqP8M/1eao2awV1IztLh/WPqi3smilS40NmLlies
	E6rzlRmzzbsrl5pXCzzqn9SO8erh5EBzyrwYmMPdi6sACPcS8RTwkmb+n7b1/r9xmrsv
	BFbQ==
X-Gm-Message-State: APjAAAULBx6qP1vaZZPyWuglGNdh6fzrXW6o0+YGRVJo7rpl4MNFG9LP
	80lxVfiNCdM3+C55imTCRdOWmAvs
X-Google-Smtp-Source: APXvYqwccRnZmyXQZGXiAz+yLl7kKuUFDyeQFzFDYDFcClSKb8K2BMLUgelNrIFBdw9fZVFeebRGKQ==
X-Received: by 2002:a17:902:6948:: with SMTP id
	k8mr80100149plt.81.1558403005094; 
	Mon, 20 May 2019 18:43:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:06 -0700
Message-Id: <82a8da70771c39d44c5665e8e80bbf5a6e2f4c53.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 04/15] oeqa/concurrenttest: Patch subunit module to handle classSetup failures
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
X-List-Received-Date: Tue, 21 May 2019 01:43:24 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index e050818..df8d5d0 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -19,6 +19,7 @@ import testtools
 import threading
 import time
 import io
+import subunit
 
 from queue import Queue
 from itertools import cycle
@@ -51,10 +52,11 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
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
@@ -67,6 +69,23 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
         super(BBThreadsafeForwardingResult, self)._add_result_with_semaphore(method, test, *args, **kwargs)
 
 #
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
+#
 # A dummy structure to add to io.StringIO so that the .buffer object
 # is available and accepts writes. This allows unittest with buffer=True
 # to interact ok with subunit which wants to access sys.stdout.buffer.
-- 
2.7.4


