Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26091CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:24 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3339.1760733859514316821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DGtgSpXn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781db5068b8so1991242b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733859; x=1761338659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhV8VwA5VUWy4/QtHJ3GPPg6KmzncGk8Vm50/kqnMtU=;
        b=DGtgSpXnHgmUQZxqniqf6jTN19Wz9ScsWNwf1tt8SwIph1TYPXGy3yJKbSrHaJjvaR
         6o82vznMtPAKvSWcm2ZfEbRYfkcDKqzN6j5ivBCpoiQWPrdMJfn3mgzBdDp3DO04UFx4
         icZpL0hOTxDWCKUv7RERzZ2xxvFFpuy7KR/fE6aVJZ6MBSTiyEIFvAr2sLWEv1E2rumm
         pVSOeQSarE5399oAQzjfvYHR0qWDpE3Y4vLTPB4G5zR2Co1pEyLXBflpvndDqhzkWYup
         iCiXtd97V8FtifQ7HxSQNvudLP/zU6Rhyeo/SfXMKoKuMknXEo7Vc7FleOlZ4W7jJ2Pz
         E5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733859; x=1761338659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhV8VwA5VUWy4/QtHJ3GPPg6KmzncGk8Vm50/kqnMtU=;
        b=bSPF5su0bLtHaKZQg6MqGtIXpuZhEEoY8KWgbBPi5Kgwf6WKOghjG4vOHYi7BDJ+bJ
         9wEnLJYuO3UcKLtHU1lVoDaOn5+UBxYYIVTeBCAG43NOqAmN9NDSkzXDEWYM64oqXQm6
         Ko0/ZCb9L/0aIflvQDJJduxhcKcPLRbLeiytEXRcmXLwSWj6WRryXstNdPnMs5KdK8rU
         WAc/8oE1HcCXrQVW1UIJKUhTQXH/tVFAB1hygQMiPTpEf4eQ+ROyCqo6a0n1rpZbBTMb
         IMThGvq8usjsnNNSLBT7Er1jciAuNdlZgcj8fA0lfkSWyHRvNVndf4IJjTt1R9q22I/h
         XZ6w==
X-Gm-Message-State: AOJu0YyT/fND/Qjx4dpnYdJ5fWf3073dXL4TiVXfUW1clNZXEb4k4vWe
	ZLv1v722bM9T4p+SmcDzAVcKRLJcVBUDEg9qD1XnYqr0nz7aHh4U/t1PHUYl9v6SXB40ytjyT/c
	qGj30ClY=
X-Gm-Gg: ASbGnctO/TYZ6YHNvdlEMOET+cuTVofZawPqbdHIdYAVkjYpaqS8X2AVvB+dSDcvU6J
	i0+xzriEnWO3JD1HewkmtIr3fiwMb1pgAnOwYXEBhZN0A8Cisp8SAhtYRDzFUXp1+EEbcBSSiZJ
	ytM+m1QshKalRE7/gLzpLQC3sRT4DSmtcB1D0Y/Il3OBnmOH6hJBnwyuT6/7c5VR7yrUe7gfsPl
	E7hfRQYsotRa7NiKR2gKA6NaPse2iZ1702Vh4Tw7L5raZhphEjXglVBIsTAqrnm8VNBWXMsPxS6
	M/RJZdpH/werq5J8G/l/aPG2N+IXjIyRwS4ikzrx5YK4UDw4HoUCBiuxe8qrIwE0ZCtRQyl8e3L
	CC9Uio0IxzQq9hYkRaRAj/s3Lh+IPNzj8NX6Ddl0T1Lp625sTjc8rzHy7Duvpo4ZdDQ==
X-Google-Smtp-Source: AGHT+IHG/kDbLGVUIkVls/+rna+oLJUyUMTAVWYiYooqdUIJjwYY+3XXn64YzRTtQRparwF88DgBkA==
X-Received: by 2002:a05:6a20:7344:b0:309:48d8:cf0a with SMTP id adf61e73a8af0-334a8649ed5mr7527113637.54.1760733858738;
        Fri, 17 Oct 2025 13:44:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] cmake: fix CVE-2025-9301
Date: Fri, 17 Oct 2025 13:44:02 -0700
Message-ID: <0aacc4298f2cdaaf6d19a58e6e134b6a6ecc5097.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733724.git.steve@sakoman.com>
References: <cover.1760733724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225064

