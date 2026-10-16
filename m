Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E42ECCF2C8
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:10:54 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4260.1792184038384970644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 13:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E3oxjpiu;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: oo.hehir@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e5e090746so28949866b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792184036; x=1792788836; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruapmwColnni4KC74UAVrQWnKKeofryTiaonVwGLbos=;
        b=E3oxjpiuLCgqTVQQ2TF6XvXlOtdfWGqDtripIMFH/axmxJ09fmG4sRr3g6Wb5nJAO/
         BX0f2f4bucr2X2HkLzJjI7Z6iOTW2bk5ayR1nZEVrYKHr3zLKYHm9gwsHZ0tRXvzYkGN
         tk9BzTEV3mmmK3m4PCBCyQHltZBvaqkCeBwfKf8XFl3CShRNrklmQlaESMPcQu9l5KH3
         PtDtXBlkIMzA/pO64VryZN6TokzuFDVr2WvdvCBOnPwiNWKD3pq+yC1BCPl9wPBVCeRU
         lg/6lKqPQzS4/7u6P+EcCA/uzf9qQkkHtIg0sbzTif9n1p8lg5v0DvqgEy2SQBPlqThJ
         HIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184036; x=1792788836;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruapmwColnni4KC74UAVrQWnKKeofryTiaonVwGLbos=;
        b=q8K12bAtWvbLaXOOm7JzX/0E1+ER5vt208yU3xZ1IQ/6erpV19hP7DSTGK8I997TOF
         0/XyvX/bjyKuJck6vIfzeLuoLwj2XyC+MnAx8qyyJ8Szh1Gf9oXQ7/04tQAFAQ98nb3f
         MnQ3o9rQV8JkRdwnYQ1go+WGyNjUHEdtZ3U/gHUAXVl3D5PGmBrd2Jdb0W9foCWzniQp
         mACJ2gLy0jB1nkslnXDbDcQtLS1ix1fxP0Hz/zFP+q7U57EujBqz6tyHNjV4Hcmwd65H
         cO4i+DzS8JqZEB7wOzRHnNMpUHfxN1e725St8M3uoeFASZF5RT9TRiQXUkos2vK3PBmZ
         ykXA==
X-Gm-Message-State: AFq9FYJuMMMGyg87z5JETy8FaKWLxPDDzVLX/AcNayc0l6sD+4brnUQb
	1uyPQN8nMSjrzVA7VwI659khUoRRj7iV/cVZt1PQY405n0keaHyF0qP4WuJOpQ==
X-Gm-Gg: AYBFou05DYQor8DiSb4TTdMWwc5UPBUkUfaJ9I8Tm1I3rL5M/KBUVu+f3n6M9BfJmhO
	RXeUo6exuQR+AopMecrdrsD2gsAxU2BHfPEpMGhWNoiakUiHnN0L+rp+oX33wyacJqv+iIs6zR+
	yhkAXnaYH0GEE70CrRy1TAQpYD77qbYO4T2QfTATnfJrb7SponCjSAoW+Tm9UJwyTBmEr25XEpV
	qQn62VCd7xdaRQr7vVDjr48obq7Auff4RpHKCoXn8d3789Ql3PK43jKF0NIgtygz7pYqXtR3Kfr
	OJ0geX4G4hjII+OUZl0E4m74RFlRZn/QTCkZy6R0H2LpDkto7uf24/IIL8rOo1wqf5t1pLa4dmE
	SrNHvZ6OEDHC6Rjz1nvvAitxSBjYOsouwDGr7b2d6mVDoXMUUxYkKFhvWsoAvUnCLZgC1dIaLJa
	1h2FNTxOh4cIbvyrQcIDO0PyhWxpsSGoiiYTycH5HBBrTifpyFPl0IQUJkZAylOpNANrJ0ORe/B
	hk=
X-Received: by 2002:a05:600c:4ed1:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a1d760381fmr19411795e9.18.1792183658622;
        Fri, 16 Oct 2026 13:47:38 -0700 (PDT)
