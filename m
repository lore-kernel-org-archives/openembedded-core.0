Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C58FD5AE71
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3002.1765620100825436570
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h91uWA6q;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29d7b019e0eso29289685ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620100; x=1766224900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txuBcYG5gbba0s2235uBtX+bf4jwp2SFq+0IMnII2I0=;
        b=h91uWA6q8OBTnZGwXn4VUDQuqlVnbFYvALFngn/gnUjXGLhbvJ74pU2z8PGc6OttyX
         f1hAUKTBE1N826LWl0ePyIW27k5xZ90wPLwJt28CJmRiLDcWxjjtdvi51CqPhj/tpBHa
         HsRjVvtsxt2AmSTGvQslgzaGYFrG3sTWQU5Wy0+Bh0OCPuR5CZvqQQz3yetrrgMDzf4C
         e3m6307potR7sMlek05Vw9H/4W/pdLFlJvOGrPZlCLR58tyGXAE9es3oP5FvhVQK7zs9
         Fmo63pjxzAifgD3SIfj0jAl3fvNgmmNYzick80GFVOAinM69HMWszmklY8p1oBWR75W9
         pH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620100; x=1766224900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txuBcYG5gbba0s2235uBtX+bf4jwp2SFq+0IMnII2I0=;
        b=gvKG2mTWOFlMu5+o+3Sh1cRyy1fzBqqVo/IJeud4kvHNX+87fQcY83Zwd4Jjay2JJv
         D3wL+Uhsrf2zKm4gJg2YybQntTGT2/oEK72CA6Xzz4kgc8LBaPeSEd4geG+FJumGHDrL
         1lwATlx5Jm8eVemD8gODgtfNWaWm5bkMsWEcNbUFaXHwIxaZohlhRlDztOabN+Yp1D9m
         iSJpu4OMOFwDbHCTiZi4l+sxqDQcmKqU9XU5SwS5SLYlhYdKbdIaZhwzqlsPigPPvHUK
         v78uB6jHCXjuqYOiCz9lq2N5DEFKDNs5O3E4o+qnetA0k/Ph2Z0hBV7Jfaj7tI9DjvCn
         +FjA==
X-Gm-Message-State: AOJu0YxT7mybUEORsl5X1h1VXjCexa7ec36/0OzdHAsQIc4ZAJk3QoT3
	cvBXVeoB1cdQ3CWgK5DbTN5VcbYHriwfQHR9mXpM5fPcwiNDZQnqEhgr81Qa8/FA
X-Gm-Gg: AY/fxX4LBub7/HmQZCCEf746Fn915s0tE37BhaqK69GoBiq6xC9kXpVZRZhjq9nZeeK
	6sIlPkpQ/SMjZqUcru32e4zR24fGN8Z14pf5J3h+6bvEc+M+3CrxanD9FibxncWzlq0m6xkMfTT
	8KkzDHK30oJ4bBu6nTLuw+zmUZZUH6HUvjkkN4SkfxMh+NnoUxuTJ0lSfIY/rL7UYdDqytTuxLO
	OUhOXwBxOdxkKjoJ1Va/lQtjObRTD71U/Y8hoeKUJR8KUwA62p/t4QY5H8/L1VhCTbO/kossvXT
	/RmGeJYYhXLwe5HbS5reP39Ywm8NcIZ7AyFDbZ4LHvo7zlbsQXDg92HQT8ad42a7extC5Ta5t/o
	TJorzMlZFFUF7F5F4EXJ7no1ZSgAmoeK8vV+7hMIZsey97zHQqeoD1I/hVE9pVBE6WfqDA9Fkgg
	XhKzciWzh1Q/CpUaN5C+WOTSIK
X-Google-Smtp-Source: AGHT+IGrEVYOSVTxlsLMwjW2k7ifI1wNJeDeeuXdYJ+0sjZy/CotM/isFQpYk4THgLxT9OMbzwGGnA==
X-Received: by 2002:a17:902:dac7:b0:2a0:7fa0:7b5c with SMTP id d9443c01a7336-2a07fa08504mr25334895ad.55.1765620100006;
        Sat, 13 Dec 2025 02:01:40 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 44/67] clang: Fix libgcc.so.1.0 symlink to point to libunwind.so.1
Date: Sat, 13 Dec 2025 15:29:08 +0530
Message-ID: <20251213095931.2571498-44-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227662

From: Khem Raj <raj.khem@gmail.com>

Pointing to libunwind.so results in build QA errors since libunwind.so
ends up in -dev package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 88c2c783bfb3fe55b6f7bec6b7b711c502a434d9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...symlink-path-for-libcc-when-LLVM_ENA.patch | 33 ++++++++
 ...libgcc.a-symlink-path-when-LLVM_ENAB.patch | 83 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  4 +-
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch

diff --git a/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch b/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
new file mode 100644
index 0000000000..f385dc83ea
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
@@ -0,0 +1,33 @@
+From 4204fd1b62de30418433139fea1b7dad4fff9c59 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Oct 2025 15:44:49 -0700
+Subject: [PATCH] [llvm-libgcc] Fix symlink path for libgcc
+
+The symlink for libgcc_so.1.0 is made to point to libunwind.so
+which is functionally correct but it fails some linux distro packaging
+complain because libunwind.so is made part of -dev package but
+libgcc_so.1.0 ends up in the real package, and creates an unneeded
+package -> dev dependency
+
+create the symlink to point to libunwind.so.1 instead then the boundaries
+of packaging are not crossed and all is well.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/165487]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm-libgcc/CMakeLists.txt | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
+index 47208fc19869..54009c1104c3 100644
+--- a/llvm-libgcc/CMakeLists.txt
++++ b/llvm-libgcc/CMakeLists.txt
+@@ -137,7 +147,7 @@ add_custom_target(llvm-libgcc ALL
+   DEPENDS unwind_shared unwind_static clang_rt.builtins-${COMPILER_RT_DEFAULT_TARGET_ARCH}
+   COMMAND ${CMAKE_COMMAND} -E create_symlink ${LLVM_LIBGCC_COMPILER_RT} libgcc.a
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.a libgcc_eh.a
+-  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so libgcc_s.so.1.0
++  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so.1 libgcc_s.so.1.0
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1.0 libgcc_s.so.1
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1 libgcc_s.so
+ )
diff --git a/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch b/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch
new file mode 100644
index 0000000000..789d6d727a
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch
@@ -0,0 +1,83 @@
+From 919fcd11ad53bdfab9a14d5df6de0895bf24e456 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Oct 2025 19:02:44 -0700
+Subject: [PATCH] [llvm-libgcc] Fix libgcc.a symlink path when LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF
+
+The llvm-libgcc installation was creating incorrect symlinks for libgcc.a
+when built with LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF, particularly seen with
+Yocto cross-compilation environments.
+
+Issues seen:
+
+-  Absolute path in symlink: The previous code didn't handle absolute paths
+   returned by get_compiler_rt_install_dir() in staging/sysroot environments,
+   resulting in symlinks like:
+   libgcc.a -> /absolute/path/to/sysroot/usr/lib/clang/.../libclang_rt.builtins.a
+
+-  Missing architecture suffix: When the install path contained "clang", the
+   code would skip setting builtins_suffix, creating:
+   libgcc.a -> clang/21.1.4/lib/linux/libclang_rt.builtins.a
+   instead of:
+   libgcc.a -> clang/21.1.4/lib/linux/libclang_rt.builtins-aarch64.a
+
+-  Incorrect relative path calculation: The original regex stripped too much
+   or too little of the path, either creating symlinks pointing to non-existent
+   locations or stripping the clang/ directory prefix entirely.
+
+Solution:
+
+- Extract the relative path starting from 'clang/' when present in absolute
+  paths, ensuring the symlink points to the correct location within the
+  installation hierarchy
+- Always append the architecture suffix to the builtins library name
+- Only prepend '../' to the path when LLVM_ENABLE_PER_TARGET_RUNTIME_DIR is
+  enabled, as this is when the builtins are in a different directory level
+
+The symlink now correctly points to the existing compiler-rt builtins library
+without creating duplicate copies.
+
+Tested with LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF in cross-compilation
+environments (aarch64 target).
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/165487]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm-libgcc/CMakeLists.txt | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
+index cd9c5011d410..ee7fe768bda0 100644
+--- a/llvm-libgcc/CMakeLists.txt
++++ b/llvm-libgcc/CMakeLists.txt
+@@ -124,11 +124,27 @@ target_link_libraries(unwind_shared PUBLIC
+ #===============================================================================
+
+ get_compiler_rt_install_dir(${COMPILER_RT_DEFAULT_TARGET_ARCH} install_dir_builtins)
+-string(REGEX REPLACE "^lib/" "" install_dir_builtins "${install_dir_builtins}")
+-string(FIND "${install_dir_builtins}" "clang" install_path_contains_triple)
+-if(install_path_contains_triple EQUAL -1)
+-  set(builtins_suffix "-${COMPILER_RT_DEFAULT_TARGET_ARCH}")
++
++# Extract the relative path starting from 'clang' or after 'lib/'
++if(IS_ABSOLUTE "${install_dir_builtins}")
++  # For absolute paths, extract starting from 'clang/' if it exists
++  string(REGEX MATCH "clang/.*$" install_dir_builtins_temp "${install_dir_builtins}")
++  if(install_dir_builtins_temp)
++    set(install_dir_builtins "${install_dir_builtins_temp}")
++  else()
++    # Fallback: strip up to first lib/
++    string(REGEX REPLACE "^.*/lib/" "" install_dir_builtins "${install_dir_builtins}")
++  endif()
+ else()
++  string(REGEX REPLACE "^lib/" "" install_dir_builtins "${install_dir_builtins}")
++endif()
++
++# Always add the architecture suffix
++set(builtins_suffix "-${COMPILER_RT_DEFAULT_TARGET_ARCH}")
++
++# Only prepend ../ when using per-target runtime directories
++string(FIND "${install_dir_builtins}" "clang" install_path_contains_triple)
++if(install_path_contains_triple GREATER -1 AND LLVM_ENABLE_PER_TARGET_RUNTIME_DIR)
+   string(PREPEND install_dir_builtins "../")
+ endif()
+ set(LLVM_LIBGCC_COMPILER_RT ${install_dir_builtins}/libclang_rt.builtins${builtins_suffix}.a)
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index f19599ae58..4ea22fe5fa 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -38,7 +38,7 @@ SRC_URI = "\
     file://0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
     file://0017-clang-Use-python3-in-python-scripts.patch \
     file://0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch \
-    file://0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \ 
+    file://0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \
     file://0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
     file://0021-libunwind-Added-unw_backtrace-method.patch \
     file://0022-lldb-Link-with-libatomic-on-x86.patch \
@@ -59,6 +59,8 @@ SRC_URI = "\
     file://0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
     file://0038-Prevent-revisiting-block-when-searching-for-noreturn.patch \
     file://0039-Only-build-c-index-test-when-clang-tests-are-include.patch \
+    file://0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
+    file://0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch \
     file://0001-Install-lldb-tblgen.patch \
     file://0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
     file://0001-clang-Support-building-native-tools-when-cross-compi.patch \

