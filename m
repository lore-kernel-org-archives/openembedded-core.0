Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AF1C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 13:23:15 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.50422.1747056189694886209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 06:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=M3xLR+28;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f53c54df75so61069836d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747056188; x=1747660988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6NY0ZyMXHdih+pfSGeSVTzyrWd5NT5KjN0OoLORbBY=;
        b=M3xLR+28hXfFCSoqfZqskQnB/LxmOoXGFOXpZItEzSvIxdzMLWXAcHcKAlDkhGPWZh
         Eu83yl0Mcw0QP0jqCoUdxsG2R0s24N+zoahyeYLuJyeeRIyJl9L/sfDdJc0rP4gsmepz
         OHvGgNqaVF76o3sOl/jnVSjHQXYQgnMV5n8NDzZsJiEz6EO4wNXTlr7J2rtYzcRX3wkv
         tV8/MRViqiErjhVYkrY8N3VCoApHiJWnRpxCyLGckr7Sq3gKXPFm8th+5FjLNiiysXD/
         xGBA5M3qydzClm5DXkBJOFZele/TcBVd6kz53CHtzltM4eJmJdf4gPbq0iQxmaHLfOIL
         cwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056188; x=1747660988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6NY0ZyMXHdih+pfSGeSVTzyrWd5NT5KjN0OoLORbBY=;
        b=wzpwlUDo9+B6xuMOewknjJkig0OdWkWmx7bR2q/QbEfxx46FOiSxRaEUQz81OlOdaU
         jKA+/xfvMgxXAsHMYGSWz7D0/9tplFX57/lZ8oDEuPZk3wIFRWYETX61f6T7JZD3nZZE
         IOLcp+WmLj/TS2OlA1NxU+f8d1xaeOMV9y0qolkHgij91c2rau2hWJpSr8glH8BTt/K0
         YSH2gHiKtdDImgpACztFNR1fJe5C4Zvs+xKJPwjqv4OdxojoN+mu8TktWNZh6LXXbjNH
         kHyycFhS8ykHmOM8PFHfgKxbrS2jY/8CMhhLACeklLy6727SzWvyDd6i/UFRewCTJ2nD
         cHFw==
X-Gm-Message-State: AOJu0Yxu4hQU5V+u4mibnLgJI6/yWAnylCeNZJm/KsDGVsb4znNET0XM
	m06oP8BZ8C0o2zaFeavraWIQ0yTRGqGBKdbBjwe3xsbB6G7eSNKA7p+AheMQJL9gx29gvgeMhZH
	3gBc=
X-Gm-Gg: ASbGncucjESziHuZfHOym/2FDnW07xew1SI9QBMjBj+1IBNUh5epI8IjJT0hp9eTZPq
	r66uCOdwaax754OY16bKp8xfFcWNwySnHFgL36brKwe2hGBwMdbb46SUXAdZGuHNd+g9PIW6AfG
	pF0UZ0aiQTwzgpFTZ9hQlg6JCtOHzq0pqVqC2dLbiwpHpZajMkr0P1dsbbauUVIGCrqqlrxIU1l
	yF7pqste1d5fpEQeFJTzN0msGIcrxkRSfFdTyGfnL/lDkBzOxMO9vdNmyrYBYPOmvSkfHrEniSs
	RWwxwPxlEcEsBC3RsMSPY3/55ndbMBPA9BBCxg8IR7xCu1figxVfEv6mxj2itmAzAYm11h1gYDI
	21KyDDUChM6g=
X-Google-Smtp-Source: AGHT+IE2xgymyi/NyEL8RXkAeReioiKuRngE2+7FD2wDFgDsTOjmnAZ+JIa7ivGfzPnsrpvybmjx0Q==
X-Received: by 2002:ad4:5d4d:0:b0:6e8:9d00:3d67 with SMTP id 6a1803df08f44-6f6e47a9230mr243082236d6.15.1747056187576;
        Mon, 12 May 2025 06:23:07 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39e070bsm52761366d6.10.2025.05.12.06.23.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:23:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3: upgrade 3.13.2 -> 3.13.3
Date: Mon, 12 May 2025 09:23:05 -0400
Message-Id: <20250512132305.3578803-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 13:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216369

This adds some security fixes and many new changes to the library.

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-3-final

Modify 0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
to remove 'test_types' from the pgo-wrapper call, since that fails now
under qemu.

Reproducibility looks OK.

ptest results OK:

|== Tests result: SUCCESS ==
|
|29 tests skipped:
|    test.test_asyncio.test_windows_events
|    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
|    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
|    test.test_gdb.test_misc test.test_gdb.test_pretty_print
|    test_android test_apple test_asdl_parser test_clinic test_devpoll
|    test_free_threading test_generated_cases test_idle test_ioctl
|    test_kqueue test_launcher test_msvcrt test_startfile test_tcl
|    test_tkinter test_ttk test_ttk_textonly test_turtle test_winapi
|    test_winconsoleio test_winreg test_wmi
|
|9 tests skipped (resource denied):
|    test_curses test_peg_generator test_pyrepl test_smtpnet
|    test_socketserver test_urllib2net test_urllibnet test_winsound
|    test_zipfile64
|
|442 tests OK.
|
|Total duration: 2 min 48 sec
|Total tests: run=43,896 skipped=2,268
|Total test files: run=471/480 skipped=29 resource_denied=9
|Result: SUCCESS
|DURATION: 169
|END: /usr/lib/python3/ptest
|2025-05-12T12:34
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adjusts the 0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
file to remove test_types from the test list, since that test fails under qemu
now.

 ...e-use-qemu-wrapper-when-gathering-profile.patch | 14 +++++++++++---
 .../{python3_3.13.2.bb => python3_3.13.3.bb}       |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.13.2.bb => python3_3.13.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 508754286fd..39b62f6f26b 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,16 +1,21 @@
-From 701720a5bab5b42fd7520fd9dd95fd2c7e42c186 Mon Sep 17 00:00:00 2001
+From e7a8a7385f561f214054cf95f0a22bfa064eee0b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Update to remove test_types from the test list, since that fails under
+qemu now.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  Makefile.pre.in | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f9932dd..be1b9ea 100644
+index 3bd4495f95b..8e8fc60bc76 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -751,8 +751,7 @@ profile-run-stamp:
@@ -19,7 +24,10 @@ index f9932dd..be1b9ea 100644
  	# Next, run the profile task to generate the profile information.
 -	@ # FIXME: can't run for a cross build
 -	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK)
-+	./pgo-wrapper ./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_types
++	./pgo-wrapper ./python -m test.regrtest --pgo test_grammar test_opcodes test_dict
  	$(LLVM_PROF_MERGER)
  	# Remove profile generation binary since we are done with it.
  	$(MAKE) clean-retain-profile
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.2.bb
rename to meta/recipes-devtools/python/python3_3.13.3.bb
index 8e16ce90dc2..6839d28e191 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.3.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56"
+SRC_URI[sha256sum] = "40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.39.5


