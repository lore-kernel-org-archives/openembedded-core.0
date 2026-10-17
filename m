Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DD5CCF2CE
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4518.1792236251823146735
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J+V/Qn2C;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: oo.hehir@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b0584ad71so386888f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236250; x=1792841050; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruapmwColnni4KC74UAVrQWnKKeofryTiaonVwGLbos=;
        b=J+V/Qn2CBOFWN5+Fpkc7MhRg22cwzUVrVMA7K32Lgr+O1tgLWSR5TsJBT1yMAf6LJM
         AYWIrI+8YJhVBkP6UwooXaeN/aAU5S6rVYl3D6KQ6fw+ycBmDdVOWntv6ENVM7lugSxx
         9fxMdAwHmhXabxp9r/clk9Wg8cLKZOt/4XezFGC435PTLhS0g1hYvcWMADQINL82odW0
         HX7KY3lEX3GhP9x0Uyuna6RHkqI5SqFGDsWG363K9RnAlersSxSKQXOSxGYptxY8I078
         1yHjR8KsGIJ0jh/wQ3WH+uQirp5f3j8Y9+7iMEtydI+I2hZj1Kh43Vb60cTIEi/e65Im
         lR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236250; x=1792841050;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruapmwColnni4KC74UAVrQWnKKeofryTiaonVwGLbos=;
        b=AarraIXuske2Ljzh/Q9zuhIclwbqpyVTTwLV7otMlKWmkLgjbUWqrerk2PsEWl9eKX
         /kcoppVtTjuo3i/IgJ9XtxWGdcQdrPL3u7Kqsy+8T5nRDmokB+arRTlPgXZfQv4+ROf3
         UyYmVERf7CYGTFN+mDn56TN1V8QvMDDvj9gNP1z6mR34vjJVIuJCub/MdEehwfRIizyH
         zEE+/P1n7hWQledy5nkqZiw+jau6V5e8QF10Y9EYZ6x2EyQupn3Q7H8Wwv8l0o0JRb1n
         6KwS4+KhtGhYdvVFMpA7kKO8v2QpvJILsYlIIrCRa2dda2VZkuS/FfdeF9oT6KvxBKu7
         ipmA==
X-Gm-Message-State: AFq9FYLyQcjXQAGYMzHMuefpqzCgFZHoK4mPgm07fRWItQgEEbSF7gNx
	qlgfKXMAmHFcuPUbZDEO8fwBcZi0zvWVt5dfg798C8iQx08Sj5aGO+SPiOrVKAWx
X-Gm-Gg: AYBFou1ZINtvTfHUgSeNUIXvi6zOGTEzyGedqPPI0eRkFnaqrfsgwXNgyEuCJ2q6AUT
	bkHNXyk//3P2k7xdP3h2NnQTrSqOahLrl6eGW5B5xAVgRvMKusV1jd7rldrGYHrfiogKvs29eza
	mcNNgqiyC6RBJ3Z3bgR6WuTvj6jUjf6tc687c2m+3/iS3I+E9OBaXojdBmz9/uwiRCTF37dCjEF
	7ok4JXKzoxfegGf0c1mdOC2WofV7ENwU8z+Yj5qfauNREHUdbmMR+Z/yGv8YAmAnABgf991+R0j
	e+3xsiFNJXZVJNXMOlOGXmicWZvhw6yrPgPsyMve5zjX9ah7xpiCZs1P2MxmkjAFYzREoX5/foT
	Yktq7I/xJIy7IR1ahwlapkcn8VcYwey/480zf5biDk9xTQTPvJBxmq5KM+KIjLW0bD9SSetnvjT
	XnR9j1+THdrN++LFQGIU2cUSIkz59BOaM0cwAmseYNoQtzZPDTVslLiq6kyatolp1d9TEr/+Y58
	blp
X-Received: by 2002:a05:6000:290f:b0:48e:740:c945 with SMTP id ffacd0b85a97d-48e07f9eb4bmr4353065f8f.32.1792236249996;
        Sat, 17 Oct 2026 04:24:09 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:09 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v2 4/8] lttng-tools: skip kernel cases when kernel tests are disabled
Date: Sat, 17 Oct 2026 12:23:53 +0100
Message-ID: <20261017112358.77434-5-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248083

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


