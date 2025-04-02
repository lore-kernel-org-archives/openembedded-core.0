Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8696C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 08:50:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.3252.1743583841566302280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 01:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Acm15ujd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3996af42857so403307f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743583839; x=1744188639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3mk62VpxFAioCQ2Kzt7DCl+KOB1EBVPE9fRPKgGMKqI=;
        b=Acm15ujdsNhb2eme7T0ndS/VpD7jyKJRRzU6haZ9bOxlJq30nP1alCFmywH7Dbdplu
         Mwgr6LtkVmNhCR4HV0Lfg64lVOg5Eomtt7KYw75Rgb6qGlp4crxmHOAJdfSXCHdiG3tc
         GFaA5DwNX0wNVwGxYKtY3XuWidzJluYw/1BHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583839; x=1744188639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3mk62VpxFAioCQ2Kzt7DCl+KOB1EBVPE9fRPKgGMKqI=;
        b=OIOK3649tiuTpQPy+AeqGM7okRINpRxx9PhlLbXxzjP8MYEYWgWc2Fyyj3mQvTM/M4
         VamMWRpzm8fRXk+1W+YXVCzGl+0pV9xmA+HQYjD9705nPci6l5TM/V13JwDQH4cZWhXS
         tWpnXy4s6MqiOlRk/R46z7ce7mckcblpI3vAG1IRkxNq5MxSTOG86lZz0YklbHlRKQwg
         Yl7FAo4g+zHcePkkeJjdIkQ6OMum7fQ0heHnm+Xbf7eUaayKqChzL4RAPpmULxSk2NB0
         i6s21EgQjsbhUJXr7Z9NUq1tgwxnNGjYZy1qObzBpXSWpUeemB4dNTX2TZas4wvGS7Fl
         0CMw==
X-Gm-Message-State: AOJu0Ywvc4zTpn9Y8KaWnPb0md70xOfT42uO9MO0eMjmHi1qxQ6LILrL
	KRunKLHlG7j/Q4NSZ/LvMDVERw8sTkgyozwqsJCu9cUD+97JXE5HCrypkclhr/hvv1E97RBtxqc
	A
X-Gm-Gg: ASbGncvxKE+2aGIv47d6EI+4hx+aWiIeiBQJMTdQ9++B8fLf7+OaSBWjrYF/cx/38jf
	/uTl4xEW//LbHrcaP0UdkDmtHS+EVsOMQhz9k2EbNTQXjbieH8mM2BqIl3vrQtfhuw9xdZ7t78y
	MHmMin/dE0xSk1IoeGk/EUgXWFWFHoxxwlW4rwOu1xfQU/LZsJRLlYjdEiPC2YMBj4zLFhmaGW6
	xnZl17YV73QP0izu1J3ara7+8hlyqjMXF45HEuEDFlWqo21E6zyYTZwLNkM8mEBC6leB7cfPKxi
	4qPNfSoFYpv8UiEkyz7OeL2V9jL1FBevL4GOHBUHMbOpOZzl8b6cIzH9AeS5ECExSQR7CbkXKw=
	=
X-Google-Smtp-Source: AGHT+IECenda/bsfkAeM8L6tJhds/umd68L1HOc64t4O777bjmGNTjskSdcI7/6I3axlxdE4kjximQ==
X-Received: by 2002:a05:6000:2512:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39c2a6ba93bmr1015691f8f.25.1743583839134;
        Wed, 02 Apr 2025 01:50:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e393sm16558448f8f.72.2025.04.02.01.50.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:50:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] python3-calver: upgrade 2022.6.26 -> 2025.04.01
Date: Wed,  2 Apr 2025 09:50:36 +0100
Message-ID: <20250402085037.2340549-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214231

Add tag to SRC_URI to verify SRCREV.

Upstream improved their project.toml and removed much of setup.py meaning
the patch was no longer needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-setup.py-hard-code-version.patch     | 32 -------------------
 ...2.6.26.bb => python3-calver_2025.04.01.bb} |  7 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
 rename meta/recipes-devtools/python/{python3-calver_2022.6.26.bb => python3-calver_2025.04.01.bb} (67%)

diff --git a/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch b/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
deleted file mode 100644
index 43f8a78ef03..00000000000
--- a/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 390a233ed969f82b2ef209b23bfb523e785603f9 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 9 May 2023 10:19:41 -0400
-Subject: [PATCH] setup.py: hard-code version
-
-setup.py is pulling the build version from the current date rather than
-a release tag or other predictable method, causing reproducibility 
-issues in builds. Patch this to make reproducible builds work while
-discussing this with upstream maintainer (or developing a patch that can
-make calver rely on a more standard pyproject.toml solution).
-
-Upstream-Status: Inappropriate (configuration)
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 73f6b10..2e27cf1 100644
---- a/setup.py
-+++ b/setup.py
-@@ -42,5 +42,5 @@ setup(
-             "use_calver = calver.integration:version",
-         ],
-     },
--    version=calver_version(True),
-+    version=calver_version("2022.6.26"),
- )
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2025.04.01.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-calver_2022.6.26.bb
rename to meta/recipes-devtools/python/python3-calver_2025.04.01.bb
index b2e7e0769df..a05e7872016 100644
--- a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.04.01.bb
@@ -3,11 +3,8 @@ HOMEPAGE = "https://github.com/di/calver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = " \
-    git://github.com/di/calver;branch=master;protocol=https \
-    file://0001-setup.py-hard-code-version.patch \
-"
-SRCREV = "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
+SRC_URI = "git://github.com/di/calver;branch=master;protocol=https;tag=${PV}"
+SRCREV = "5b62e5127f9ad5bb56bd09ccd8c44283a23ddb60"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 

