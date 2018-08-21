Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B38CE74E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 21:56:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v16-v6so2637550wro.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 14:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=8nvZKVu9qWBwBTkbmsxxDcLrpOOSD0IVtkN2QW1e/ZI=;
	b=d1WaGeEOr0rKDX8SHG7TwkiLQG7Gov3NViSBGVGl6dccnW7/7HHkLeUPZnOWkk+1rp
	tgophHYMZaPXzmuNxCDSCaug1KyLZWpCIVo5PPl1+Zg4S31+fs41Wrgn0mUwSDK64mBN
	5LUYYc+JYGk6IB7cmCmw9hstWn7JRDNtNXhRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8nvZKVu9qWBwBTkbmsxxDcLrpOOSD0IVtkN2QW1e/ZI=;
	b=ZRqg33NFRAwHFNeAuEuZpdEm7qxoFzwabSPyShqelW1T6Bj85ylSJIVUfDPSzRMjUk
	34tfpO5+13mgE/mUlsPzGy2xNPrQuUg7d5COWXigrS3sgSI3QXwheYmS0grcaOnX4fG4
	/dbLuy509F6WQv4FKJ09ZYiKN6asUljDDAOFXYv71G0k4bo0oBxvMmO1exThRBtf9+Tg
	v6EaE7qrJM499VMZ0pCuVAmRnM2UJtF3yr9eflo5FQGdAz1m1RhsainQtWzvionDlM4e
	stuohZQzgXUiD2ifOm9DTrJ7ha0DRaWg7wSqBri4mGzobAw5zA8B9qrhncIKFwS0fkYy
	S06g==
X-Gm-Message-State: APzg51BGUV9+cVBXqgomzxxqUNfz1CDU9JYs1BlcE8GhIj72TAK6wvzm
	ef91Wi+o+VTKjOIGGN+H7QW3k+ooN3o=
X-Google-Smtp-Source: ANB0VdY4T4t7ugfD9VgwagwKo/OzlJUXJxqAkkxM1yq+8Gd4vdhzawEn8su9OeOlypjJWqU/dJqUtw==
X-Received: by 2002:a5d:5383:: with SMTP id
	d3-v6mr1506113wrv.191.1534888579086; 
	Tue, 21 Aug 2018 14:56:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k34-v6sm4626650wre.18.2018.08.21.14.56.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 14:56:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 22:56:16 +0100
Message-Id: <20180821215616.13459-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/context: Only set buffer mode for non-concurrent tests
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
X-List-Received-Date: Tue, 21 Aug 2018 21:56:19 -0000

Periodically we'd see:

NOTE: core-image-sato-1.0-r0 do_testsdk: ======================================================================
NOTE: core-image-sato-1.0-r0 do_testsdk: ERROR: broken-runner
NOTE: core-image-sato-1.0-r0 do_testsdk: ----------------------------------------------------------------------
NOTE: core-image-sato-1.0-r0 do_testsdk: testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/lib/oeqa/core/utils/concurrencytest.py", line 122, in _run_test
    test.run(process_result)
  File "/usr/lib/python3.6/site-packages/subunit/__init__.py", line 1194, in run
    protocol = TestProtocolServer(result, self._passthrough, self._forward)
  File "/usr/lib/python3.6/site-packages/subunit/__init__.py", line 514, in __init__
    stream = stream.buffer
AttributeError: '_io.StringIO' object has no attribute 'buffer'

which seems to occur if a result arrives before all the runner threads
have started. The runner's result handling changes sys.stdout to a buffer
temporarily which can be seen in other threads and it can sometimes fail.

Since the tests are running in a separate process we don't need this buffer
handling in the concurrent case so only set when not parallelising. The
concurrent class handle setting buffer mode internally.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index f174c4bbcfc..821aec8836a 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -58,7 +58,7 @@ class OETestContext(object):
         self.suites = self.loader.discover()
 
     def runTests(self, processes=None, skips=[]):
-        self.runner = self.runnerClass(self, descriptions=False, verbosity=2, buffer=True)
+        self.runner = self.runnerClass(self, descriptions=False, verbosity=2)
 
         # Dinamically skip those tests specified though arguments
         self.skipTests(skips)
@@ -70,6 +70,7 @@ class OETestContext(object):
             concurrent_suite = ConcurrentTestSuite(self.suites, processes)
             result = self.runner.run(concurrent_suite)
         else:
+            self.runner.buffer = True
             result = self.runner.run(self.suites)
         self._run_end_time = time.time()
 
-- 
2.17.1


