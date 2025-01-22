Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26CFC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 15:09:01 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.45872.1737558534457346943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 07:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=P/VzQ9zG;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7bcf33f698dso625624285a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737558533; x=1738163333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6gy7p38nAIo+x9ovBfHi7PTNXT3sVP7P2uXisGBT5c=;
        b=P/VzQ9zGsdTp4df2zGAViiKsqsP3IqCRkvlee/RSo0Jp2WkUJJEeY6TfxBgg+Z6hCM
         SEJQVMu7ZbS/7zz2aO0kDcZ6B89Trh3XHwZPTtoe1b0XZPasQ5NJluBmL3S6YqP8eOwb
         ejX3fK/gJfDfD0/ERZh5bZUFzri0LxGh9AKzm8Bq2tbLhEyBZcYm7WZrWX7fm7ZOeeOb
         D6cpUxU+tX+ShMahIyb2trOFPowtWYfZacaGycHyIHqnQBn79PCEoHSAvCNXswOjGaco
         roSNNCPv8YYI8eUeDLMc6QdBy25RP3+mVGYHxCfybizkmGYosGm6F7wfX4rmmY3yJwtx
         EzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737558533; x=1738163333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6gy7p38nAIo+x9ovBfHi7PTNXT3sVP7P2uXisGBT5c=;
        b=KA6veZJNTBf5xekaq8btaLlpjSFQ/B77gUpW+J0yFB+mAu/6TupOx+7c41wo4V6U8o
         6WsyNzhAN/pQytqKw6XrDQHbz/pIPNh0qyTAe9lIuHETiy2W4FqCEVoANcJ9Yctj9jHJ
         R/GGKkKbX30JCo0a5fgHE1rGoelsvrXQZ6IQCdkCvc+6zd8fIQiAvVzAfMGvseruOQo1
         QELKLnvrvMEbket/NBmdTvTkz+cxVy/EaoOD59Hvy7eVdjvFjtG87AbxH+Ft51c09UjR
         30fQwwXP2cUeMkqoXUBwrjvVWBqJC5MiCDS6oNbXMaqm5wBNJPtfr7Mor+sSU7uHj2UJ
         abVQ==
X-Gm-Message-State: AOJu0YzBSOIxCH71T3yjP6R1dOUFs+Ct9ITDOjKPKCGxLlVnj0gUTXq7
	6xwxqGCeXhZDUOKmDBDAQgutiuRz2UH21aNau6e+axA3Oc0HoyNw8QOL8wGGzVC4jZOds/1Yj1e
	wxXY=
X-Gm-Gg: ASbGncund1GR0EAuco3XpWqnbs0992CkXedpkfmm2wdwsJy+hy0GnBFzYMiq+QYXeBc
	xRgNI17EFKixvynkuQpi4A6lQIFOGaI34cL2FlRLZgFxHMWF68km2O33YovV8CXYZpFD5wY9u+S
	EalKjTmokfgvL/m1kdGsmxtN16Lh0uB/6D5R0PGRpt2joNn/9SpvPTmDkFuHOeVXB7WUTS8JIRX
	/eYsXiWeXjMyn+hDKNIX+dYkZamhnG3hvAQ95QdRBRr+nQRKjZw9gqXb9sA3gv4YR3F+d39OVru
	OeW1Hx484zrH0WwZzpRczggyaqNcYw==
X-Google-Smtp-Source: AGHT+IE4LYjCFiLtJ/5u4eBaZynNmK4xe/JeeP296NSC2JzZp8wuTeo1iNrD1Gzeq+yqqSH8jPkm6g==
X-Received: by 2002:a05:620a:15a:b0:7be:82fc:6877 with SMTP id af79cd13be357-7be82fc6c6emr879999385a.37.1737558531700;
        Wed, 22 Jan 2025 07:08:51 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614ef2d7sm668957185a.96.2025.01.22.07.08.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:08:51 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-numpy: upgrade 2.2.1 -> 2.2.2
Date: Wed, 22 Jan 2025 10:08:48 -0500
Message-Id: <20250122150848.3101917-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 15:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210156

Changelog: https://github.com/numpy/numpy/releases/tag/v2.2.2

Reproducibility looks OK:

|2025-01-20 16:40:52,428 - oe-selftest - INFO - Ran 1 test in 2125.833s
|2025-01-20 16:40:52,428 - oe-selftest - INFO - OK
|2025-01-20 16:40:57,146 - oe-selftest - INFO - RESULTS:
|2025-01-20 16:40:57,146 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (2065.94s)
|2025-01-20 16:40:57,147 - oe-selftest - INFO - SUMMARY:
|2025-01-20 16:40:57,147 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 2125.834s
|2025-01-20 16:40:57,147 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/fix_reproducibility.patch              | 2 +-
 .../python/{python3-numpy_2.2.1.bb => python3-numpy_2.2.2.bb}   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.1.bb => python3-numpy_2.2.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 4a673081062..437bafb54f5 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 16a973c118989674afeeda2c2ccc24c9c366210e Mon Sep 17 00:00:00 2001
+From ad6c0196e4c97ca37368610c010e46c90a4749b4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 18d7f3f84e4..514073d94e4 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From cde931f4380745b9818b55d7b06a43d347518967 Mon Sep 17 00:00:00 2001
+From 061a8ae1d1d000892d6dba89a444922e7a28804b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.1.bb b/meta/recipes-devtools/python/python3-numpy_2.2.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.1.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.2.bb
index 251e7b0c64d..3b74e9059d1 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "45681fd7128c8ad1c379f0ca0776a8b0c6583d2f69889ddac01559dfe4390918"
+SRC_URI[sha256sum] = "ed6906f61834d687738d25988ae117683705636936cc605be0bb208b23df4d8f"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.5


