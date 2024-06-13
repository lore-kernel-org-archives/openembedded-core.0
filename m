Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4BAC2BA15
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:03 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.9969.1718288454569906925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CSfJTY+X;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6e5fd488d9fso871140a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288454; x=1718893254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iA2ntRrglCC30qeDY44tZPiJhQxMTKv4U8R4OH/awco=;
        b=CSfJTY+XdCcQaNNQzQk311gUxd5Q5Z+i9Ln6hsP1dm1mFNttMUU0RaQ9Rna7OVV8q5
         r+UbX3FsBw5IqPoY2fLr1Lb1Y6Y3Al68fdrx59knArHvgoiBXpevvOQval14zL6QeiZH
         Fl4M5BoOqEEjD5R4j2Cyz4XHQdRdr6jm30yxt3CVLVVDzDUES2JuZ286bNv6Hzegp71Y
         NPXiSPIeXKnA71TqQiI9OLEn+gJYse5eT8HgvlpWO7r/YXLlglrfBmaj3+uENoXXXIcM
         8sVfYrLlGCHiLmJMg2NIKJs5TKe1a4JPNOEELqXxix0CBnM2EmUCJ2HKhXNFHosLYvlC
         /NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288454; x=1718893254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iA2ntRrglCC30qeDY44tZPiJhQxMTKv4U8R4OH/awco=;
        b=LFPICgCAgOV6u+eLz79t4MO8BUPGANOWu5juIz8LwwTiE8+1DvqLnLxAXg4aA985M6
         7evRrPip5MsJRnv1wgy6b+Vze09draRyCoGYu8oGUM4wtf7o+29Co9xcEbwKPPCbwuor
         9rgVROImgAfGApW6r8fdD7NDtbCrErD6pf9hZouobk3IL6q2BZSTjw0C35o0FJvcBeRu
         KS1pSMpPiAduf881O2g4x1Gyd1qo/JwzboGK92G1wfo06HcwWPnr1Nfu9Gf+wxgxR7xt
         hr2KRClujxrV2oN6Cfk7edD7iMKtjJ1ofJ9QwZQmvDpIg9bq9m6p330W5dFHuzWI2ltI
         rFyw==
X-Gm-Message-State: AOJu0YxTvUUpxpa3+2hKZiuBxU7/fa8TyQo6eV99Mrbpw/LB8fZaLNyC
	C60f6PjO99eyPIeE1xZc2W1uRrbNN5J/G1mcgh936Cs8yTa3ksbZS+WitF4ab2aF4fcSKOzcldG
	y
X-Google-Smtp-Source: AGHT+IFVI0XcPEiv98Oeqyc5safp4lew209wNEruDRC61DxP8vvDxGIj5CUpTPVw1RXXucy+U+Vh1w==
X-Received: by 2002:a17:902:ecc7:b0:1f8:3c5d:9eb with SMTP id d9443c01a7336-1f83c5d0bbfmr62854045ad.7.1718288453800;
        Thu, 13 Jun 2024 07:20:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/29] oeqa: selftest: context: run tests serially if testtools/subunit modules are not found
Date: Thu, 13 Jun 2024 07:20:15 -0700
Message-Id: <ffd1db7d7813f6da22c0d9ef5fde6738058f1eb2.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200613

From: Julien Stephan <jstephan@baylibre.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 35284404473b2c2d9f69594582868ed66ef3525e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 57844b289a..99186175e5 100644
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


