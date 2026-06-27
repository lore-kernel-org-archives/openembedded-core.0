Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E4DC44502
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 07:55:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51398.1782546940932888307
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 00:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dL3mt933;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46cdc80779bso1558323f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 00:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782546939; x=1783151739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV3trO7+FZEHpj4IMIN/UUIUvNytJ5oeKJyaULxvdPo=;
        b=dL3mt933skwcVSeES3PKqOtQl9dwCQZjhQ5CmJnbdJJZNXgO18q5ftxerB1ak5j1bS
         D0BhCjqAo8jYXSnddRQD+p8xOkRWJnROocP8d39be10w2XMJqbwIdFwgYPn512CIZWDD
         1jv/r0BtW4BGaFvX5K5JBbqn8DvVuGCHw3FREVGRpc43Sm02ejrxwMYzY3zYTp8kb7FK
         0bvc5dziTMsfA1tkXXGF3ACFzhgag0HG5EIDc6J2xgF27zKsV7/xHYFydt5vEatquqsY
         2qzSrNjxcMatu5qUjjr1GpgGQGjwsNypRXv80YsKlgnv/kC4T5tKvVGq3tcIWo1DfuoX
         13fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782546939; x=1783151739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rV3trO7+FZEHpj4IMIN/UUIUvNytJ5oeKJyaULxvdPo=;
        b=q7WaInFc+VuM9mE+vox2koMf1MQjA7jqpkEz91qnCQLIZDfO8E0RgTxXkyIjSi+gal
         3N7tMBqP+yAhyD2Iu8C2sZkUK8s3yPf5svNq9eBEupgy2G/5TrHgIdA0w0Cex1SUlCbw
         Tsb+gOnm+Izov19mp3AABRw6aWq/9u5ssb2eQT8C3Rty6U1Xq7bRM55VUcnGYrtrQAMI
         kge5s9V5rXyOsXTNdNvOoHheXOCWU5l6i0Wv6DW4mT//eKJ7BIth6F3EENki3bfdwSV2
         KkAD0uX+hibVnCuCddZFBxp341bBW75ICj7sWb3RHXypFVcq52G1z2xM0aEoWImvKFVC
         XNqw==
X-Gm-Message-State: AOJu0YyhSTUrrsAPDntza0BYLZT8MYnH3ZhoYkGKy08+0rgjbc/vzxMl
	PpWvubVaVJ7CcGqrpkB5UpOgw3tZgpAjs2QqgVycHi1isiHmGLLUt0pkhM7NBGmx7no=
X-Gm-Gg: AfdE7ckiF+S3mhLBISVfOlbqQ1l+EJlhmPlT9FdmBnpQGe/4lEW1xP+bwxQYK7Q5Egk
	YCL9NC1Frk0aG/85a3dHYMck/5ml1L1SRDuXCHCv8haB5jGr9AerefFnU7MN9Nsu2GQx4lyTcOx
	kmWvyEzuPjGtIeVjG73cmlCLiuQ4glX4JnRHNS9VCnHEz3yz/hV03FLRNH2637akg4pqXPClvSq
	iIDk5JvPmfq2bqm12W046mxyD+co8QTm6/hDRaAGw7r0l/xGQ8l0o2AwzxUgxsySepFLGDyEIKF
	lqDNcBrPEfMWYrr+h0XE0p5ZF7CrzmNU3pMC1CjJnWhxaV8eQxxMXBPI1eap8JbfJK9KqoHHxxi
	tFAZAkDFw3IBM8hYZv1bOfhyWnyF09BCbW+vl3LDL+rY/3MHgwjE/u2a3JbfEKBSLDgFCwnT/tE
	zIXZLU0FJsOrP1c/VKs+r038UUN04LmzEkAPswvtH+WF8oYry8
X-Received: by 2002:a5d:64e3:0:b0:461:a16c:a6c1 with SMTP id ffacd0b85a97d-46dc2075bb8mr15098425f8f.36.1782546939008;
        Sat, 27 Jun 2026 00:55:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f4ffc11d9sm11421952f8f.37.2026.06.27.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 00:55:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/8] webkitgtk: upgrade 2.50.6 -> 2.52.4
Date: Sat, 27 Jun 2026 09:55:25 +0200
Message-ID: <20260627075532.3153679-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627075532.3153679-1-alex.kanavin@gmail.com>
References: <20260627075532.3153679-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 07:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239687

From: Alexander Kanavin <alex@linutronix.de>

