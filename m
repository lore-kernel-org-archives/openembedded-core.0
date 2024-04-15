Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29B0C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 12:03:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.19328.1713182601284727539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 05:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Y5WpM3N+;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-416a8ec0239so16922375e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713182599; x=1713787399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjnF9ZXdq3dLirrTfPtIEU2dqwagFExo1xjgdjBCHyc=;
        b=Y5WpM3N+Zst1GjUtgkfcyqAXJlSljWJtFnSp7nMwIRjIStBntv6OuHvd+l8mmpieLN
         XnYeHWi0sbvz6tBoZi6oxtcDxSCeyN46CTOvk/b559MtyaSo8yUTKXQkYcaBPXDNOGSD
         Q97jqfwVGW6mfAlALk+jFGAhD8KV5PdoyHyJWjy+mPvphwnMbWxTJL25GB8nPmanpWRa
         XzmxRuPOURqV8yoBMMfnXH4Y7dedmnCHT7QhQIv/82CmJg/bXkil5grNCH2VNYNxchvc
         8Hdhj+aRgJy9tWxa5zpkeCtDlds0Er6rUCRZNu+60HZ1C5ChtbPGFzn4xnlfekGzTQLY
         VY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713182599; x=1713787399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjnF9ZXdq3dLirrTfPtIEU2dqwagFExo1xjgdjBCHyc=;
        b=hg88HEIrQ54NDyh43UsUzyioTr+elMIs4sIqnPGUtCSePvLNpLg9ijYjS752wfMds6
         oRzIDaqRdbXtSDxW3Zjf+8nOTwOltDiXxGHQ/Ss3jXBkdWnBxKv/74Jy/MzJnNiEW9ba
         0nEQZf72uom2ZPitSRn18YMgJe/NbwVpEDKwiXb8nXx8/QLjiDujWCaz3K6do0P823ks
         dGjY5umwY++rNnCkrNNNPqH3oiFU2DbPaln5xeGmXqP8JsTxNmTazgPC67PPD6i3rA7+
         JSBAIbw++iHFrMGHJBtLhHLrLscPmPo9U4VGL8xRP+zeFwJxRHGeGrhkWDfwhexWRpVG
         XOTQ==
X-Gm-Message-State: AOJu0YzNT6I2MW0yeitMgI07n95yHq4JJYUm90GlIhTjpGKXONEZJkft
	Nf7jaNB8kEnp+y4+Sk/bBF4iLQaIZ0ueF5ya1dWixHJoGXIKw7qHGgPBqTz+e2DK9KwnfUlnbRB
	XcLg=
X-Google-Smtp-Source: AGHT+IFuWLXxDKZ+THzVmDgMZXcSm9D4viaFtcE/W7JgoRwPdh83ICjFtH49Y/bis7DaCXDbeKetTg==
X-Received: by 2002:a05:600c:4591:b0:418:2a04:d926 with SMTP id r17-20020a05600c459100b004182a04d926mr4816094wmo.16.1713182599112;
        Mon, 15 Apr 2024 05:03:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c35c400b0041638a085d3sm19358907wmq.15.2024.04.15.05.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:03:18 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] oeqa: selftest: context: run tests serially if testtools/subunit modules are not found
Date: Mon, 15 Apr 2024 14:03:17 +0200
Message-ID: <20240415120317.167986-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 12:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198235

If testtools and/or subunit modules are not found we get the following backtrace
(example for testtools):

  NOTE: Starting bitbake server...
  Traceback (most recent call last):
    File "<..>/poky/scripts/oe-selftest", line 60, in
  <module>
      ret = main()
    File "<..>/poky/scripts/oe-selftest", line 47, in main
      results = args.func(logger, args)
    File "<..>/poky/meta/lib/oeqa/selftest/context.py",
  line 391, in run
      rc = self._internal_run(logger, args)
    File "<..>/poky/meta/lib/oeqa/selftest/context.py",
  line 377, in _internal_run
      rc = self.tc.runTests(**self.tc_kwargs['run'])
    File "<..>/poky/meta/lib/oeqa/selftest/context.py",
  line 161, in runTests
      return super(OESelftestTestContext, self).runTests(processes, skips)
    File "<..>/poky/meta/lib/oeqa/core/context.py", line
  91, in runTests
      result = self.runner.run(self.prepareSuite(self.suites, processes))
    File "<..>/poky/meta/lib/oeqa/selftest/context.py",
  line 154, in prepareSuite
      from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
    File
  "<..>/poky/meta/lib/oeqa/core/utils/concurrencytest.py",
  line 22, in <module>
      import testtools
  ModuleNotFoundError: No module named 'testtools'

Fix this by adding a custom callback on -j/--num-processes parameter to
check testtools and subunit modules. Fallback to serial testing if
missing. This strategy is already used in sdk/context.py

Signed-off-by: Julien Stephan <jstephan@baylibre.com>

---

If someone has a better suggestion instead of using print here, I'll
update the patch :)
---
 meta/lib/oeqa/selftest/context.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 57844b289a2..99186175e5d 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -194,8 +194,23 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         parser.add_argument('-R', '--skip-tests', required=False, action='store',
                 nargs='+', dest="skips", default=None,
                 help='Skip the tests specified. Format should be <module>[.<class>[.<test_method>]]')
+
+        def check_parallel_support(parameter):
+            if not parameter.isdigit():
+                import argparse
+                raise argparse.ArgumentTypeError("argument -j/--num-processes: invalid int value: '%s' " % str(parameter))
+
+            processes = int(parameter)
+            if processes:
+                try:
+                    import testtools, subunit
+                except ImportError:
+                    print("Failed to import testtools or subunit, the testcases will run serially")
+                    processes = None
+            return processes
+
         parser.add_argument('-j', '--num-processes', dest='processes', action='store',
-                type=int, help="number of processes to execute in parallel with")
+                type=check_parallel_support, help="number of processes to execute in parallel with")
 
         parser.add_argument('-t', '--select-tag', dest="select_tags",
                 action='append', default=None,
-- 
2.34.1


