Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F54CAC59C
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.41405.1757580699945293953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KhqnLU2L;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so4037255e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580698; x=1758185498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vN93Obe/xQMYxbtVn7gO36rEoj2fE/PgN8kbVmpfZZY=;
        b=KhqnLU2LgAnbvuZWKMbdPlsJLXSsJqtVYNT4RVfaB1iYiE+ddKUV6wHIqq0kcX/gvq
         o0YPOI+b8PXX12NIF78uxDBpGGBnbgXTKzzpUKFA0tNPtYK3XO8+bhrHLeNYW/xKgIjv
         iDaIeFP8eRvjC6Oks6EKd8oZ6g/gTv5dc7n46o3Qrq1lqdK9n9e6iCbzw1bP9imThyHM
         cV4Cw/cFTG7mY1TU6VOAekef89uW9p8s79526X4wkcedleEeEnQ8rnRUA+3qGtcqGTFA
         1Y2zYm0MtKf981LY1J5kL7GrgO1lC8zr6aQVtnW1MTQ8VzBGYTdf9SsZrJg7Ggpjbrhe
         MHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580698; x=1758185498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vN93Obe/xQMYxbtVn7gO36rEoj2fE/PgN8kbVmpfZZY=;
        b=wUfXVmwR6DucdmfOOalRY+2NUkM0xfCaOHFZIUNlq3q2TiJfLPXt9WpzWpQtyUaeyD
         w3kAvYOCi4CCCNSSpirKB/RYvU+trzpHb9hE8gwQPoyX0ne6TLIWBrwexMxLAxpcFhS4
         pJlz7vBkrzSs1rGm8OpeMqceuxE2rkSZHY7evwn3dacNMxkrxm9RdGNEEQwnLXKTKhRI
         Kx5mNeAzFeDPJxkX1TNnqM4+GhNvv044peY054F63Qky8LPHEMkftPmaA6CAp21T1g6+
         T/NQ8BPgcAul30KRW26ezl9biS3FCdI0/XhqiLU5JjmhGW6mB7aQWRLT8rUfkwiz01jp
         OSzg==
X-Gm-Message-State: AOJu0YwmqmU8DWRIv/wLxUUdGnze7GOAX1SNVgfDOVfPa6XqFTSQ/673
	uPCwuKyid0ndgKGdSAKvxn20AycYYmV7hEKQ2Hb6PKP4Zx8ICmRsWG8MDUkpeg==
X-Gm-Gg: ASbGncviWZkerTNw7IpPU/lHrGovt9+jlWCdUt7B2ssi/5ihSnaRF6PlFwCbqf8GKdG
	ccYBXdiBjMpOSbVr5P/okEgCjjEvAGccO5kcYHu8IMo9E5tg3FfHAwZTW44vT6KGFRT3EVIvp1f
	7TMu9xuIuc6KmfVFWjUTHy0VVQKyPGL//Lxz8lUN/n2v8XkaGg0FMhJqfdBGcAUbIKWPWxSfoYD
	t8zVUFwfunhK+ujATN4r8ea1JxVavVHqzCYQYlawURTWlLIHf6zGmUQnC3yl/aQHBimXOxXHQxq
	M1a9sW1i3hplvomU86YcdD9usm76ROZqSzWO9hpj4krgH/uMTj7WQa/cagV5TAjyH4eYnf/WMzG
	KnfFPgQxGs/EoxSWLNkyrao99DKZZMp5AYrhzkUnXlC/zqpfSmsT42X3qqVoAvZIe+KOxqviXsq
	T38FGf6OdKlm+icPyJzKHNoe+xudR7y9rS0yaaxjPb/TtA7mcKM2XrHve/7U/F0M4Z3ZRxwHYOs
	CdMRXc=
X-Google-Smtp-Source: AGHT+IE4qKxL2xwDphelzo1vm4Xsxili/CuEkY7DUA6M1oZzrEhP3tZnS9/NkFm3U+GXSHRHpuQNwg==
X-Received: by 2002:a05:600c:3e1a:b0:45d:e4d6:a7db with SMTP id 5b1f17b1804b1-45dfe9c6a1fmr19065725e9.5.1757580698224;
        Thu, 11 Sep 2025 01:51:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/16] python3-pbr: update 6.1.0 -> 7.0.1
Date: Thu, 11 Sep 2025 10:51:14 +0200
Message-Id: <20250911085123.1551425-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223254

From: Alexander Kanavin <alex@linutronix.de>

Drop 0001-change-shebang-to-python3.patch
(the change is made only to tests which aren't installed,
and probably isn't necessary to begin with as upstream
would've fixed it already).

Merge .inc into .bb.

Switch away from setuptools3 as pyproject.toml now exists.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-change-shebang-to-python3.patch      | 39 -------------------
 .../python/python3-pbr_6.1.0.bb               |  4 --
 .../{python-pbr.inc => python3-pbr_7.0.1.bb}  |  6 +--
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_6.1.0.bb
 rename meta/recipes-devtools/python/{python-pbr.inc => python3-pbr_7.0.1.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch
deleted file mode 100644
index 218add1778e..00000000000
--- a/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From df0a8c56f03004738599e06a7b5a1d2b67189848 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 23 Apr 2020 09:28:58 +0000
-Subject: [PATCH] change shebang to python3
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- pbr/tests/test_integration.py | 2 +-
- pbr/tests/test_packaging.py   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pbr/tests/test_integration.py b/pbr/tests/test_integration.py
-index cb4b5e5..4cbfb19 100644
---- a/pbr/tests/test_integration.py
-+++ b/pbr/tests/test_integration.py
-@@ -171,7 +171,7 @@ class TestInstallWithoutPbr(base.BaseTestCase):
-         pkgs = {
-             'pkgTest': {
-                 'setup.py': textwrap.dedent("""\
--                    #!/usr/bin/env python
-+                    #!/usr/bin/env python3
-                     import setuptools
-                     setuptools.setup(
-                         name = 'pkgTest',
-diff --git a/pbr/tests/test_packaging.py b/pbr/tests/test_packaging.py
-index dddf7ae..bec03ce 100644
---- a/pbr/tests/test_packaging.py
-+++ b/pbr/tests/test_packaging.py
-@@ -219,7 +219,7 @@ class CreatePackages(fixtures.Fixture):
- 
-     defaults = {
-         'setup.py': textwrap.dedent(six.u("""\
--            #!/usr/bin/env python
-+            #!/usr/bin/env python3
-             import setuptools
-             setuptools.setup(
-                 setup_requires=['pbr'],
diff --git a/meta/recipes-devtools/python/python3-pbr_6.1.0.bb b/meta/recipes-devtools/python/python3-pbr_6.1.0.bb
deleted file mode 100644
index a58b491a825..00000000000
--- a/meta/recipes-devtools/python/python3-pbr_6.1.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[sha256sum] = "788183e382e3d1d7707db08978239965e8b9e4e5ed42669bf4758186734d5f24"
diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python3-pbr_7.0.1.bb
similarity index 74%
rename from meta/recipes-devtools/python/python-pbr.inc
rename to meta/recipes-devtools/python/python3-pbr_7.0.1.bb
index f08d9fd3819..6878fa09671 100644
--- a/meta/recipes-devtools/python/python-pbr.inc
+++ b/meta/recipes-devtools/python/python3-pbr_7.0.1.bb
@@ -5,10 +5,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
-
-inherit pypi
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-pip"
 
 BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI[sha256sum] = "3ecbcb11d2b8551588ec816b3756b1eb4394186c3b689b17e04850dfc20f7e57"
-- 
2.39.5


