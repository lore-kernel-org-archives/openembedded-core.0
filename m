Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EDEC27C7B
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 15:05:38 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.776.1718204732264815066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 08:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=C7jOwKD8;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-795524bb6d9so152319385a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718204731; x=1718809531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOR9mE/rLqGO1tUnItIgGzhPdeIm+Xr4Pl6a3INcrCo=;
        b=C7jOwKD8KmHGxIVXLvHWKzKF2GNiAr5ugUVO2SppjDDpvD7kKZPrFXwHQMjBDZ2SZw
         zwy862+xd/lEjsdfcvDiDK69d4DTLz+50T/v9WHGuTL7a/Mo2YADKtr8Ju42DPz5NwRe
         80auqegXb4/gTqoMkcTfP35/rHco1vXpNiXU/zbWZlyXrBhZ/JWz0pKKGLlSzcgM/9/p
         fxzlq2yzaL4HdM/1OEIXYCUQB2hEM+/lQyPt6qxnYDpJJuTVvHLuzCBjLrDEeKdvTgJv
         3fb0OWLl6qH5x1ugsS3eATwYC3gWOsVlgA30JyEyDSzuiU+y/B8FrHv9+kz2kpgmPZEk
         efgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204731; x=1718809531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOR9mE/rLqGO1tUnItIgGzhPdeIm+Xr4Pl6a3INcrCo=;
        b=AcRj544AbW1Y/csdmTyaHLUEDqL45UEPEXBN+vlfWJPtpkjxsu+K+UTpHr7r74MxkH
         RlwnbDtw/HwIn+Y8RicGkIVVRFszOIAFXQ9f/FyertsRG7VHzV3zNrsnAzSvmsZwdcun
         e+T1VA6wNzJDWfbUgc9ek4qFWWdhW952Q4j6R/GhePnwVJuz540MX+5RcIdo008iH3ZH
         4MbcfVmjk6R8q4gzddda7X/YIjUYHhJe9MvT3+H5dkxP+SqAuNjOBQ0R72eD5iB7QpaV
         f38hFNb4HHP1cCFmd3Jb+8x0qfUck627oCzoAwIny/hu1LAFuXSma2QvNvwX1m+eId+S
         LKwA==
X-Gm-Message-State: AOJu0YxYztGox0EjRvS4u79LuBP/Ky1kfT5pOka8ZgC+sI0HdEwz5Xhi
	nhIoqExNCLRy9iX81FQsxoFRYC1PfmM8cNCW90/OvoCMF0huXzYVy/0sNF6QkC0bRxYTbMzeC69
	rWzA=
X-Google-Smtp-Source: AGHT+IGxAGDxlkRtAGsT5uUvtCj9VqE48f2RB12VolQYf6x679Kb2iEZP3thfiK5m05SQPCRoipEuw==
X-Received: by 2002:a05:620a:3955:b0:797:8511:a1a4 with SMTP id af79cd13be357-797f617410emr225151585a.50.1718204731030;
        Wed, 12 Jun 2024 08:05:31 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7954b9553c7sm464869585a.130.2024.06.12.08.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:05:30 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] python3: skip test_concurrent_futures/test_deadlock
Date: Wed, 12 Jun 2024 11:05:28 -0400
Message-ID: <20240612150528.173057-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 15:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200574

These tests are causing hangs on the Autobuilder, so disable them for
now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...-test_deadlock-skip-problematic-test.patch | 30 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.4.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
new file mode 100644
index 0000000000..f0a7cfd39b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
@@ -0,0 +1,30 @@
+From d7e3f26e7094fbe20e2271d75f18ac3b23a67f58 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Wed, 12 Jun 2024 10:29:03 -0400
+Subject: [PATCH] test_deadlock: skip problematic test
+
+This test hangs frequently when run on the Autobuilder. Disable it in
+testing until the cause can be determined.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_concurrent_futures/test_deadlock.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_concurrent_futures/test_deadlock.py b/Lib/test/test_concurrent_futures/test_deadlock.py
+index 1db4cd0099..fd07895a17 100644
+--- a/Lib/test/test_concurrent_futures/test_deadlock.py
++++ b/Lib/test/test_concurrent_futures/test_deadlock.py
+@@ -90,6 +90,7 @@ def __reduce__(self):
+         return _raise_error_ignore_stderr, (UnpicklingError, )
+ 
+ 
++@unittest.skip("skipping problematic test")
+ class ExecutorDeadlockTest:
+     TIMEOUT = support.LONG_TIMEOUT
+ 
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 49c134fc7c..64cd5d0bc0 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
+	   file://0001-test_deadlock-skip-problematic-test.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.45.2


