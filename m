Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A58C369D3
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 21:48:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.26249.1745272109258724343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 14:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WqOAEwty;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so30805575e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 14:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745272107; x=1745876907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuK4B2zD1vbu0uOOkH6kUCbtSb6PstNr57lWX1NB/1U=;
        b=WqOAEwtyvfwx3nXVq+tOh9GvTk005jq6QbI2VQU8M/y5TY33rkCmQZ0szvx9QwIBuj
         5mU0ffS7MrE4FfE5TgBaEIC7Ng5TTWjhjKoT/gq5+irmduNa0w65Yhny/ZxnECn5+CXR
         n3tVAnUTxlQryK63RpG6czZdet0XKVhb1JKBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272107; x=1745876907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SuK4B2zD1vbu0uOOkH6kUCbtSb6PstNr57lWX1NB/1U=;
        b=gExMuWZcnVoyt109led3TVCbamYv9nVEq6wpeBDAtVoT2l0LlHhHOzm1sCJie7KXk/
         JQojkFpEqZCKiyrIz5vywmi6S9+Ge1JYxmVbG3Go1StfrnXCesnE4at0898AIrsPgLzE
         uC+K6Q37RtL7Uq7aPAyfgzpW1Zid9pglEWGTffdNAzYZnxpcv12qyZIn4FfJW/ztWIgJ
         IJsf3gOhkNO1C8sRbUoGiwlY0jqDuso6WfPJ37vh6AfYYaKt9xfa8KvB1t4bJeEQIsxT
         MhktqgzDVjfb9YmqpYSOvTU5uwdU/tuAIM9YZ7f0AYnMrvo7Mo/A/udSGC7/G/F2mhv3
         ZovQ==
X-Gm-Message-State: AOJu0Yx7IdZ1sLh3hgiu50ezVciho/TpARSqhMrDJ1MGrqJdmBQZ5UCL
	9Wh4D/gohbdpUy6BFxB66Mpx4xGnwaMabMSKy9AXtxnidZP8RbYB7h+xAKinvvkkOPsw9K4F6T6
	O
X-Gm-Gg: ASbGncuSxAiNDKIYdoBa2l/MzvrVJ/ze53M6qe4jSV1KhkBEEt253gt2Vt0CBpivTmL
	ufvwaAJD7fwf479qM+B5jQA1QvxOu7OcJm2YuJDabnqnRfMfts0NQv+myVV52flP8BwmEdDO+tn
	CL9mrkX5Xzky+6KxGhf0WYxh1SGJFGiiTcsw+8Su+BZk3SAUUBBOjj2WkBSr2xd+CThq4VESAbO
	mVLVaUPOi3EG90zYcuUCZ9MzsUAbsxvLSp+gvXY40eRpXwH4NPe9GxhZOwo1ZMTdVtWZ0nPJdto
	6cRv+osHfG/IF2/mUoZrxuAlpf+H9FlWrxivZHmuV85zHwl2wcw2EPJ8UiD+RqvQAN9W6Q==
X-Google-Smtp-Source: AGHT+IExN9hZWbEErOTmehFoN6yl2kHyEGfrgAMXpiAt+3mK+GlpJt/Pt3DphOuF6yK3XLUmo3DQ8g==
X-Received: by 2002:a05:600c:350e:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-4406b1f1c8cmr89945265e9.2.1745272106799;
        Mon, 21 Apr 2025 14:48:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f12:50b3:e6fc:b6f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5cf2dfsm151261685e9.29.2025.04.21.14.48.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 14:48:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-tools: 2.13.14 -> 2.13.15
Date: Mon, 21 Apr 2025 22:48:19 +0100
Message-ID: <20250421214824.3335730-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 21:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215186

Includes fixes for 64 bit time on 32 bit platforms.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...troy-flush-fix-session-daemon-abort-.patch |   7 +-
 ...pat-Define-off64_t-as-off_t-on-linux.patch |  17 ++-
 ...skip_kernel_test-to-check-root-user-.patch | 105 +++++++++---------
 ...-tests-do-not-strip-a-helper-library.patch |   2 +-
 .../lttng/lttng-tools/disable-tests.patch     |  16 ++-
 ...ools_2.13.14.bb => lttng-tools_2.13.15.bb} |   2 +-
 6 files changed, 81 insertions(+), 68 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.14.bb => lttng-tools_2.13.15.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
index 8ddc5883541..e5c96770738 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
@@ -1,4 +1,4 @@
-From 6b45c5f80d20e7bbf3d98c1fa17d2cf8716af3bb Mon Sep 17 00:00:00 2001
+From ea47622987d0947af3e8f75d16d52e27ebd60166 Mon Sep 17 00:00:00 2001
 From: Xiangyu Chen <xiangyu.chen@windriver.com>
 Date: Mon, 25 Mar 2024 18:20:14 +0800
 Subject: [PATCH] Fix: rotation-destroy-flush: fix session daemon abort if no
