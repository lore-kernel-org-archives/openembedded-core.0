Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1179D72352
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 08:43:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63476.1769157820908150648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 00:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OPlVu+De;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801d21c411so9990445e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769157819; x=1769762619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd7x1K39CXHWdWE90cA+accdmwJW4Er8UT74T7rGinU=;
        b=OPlVu+DefAMSazAR1a8aYsxwdhoF1UKdzgk2waMhGvGkCZJFGB3P2OAJ1Td7E1Qan5
         otSS6t1rBJQUkUfIZRkUiYSDojMlOM7Dbin87ib8eS79x0WBNOMgYvZyD6ZxmFbdl+eX
         Ilub6PZu47/Ou8nkFBWKzFVQDknALWJE8THEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769157819; x=1769762619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pd7x1K39CXHWdWE90cA+accdmwJW4Er8UT74T7rGinU=;
        b=HmE1lov0BY6k5mfFo6MmD2ggwLCqbqye2N6XDoM4sSru3k0LuI6X5cAxw5UnYDOn6I
         OI5enkHEp1/DJOGozD6go06nz0Un546BTW32JDyYvQVosO2mHplHVC4YJSwwXTJuL6+6
         R2TsvwzmG4sdICQ3e3dkMDbuciO1b1edS35GRt/7DNTjtVeAoKJlTLXdH/m2BNpR2HbY
         EEgA4tYTgw5sVdSl5+t53a1poX0+Obw1ao3suD572+ZFYTOZ3BAbah5s55cnWjUC20nZ
         DJjMILry5yFaK5wwldhuK4CdKBIA0A7E6iadGN8YhDEYzj/F773KxpUv1E4aO252Eznb
         jlZw==
X-Gm-Message-State: AOJu0YyrsP5W/tuUgEYUdRbMnA9X26cAnyt5mAXt4VReVrjFWyVBLmzM
	H/CQLo+GSvx9x393XtBiohOUiJXiKqrWIqSjo2fcCrj7taRbGjhv2avgM7Mo5ZqGQSrO/+8CKYp
	70Bt0
X-Gm-Gg: AZuq6aIY7kBsrDWVbldb3xM7V9ymf3OARsczE+AwXDGGBObvLO1fTya/9G1BzM7naZu
	3R3RteRBnov64eZWdfLeYU2FShGIr8vfIsfYyIefaaJNMvlPmdCaFEUDYBeiT+nGwZoss4xk6IO
	T/vPNTO/YarOY0sSvdjqZPK09sUBZYCa88xESNAKTXs4RfQVyuRU5szzZOt71mfzQU8OyVg4QX3
	E3H4WfadLA7tptat1PYxbfN90EZxz7Ca2efO7HmfVHktmVleS4Xa2Ik+zeB+qcMYTNConiv6Dae
	Csnt2h8fi0MPRib+6kRml0A26dMDObQLjjfMKVOH7egBVA7CnTlOUv6d1jI6i4t+aT8d6SddoC8
	vma5kOJGl1PzEuVUJ8EjFGWMsT72llE7lGpFF7mTLbUMQS8C64Gqi5YMlK2/BisHzqXtCatxBjU
	1Aa3Bp6b0J876jwWxIU8afixaT7oulw6u9/F4=
X-Received: by 2002:a05:600c:4e05:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-4804c95e02fmr36696755e9.15.1769157818582;
        Fri, 23 Jan 2026 00:43:38 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6939sm15275455e9.5.2026.01.23.00.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 00:43:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 1/2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Date: Fri, 23 Jan 2026 10:43:34 +0200
Message-ID: <20260123084336.3061764-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 08:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229876

Upgrade to release 0.19.1:

- Fix SeekableZstdFile write table entries on 32-bits architectures
  when there is a huge number of entries

From release 0.19.0:

- The project has been completely refactored to use the Zstandard
  implementation from the standard library (PEP-784)
- The refactor has some minor impact on public APIs, such as
  changing the exception raised on invalid input
- Add backports.zstd dependency for Python before 3.14
- Changes in build dependency: remove setuptools and C build
  toolchain, add hatchling and hatch-vcs
- Remove git submodule usage
- Drop support for Python 3.9 and below
- Use ruff as formatter and linter
- Embed type hints in Python code, and check with mypy

All ptests pass following python3 upgrade from 3.13.11 to 3.14.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...emove-setuptools-version-limit-of-74.patch | 27 -------------------
 ...std_0.17.0.bb => python3-pyzstd_0.19.1.bb} |  7 ++---
 2 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
 rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb => python3-pyzstd_0.19.1.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
deleted file mode 100644
index f2910322ff..0000000000
--- a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Apr 2025 14:38:31 -0700
-Subject: [PATCH] Remove setuptools version limit of '74'
-
-Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
-support beyond that which is needed for python 3.9 on windows. We
-do not have this problem on Linux
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index dd885e4..5d4d511 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- # setuptools 64+ support --build-option
- # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 under Windows
--requires = ["setuptools>=64,<74"]
-+requires = ["setuptools>=64"]
- backend-path = ["build_script"]
- build-backend = "pyzstd_pep517"
diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
index af7069b6ed..a41c16682d 100644
--- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
+++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
@@ -9,10 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI += "file://0001-Remove-setuptools-version-limit-of-74.patch"
-SRC_URI[sha256sum] = "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
+SRC_URI[sha256sum] = "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d586937830a8afc7d72"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
+
+DEPENDS += "python3-hatch-vcs-native"
 
 # clang-16 with -flto segfaults on arm, therefore ignore flto for now
 do_configure:append:arm:toolchain-clang() {
-- 
2.47.3


