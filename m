Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1CAC3ABA9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 05:47:50 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.5212.1746078458628190177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 22:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASOfZyFU;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224100e9a5cso7551265ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 22:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746078458; x=1746683258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmTDL2vKL/MsiJhj4Q2vLnA4lQ2T4SN/A8601o25Ldw=;
        b=ASOfZyFUVD+am+FegTSlBNnK8MIyCb3H63SBDZ6sMzJI+gS62dwfnoL8IM2Zj+xIGb
         4c+eqnJjFTJ2BgUGUUGAJIYwX7lFmG/IlVXPttIQgQrsEq68eUmfJXrqDTfwK5WV7j7R
         0or0hukyGtJN4XnxfOKg7BE5XOrjjp05SX9HpZHdF5Vt4UAhZyW4h2jfl+6r0xuAEM0m
         fy+NPLAo2dd3I7nGkjc3gyIYuBUk5JQq9tLJ2gCfuBzccNGkDU07z/jU4OZ7BmIrElQ2
         IzQUkeHg6HRt7P5rnPvw5go8uTcB+x993hMhS4kNM5p3bLIF6rsjBqGh1sIT0EDNXgZV
         1sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746078458; x=1746683258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmTDL2vKL/MsiJhj4Q2vLnA4lQ2T4SN/A8601o25Ldw=;
        b=VEUcXO9IeIxYU8SxE1K+svSbRwTsxNbq15oGCVE1mU+e7JQoKrgz4KySE8/7IFkbYQ
         YxpnGK6ZGR51fvvpag35S2Vo4cd0vkP42a5LqUBU+CD1olNDnwciXK8aDVUd7Ez096gV
         UTnKjZmtsUPrYpldd7fd/2UE5G4iigOeZmI/XSf+pdJOVgRW8of5mNVYXLlslYq/QJXb
         Hnlyf81fKhrZy9l3/6q2Cp/4b1im+FVG4EIP5CBTMEuAIV25WWmVfBV9mv1AumiGFz0t
         /wpUh7UkO+/3eN7wpMnobPKzHxQKdLsPHaaisrqg0fMSSG/udIlGl1Q4m8mgLU4kYVno
         9JUA==
X-Gm-Message-State: AOJu0YyUx1BzEOMEHkizgBrRZ7ECGBEIhBK3u5iU5KsWFZleyUx9glW5
	cCi9JjKyy1I82wzUVOKI94qnHwQnB11TCmLVQQdx2g45K6b6J1OHl3MYIiab
X-Gm-Gg: ASbGncvUPcOzDKfDrYn/aoEb/NsZjUW9DU2UUH2aUokyiiHrGMWJVfNfJ0SFaS4HJJ6
	SC8dwOip3EwVj6jueGB2/7lu+ew1emzAaCJilAwbd9pIli6fqX3+kDLBNXTjpOdoJ0vMStpxiJ1
	BcqN0CLCYzETaRdgQ7F6F1rJVlPQf2NYncodrFQgq0HmFi98F2KYGmwROKjFSmNM8a7F+P1a2Ga
	FVYz6mXeajTusZVEM8zp9/cPDKqsNVYpvzePQ4voibczGqYN57KtZDSqNyFWdQVYJ7eC9b4g0xk
	1GpIOIJo+XSOYZKYN9UugEI++sm5P6iF
X-Google-Smtp-Source: AGHT+IFTic9LCHUDd5OLrFNqxGN/q/v3Gx26v8/Rdzh+Zn3Q93GYERR3762LmhVKYYbKenBCpChFsA==
X-Received: by 2002:a17:902:e74b:b0:224:160d:3f54 with SMTP id d9443c01a7336-22e0842c63fmr20038515ad.31.1746078457446;
        Wed, 30 Apr 2025 22:47:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b8ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a28sm132915555ad.110.2025.04.30.22.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 22:47:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust: Fix build with GCC-15 on aarch64/musl
Date: Wed, 30 Apr 2025 22:47:33 -0700
Message-ID: <20250501054733.1521614-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 05:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215763

GCC-15 has _CHKFEAT_GCS defined in arm_acle.h to indicate gcs intrinsics
support, this trips llvm libunwind gcs feature detection logic to set
gcs feature on. However the contructs used in unwindlib are assuming clang
and the needed target attribute is not available in gcc it should be +gcs
to work with both clang and gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-gcs-instead-of-gcs-target-attribute.patch | 56 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch

diff --git a/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch b/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
new file mode 100644
index 00000000000..52f47b86857
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
@@ -0,0 +1,56 @@
+From e4f4094de8ddcbe6d5ff1cdf782d2b89e0563903 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Apr 2025 19:51:19 -0700
+Subject: [PATCH] libunwind: Use +gcs instead of gcs target attribute
+
+__attribute__((target("gcs"))) does not work with gcc
+
+GCC-15 has added gcs intrinsics [1] but the syntax for enabling it is
+slightly different. This syntax works with clang too.
+
+With gcc15 compiler libunwind's check for this macros is succeeding and it
+ends up enabling 'gcs' by using function attribute, this works with clang
+but not with gcc but '+gcs' works with both
+
+We can see this in rust compiler bootstrap for aarch64/musl when system
+uses gcc15, it ends up with these errors
+
+Building libunwind.a for aarch64-poky-linux-musl
+cargo:warning=/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/src/UnwindLevel1.c:191:1: error: arch extension 'gcs' should be prefixed by '+'
+cargo:warning=  191 | unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *exception_object) {
+cargo:warning=      | ^~~~~~~~~~~~~
+cargo:warning=/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/src/UnwindLevel1.c:337:22: error: arch extension 'gcs' should be prefixed by '+'
+cargo:warning=  337 |                      _Unwind_Stop_Fn stop, void *stop_parameter) {
+cargo:warning=      |                      ^~~~~~~~~~~~~~~
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5a6af707f0af
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/138077]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/llvm-project/libunwind/src/UnwindLevel1.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/llvm-project/libunwind/src/UnwindLevel1.c b/src/llvm-project/libunwind/src/UnwindLevel1.c
+index 7e785f4d31e7..ed2c8239824c 100644
+--- a/src/llvm-project/libunwind/src/UnwindLevel1.c
++++ b/src/llvm-project/libunwind/src/UnwindLevel1.c
+@@ -185,7 +185,7 @@ extern int __unw_step_stage2(unw_cursor_t *);
+ 
+ #if defined(_LIBUNWIND_USE_GCS)
+ // Enable the GCS target feature to permit gcspop instructions to be used.
+-__attribute__((target("gcs")))
++__attribute__((target("+gcs")))
+ #endif
+ static _Unwind_Reason_Code
+ unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *exception_object) {
+@@ -329,7 +329,7 @@ unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *except
+ 
+ #if defined(_LIBUNWIND_USE_GCS)
+ // Enable the GCS target feature to permit gcspop instructions to be used.
+-__attribute__((target("gcs")))
++__attribute__((target("+gcs")))
+ #endif
+ static _Unwind_Reason_Code
+ unwind_phase2_forced(unw_context_t *uc, unw_cursor_t *cursor,
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 25c0a1ce52a..82d28cf09f4 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://Zdual-proc-macros-additional-check.patch;patchdir=${RUSTSRC} \
+            file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "b1fbf809efe9f036939401e142631c201a53bcf43ec1696bd9f5290ba236a266"
 

