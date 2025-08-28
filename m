Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C68DCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 10:19:04 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.17471.1756376343184302594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 03:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MiQd5Mrd;
 spf=pass (domain: baylibre.com, ip: 209.85.219.68, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-70d9eb2e655so10279216d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756376341; x=1756981141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1KvAh86ThMZRI/OLZ6oCpIxx/51lTPhs9IHyVqYItI=;
        b=MiQd5Mrd5F6+pBbazHACiu+LQnZZ8iQMV1YWYKq6q71C88qf71YQ61dP5b0nkt++Ya
         X3BL00aqmKG3vtu5082ISb03uVTz1mEK4fKYWtLJ+524JM+JZRx4HMfWoRIJLqF02dT6
         0Txp05T3sBleyM11+keUIet8tCv1w7ihGFVL/9DvUpkSdwTuX3XqUgdl7nB/2mpii9n2
         YVkkVx4l++hOywxch4xjkLABBboNQN26HiXcQj44myKz+D/608F2boqH2k/+FnR3XQW7
         UPo2GucA5wvzmGi79LE0OUFI1Y8Bvys0Kl5jDdOxQ5kb7cCG5MvnQtU7hMwGfsaXZqVq
         VSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376341; x=1756981141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1KvAh86ThMZRI/OLZ6oCpIxx/51lTPhs9IHyVqYItI=;
        b=gEpl3CYhnFnECtejh3OMOLJjfpkaXlzqTcGeZ3zzPE9uQagSLY84/TCpc0MQEuIyqX
         YRqRUyyFtJciKDlcJmXWvpEqpeSh2OMXhXAKbSD5vRl0wRTv6M6boeExUer5pStbnCke
         Qki41JIglSh8p5RvHIBPRu8nrjpI+JqDFHqbBEk32ibt1Vw4ePCcRXLQaKaatDscz60X
         AKtpLAPg/E4WZZx7q1WZY4Vz7usBwDDjvdanQApqNUlszSfyVNpf2lUe4cVjLFF7K2qC
         60H+skA09sEJT8Yj2+KUoTDut0fkrWCSlVx4SY9mwNS5e43OodxMGU7YiYjv9sbTrxjt
         Cu/g==
X-Gm-Message-State: AOJu0Ywt1BAltPq7t/xmKdaw07oKXiXSIrgcYGDxSznq1k9W8KG/vd4o
	nro4a7nTggc/1AtmVIOIglhHIELO5GrFs9qHdZVpkDxGi7mTRbC1KZLQz02yjKrNX1aCnhzgyLp
	c1St/xWF0FXmV
X-Gm-Gg: ASbGncu4j5al29KLcCipIjlJC+ZfHaYlisX2g38mHA1INUtZJtDy9iepUtkwS/8B46Q
	41SEmtUTYsBR5dgqJY5FOY7V1o3mdumQPrWY6nZb2dhxjAxlTeDw3hjvUrSO50nJBf6k0BjsFUe
	REN0EcgmWk0Xng3xlcLBZNg4qqWPpwIvGXCxN0LZcbOf3q67+d3JNI27pPPQUobio8Nk0br6EtP
	pEj9Px+fnlJz7A42SkTIe4BELbKUCihod6s5F8yZ7yteulS91GMi99Al1UX8C22vYvLoK1Q5Kn6
	lzErAqA9WHPRwwrqXpZtjDRy2wyReSl24zya0la1jA+ssXzGmqv68hS2QV6boWL6UduAMCII/il
	ThgGwwFPev8kg7fooSKCfn4s9+lHbxawe7AofzFzRfQFZ7WNmP29UnxL8DNKm36FPxtHU
X-Google-Smtp-Source: AGHT+IG3IjbGHjyeCgewWZC7eW6qpoe/kK0BSgXqUmWidorTaV1/USj3ARrjWhQT8HCyWYZl8aRfqg==
X-Received: by 2002:ad4:5aea:0:b0:70d:d23a:9ea7 with SMTP id 6a1803df08f44-70dd23a9f70mr116083486d6.50.1756376340919;
        Thu, 28 Aug 2025 03:19:00 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b308ba2b9esm46421cf.11.2025.08.28.03.18.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:19:00 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-numpy: upgrade 2.3.1 -> 2.3.2
Date: Thu, 28 Aug 2025 06:18:56 -0400
Message-ID: <20250828101857.3947730-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 10:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222554

Release notes (https://github.com/numpy/numpy/releases/tag/v2.3.2):

|The NumPy 2.3.2 release is a patch release with a number of bug fixes
|and maintenance updates. The highlights are:
|
|    Wheels for Python 3.14.0rc1
|    PyPy updated to the latest stable release
|    OpenBLAS updated to 0.3.30
|
|This release supports Python versions 3.11-3.14

Reproducibility OK:

|2025-08-28 05:50:44,703 - oe-selftest - INFO - ----------------------------------------------------------------------
|2025-08-28 05:50:44,703 - oe-selftest - INFO - Ran 1 test in 1440.103s
|2025-08-28 05:50:44,703 - oe-selftest - INFO - OK
|2025-08-28 05:50:49,531 - oe-selftest - INFO - RESULTS:
|2025-08-28 05:50:49,531 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1400.47s)
|2025-08-28 05:50:49,724 - oe-selftest - INFO - SUMMARY:
|2025-08-28 05:50:49,724 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1440.103s
|2025-08-28 05:50:49,724 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

ptests OK:

|============================================================================
|Testsuite summary
|# TOTAL: 48921
|# PASS: 46457
|# SKIP: 2426
|# XFAIL: 33
|# FAIL: 0
|# XPASS: 5
|# ERROR: 0
|DURATION: 193
|END: /usr/lib/python3-numpy/ptest
|2025-08-28T09:14
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-numpy_2.3.1.bb => python3-numpy_2.3.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.1.bb => python3-numpy_2.3.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.1.bb b/meta/recipes-devtools/python/python3-numpy_2.3.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.3.1.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.2.bb
index ed41d03e6b..7ef353c420 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "1ec9ae20a4226da374362cca3c62cd753faf2f951440b0e3b98e93c235441d2b"
+SRC_URI[sha256sum] = "e0486a11ec30cdecb53f184d496d1c6a20786c81e55e41640270130056f8ee48"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.50.1