Disable on 32 bit x86: upstream doesn't test the build for it, it has regressed,
and it's just not a relevant or useful target for a web engine in 2026.

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/epiphany/epiphany_50.4.bb  |  4 +--
 ...able-to-control-macro-__PAS_ALWAYS_I.patch | 10 +++----
 ...spection.cmake-prefix-variables-obta.patch |  2 +-
 ...-on-RISCV-https-bugs.webkit.org-show.patch | 30 -------------------
 ...dGLib.cmake-do-not-set-include-dirs-.patch | 30 +++++++++++++++++++
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  |  6 ++--
 .../webkit/webkitgtk/reproducibility.patch    |  4 +--
 .../webkit/webkitgtk/sys_futex.patch          |  2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    |  6 ++--
 ...ebkitgtk_2.50.6.bb => webkitgtk_2.52.4.bb} |  9 +++---
 10 files changed, 52 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.50.6.bb => webkitgtk_2.52.4.bb} (96%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_50.4.bb b/meta/recipes-gnome/epiphany/epiphany_50.4.bb
index 2abec0742d..2b2d08b615 100644
--- a/meta/recipes-gnome/epiphany/epiphany_50.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.4.bb
@@ -41,5 +41,5 @@ PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
 FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
 
-# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
-COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
+# please see webkitgtk recipe for details
+COMPATIBLE_HOST:x86 = "null"
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index a2c315a7cc..4aad11e311 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From ec0a881bb05e5a4eed9a71b4494e64373cdd4d25 Mon Sep 17 00:00:00 2001
+From 73c15fceb9bcb3896c56de0ab712e76d2eca0b19 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -44,10 +44,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-index ea511e5b..2e8df1e5 100644
+index a845ed01..4bde7544 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
+@@ -46,7 +46,7 @@ __PAS_BEGIN_EXTERN_C;
  #define __SUSPICIOUS__
  #define __BROKEN__
  
@@ -57,10 +57,10 @@ index ea511e5b..2e8df1e5 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index 77a292fb..bf53d809 100644
+index efdf8d4d..8c57ad5b 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -512,3 +512,10 @@ endif ()
+@@ -570,3 +570,10 @@ endif ()
  
  # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
  set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 56d532749a..b05ebe5fbb 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 14b50f50e1c8198f3a14767b8d62e25093babe51 Mon Sep 17 00:00:00 2001
+From 6ec23f12926c93746fdd30a9b5547a76878c9a4c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
deleted file mode 100644
index 66ffd1266b..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7fe5b5ef35441a2e40cac13a51c6af10afa1dbe2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Mar 2025 01:21:22 -0700
-Subject: [PATCH] Fix build errors on RISCV
- https://bugs.webkit.org/show_bug.cgi?id=290163
-
-Reviewed by NOBODY (OOPS!).
-
-Include c++ header <system_error> for std::error_code.
-
-* Source/WebCore/contentextensions/ContentExtensionActions.h: Include system_error
-
-Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42802]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WebCore/contentextensions/ContentExtensionActions.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/WebCore/contentextensions/ContentExtensionActions.h b/Source/WebCore/contentextensions/ContentExtensionActions.h
-index a600f410..80512454 100644
---- a/Source/WebCore/contentextensions/ContentExtensionActions.h
-+++ b/Source/WebCore/contentextensions/ContentExtensionActions.h
-@@ -28,6 +28,7 @@
- #if ENABLE(CONTENT_EXTENSIONS)
- 
- #include "ContentExtensionStringSerialization.h"
-+#include <system_error>
- #include <wtf/JSONValues.h>
- #include <wtf/Hasher.h>
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
new file mode 100644
index 0000000000..03b3db2444
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
@@ -0,0 +1,30 @@
+From e625e06202f992936b43790ee2c992611facba04 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 21 Jun 2026 22:57:24 +0200
+Subject: [PATCH] Source/cmake/FindGLib.cmake: do not set include dirs from
+ INCLUDEDIR
+
+The correct include directory set is provided by INCLUDE_DIRS (e.g. the following line).
+INCLUDEDIR is a prefix to them (e.g. it's set to /usr/include in most cases), and adding
+it is causing problems in cross-compile scenarios where the build is performed against
+a system root and include locations are substituted to that using pkg-config override
+mechanisms.
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/67960]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Source/cmake/FindGLib.cmake | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Source/cmake/FindGLib.cmake b/Source/cmake/FindGLib.cmake
+index 00de647d..68581c25 100644
+--- a/Source/cmake/FindGLib.cmake
++++ b/Source/cmake/FindGLib.cmake
+@@ -191,7 +191,6 @@ function(GLib_HandleComponent name)
+     list(TRANSFORM dependencies PREPEND GLib::)
+     add_library(GLib::${name} UNKNOWN IMPORTED GLOBAL)
+     set_target_properties(GLib::${name} PROPERTIES IMPORTED_LOCATION "${GLib_${name}_LIBRARY}")
+-    target_include_directories(GLib::${name} INTERFACE ${PC_GLib_${name}_INCLUDEDIR})
+     target_include_directories(GLib::${name} INTERFACE ${PC_GLib_${name}_INCLUDE_DIRS})
+     target_compile_options(GLib::${name} INTERFACE ${PC_GLib_${name}_CFLAGS})
+     target_compile_options(GLib::${name} INTERFACE ${PC_GLib_${name}_CFLAGS_OTHER})
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index 82eb56a0f6..8fff6f5f81 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,7 +1,7 @@
-From 9d09d47c01b8ee92a02662d58d2570160064fa5d Mon Sep 17 00:00:00 2001
+From 30ce10321a6f49aa27284139dafcf3517f95d13c Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
 Date: Fri, 19 Dec 2025 10:10:41 +0000