Received: from hp-z640.fritz.box ([51.37.221.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm51205765e9.5.2026.10.16.13.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:47:37 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH 4/7] lttng-tools: skip kernel cases when kernel tests are disabled
Date: Fri, 16 Oct 2026 21:45:33 +0100
Message-ID: <20261016204547.2328847-5-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248043

run-ptest sets LTTNG_TOOLS_DISABLE_KERNEL_TESTS when lttng-modules is not
installed, as on riscv64, but kernel/test_event_disable.py &
tools/save-load/test_save_load.py check only for root & fail with "Kernel
tracer not available". Carry the fix sent upstream.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 ...our-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch | 108 ++++++++++++++++++
 .../lttng/lttng-tools_2.16.0.bb               |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch
new file mode 100644
index 0000000000..ca041e8da8
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch
@@ -0,0 +1,108 @@
+From f56f36ecd7481d96c99876e8a6f4a609197e7132 Mon Sep 17 00:00:00 2001
+From: OOHehir <oo.hehir@gmail.com>
+Date: Tue, 13 Oct 2026 09:41:51 +0100
+Subject: [PATCH] Fix: tests: honour LTTNG_TOOLS_DISABLE_KERNEL_TESTS in two
+ Python tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+OBSERVED ISSUE
+━━━━━━━━━━━━━━
+On a target without lttng-modules, kernel/test_event_disable.py & the
+kernel cases of tools/save-load/test_save_load.py fail with "Kernel tracer
+not available", although the test run sets LTTNG_TOOLS_DISABLE_KERNEL_TESTS=1.
+Observed with the Yocto Project ptest on riscv64, which ships no lttng-modules.
+
+CAUSE
+━━━━━
+Both scripts only check that they run as root before running kernel cases,
+while the other Python tests use lttngtest._Environment.run_kernel_tests(),
+which also honours LTTNG_TOOLS_DISABLE_KERNEL_TESTS.
+
+SOLUTION
+━━━━━━━━
+Use run_kernel_tests() in both scripts. It checks for root as before, & also
+honours LTTNG_TOOLS_DISABLE_KERNEL_TESTS.
+
+Under review on Gerrit: https://review.lttng.org/c/lttng-tools/+/18903
+
+Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2026-October/031100.html]
+Signed-off-by: OOHehir <oo.hehir@gmail.com>
+---
+ tests/regression/kernel/test_event_disable.py      | 7 ++-----
+ tests/regression/tools/save-load/test_save_load.py | 9 ++++-----
+ 2 files changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/tests/regression/kernel/test_event_disable.py b/tests/regression/kernel/test_event_disable.py
+index da9f146..a373544 100755
+--- a/tests/regression/kernel/test_event_disable.py
++++ b/tests/regression/kernel/test_event_disable.py
+@@ -15,7 +15,6 @@ Validates that disabling events works correctly:
+ - Disabling by name disables all matching rules regardless of filters
+ """
+ 
+-import os
+ import pathlib
+ import sys
+ import traceback
+@@ -307,11 +306,9 @@ if __name__ == "__main__":
+         ),
+     ]
+ 
+-    is_root = os.getuid() == 0
+-
+-    if not is_root:
++    if not lttngtest._Environment.run_kernel_tests():
+         tap = lttngtest.TapGenerator(len(kernel_tests))
+-        tap.skip_all_remaining("Kernel tests require root privileges")
++        tap.skip_all_remaining("Kernel tests not enabled")
+         sys.exit(0)
+ 
+     tap = lttngtest.TapGenerator(len(kernel_tests))
+diff --git a/tests/regression/tools/save-load/test_save_load.py b/tests/regression/tools/save-load/test_save_load.py
+index 9dd8042..1983263 100755
+--- a/tests/regression/tools/save-load/test_save_load.py
++++ b/tests/regression/tools/save-load/test_save_load.py
+@@ -13,7 +13,6 @@ through save/load cycles, including:
+ - Kernel syscalls and tracepoints
+ """
+ 
+-import os
+ import pathlib
+ import sys
+ import traceback
+@@ -953,11 +952,11 @@ if __name__ == "__main__":
+         ),
+     ]
+ 
+-    is_root = os.getuid() == 0
++    run_kernel_tests = lttngtest._Environment.run_kernel_tests()
+     allows_destructive = lttngtest._Environment.allows_destructive()
+ 
+     total_tests = len(user_tests) + len(agent_tests)
+-    if is_root:
++    if run_kernel_tests:
+         total_tests += len(kernel_tests)
+         if allows_destructive:
+             total_tests += len(destructive_kernel_tests)
+@@ -971,7 +970,7 @@ if __name__ == "__main__":
+         for test_name, test_func, kwargs in agent_tests:
+             run_test(tap, test_env, test_func, test_name, **kwargs)
+ 
+-    if is_root:
++    if run_kernel_tests:
+         with lttngtest.test_environment(
+             with_sessiond=True, log=tap.diagnostic, enable_kernel_domain=True
+         ) as test_env:
+@@ -986,6 +985,6 @@ if __name__ == "__main__":
+                     "Skipping destructive kernel tests (LTTNG_ENABLE_DESTRUCTIVE_TESTS not set)"
+                 )
+     else:
+-        tap.diagnostic("Skipping kernel tests (not running as root)")
++        tap.diagnostic("Skipping kernel tests (not enabled)")
+ 
+     sys.exit(0 if tap.is_successful else 1)
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
index cfc16ed6c7..347bdcc273 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
@@ -72,6 +72,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests2.patch \
            file://0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch \
            file://muslfix.patch \
+           file://0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch \
            "
 
 SRC_URI[sha256sum] = "b8b3244894e49e773d4942b8899f768057974edf75c18dbb48b65bb123c7b2c7"
-- 
2.43.0


