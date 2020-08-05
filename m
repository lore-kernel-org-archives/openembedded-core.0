Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.8880.1596639018127058126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=O0V33deE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id m8so15981345pfh.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=13PBTYoRzgCaVlgSYtkVNBrTNMBXrSdFTvK9QjpjOVM=;
        b=O0V33deEozbQ0bCWqIiNMHqjJfucA1U+o0LdH1Zk+L8B1V9FxRiU9Osydvf89ygc9W
         HHZ/+Vq2kzsAWQH9fenj/cPPrYwVCQCPzGeA8HlaAWWmQZunIqoor9mrPVonmxwKqSuS
         NMJ9kU8ImfvfuGlEfthh5+WC3FGl3/hCWVnIAi7N+UOfQXT6euhBVc7VTRdilUQJBqF+
         0HpdkTFyYUDfHwJb83fjmzpMzN+Eytp8jJiwX6vUkJtyHrJNQhxm8o8iFhaZOd/ZMYu6
         luthPo/BTkE59+0ts46UhnHlS4zCnoPaIj9JJFnxl0ZpY78DpI1RMnN5grX+HzCFcCV1
         ++Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=13PBTYoRzgCaVlgSYtkVNBrTNMBXrSdFTvK9QjpjOVM=;
        b=kvJscho0UtrbmUifsNO8EACVvarbfWUDLATtWcsxRh03KBgup9nDfEWQJwkR3Dvbhz
         0R9so4Zic1t4BhPRaLizdnw8eU5IrTPK7Ea0i4Qq23UNscLpAtl2OHjZeSt1S21EJ6en
         N+VfY5po4fOZn7pw+StoKK7bP6IChvhrXmwX/Ryy01kZ52TQR+vi77X/KOaoeiWo3IGs
         S+sy3r9Ta09jfgwsg5WSrOTZ9xfLUKwrOpMVPFUHjPUf5RmwcQotqinzBNNbNds95MlI
         a/RwCnAFwjZfuQZe/cFeRmFwiTCj3KCVzjZxUR51hNI6NW+wrmpgsdqfh2vWoOrMMXxa
         0D0w==
X-Gm-Message-State: AOAM5332GdsZLJ5nIsX/QH9UL4Teone5QpjY9TCo+q4nVSUa5RfUqFjU
	xqSaLmoveTTbOzSPlM55gx1D7VYRLUM=
X-Google-Smtp-Source: ABdhPJx1vSXLJdjEjwOWEiObRvWo7GBYfOlvizOlanYBCwj6jmCH5B8aEHL/x0Fso+rd74aOX5CR8w==
X-Received: by 2002:a63:1b42:: with SMTP id b2mr3082626pgm.397.1596639016998;
        Wed, 05 Aug 2020 07:50:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 06/11] boost: backport fix to make async_pipes work with asio
Date: Wed,  5 Aug 2020 04:49:29 -1000
Message-Id: <f3f6cc45b0b95cce337947df8dfaa9402251541c.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

From: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>

async_pipe is missing the executor_type type, which is expected by
asio in /usr/include/boost/asio/impl/read.hpp. Without this, it's
not possible to even compile code that uses constructs such as:

boost::asio::io_service foo;
boost::process::async_pipe foopipe{ boost::process::async_pipe(foo) };

This is only relevant for Dunfell because master has already moved to
boost-1.73.0 in which this bug has been fixed. The bug is also not
present in Zeus, which uses boost-1.71.0.

Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-added-typedef-executor_type.patch    | 54 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch

diff --git a/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
new file mode 100644
index 0000000000..7b8178fd76
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
@@ -0,0 +1,54 @@
+From 6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0 Mon Sep 17 00:00:00 2001
+From: Klemens David Morgenstern <klemens.morgenstern@gmx.net>
+Date: Fri, 22 Nov 2019 14:03:22 +0800
+Subject: [PATCH] added typedef executor_type;
+
+Upstream-Status: Backport [https://github.com/boostorg/process/commit/6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0]
+
+Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
+---
+ include/boost/process/async_pipe.hpp                | 2 ++
+ include/boost/process/detail/posix/async_pipe.hpp   | 1 +
+ include/boost/process/detail/windows/async_pipe.hpp | 1 +
+ 3 files changed, 4 insertions(+)
+
+diff --git a/include/boost/process/async_pipe.hpp b/include/boost/process/async_pipe.hpp
+index 101fe1d..a562432 100644
+--- a/boost/process/async_pipe.hpp
++++ b/boost/process/async_pipe.hpp
+@@ -47,6 +47,8 @@ public:
+      */
+     typedef platform_specific handle_type;
+ 
++    typedef typename handle_type::executor_type executor_type;
++
+     /** Construct a new async_pipe, does automatically open the pipe.
+      * Initializes source and sink with the same io_context.
+      * @note Windows creates a named pipe here, where the name is automatically generated.
+diff --git a/include/boost/process/detail/posix/async_pipe.hpp b/include/boost/process/detail/posix/async_pipe.hpp
+index 725a078..a82c057 100644
+--- a/boost/process/detail/posix/async_pipe.hpp
++++ b/boost/process/detail/posix/async_pipe.hpp
+@@ -23,6 +23,7 @@ class async_pipe
+ public:
+     typedef int native_handle_type;
+     typedef ::boost::asio::posix::stream_descriptor handle_type;
++    typedef typename handle_type::executor_type executor_type;
+ 
+     inline async_pipe(boost::asio::io_context & ios) : async_pipe(ios, ios) {}
+ 
+diff --git a/include/boost/process/detail/windows/async_pipe.hpp b/include/boost/process/detail/windows/async_pipe.hpp
+index 06d5f2d..0b447f9 100644
+--- a/boost/process/detail/windows/async_pipe.hpp
++++ b/boost/process/detail/windows/async_pipe.hpp
+@@ -48,6 +48,7 @@ class async_pipe
+ public:
+     typedef ::boost::winapi::HANDLE_ native_handle_type;
+     typedef ::boost::asio::windows::stream_handle   handle_type;
++    typedef typename handle_type::executor_type executor_type;
+ 
+     async_pipe(boost::asio::io_context & ios) : async_pipe(ios, ios, make_pipe_name(), true) {}
+     async_pipe(boost::asio::io_context & ios_source, boost::asio::io_context & ios_sink)
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
index 0b7badbc76..51c84bc935 100644
--- a/meta/recipes-support/boost/boost_1.72.0.bb
+++ b/meta/recipes-support/boost/boost_1.72.0.bb
@@ -8,4 +8,5 @@ SRC_URI += "file://arm-intrinsics.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-revert-cease-dependence-on-range.patch \
+           file://0001-added-typedef-executor_type.patch \
            "
-- 
2.17.1