From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-9301
	https://gitlab.kitware.com/cmake/cmake/-/issues/27135

Upstream-patch:
	https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cmake/cmake/CVE-2025-9301.patch           | 71 +++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.22.3.bb   |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch

diff --git a/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
new file mode 100644
index 0000000000..08137ae503
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
@@ -0,0 +1,71 @@
+From 37e27f71bc356d880c908040cd0cb68fa2c371b8 Mon Sep 17 00:00:00 2001
+From: Tyler Yankee <tyler.yankee@kitware.com>
+Date: Wed, 13 Aug 2025 15:22:28 -0400
+Subject: [PATCH] foreach: Explicitly skip replay without iterations
+
+As written, foreach loops with a trailing `IN` (i.e., no loop
+variable(s) given) lead to an assertion error. Handle this case by
+exiting early when we know the loop won't execute anything.
+
+Fixes: #27135
+
+CVE: CVE-2025-9301
+
+Upstream-Status: Backport
+https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8
+
+Signed-off-by: Tyler Yankee <tyler.yankee@kitware.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ Source/cmForEachCommand.cxx                  | 3 +++
+ Tests/RunCMake/foreach/RunCMakeTest.cmake    | 1 +
+ Tests/RunCMake/foreach/TrailingIn-result.txt | 1 +
+ Tests/RunCMake/foreach/TrailingIn.cmake      | 5 +++++
+ 4 files changed, 10 insertions(+)
+ create mode 100644 Tests/RunCMake/foreach/TrailingIn-result.txt
+ create mode 100644 Tests/RunCMake/foreach/TrailingIn.cmake
+
+diff --git a/Source/cmForEachCommand.cxx b/Source/cmForEachCommand.cxx
+index dcb36265..35b59960 100644
+--- a/Source/cmForEachCommand.cxx
++++ b/Source/cmForEachCommand.cxx
+@@ -100,6 +100,9 @@ bool cmForEachFunctionBlocker::ArgumentsMatch(cmListFileFunction const& lff,
+ bool cmForEachFunctionBlocker::Replay(
+   std::vector<cmListFileFunction> functions, cmExecutionStatus& inStatus)
+ {
++  if (this->Args.size() == this->IterationVarsCount) {
++    return true;
++  }
+   return this->ZipLists ? this->ReplayZipLists(functions, inStatus)
+                         : this->ReplayItems(functions, inStatus);
+ }
+diff --git a/Tests/RunCMake/foreach/RunCMakeTest.cmake b/Tests/RunCMake/foreach/RunCMakeTest.cmake
+index 15ca4770..acfc742e 100644
+--- a/Tests/RunCMake/foreach/RunCMakeTest.cmake
++++ b/Tests/RunCMake/foreach/RunCMakeTest.cmake
+@@ -22,3 +22,4 @@ run_cmake(foreach-RANGE-invalid-test)
+ run_cmake(foreach-RANGE-out-of-range-test)
+ run_cmake(foreach-var-scope-CMP0124-OLD)
+ run_cmake(foreach-var-scope-CMP0124-NEW)
++run_cmake(TrailingIn)
+diff --git a/Tests/RunCMake/foreach/TrailingIn-result.txt b/Tests/RunCMake/foreach/TrailingIn-result.txt
+new file mode 100644
+index 00000000..573541ac
+--- /dev/null
++++ b/Tests/RunCMake/foreach/TrailingIn-result.txt
+@@ -0,0 +1 @@
++0
+diff --git a/Tests/RunCMake/foreach/TrailingIn.cmake b/Tests/RunCMake/foreach/TrailingIn.cmake
+new file mode 100644
+index 00000000..e2b5b2f2
+--- /dev/null
++++ b/Tests/RunCMake/foreach/TrailingIn.cmake
+@@ -0,0 +1,5 @@
++foreach(v IN)
++endforeach()
++
++foreach(v1 v2 IN)
++endforeach()
+-- 
+2.35.5
+
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.3.bb b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
index 04a0f0e793..e5e279c07f 100644
--- a/meta/recipes-devtools/cmake/cmake_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
@@ -12,6 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
     file://0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch \
 "
+SRC_URI += "file://CVE-2025-9301.patch"
 
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \
-- 
2.43.0


