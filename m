Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.12727.1596464859393102762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PZUp0Mj/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id 10so129195plj.6
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=13PBTYoRzgCaVlgSYtkVNBrTNMBXrSdFTvK9QjpjOVM=;
        b=PZUp0Mj/UFgcR3hVHtHVHq/yRC41zx4+WeeMucAhaaeC5PCsQRnq0wWqPwB0Bz06jy
         uJi1eqfxpiL/KUlOBVaTZy4dQOCKYN7tenB62ZI8Ux7esI2TP+x9dUCtV2sFJN0j3eOW
         5+7bLUwM8B8XqZILTbvTH6o23pMA2z9mHaFsIf8aqUbFshTGn74u193NOwG3iTrmYO0m
         ViYh5z2PFUneZKZ45kqPPB9kyLN3g/62HL7G+ILxBL7+n1sYjiLG/OrfNxjKE5QS6miD
         Qor5aWfddu3AxilUE9txwAjt9ujQ8Qh93p8qZAX9VJzJiuFc5cxpIYx5DuqS8Wz8eyIG
         tPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=13PBTYoRzgCaVlgSYtkVNBrTNMBXrSdFTvK9QjpjOVM=;
        b=H89IenhL/5isfOS+thM88j5ymoiJiwORhlfTRRvnmAVtQY5gozL/ox/CM3DaebBQBv
         OE/3Agb6PzrQKA20DAupSMZUT3/hV5rF7XA2+vueqKcemCshExRTqdvZ109gjSUrQSvJ
         MvHfHzO/O8AspThCFCLjOaU+LJNPs/sVvzugOIuH+RIoTDzvehzrpJ6fzwW128HWdNPE
         axJRdCmwpHU7jWcHW2C5CxKxFK/xZ/7TipblL0YYDfUVMYAohjuk2EtOQ11vvYC8pyk4
         g1lV8v1tMWmCDUOPS5ghRJ/rYsh16m+WmGPJIbnvKIT5q3lTtp7sjbTF7O3IzkPCCOKI
         kKLg==
X-Gm-Message-State: AOAM532PEpSnuOBcM/ESDb/TVC/QLvvoFQ7RrH4mb6RTcUZU2Vq3I1hG
	/n9Y8uvRL2SPAKt3Y3oXUrZ8o3BiVwQ=
X-Google-Smtp-Source: ABdhPJyaWhO0jhwqdV/UIjR7Xb9gEedSdF4xIQgZ0yLH/nBXz30m10kCc4Nvy2waojURSZGGsXdGdg==
X-Received: by 2002:a17:90b:684:: with SMTP id m4mr4874834pjz.4.1596464858416;
        Mon, 03 Aug 2020 07:27:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] boost: backport fix to make async_pipes work with asio
Date: Mon,  3 Aug 2020 04:27:00 -1000
Message-Id: <aa20e28abb34fe82e64f6039b4655be5c374606a.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

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

