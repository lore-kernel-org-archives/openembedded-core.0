Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4407CA6CBE
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:18:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6600.1769505525139092534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BpDhCF+j;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43246af170aso3089968f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 01:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769505523; x=1770110323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZxcTmhe+AgfDHZp7+OCh3rQiMlBff94q/jn76Gg5fk=;
        b=BpDhCF+jMspPuWX4sSIkCInlxuIYPfrGH2najnp/yT3q+jZ5AEFiD9vfvV5NEKBLIh
         cuMxFv6SL6ftzAUK4lCe2ejaVnxU0pc844xl4ZJFK4vaRHZGBKdb73YLZ6sQSCNLjzIa
         SlQXgB9duYFfs6MzwmI9UJ/upprb/Nx1QQVls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505523; x=1770110323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZxcTmhe+AgfDHZp7+OCh3rQiMlBff94q/jn76Gg5fk=;
        b=EScvBTG613XtUwv4qNwHGrAaJ4tdJkAJQsC4Q2lL2IfkL+jV1IicbN9NhwgOm/WTFb
         k8gLEqqfy9szNqUppukIMn4LIn6/CPJt9uVsFcDiZU1jIuFNOTpPWrQ8IyDIbzbPykMo
         JrzRFXzo4RxARzV0/pqasYPB6+7aVdGofJeS6aDfTU8pvcF5QcLEQJUjLcb0TLeWykbS
         1ammTC5+phhIltgy3OMzFpTQ0wJxvHndlTTvUO0R2EGwhL/yDRWmjIVpoRVZ5IUk3tuz
         q1REX698i0DM5QrpukYT0TF3TT5aS8It8r+IzHuis+xB7FSZEfAg1wgFMTWW7McV32MS
         F76Q==
X-Gm-Message-State: AOJu0YzI1B96MMdPhcYf37Wb9GL32JgVGF2oxxDCUsm8xK/I48nOV/Hw
	gYntb0zCwcL99QKyHN+hVkmIFS2ZRNzX7DVR3UvYCbn5XFYNljT4n/U1E4JPgpd1yPBgqu9s2DW
	2QY3H
X-Gm-Gg: AZuq6aIeJggRhX7f5SJea3F6pdzGnLPaz87EDO7+90nfoHDz0flU/FbRoWiam5BdfE6
	V5PFCbc3DlGcVAnxkiH2e5L8PKh+CgQaUNAD/ZDohe87/m/yD/aGZgKUx+xzW2qc/m3NTteXFw9
	kQ3HOs7cShDskzO/i6EhV30rHjuPCr8isK0TV9ENeDNUnWKWGaQwYdpwEa0eAa9DvZ7t+RA3iBf
	Z0sYs5J5D2BXLauxwYGiRtxIyNhvppEK2C+9KETvgAULmMzKI9vSmJCc+ECktvBeZSQZmt1PHxo
	u25SXmt2XDxlc6PCFsEl48mSOq9m1pZ+Y3DWyw6JekRxcl0Wto6xqEgrL3nTmxOtyizGdIFfWEh
	B/afcW5GqzrQThpk4Mb0leAmW1AlsZvrYaTHHbHraS3Geh7uVDMDknIwgl4sxg2bqg0EKMQ1RUT
	x3paFUn0w/rRpS3/JV+AcLMPqt
X-Received: by 2002:a05:6000:2081:b0:434:304e:9ae5 with SMTP id ffacd0b85a97d-435dd0a72f5mr1372114f8f.5.1769505522588;
        Tue, 27 Jan 2026 01:18:42 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7474csm37677478f8f.37.2026.01.27.01.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:18:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [[PATCHv2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Date: Tue, 27 Jan 2026 11:18:29 +0200
Message-ID: <20260127091829.3500551-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 09:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230036

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
 ...std_0.17.0.bb => python3-pyzstd_0.19.1.bb} | 10 +++----
 2 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
 rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb => python3-pyzstd_0.19.1.bb} (53%)

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
similarity index 53%
rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
index af7069b6ed..df1e4d49d2 100644
--- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
+++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
@@ -9,12 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI += "file://0001-Remove-setuptools-version-limit-of-74.patch"
-SRC_URI[sha256sum] = "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
+SRC_URI[sha256sum] = "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d586937830a8afc7d72"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
 
-# clang-16 with -flto segfaults on arm, therefore ignore flto for now
-do_configure:append:arm:toolchain-clang() {
-    sed -i -e "s|'-flto'|''|" ${S}/setup.py
-}
+DEPENDS += "python3-hatch-vcs-native"
-- 
2.47.3