@@ -33,7 +33,7 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
-index 669bcbc43..64161768f 100755
+index 8ef4f0d..e506b53 100755
 --- a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
 +++ b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
 @@ -23,11 +23,11 @@ SIZE_LIMIT=$PAGE_SIZE
@@ -51,6 +51,3 @@ index 669bcbc43..64161768f 100755
  # MUST set TESTDIR before calling those functions
  function run_app()
  {
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
index 25caccdef8f..e68feb27534 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
@@ -1,7 +1,11 @@
-From 74b3844737b03492756b4f896c938b504b069f14 Mon Sep 17 00:00:00 2001
-From: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+From e5b2615aaad44a1c0d52da1469b28f99cfb12b5f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
+ <jeremie.galarneau@efficios.com>
 Date: Tue, 17 Jan 2023 16:57:35 -0500
 Subject: [PATCH] compat: off64_t is not defined by musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 This helps compile with latest musl, where off64_t is not defined unless
 _LARGEFILE64_SOURCE is defined. On glibc, _LARGEFILE64_SOURCE is defined
@@ -20,7 +24,12 @@ Reported-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
 Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
 ---
+ src/common/compat/compat-fcntl.c |  5 ++++-
+ src/common/compat/fcntl.h        | 10 +++-------
+ 2 files changed, 7 insertions(+), 8 deletions(-)
 
+diff --git a/src/common/compat/compat-fcntl.c b/src/common/compat/compat-fcntl.c
+index 5c0bdc9..18bab0a 100644
 --- a/src/common/compat/compat-fcntl.c
 +++ b/src/common/compat/compat-fcntl.c
 @@ -8,14 +8,17 @@
@@ -42,6 +51,8 @@ Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
  #ifdef HAVE_SYNC_FILE_RANGE
  	return sync_file_range(fd, offset, nbytes, flags);
  #else
+diff --git a/src/common/compat/fcntl.h b/src/common/compat/fcntl.h
+index 5e566e5..93b22b7 100644
 --- a/src/common/compat/fcntl.h
 +++ b/src/common/compat/fcntl.h
 @@ -13,16 +13,12 @@
@@ -62,7 +73,7 @@ Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
  		unsigned int flags);
  #define lttng_sync_file_range(fd, offset, nbytes, flags) \
  	compat_sync_file_range(fd, offset, nbytes, flags)
