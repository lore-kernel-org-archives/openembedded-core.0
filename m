Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EABC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 10:52:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40627.1785754362996146350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 03:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ioW1gWW6;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49558ce01afso15084775e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785754361; x=1786359161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtMWyH1UMMI4yIUm6Kqnd6jf6Kdz4yHOJ1PvZVNmxJg=;
        b=ioW1gWW6lpxA6xiaXiL0hldO0F3aI8tsMrJyc6yyxO6NhnmYSxBgGSIifthXuPn6Fw
         hH4jD1/YgrgBURo09aL0vKL/bfJ13vgetotnEq6K6tTUTOlkwcSrogjN/gQjWWQeq2mN
         flXb//ClxFBREJIDpcBkIomrAvuUuNcSwvpHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754361; x=1786359161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtMWyH1UMMI4yIUm6Kqnd6jf6Kdz4yHOJ1PvZVNmxJg=;
        b=rD6cw9IViGf12+xnhWLZWJRlkBXNE46EFT3ztQqYIck7Q4Bc4Pzm44hPeN8aFPv11Y
         IprOblwF4JPLbp3ExQlKMIRWlGN/zWH7qGElx36BJXQfVhpox72++gHWBll9MQxpJW7L
         oH9t+lkoJsf4mjQfb6LO/m+78hmMS/LgwOEOn+1jzDaJ5PVG3O5gMU7hhIsAnt5oQQzV
         AS0fXXDv/YqRFaXaSVgiEdnjTi6TVkWSiWTDNdYnQnLC6km3T2m3+cCe2eReb6Q7YiIy
         V/Z0XwB3B+K+AmJ5ENuXBG1Mwtny8oYNHgbZsmh3brzv/DinFypOsLAuV45fBhcHSbSF
         HvBQ==
X-Gm-Message-State: AOJu0YxvBEACIoZ7sA5RjxHMDZ/tvPej6IOyhbCekmyrFOmz3UJ3UyqW
	9U+/+Mq9puD0oh7bqrqeWQLMX5yMgWC2vIS8s/xEcyQkhBDcLvy2gXy0Yubx3+isaDs32g8yeoP
	2VUa/
X-Gm-Gg: AR+sD13MrS8+gDJcI+xMOwnCsYYDwd/6B04TKUiMkSzEtzrO4zHG1BTqTCBijA7mnHJ
	5RJzS3GLt35Js62U2FpKtdJC1PcoTrb3gIQuGso82P0/Mb9PfwCLebgBxLMZLpuVOBZwxGqOPB0
	ivAZ0de+U9k4OREZ5vSQx05g5itU5f1pkqWIjH1H9ieGv5ez9PGeGd3Bb1poObYhmhgVQxQLkis
	QxE91ggbb5pNjaf7LVFKHLV5q2w9cLHTMMskcfH7euRyg6pYu75L2hZXXBclzj4vWpl1KpG7y2h
	ZJejHJMYFBnqATFp2K46M3mWgWcA6J5dc7zXeC0soyNR/hJncPr+V/YVglG0FSeSTRiqfyVM3IE
	DUij69x+UAX2Yu0BaeoL6bAbCYK9zkq1MfLgDWyu77l4JndkXAZLtm3jjrkYL5TOwoF6mP+yOD3
	wAdf33GCZ5E22ZK1xKu37G0C4xARjfZpLxNtKFgrLa8hhJDT6pUrtS2+Mpis6mnJrzr9UJuEZzs
	Vx7HKv7EU9ZhrBLsnRXJMpXaj8TKHgA1F/o3iG97Tvrs5qTBrIKkICPXSlGd7lufpfmzcNEfkfU
	AdHwhCR90+0Ru0AtE55pwYBP
X-Received: by 2002:a05:600d:6451:20b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-4980c66d950mr153797825e9.7.1785754361165;
        Mon, 03 Aug 2026 03:52:41 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm358693235e9.13.2026.08.03.03.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:52:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-numpy: Upgrade 2.5.0 -> 2.5.1
Date: Mon,  3 Aug 2026 13:52:35 +0300
Message-ID: <20260803105235.2301438-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242648

Upgrade to release 2.5.1:

- The minimum supported GCC version has been updated from 9.3.0 to
  10.3.0
- Bug fixes

Drop 0001-python-sysroot.patch because the vendored fork of Meson
in numpy has been upgraded to include patches from 1.12.0rc2,
including the specific sysroot fix available since since 1.10.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-numpy/0001-python-sysroot.patch   | 34 -------------------
 ...-numpy_2.5.0.bb => python3-numpy_2.5.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
 rename meta/recipes-devtools/python/{python3-numpy_2.5.0.bb => python3-numpy_2.5.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
deleted file mode 100644
index 681876fa52..0000000000
--- a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ced528318cddfef6c5e676c2815e64b5caa45c64 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 21 Jan 2026 14:12:36 +0000
-Subject: [PATCH] Add sysroot to pkgconfig libdir
-
-When Meson uses pkg-config to introspect the Python install it resets PKG_CONFIG_PATH
-and PKG_CONFIG_LIBDIR. However, when it writes to PKG_CONFIG_LIBDIR it uses the
-_target_ library directory without prefixing this with the sysroot, which breaks
-the build if _LIBDIR is the primary search path.
-
-This has been fixed in Meson since 1.10.0[1] but numpy has a vendored fork of Meson
-that is currently at 1.9.2, so backport the specific fix to solve this problem.
-
-[1] meson 59c3dd1fd ("python: add a python.build_config option (PEP 739)")
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- vendored-meson/meson/mesonbuild/dependencies/python.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/vendored-meson/meson/mesonbuild/dependencies/python.py b/vendored-meson/meson/mesonbuild/dependencies/python.py
-index 7f9bd20..fdcf714 100644
---- a/vendored-meson/meson/mesonbuild/dependencies/python.py
-+++ b/vendored-meson/meson/mesonbuild/dependencies/python.py
-@@ -412,6 +412,8 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
-     if DependencyMethods.PKGCONFIG in methods:
-         if from_installation:
-             pkg_libdir = installation.info['variables'].get('LIBPC')
-+            sysroot = env.properties[for_machine].get_sys_root() or ''
-+            pkg_libdir = sysroot + pkg_libdir
-             pkg_embed = '-embed' if embed and mesonlib.version_compare(installation.info['version'], '>=3.8') else ''
-             pkg_name = f'python-{pkg_version}{pkg_embed}'
- 
diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.0.bb b/meta/recipes-devtools/python/python3-numpy_2.5.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-numpy_2.5.0.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.1.bb
index 43ecdb2c42..88786dc016 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.1.bb
@@ -9,9 +9,8 @@ SRCNAME = "numpy"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "5a129578019311b6e56bdd714250f19b518f7dceeeb8d1af5490f4942d3f891c"
+SRC_URI[sha256sum] = "a48a113e6afea91f5608793bafa7ef2ad481fefbda87ec5069f483de61cb9fa3"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.3


