Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881B6C3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 06:33:50 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.5685.1746081223209502234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 23:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R//u0o34;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736aaeed234so673220b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 23:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746081222; x=1746686022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m5FruCdz2IkOV61Q3KibGDbQg0rbWXNceRDBW8pV7HU=;
        b=R//u0o34mYS9+Er/ghJH+GJ1ZP7gnFfMCKObPyq7JOp1EK7QMoOGqevmj5HxDlNs9b
         3k9zZjAAagS8qDwJPCMZRoY0WL00PiPqVlngklToshY3HbyltYbqHeF9D7kuC/yGXI/u
         axIjblcbuasgXZbs1emcyuIeCoPysnFXDrR9PMMIxWRidGKhiqIbnp1F1IaQI+/No4RX
         WlY9jIcnGdY7vZ+2rx552mpDFe+7NdtFvmKDnQUUbKyLfdMPMi8tnRC7hQgPQ995bX8W
         +MmLaoXfN87e92aknJRXs+lJCXw6BFWt8dfjs0pQ97xhInjh7ASbNr3/L+iBF0gqVmYA
         WTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746081222; x=1746686022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5FruCdz2IkOV61Q3KibGDbQg0rbWXNceRDBW8pV7HU=;
        b=rmbblDYEUlG70gNKWuCYoy50tDRKm+tvpaAMaABcvpr44dzh9T+sFzkTJzfKkXz7ve
         VI77A3co8F0vhvGTXpXo3IOpXn/BZecFjOi8arhenayMkBaqAsjoWUIq+ySkGgNBcjpw
         E8GaGYX/DgEMC+dL0ImJ80saEttgYDHphPykaNzCwPWtmutbQ3HxVSh7dV69QYMbj4a2
         yPaTw+sQ6n8FrBW2GFPB+MPgseslktJsbLfDVXPmuwGO5wPnQ6jgji0uJbrONlkGdNj5
         Yk3YWLj+PGqRIlKqKr9iRnRbCr5Jno7u3nOO96q6voib7RFbIXquyRMQkX07eyY/Ps8X
         yWyg==
X-Gm-Message-State: AOJu0YzjvXhRCN/7fIUsh14qg5+m0UPxNd6C8QwSpUVQOrVllEAgQ4p7
	r5zvwt6QDuRAhLrU/4CH6IWVA0ZmViY/0tNyFG9G8X/EG9T3OHvlCe6ovKXw
X-Gm-Gg: ASbGnctZNEgavcDoAZyftk7Am3cj43bjfB3cLJ9ynYJf0nw89AhU5cXekJggjgEmgYH
	nHNacRkfnCEdsOQxvjjiff4pRLxEYzh0pmX7fElXyfc3Yu6gbTowLf9ui7/FRrRyyIZ/4Mh4Yel
	IZLJd5onvAoxVEyRNxCO+5YjTuVrMJpc6eb8txbs6DEA1d+HgLH+oy5ilx6pycaz7IVjoQqVY9X
	EfqsUylUVrK2qdj58+iFfTwj26bcovO6XGWmSceD9w47YOMP+XBXEb35/ayBc93Yae/XQH42rWk
	nFYRFqk0o23IqPzdBdk+cxkFisG7yP8W
X-Google-Smtp-Source: AGHT+IH95IEh8vVV38PKHaxzhuaNPr3MDZsKUQ2dxxsiKDGvtVi+cKzoFRHTUsFiotnQ92Z6VF+fnA==
X-Received: by 2002:a05:6a20:c78e:b0:1f5:884a:7549 with SMTP id adf61e73a8af0-20bd873eebbmr2149772637.41.1746081222022;
        Wed, 30 Apr 2025 23:33:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b8ae])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d6436c2sm73222a12.49.2025.04.30.23.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:33:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rust: Fix build with GCC-15 on aarch64/musl
Date: Wed, 30 Apr 2025 23:33:39 -0700
Message-ID: <20250501063339.1587969-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 06:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215765

GCC-15 has _CHKFEAT_GCS defined in arm_acle.h to indicate gcs intrinsics
support, this trips llvm libunwind gcs feature detection logic to set
gcs feature on. However the contructs used in unwindlib are assuming clang
and the needed target attribute is not available in gcc it should be +gcs
to work with both clang and gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Disable gcs with gcc, it was as such with gcc-14 too

 ...-gcs-instead-of-gcs-target-attribute.patch | 66 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch

diff --git a/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch b/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
new file mode 100644
index 00000000000..a704671fb9b
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
@@ -0,0 +1,66 @@
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
+--- a/src/llvm-project/libunwind/src/UnwindLevel1.c
++++ b/src/llvm-project/libunwind/src/UnwindLevel1.c
+@@ -185,7 +185,7 @@ extern int __unw_step_stage2(unw_cursor_
+ 
+ #if defined(_LIBUNWIND_USE_GCS)
+ // Enable the GCS target feature to permit gcspop instructions to be used.
+-__attribute__((target("gcs")))
++__attribute__((target("+gcs")))
+ #endif
+ static _Unwind_Reason_Code
+ unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *exception_object) {
+@@ -329,7 +329,7 @@ unwind_phase2(unw_context_t *uc, unw_cur
+ 
+ #if defined(_LIBUNWIND_USE_GCS)
+ // Enable the GCS target feature to permit gcspop instructions to be used.
+-__attribute__((target("gcs")))
++__attribute__((target("+gcs")))
+ #endif
+ static _Unwind_Reason_Code
+ unwind_phase2_forced(unw_context_t *uc, unw_cursor_t *cursor,
+--- a/src/llvm-project/libunwind/src/cet_unwind.h
++++ b/src/llvm-project/libunwind/src/cet_unwind.h
+@@ -42,7 +42,8 @@
+ #include <arm_acle.h>
+ 
+ // We can only use GCS if arm_acle.h defines the GCS intrinsics.
+-#ifdef _CHKFEAT_GCS
++// Enable gcs with clang for now, gcc does not build unwindlevel1.c correctly
++#if defined(_CHKFEAT_GCS) && defined(__clang__)
+ #define _LIBUNWIND_USE_GCS 1
+ #endif
+ 
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
 

