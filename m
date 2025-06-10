Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B94AC677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:48 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.90710.1749571782941812637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a4WKhlg+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso3054807a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571782; x=1750176582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+tsYhe4tjn+K8Tvitsa+bkYLWApXmO2atUXQaa1kkU=;
        b=a4WKhlg+vWrKVT1yuIcC1Jn4fIEyGoDmR+Q6+7p1eW5fs13UF3GMwe8KG/+UtxfE9c
         S7cudRX58WVmwhWSyg2SUIyaZQS5RvLUhPeY+mIJzyDTmpKASZvizn79Yo8K6uKD5oG6
         VQwh/D190XPd+og+G1XgYapOsuKn8bW/zhUBkK3+nzdxI3JgA/1n3u3Fx/VQevGqBM+E
         t4bkFdQ4dxzCYbSLmWHSRkuRBKjbNR7bxjEvKKZfb0mCShd69E8OCIiF2ww0SpLRoPUK
         9SwPZdheq5XuruQxk4I/5UEHQILxqETLm/Xz0QzUh7E8t6wB7eBSQ/EZTUAtN5/YeqbY
         R5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571782; x=1750176582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+tsYhe4tjn+K8Tvitsa+bkYLWApXmO2atUXQaa1kkU=;
        b=mefMYdE53p44T20IoOzbHAwnfWBamIDBGmQ+PmNMIM6kuipMq+lRi2iBUDFGo2Yc18
         vz7fg0JvytAWSTUCBe/Z6wUjVrvc+XMTm5XyL5MXyJL/iMz63Di6sCRaxQarcbp2RT50
         6yxET+lcAKZFok+ubhlstWPgZtgBeiej7QeDbdRkeQGjoY0LT7+GvkUWdwpALLWbm2Kn
         mUkc9xQ49v1+eesgsFblaqBZJOpFoAFR44s8m+Dkd00uvxggwijHjHG+mGy/KSnDDRAA
         Y0BkIDY7KjijViwJbbeqO6dA+cTKAGJAMBaQbfuukPUhYNaWCH+CbPeFiJdCTcnWCFkq
         Widg==
X-Gm-Message-State: AOJu0Yzlu9MaYVffJH8Wx2l5064r8v2NxLjuVLsyWc1awB8dY5rO4DAm
	dBAMhxRBl9NDJehWlJQSJbYeRWbV8wxL50dpXMxJ40L/sBVho+AFug33F9FuSx9kDQnMLvvvN73
	2e+m2
X-Gm-Gg: ASbGncsD2h9z//tUZAyxDFeS+sRMoZshASbJzszW7/vIjCax3Q/HFRi1uvLxIJnngJJ
	7KpGSEyHo6tHbXpoiiKq1h6GsPLOYO9ZDY9FAjrQvc/ZYerUjedBsF5eFmLBMkrso6lk04xR6dx
	1RXwboYctyqR7I6dxsiz9gf4DbJoNGv0NDnnKTORoKTLLf5FZ8d55MyMc3PYF//khBaxlBghlOw
	ByOAh4FLpizWsKKfXMRTj9k787So2bu2zimyjs0Z1lj0WpJLa+g7BwCbYhJFvz5+qBK0DgyXwIQ
	cGJBcIXsx8pI43haovZY338D0MDPYoHmHqOGZOTzReisfpYhiLUdHA==
X-Google-Smtp-Source: AGHT+IFgpt4T1pNdQab4hQkih2zSc5um8ck1Aa86EgrG0up0yxvDVO60JhgHRnUqazsQIiKAFH7UUA==
X-Received: by 2002:a17:90a:da8c:b0:312:ea46:3e66 with SMTP id 98e67ed59e1d1-313af17c802mr218163a91.21.1749571781912;
        Tue, 10 Jun 2025 09:09:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 31/32] python3: upgrade 3.13.2 -> 3.13.3
Date: Tue, 10 Jun 2025 09:08:44 -0700
Message-ID: <6587dc1fc62de79c4599761af59ebd385244cb57.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218400

From: Trevor Gamblin <tgamblin@baylibre.com>

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

(From OE-Core rev: 063d5a5fb2f71b523f378b95167553b28804c3ad)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-use-qemu-wrapper-when-gathering-profile.patch | 14 +++++++++++---
 .../{python3_3.13.2.bb => python3_3.13.3.bb}       |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.13.2.bb => python3_3.13.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 508754286f..39b62f6f26 100644
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
index 8e16ce90dc..6839d28e19 100644
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
2.43.0


