Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926A4C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:18 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.2935.1742372177131234045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jcDOtp+9;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22409077c06so164550315ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372176; x=1742976976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2PtxRgE0TTRXgnqb83QPol09MKM/KsT/+eDq9QzMuk=;
        b=jcDOtp+93mJz09VchSzmbtT/Ak2Tr956fBqSmvGvrXjkzgc7JP3XMED4YJIPiufHU1
         5r9rVUPgoKT5SqP6dlh8piRRhTx9QbIKvSZRkkZ3tGj/OZ0qrEM0xA/O+H7z95M2JLpM
         hJMePf1LDryRIE18k8sSmrXM+r1+nsah0Spn41kRJBX/jYO6CY3wryFB7KOJtjkvthfm
         AMnvBhIZn1A96AjeDoEs9sQLtyTLa7a9DzOxkxoEVvsGBS9YExyHhDmV9ex2rKkC361f
         E0ca7NNIT5/BxASd8oKPxV0UUZexOvhC43VOxs5VZi9A7QdJ3SgfD1iaoYKioVWDjBiz
         jGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372176; x=1742976976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2PtxRgE0TTRXgnqb83QPol09MKM/KsT/+eDq9QzMuk=;
        b=BfirURPY4evG/pRMJoKZiLhsgdFfZszjmnsWrKECdPncq8cWPR7zMTJR5WORTvyT5N
         BM2mX3y5O2Kp06hwNPinQYS2kRVJkNpHG4USbJ4kpyiAeopXgnEzxivekWOr76H1m+sb
         sVtEll3N6vhQWwauPL7QWowtT+G8M+lo43k2+T6pAOkdnYCw2WAAOt2fnuUqmtcG+rMv
         fvMfZTnKP4refbmnOTdv884V6UW/XHbz3bMcTsAP+f0RUSDcGVaAG5FfAIPV7Kfy1400
         tfFtKqLx5SvW2F+on2XlMF5T5WVPE4PU+7XtbgQZ16C25o7B5oj23XElepeKGb6E9Z0F
         G4kQ==
X-Gm-Message-State: AOJu0YxIvvswMyz27nBo3jqBXsuGMdvyaa8uaqxlXC/jTUjTAJLEcdkw
	EFftNnFgdqHyPkdrfADBeHzlWvU/pOB214rylhhYXcbHWy2t7nlFrvRQ7Pyy
X-Gm-Gg: ASbGncvOMy/pxjQzP6Q39GccFuMDO/lMwOFT0pNz1XZ8OwXHpPjx2vph87jPuw7XJDZ
	nwAgM2jjPBWnVI0B+JQ76sSXYohtl6+hKcWLLHycFzlyhuvqj/Y/mNxUvkm/F5oZOvPk2rcems/
	gfXyBz0Dr7lYRCmGzY+q5GOU5OGc8dv9wVRevLDL6xGga65ojyfa1E48MzrcQkfieig++06XaG/
	PJcWKCBsRNPtrBfOfDeYuxOByhq/IwIrhjBGlH7UVw+dtlPHGpXgmRiUY2QFct+Gz2+ADXJJoPM
	Z/sSpS99gg90NrGDOAHhQoKbu6oCH/1v76a42iTclaNL8zU=
X-Google-Smtp-Source: AGHT+IE0qfrRk/Wkmo1REbuqrR0IozNSVohM487tsk8j2tVSA8feZOVjQoglP59d5rENeX+cSLGd0A==
X-Received: by 2002:a05:6a20:2d09:b0:1f5:6d00:ba03 with SMTP id adf61e73a8af0-1fbed125619mr3478102637.36.1742372176120;
        Wed, 19 Mar 2025 01:16:16 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 03/27] webkitgtk: Fix assertion options with clang
Date: Wed, 19 Mar 2025 01:15:31 -0700
Message-ID: <20250319081610.3536475-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213269

libc++20 needs _LIBCPP_HARDENING_MODE while older libc++
needs _LIBCPP_ENABLE_ASSERTIONS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...04-main-7ffc29624258-.-https-bugs.we.patch | 75 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb  |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
new file mode 100644
index 00000000000..5cbb1035b21
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
@@ -0,0 +1,75 @@
+From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Tue, 18 Mar 2025 07:39:01 -0700
+Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
+ https://bugs.webkit.org/show_bug.cgi?id=289953
+
+    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
+    https://bugs.webkit.org/show_bug.cgi?id=289953
+
+    Reviewed by Alicia Boya Garcia.
+
+    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc++
+      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MODE
+      macro, otherwise for older versions keep _LIBCPP_ENABLE_ASSERTIONS.
+
+    Canonical link: https://commits.webkit.org/292304@main
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2c105443d41e5ce3de3a4cac2ed8a07ebd134459]
+
+Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
+ 1 file changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
+index f6cf5ee..3178674 100644
+--- a/Source/cmake/OptionsCommon.cmake
++++ b/Source/cmake/OptionsCommon.cmake
+@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
+ ")
+ check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP)
+ if (CXX_STDLIB_IS_LIBCPP)
+-    set(CXX_STDLIB_VARIANT "LIBCPP")
+-    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
++    set(CXX_STDLIB_TEST_SOURCE "
++        #include <utility>
++        #if _LIBCPP_VERSION >= 190000
++        int main() { }
++        #else
++        #error libc++ is older than 19.x
++        #endif
++    ")
++    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
++    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
++        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
++        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_EXTENSIVE)
++    else ()
++        set(CXX_STDLIB_VARIANT "LIBCPP <19")
++        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=1)
++    endif ()
+ else ()
+     set(CXX_STDLIB_TEST_SOURCE "
+     #include <utility>
+@@ -239,7 +253,7 @@ else ()
+     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_GLIBCXX)
+     if (CXX_STDLIB_IS_GLIBCXX)
+         set(CXX_STDLIB_VARIANT "GLIBCXX")
+-        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
++        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=1)
+     endif ()
+ endif ()
+ message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
+@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
+ 
+ if (USE_CXX_STDLIB_ASSERTIONS)
+     if (CXX_STDLIB_ASSERTIONS_MACRO)
+-        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}=1")
+-        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=1")
++        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}")
++        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
+     else ()
+         message(STATUS "  Assertions disabled, CXX_STDLIB_ASSERTIONS_MACRO undefined")
+     endif ()
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index afd5dcdd8d8..dfbf9590542 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
            file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
+           file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 