-Subject: Use WTF_CPU_UNKNOWN when building for riscv64
+Subject: [PATCH] Use WTF_CPU_UNKNOWN when building for riscv64
 
 WebKitGTK doesn't build on riscv64 even with the JIT disabled.
 Treating the CPU as unknown is perhaps a bit severe, but it allows us
@@ -36,7 +36,7 @@ index 8aac1024..d9d69a40 100644
  #define WTF_CPU_UNKNOWN 1
  #endif
 diff --git a/Source/cmake/WebKitCommon.cmake b/Source/cmake/WebKitCommon.cmake
-index 98ee788a..3861c0a4 100644
+index 639b7e5d..c7e60287 100644
 --- a/Source/cmake/WebKitCommon.cmake
 +++ b/Source/cmake/WebKitCommon.cmake
 @@ -129,8 +129,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 14784a38a0..1fc3ccaf62 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From d8a41103d268c7d7de12326a15642508c3541d85 Mon Sep 17 00:00:00 2001
+From 983fe4a8fd6fb6512fdf78d9a32be345c252e64d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
@@ -16,7 +16,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/JavaScriptCore/generator/GeneratedFile.rb b/Source/JavaScriptCore/generator/GeneratedFile.rb
-index 6ed2b6e4..86a28286 100644
+index 9a951947..d499ae30 100644
 --- a/Source/JavaScriptCore/generator/GeneratedFile.rb
 +++ b/Source/JavaScriptCore/generator/GeneratedFile.rb
 @@ -25,7 +25,7 @@ require 'date'
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
index c473e81705..dd9d93a662 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,4 +1,4 @@
-From 5a82a729903fcd6943334c160838a143dc9a3b3c Mon Sep 17 00:00:00 2001
+From ddd3c2ff59abeea528d228ad5d5641fc3a3e5f83 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Dec 2024 20:24:22 -0800
 Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit time_t
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 97af0bce8f..b37673293f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From 367cc1e4bdb122a72666314abdb09dad266fd8a6 Mon Sep 17 00:00:00 2001
+From d2df5d7398dea93b4c7907299dc5030274894b15 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
@@ -21,10 +21,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index d80e882a..84448df2 100644
+index fcec367d..851f68d9 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -340,8 +340,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+@@ -341,8 +341,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
      UNUSED_VARIABLE(t2);
      UNUSED_VARIABLE(t3);
      UNUSED_VARIABLE(t5);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
index 5d2c970b29..1c3f2343ba 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
@@ -15,10 +15,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
-           file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
+           file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch \
            "
-SRC_URI[sha256sum] = "2b281abf8894ffc6172152e5660b75eeeedbe1cc43d6783d09dc79f7c865bb42"
+SRC_URI[sha256sum] = "cf4076a1ca2a64788edca8c452d8ebb68d5e2965e588fe46a388a016513edce4"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -150,8 +150,9 @@ ARM_INSTRUCTION_SET:armv7a = "thumb"
 ARM_INSTRUCTION_SET:armv7r = "thumb"
 ARM_INSTRUCTION_SET:armv7ve = "thumb"
 
-# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
-COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
+# As of 2.52.4, 32 bit x86 builds are broken:
+# https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4013/steps/12/logs/stdio
+COMPATIBLE_HOST:x86 = "null"
 
 # introspection inside qemu-arm hangs forever on musl/arm builds
 # therefore disable GI_DATA
-- 
2.47.3