-@@ -37,8 +33,8 @@ extern int compat_sync_file_range(int fd
+@@ -37,8 +33,8 @@ extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
  #define SYNC_FILE_RANGE_WAIT_BEFORE   0
  #define SYNC_FILE_RANGE_WRITE         0
  
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
index 2671a1908e0..cb2c763b512 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
@@ -1,4 +1,4 @@
-From cf558f802b259a33605fe0ede4d74ae2ff6be699 Mon Sep 17 00:00:00 2001
+From 76976da4e01ce90923f61ba734e066faefb76beb Mon Sep 17 00:00:00 2001
 From: Xiangyu Chen <xiangyu.chen@windriver.com>
 Date: Mon, 12 Feb 2024 09:23:54 -0500
 Subject: [PATCH] tests: add check_skip_kernel_test to check root user and
@@ -83,7 +83,7 @@ Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
  47 files changed, 166 insertions(+), 363 deletions(-)
 
 diff --git a/tests/destructive/metadata-regeneration b/tests/destructive/metadata-regeneration
-index b81e7af32..36b130d17 100755
+index b81e7af..36b130d 100755
 --- a/tests/destructive/metadata-regeneration
 +++ b/tests/destructive/metadata-regeneration
 @@ -185,19 +185,13 @@ function test_ust_streaming ()
@@ -108,7 +108,7 @@ index b81e7af32..36b130d17 100755
  	start_lttng_relayd "-o $TRACE_PATH"
  	start_lttng_sessiond
 diff --git a/tests/perf/test_perf_raw.in b/tests/perf/test_perf_raw.in
-index f293ccd71..d35529a87 100644
+index f293ccd..d35529a 100644
 --- a/tests/perf/test_perf_raw.in
 +++ b/tests/perf/test_perf_raw.in
 @@ -137,12 +137,6 @@ function test_kernel_raw()
@@ -134,7 +134,7 @@ index f293ccd71..d35529a87 100644
  	modprobe lttng-test
  	test_kernel_raw
 diff --git a/tests/regression/kernel/test_all_events b/tests/regression/kernel/test_all_events
-index 2e20888df..044f9b65f 100755
+index 2e20888..044f9b6 100755
 --- a/tests/regression/kernel/test_all_events
 +++ b/tests/regression/kernel/test_all_events
 @@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
@@ -153,7 +153,7 @@ index 2e20888df..044f9b65f 100755
  	validate_lttng_modules_present
  	start_lttng_sessiond
 diff --git a/tests/regression/kernel/test_callstack b/tests/regression/kernel/test_callstack
-index a4477fd7c..d8d6b5e0f 100755
+index a4477fd..d8d6b5e 100755
 --- a/tests/regression/kernel/test_callstack
 +++ b/tests/regression/kernel/test_callstack
 @@ -134,13 +134,7 @@ plan_tests $NUM_TESTS
@@ -172,7 +172,7 @@ index a4477fd7c..d8d6b5e0f 100755
  	validate_lttng_modules_present
  	start_lttng_sessiond
 diff --git a/tests/regression/kernel/test_channel b/tests/regression/kernel/test_channel
-index 9cc74c4e8..4c377bd2a 100755
+index 9cc74c4..4c377bd 100755
 --- a/tests/regression/kernel/test_channel
 +++ b/tests/regression/kernel/test_channel
 @@ -47,13 +47,7 @@ function test_channel_buffer_too_large()
@@ -191,7 +191,7 @@ index 9cc74c4e8..4c377bd2a 100755
  	start_lttng_sessiond
  
 diff --git a/tests/regression/kernel/test_clock_override b/tests/regression/kernel/test_clock_override
-index 72892898b..48a3f926a 100755
+index 7289289..48a3f92 100755
 --- a/tests/regression/kernel/test_clock_override
 +++ b/tests/regression/kernel/test_clock_override
 @@ -172,13 +172,7 @@ TESTS=(
@@ -210,7 +210,7 @@ index 72892898b..48a3f926a 100755
  	validate_lttng_modules_present
  	trap signal_cleanup SIGTERM SIGINT
 diff --git a/tests/regression/kernel/test_event_basic b/tests/regression/kernel/test_event_basic
-index ac9ec0549..387e2f733 100755
+index ac9ec05..387e2f7 100755
 --- a/tests/regression/kernel/test_event_basic
 +++ b/tests/regression/kernel/test_event_basic
 @@ -73,13 +73,7 @@ plan_tests $NUM_TESTS
@@ -229,7 +229,7 @@ index ac9ec0549..387e2f733 100755
  	validate_lttng_modules_present
  	start_lttng_sessiond
 diff --git a/tests/regression/kernel/test_kernel_function b/tests/regression/kernel/test_kernel_function
-index b1d5491fc..ea16cdeef 100755
+index b1d5491..ea16cde 100755
 --- a/tests/regression/kernel/test_kernel_function
 +++ b/tests/regression/kernel/test_kernel_function
 @@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
@@ -248,7 +248,7 @@ index b1d5491fc..ea16cdeef 100755
  	start_lttng_sessiond_notap
  	validate_lttng_modules_present
 diff --git a/tests/regression/kernel/test_lttng_logger b/tests/regression/kernel/test_lttng_logger
-index b8f7ded82..00eaae823 100755
+index b8f7ded..00eaae8 100755
 --- a/tests/regression/kernel/test_lttng_logger
 +++ b/tests/regression/kernel/test_lttng_logger
 @@ -110,13 +110,7 @@ plan_tests $NUM_TESTS
@@ -267,7 +267,7 @@ index b8f7ded82..00eaae823 100755
  	validate_lttng_modules_present
  	start_lttng_sessiond
 diff --git a/tests/regression/kernel/test_ns_contexts b/tests/regression/kernel/test_ns_contexts
-index 0c8718d78..59e2568f6 100755
+index 7d447bc..1c71ea5 100755
 --- a/tests/regression/kernel/test_ns_contexts
 +++ b/tests/regression/kernel/test_ns_contexts
 @@ -108,13 +108,7 @@ plan_tests $NUM_TESTS
@@ -286,7 +286,7 @@ index 0c8718d78..59e2568f6 100755
  system_has_ns=0
  if [ -d "/proc/$$/ns" ]; then
 diff --git a/tests/regression/kernel/test_ns_contexts_change b/tests/regression/kernel/test_ns_contexts_change
-index 42a61276b..3f5e4eeab 100755
+index 42a6127..3f5e4ee 100755
 --- a/tests/regression/kernel/test_ns_contexts_change
 +++ b/tests/regression/kernel/test_ns_contexts_change
 @@ -162,14 +162,7 @@ plan_tests $NUM_TESTS
@@ -306,7 +306,7 @@ index 42a61276b..3f5e4eeab 100755
  system_has_ns=0
  if [ -d "/proc/$$/ns" ]; then
 diff --git a/tests/regression/kernel/test_rotation_destroy_flush b/tests/regression/kernel/test_rotation_destroy_flush
-index cb773d7df..0af514b49 100755
+index cb773d7..0af514b 100755
 --- a/tests/regression/kernel/test_rotation_destroy_flush
 +++ b/tests/regression/kernel/test_rotation_destroy_flush
 @@ -120,13 +120,7 @@ TESTS=(
@@ -325,7 +325,7 @@ index cb773d7df..0af514b49 100755
  	validate_lttng_modules_present
  	trap signal_cleanup SIGTERM SIGINT
 diff --git a/tests/regression/kernel/test_select_poll_epoll b/tests/regression/kernel/test_select_poll_epoll
-index d8245a0e7..20f0ef0ae 100755
+index d8245a0..20f0ef0 100755
 --- a/tests/regression/kernel/test_select_poll_epoll
 +++ b/tests/regression/kernel/test_select_poll_epoll
 @@ -374,13 +374,7 @@ if test $? != 0; then
@@ -344,7 +344,7 @@ index d8245a0e7..20f0ef0ae 100755
  	validate_lttng_modules_present
  
 diff --git a/tests/regression/kernel/test_syscall b/tests/regression/kernel/test_syscall
-index 401a18a8d..219d94703 100755
+index 401a18a..219d947 100755
 --- a/tests/regression/kernel/test_syscall
 +++ b/tests/regression/kernel/test_syscall
 @@ -664,13 +664,7 @@ plan_tests $NUM_TESTS
@@ -363,7 +363,7 @@ index 401a18a8d..219d94703 100755
  	validate_lttng_modules_present
  	start_lttng_sessiond
 diff --git a/tests/regression/kernel/test_userspace_probe b/tests/regression/kernel/test_userspace_probe
-index 1091ee65e..5d984d666 100755
+index 1091ee6..5d984d6 100755
 --- a/tests/regression/kernel/test_userspace_probe
 +++ b/tests/regression/kernel/test_userspace_probe
 @@ -815,13 +815,7 @@ fi
@@ -382,7 +382,7 @@ index 1091ee65e..5d984d666 100755
  	validate_lttng_modules_present
  	start_lttng_sessiond
 diff --git a/tests/regression/tools/clear/test_kernel b/tests/regression/tools/clear/test_kernel
-index 06fb1c368..48250a742 100755
+index 06fb1c3..48250a7 100755
 --- a/tests/regression/tools/clear/test_kernel
 +++ b/tests/regression/tools/clear/test_kernel
 @@ -536,12 +536,6 @@ plan_tests $NUM_TESTS
@@ -408,7 +408,7 @@ index 06fb1c368..48250a742 100755
  	trap signal_cleanup SIGTERM SIGINT
  
 diff --git a/tests/regression/tools/filtering/test_invalid_filter b/tests/regression/tools/filtering/test_invalid_filter
-index 7d9e524d9..8435e5546 100755
+index 7d9e524..8435e55 100755
 --- a/tests/regression/tools/filtering/test_invalid_filter
 +++ b/tests/regression/tools/filtering/test_invalid_filter
 @@ -168,13 +168,7 @@ done
@@ -427,7 +427,7 @@ index 7d9e524d9..8435e5546 100755
  	diag "Test kernel filters"
  	i=0
 diff --git a/tests/regression/tools/filtering/test_unsupported_op b/tests/regression/tools/filtering/test_unsupported_op
-index 299247a3c..91eb86d21 100755
+index 299247a..91eb86d 100755
 --- a/tests/regression/tools/filtering/test_unsupported_op
 +++ b/tests/regression/tools/filtering/test_unsupported_op
 @@ -103,13 +103,7 @@ while [ "$i" -lt "$OP_COUNT" ]; do
@@ -446,7 +446,7 @@ index 299247a3c..91eb86d21 100755
  	diag "Test kernel unsupported filter operations"
  
 diff --git a/tests/regression/tools/filtering/test_valid_filter b/tests/regression/tools/filtering/test_valid_filter
-index e76ffa25f..1ba7c79bb 100755
+index e76ffa2..1ba7c79 100755
 --- a/tests/regression/tools/filtering/test_valid_filter
 +++ b/tests/regression/tools/filtering/test_valid_filter
 @@ -1452,13 +1452,7 @@ KERNEL_FILTERS=(
@@ -465,7 +465,7 @@ index e76ffa25f..1ba7c79bb 100755
  	diag "Test kernel valid filters"
  
 diff --git a/tests/regression/tools/health/test_health.sh b/tests/regression/tools/health/test_health.sh
-index b3d6419d2..68716e6b9 100644
+index b3d6419..68716e6 100644
 --- a/tests/regression/tools/health/test_health.sh
 +++ b/tests/regression/tools/health/test_health.sh
 @@ -82,7 +82,7 @@ function test_health
@@ -500,7 +500,7 @@ index b3d6419d2..68716e6b9 100644
  i=0
  while [ "$i" -lt "$THREAD_COUNT" ]; do
 diff --git a/tests/regression/tools/health/test_thread_ok b/tests/regression/tools/health/test_thread_ok
-index e84adb611..e5e23543f 100755
+index e84adb6..e5e2354 100755
 --- a/tests/regression/tools/health/test_thread_ok
 +++ b/tests/regression/tools/health/test_thread_ok
 @@ -67,7 +67,7 @@ function test_thread_ok
@@ -527,7 +527,7 @@ index e84adb611..e5e23543f 100755
  
  rm -rf ${HEALTH_PATH}
 diff --git a/tests/regression/tools/live/test_kernel b/tests/regression/tools/live/test_kernel
-index b622b5214..fdaa09f0d 100755
+index b622b52..fdaa09f 100755
 --- a/tests/regression/tools/live/test_kernel
 +++ b/tests/regression/tools/live/test_kernel
 @@ -39,13 +39,11 @@ function clean_live_tracing()
@@ -549,7 +549,7 @@ index b622b5214..fdaa09f0d 100755
  modprobe lttng-test
  
 diff --git a/tests/regression/tools/live/test_lttng_kernel b/tests/regression/tools/live/test_lttng_kernel
-index a23d9373a..1b933648f 100755
+index a23d937..1b93364 100755
 --- a/tests/regression/tools/live/test_lttng_kernel
 +++ b/tests/regression/tools/live/test_lttng_kernel
 @@ -45,13 +45,7 @@ function clean_live_tracing()
@@ -568,7 +568,7 @@ index a23d9373a..1b933648f 100755
  	modprobe lttng-test
  
 diff --git a/tests/regression/tools/metadata/test_kernel b/tests/regression/tools/metadata/test_kernel
-index 57cace6ea..26e95d93a 100755
+index 57cace6..26e95d9 100755
 --- a/tests/regression/tools/metadata/test_kernel
 +++ b/tests/regression/tools/metadata/test_kernel
 @@ -91,13 +91,7 @@ plan_tests $NUM_TESTS
@@ -587,7 +587,7 @@ index 57cace6ea..26e95d93a 100755
  	validate_lttng_modules_present
  	modprobe lttng-test
 diff --git a/tests/regression/tools/notification/test_notification_kernel_buffer_usage b/tests/regression/tools/notification/test_notification_kernel_buffer_usage
-index 76e69a77e..8fdaabb3e 100755
+index 76e69a7..8fdaabb 100755
 --- a/tests/regression/tools/notification/test_notification_kernel_buffer_usage
 +++ b/tests/regression/tools/notification/test_notification_kernel_buffer_usage
 @@ -60,29 +60,27 @@ function test_buffer_usage_notification
@@ -638,7 +638,7 @@ index 76e69a77e..8fdaabb3e 100755
 +rm -rf "${consumerd_pipe[@]}" 2> /dev/null
  rm -rf "$TEST_TMPDIR"
 diff --git a/tests/regression/tools/notification/test_notification_kernel_capture b/tests/regression/tools/notification/test_notification_kernel_capture
-index 88f123d3d..0f8a2bc6f 100755
+index 88f123d..0f8a2bc 100755
 --- a/tests/regression/tools/notification/test_notification_kernel_capture
 +++ b/tests/regression/tools/notification/test_notification_kernel_capture
 @@ -31,22 +31,21 @@ function test_basic_error_path
@@ -676,7 +676,7 @@ index 88f123d3d..0f8a2bc6f 100755
  
  rm -f "$TESTAPP_STATE_PATH"
 diff --git a/tests/regression/tools/notification/test_notification_kernel_error b/tests/regression/tools/notification/test_notification_kernel_error
-index 80fe6e5b5..b757ec2b4 100755
+index 80fe6e5..b757ec2 100755
 --- a/tests/regression/tools/notification/test_notification_kernel_error
 +++ b/tests/regression/tools/notification/test_notification_kernel_error
 @@ -30,23 +30,22 @@ function test_basic_error_path
@@ -715,7 +715,7 @@ index 80fe6e5b5..b757ec2b4 100755
  
  rm -f "$TESTAPP_STATE_PATH"
 diff --git a/tests/regression/tools/notification/test_notification_kernel_instrumentation b/tests/regression/tools/notification/test_notification_kernel_instrumentation
-index 90545a541..705f7703d 100755
+index 90545a5..705f770 100755
 --- a/tests/regression/tools/notification/test_notification_kernel_instrumentation
 +++ b/tests/regression/tools/notification/test_notification_kernel_instrumentation
 @@ -28,22 +28,21 @@ function test_kernel_instrumentation_notification
@@ -753,7 +753,7 @@ index 90545a541..705f7703d 100755
  
  rm -f "$TESTAPP_STATE_PATH"
 diff --git a/tests/regression/tools/notification/test_notification_kernel_syscall b/tests/regression/tools/notification/test_notification_kernel_syscall
-index d273cb55d..7fa235388 100755
+index d273cb5..7fa2353 100755
 --- a/tests/regression/tools/notification/test_notification_kernel_syscall
 +++ b/tests/regression/tools/notification/test_notification_kernel_syscall
 @@ -31,19 +31,18 @@ function test_kernel_syscall_notification
@@ -786,7 +786,7 @@ index d273cb55d..7fa235388 100755
  
  rm -f "$TESTAPP_STATE_PATH"
 diff --git a/tests/regression/tools/notification/test_notification_kernel_userspace_probe b/tests/regression/tools/notification/test_notification_kernel_userspace_probe
-index 8ef8d708d..abddd9be7 100755
+index 8ef8d70..abddd9b 100755
 --- a/tests/regression/tools/notification/test_notification_kernel_userspace_probe
 +++ b/tests/regression/tools/notification/test_notification_kernel_userspace_probe
 @@ -29,18 +29,18 @@ function test_kernel_userspace_probe_notification
@@ -819,7 +819,7 @@ index 8ef8d708d..abddd9be7 100755
  
  rm -f "$TESTAPP_STATE_PATH"
 diff --git a/tests/regression/tools/notification/test_notification_multi_app b/tests/regression/tools/notification/test_notification_multi_app
-index d8b639225..61891b56f 100755
+index d8b6392..61891b5 100755
 --- a/tests/regression/tools/notification/test_notification_multi_app
 +++ b/tests/regression/tools/notification/test_notification_multi_app
 @@ -411,22 +411,18 @@ function test_on_register_evaluation ()
@@ -851,10 +851,10 @@ index d8b639225..61891b56f 100755
  for fct_test in ${TESTS[@]};
  do
 diff --git a/tests/regression/tools/notification/test_notification_notifier_discarded_count b/tests/regression/tools/notification/test_notification_notifier_discarded_count
-index c9235393e..a6c31a728 100755
+index 9850b49..778d37d 100755
 --- a/tests/regression/tools/notification/test_notification_notifier_discarded_count
 +++ b/tests/regression/tools/notification/test_notification_notifier_discarded_count
-@@ -391,7 +391,8 @@ function test_ust_notifier_discarded_regardless_trigger_owner
+@@ -376,7 +376,8 @@ function test_ust_notifier_discarded_regardless_trigger_owner
  test_ust_notifier_discarded_count
  test_ust_notifier_discarded_count_max_bucket
  
@@ -864,7 +864,7 @@ index c9235393e..a6c31a728 100755
  
  	validate_lttng_modules_present
  
-@@ -413,9 +414,7 @@ if [ "$(id -u)" == "0" ]; then
+@@ -398,9 +399,7 @@ if [ "$(id -u)" == "0" ]; then
  	modprobe --remove lttng-test
  
  	rm -rf "${sessiond_pipe[@]}" 2> /dev/null
@@ -877,7 +877,7 @@ index c9235393e..a6c31a728 100755
  
  rm -rf "$TEST_TMPDIR"
 diff --git a/tests/regression/tools/regen-metadata/test_kernel b/tests/regression/tools/regen-metadata/test_kernel
-index 49eea32a7..555a4e2ce 100755
+index 49eea32..555a4e2 100755
 --- a/tests/regression/tools/regen-metadata/test_kernel
 +++ b/tests/regression/tools/regen-metadata/test_kernel
 @@ -99,13 +99,7 @@ plan_tests $NUM_TESTS
@@ -896,7 +896,7 @@ index 49eea32a7..555a4e2ce 100755
  	validate_lttng_modules_present
  
 diff --git a/tests/regression/tools/regen-statedump/test_kernel b/tests/regression/tools/regen-statedump/test_kernel
-index 8a261355d..bbbac3942 100755
+index 8a26135..bbbac39 100755
 --- a/tests/regression/tools/regen-statedump/test_kernel
 +++ b/tests/regression/tools/regen-statedump/test_kernel
 @@ -39,13 +39,7 @@ plan_tests $NUM_TESTS
@@ -915,7 +915,7 @@ index 8a261355d..bbbac3942 100755
  	validate_lttng_modules_present
  	start_lttng_sessiond
 diff --git a/tests/regression/tools/rotation/test_kernel b/tests/regression/tools/rotation/test_kernel
-index f5f1f5553..efe3fd359 100755
+index f5f1f55..efe3fd3 100755
 --- a/tests/regression/tools/rotation/test_kernel
 +++ b/tests/regression/tools/rotation/test_kernel
 @@ -82,13 +82,7 @@ plan_tests $NUM_TESTS
@@ -934,7 +934,7 @@ index f5f1f5553..efe3fd359 100755
  	validate_lttng_modules_present
  
 diff --git a/tests/regression/tools/snapshots/test_kernel b/tests/regression/tools/snapshots/test_kernel
-index abb243563..d91876867 100755
+index abb2435..d918768 100755
 --- a/tests/regression/tools/snapshots/test_kernel
 +++ b/tests/regression/tools/snapshots/test_kernel
 @@ -217,13 +217,7 @@ plan_tests $NUM_TESTS
@@ -953,7 +953,7 @@ index abb243563..d91876867 100755
  
  	validate_lttng_modules_present
 diff --git a/tests/regression/tools/snapshots/test_kernel_streaming b/tests/regression/tools/snapshots/test_kernel_streaming
-index 0c92dc710..dd965afee 100755
+index 0c92dc7..dd965af 100755
 --- a/tests/regression/tools/snapshots/test_kernel_streaming
 +++ b/tests/regression/tools/snapshots/test_kernel_streaming
 @@ -145,13 +145,7 @@ plan_tests $NUM_TESTS
@@ -972,7 +972,7 @@ index 0c92dc710..dd965afee 100755
  	validate_lttng_modules_present
  
 diff --git a/tests/regression/tools/streaming/test_high_throughput_limits b/tests/regression/tools/streaming/test_high_throughput_limits
-index 2b9e3ad39..c55d51098 100755
+index 2b9e3ad..c55d510 100755
 --- a/tests/regression/tools/streaming/test_high_throughput_limits
 +++ b/tests/regression/tools/streaming/test_high_throughput_limits
 @@ -170,13 +170,7 @@ plan_tests $NUM_TESTS
@@ -991,7 +991,7 @@ index 2b9e3ad39..c55d51098 100755
  
  	# Catch sigint and try to cleanup limits
 diff --git a/tests/regression/tools/streaming/test_kernel b/tests/regression/tools/streaming/test_kernel
-index 33334229f..113eea7bf 100755
+index 3333422..113eea7 100755
 --- a/tests/regression/tools/streaming/test_kernel
 +++ b/tests/regression/tools/streaming/test_kernel
 @@ -47,13 +47,7 @@ plan_tests $NUM_TESTS
@@ -1010,7 +1010,7 @@ index 33334229f..113eea7bf 100755
  	validate_lttng_modules_present
  
 diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/regression/tools/tracker/test_event_tracker
-index cc0f698d2..de0c79d36 100755
+index cc0f698..de0c79d 100755
 --- a/tests/regression/tools/tracker/test_event_tracker
 +++ b/tests/regression/tools/tracker/test_event_tracker
 @@ -466,13 +466,7 @@ test_event_track_untrack ust 0 "${EVENT_NAME}" "--pid --all"	# backward compat
@@ -1029,7 +1029,7 @@ index cc0f698d2..de0c79d36 100755
  	diag "Test kernel tracker"
  
 diff --git a/tests/regression/tools/trigger/test_add_trigger_cli b/tests/regression/tools/trigger/test_add_trigger_cli
-index 98ecf6272..d1763aa2e 100755
+index 98ecf62..d1763aa 100755
 --- a/tests/regression/tools/trigger/test_add_trigger_cli
 +++ b/tests/regression/tools/trigger/test_add_trigger_cli
 @@ -34,12 +34,6 @@ tmp_stdout=$(mktemp --tmpdir -t test_parse_cli_trigger_stdout.XXXXXX)
@@ -1073,7 +1073,7 @@ index 98ecf6272..d1763aa2e 100755
  		--name="syscall-trigger-0" \
  		--condition event-rule-matches --type=syscall --name=open \
 diff --git a/tests/regression/tools/trigger/test_list_triggers_cli b/tests/regression/tools/trigger/test_list_triggers_cli
-index a04018013..02c3de3e9 100755
+index 2574e15..652a08c 100755
 --- a/tests/regression/tools/trigger/test_list_triggers_cli
 +++ b/tests/regression/tools/trigger/test_list_triggers_cli
 @@ -36,22 +36,12 @@ uprobe_sdt_binary=$(realpath "${TESTDIR}/utils/testapp/userspace-probe-sdt-binar
@@ -1120,7 +1120,7 @@ index a04018013..02c3de3e9 100755
  test_buffer_usage_conditions
  test_session_rotation_conditions
 diff --git a/tests/regression/tools/wildcard/test_event_wildcard b/tests/regression/tools/wildcard/test_event_wildcard
-index f69baffc4..14d9bb88a 100755
+index f69baff..14d9bb8 100755
 --- a/tests/regression/tools/wildcard/test_event_wildcard
 +++ b/tests/regression/tools/wildcard/test_event_wildcard
 @@ -124,13 +124,7 @@ test_event_wildcard ust 1 'tp*tptest'
@@ -1139,7 +1139,7 @@ index f69baffc4..14d9bb88a 100755
  	diag "Test kernel wildcards"
  
 diff --git a/tests/regression/tools/working-directory/test_relayd_working_directory b/tests/regression/tools/working-directory/test_relayd_working_directory
-index c7e784cca..6bd1e504a 100755
+index c7e784c..6bd1e50 100755
 --- a/tests/regression/tools/working-directory/test_relayd_working_directory
 +++ b/tests/regression/tools/working-directory/test_relayd_working_directory
 @@ -145,9 +145,9 @@ function test_relayd_debug_permission()
@@ -1155,7 +1155,7 @@ index c7e784cca..6bd1e504a 100755
  
  	skip $is_user "Skipping permission debug output test; operation can't fail as root" 6 ||
 diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/tests/regression/ust/namespaces/test_ns_contexts_change
-index 8a4b62ce3..622241f7b 100755
+index 8a4b62c..622241f 100755
 --- a/tests/regression/ust/namespaces/test_ns_contexts_change
 +++ b/tests/regression/ust/namespaces/test_ns_contexts_change
 @@ -101,12 +101,7 @@ plan_tests $NUM_TESTS
@@ -1173,7 +1173,7 @@ index 8a4b62ce3..622241f7b 100755
  system_has_ns=0
  if [ -d "/proc/$$/ns" ]; then
 diff --git a/tests/regression/ust/test_event_perf b/tests/regression/ust/test_event_perf
-index 33aab2981..178959a19 100755
+index 33aab29..178959a 100755
 --- a/tests/regression/ust/test_event_perf
 +++ b/tests/regression/ust/test_event_perf
 @@ -119,17 +119,11 @@ plan_tests $NUM_TESTS
@@ -1196,10 +1196,10 @@ index 33aab2981..178959a19 100755
  	test_event_basic
  }
 diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
-index faa87e783..da0e0569d 100644
+index 35633fa..b6783ef 100644
 --- a/tests/utils/utils.sh
 +++ b/tests/utils/utils.sh
-@@ -318,6 +318,41 @@ function conf_proc_count()
+@@ -329,6 +329,41 @@ function conf_proc_count()
  	echo
  }
  
@@ -1241,6 +1241,3 @@ index faa87e783..da0e0569d 100644
  # Check if base lttng-modules are present.
  # Bail out on failure
  function validate_lttng_modules_present ()
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
index 2f95889c4b1..84c02a02cf5 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
@@ -1,4 +1,4 @@
-From 2237748af00467ad8250a7ccd944200f811db69a Mon Sep 17 00:00:00 2001
+From 3f1f1dc868accca37d2f276ed741884698b38538 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 12 Dec 2019 16:52:07 +0100
 Subject: [PATCH] tests: do not strip a helper library
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
index 3a77ea2e439..b8971a69de8 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
@@ -1,3 +1,8 @@
+From 1fbd24512e8fce64b92efa846c301e45a7371ed2 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 14 Dec 2021 12:34:04 +0000
+Subject: [PATCH] lttng-tools: Disable problem tests
+
 Upstream-Status: Inappropriate [need to root cause the test hangs]
 
 We keep seeing hangs in the tools/notifications tests on x86 and arm for
@@ -8,11 +13,14 @@ of them.
 https://bugzilla.yoctoproject.org/show_bug.cgi?id=14263
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ tests/regression/Makefile.am | 12 ------------
+ 1 file changed, 12 deletions(-)
 
-Index: lttng-tools-2.13.1/tests/regression/Makefile.am
-===================================================================
---- lttng-tools-2.13.1.orig/tests/regression/Makefile.am
-+++ lttng-tools-2.13.1/tests/regression/Makefile.am
+diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
+index e556223..756fb98 100644
+--- a/tests/regression/Makefile.am
++++ b/tests/regression/Makefile.am
 @@ -29,18 +29,6 @@ TESTS = tools/base-path/test_ust \
  	tools/crash/test_crash \
  	tools/regen-metadata/test_ust \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
index 98c2f9831b7..762d4e5c2fe 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
@@ -41,7 +41,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch \
            "
 
-SRC_URI[sha256sum] = "53bdf7c4ad07dbfe660ee4d9affc63fe44ae59e9a73c6f7a96e0fca140e5adcb"
+SRC_URI[sha256sum] = "96ea42351ee112c19dad9fdc7aae93b583d9f1722b2175664a381d2d337703c4"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 

