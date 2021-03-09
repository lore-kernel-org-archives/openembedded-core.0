Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.545.1615329660946853377
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 14:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N/ubzBUr;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d23so4180919plq.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 14:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c/s+hDWBdKdvpZ48ljrI3i0Sk7xGJbMn/QfcjDiOzHo=;
        b=N/ubzBUr/hvZdXQtATG9QeKEqt3P7ShRzcqko9Gq6tMrWW7AR3D/uaNTBo8r/9pg9O
         NkXavFAHxJTOolNQN5oElo2C68G7Gne6+yl3fCXyzV9CC02svn9JkT/NV+iT/oKbpArO
         r83TzMthCeDrCuZcLq6yhp+25EdFxYDw3UFV/EHtc92auNa/T/33J8q5kMIJ42p1KsBK
         jL2IXKon7QMo8LClkLAf/Jd56iQNSndT4oY+v3uirwSz+U8qv131sgr1souV2P9hgIJ5
         NPpHo8kfIhSybYDQzn8wS1jSR09HgA5aFAQNh+g0QRLYKogWhQ0KxNu1rfBYlH3J7AR/
         8xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c/s+hDWBdKdvpZ48ljrI3i0Sk7xGJbMn/QfcjDiOzHo=;
        b=hDYa5QDaCNb6AF6BQH/xovJ4SfF2hC/rxcwOyWtuFQfRFKkJi4XqGKEAGhHSG1ERDr
         cI/7ajJ5XxBPNCGdzZAvJYuYLKYy87KNImEN+iGcvh2Es1WQdHoraQOVSpQK4epx8cZl
         Jk76E33pzVtyV2k3xBfnhNOUHMiMfhB1vV7dXkh7icbqiQTlaGYAyPmA+d6AwS2DKG3i
         TQO2gY9lQ+QlvV2zRGaknlzxKKmLQNWS1vUcyoUDXBb8PVkxojcYZn6oKlJZfUoOHtY9
         tTjp8AXixfTog9PsXjL3akYIDfIgT/eMt8MlETm2O8pVSk7k6HYmf2hW7LfAxEpTrN6e
         35qg==
X-Gm-Message-State: AOAM5326n9tYxWpKKCoekrZgyH3DYdpex/0Ywd2CHUarcqPss/p2jUt3
	/GSqWqwvH3S+57Chu9MRYs5u9YuAdVppiw==
X-Google-Smtp-Source: ABdhPJxBU6ODOr+DEeRweVZF8fqXFcZrvwGZS8nsoYXHBDjLkDlV0qyYmdlbHuBARptCwtYIQ37D1A==
X-Received: by 2002:a17:90a:8594:: with SMTP id m20mr119309pjn.215.1615329660067;
        Tue, 09 Mar 2021 14:41:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id mz11sm3892032pjb.6.2021.03.09.14.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 14:40:59 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] webkitgtk: Enhance check for atomics to include 1 byte CAS
Date: Tue,  9 Mar 2021 14:40:57 -0800
Message-Id: <20210309224057.3236584-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes linking failures
Source/WTF/wtf/text/StringImpl.h:1115: undefined reference to `__atomic_compare_exchange_1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Switch to upstream submitted patch instead of making RISCV specific

 ...ics-check-to-include-1-byte-CAS-test.patch | 77 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  2 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
new file mode 100644
index 0000000000..93bda4d754
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
@@ -0,0 +1,77 @@
+From 40520b0de69d8ca8e659248f5ffe641f33cc6dee Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Mar 2021 14:16:58 -0800
+Subject: [PATCH] Extend atomics check to include 1-byte CAS test
+
+Rename ATOMIC_INT64_REQUIRES_LIBATOMIC to ATOMICS_REQUIRE_LIBATOMIC so
+it can reflect broader range which is now checked
+
+Rename ATOMIC_INT64_IS_BUILTIN to ATOMICS_ARE_BUILTIN
+
+Upstream-Status: Submitted [https://bugs.webkit.org/attachment.cgi?bugid=222959]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/JavaScriptCore/CMakeLists.txt   |  2 +-
+ Source/WebKit/CMakeLists.txt           |  2 +-
+ Source/cmake/WebKitCompilerFlags.cmake | 15 ++++++++++-----
+ 3 files changed, 12 insertions(+), 7 deletions(-)
+
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -129,7 +129,7 @@ if (USE_CAPSTONE)
+     list(APPEND JavaScriptCore_LIBRARIES capstone)
+ endif ()
+ 
+-if (ATOMIC_INT64_REQUIRES_LIBATOMIC)
++if (ATOMICS_REQUIRE_LIBATOMIC)
+     list(APPEND JavaScriptCore_LIBRARIES atomic)
+ endif ()
+ 
+--- a/Source/WebKit/CMakeLists.txt
++++ b/Source/WebKit/CMakeLists.txt
+@@ -337,7 +337,7 @@ if (USE_LIBWEBRTC)
+     list(APPEND WebKit_LIBRARIES webrtc)
+ endif ()
+ 
+-if (ATOMIC_INT64_REQUIRES_LIBATOMIC)
++if (ATOMICS_REQUIRE_LIBATOMIC)
+     list(APPEND WebKit_PRIVATE_LIBRARIES atomic)
+ endif ()
+ 
+--- a/Source/cmake/WebKitCompilerFlags.cmake
++++ b/Source/cmake/WebKitCompilerFlags.cmake
+@@ -280,12 +280,17 @@ endif ()
+ if (COMPILER_IS_GCC_OR_CLANG)
+     set(ATOMIC_TEST_SOURCE "
+         #include <atomic>
+-        int main() { std::atomic<int64_t> i(0); i++; return 0; }
++        int main() {
++          std::atomic<int64_t> i(0);
++          std::atomic<int8_t> j(0);
++          i++; j++;
++          return 0;
++        }
+     ")
+-    check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMIC_INT64_IS_BUILTIN)
+-    if (NOT ATOMIC_INT64_IS_BUILTIN)
++    check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMICS_ARE_BUILTIN)
++    if (NOT ATOMICS_ARE_BUILTIN)
+         set(CMAKE_REQUIRED_LIBRARIES atomic)
+-        check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMIC_INT64_REQUIRES_LIBATOMIC)
++        check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMICS_REQUIRE_LIBATOMIC)
+         unset(CMAKE_REQUIRED_LIBRARIES)
+     endif ()
+ endif ()
+--- a/Source/WTF/wtf/CMakeLists.txt
++++ b/Source/WTF/wtf/CMakeLists.txt
+@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES
+     ICU::uc
+ )
+ 
++if (ATOMICS_REQUIRE_LIBATOMIC)
++    list(APPEND WTF_LIBRARIES atomic)
++endif ()
++
+ set(WTF_INTERFACE_LIBRARIES WTF)
+ set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_DIR})
+ set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
index a1dd76ce81..d0a41f48c7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
@@ -19,7 +19,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
+           file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
            "
+
 SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
-- 
2.30.1

