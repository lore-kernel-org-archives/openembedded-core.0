Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.5032.1596103226410948633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2020 03:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uU+pnM94;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: viktor.rosendahl@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id c80so5177951wme.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2020 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mJutG2AyCVd4crwIxyvK3Tqb+CrSowPONdKiwkOtAyE=;
        b=uU+pnM942EdKFgyGV6bYK96wRF9rVPIPb1FHt+mnFyOVkuiUdXnowk4ZYtTLJCj342
         rIx4EuTafgmd1ZFyridE5OzzbiZ/pfYxytqtcUdXouaQsUOa1dp4y+G49BFnzxeQzwkT
         h44jAaf4lM9Wx3NzV5ha9/36Q4ZHZvDEa/vMU+3T27TzY2SSek+eG+y6RSvGrktsYvCO
         sYDf+Lq97UkjK7Kg/ldzQ0Zj0l9lURem3EAFiFtulnxY3jZwSRQcIbiAeK18dXBQm9yo
         ngrHr6I0LUw3yzEcV4qDBW//+OgYrE/ctLim220fit43D9ZtHJft2UL470i8w3d7pZ5+
         Em4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mJutG2AyCVd4crwIxyvK3Tqb+CrSowPONdKiwkOtAyE=;
        b=jKArf6LCpQJ4nDB7rINy5t3B+Pbxa9kv+QKqFvsbOV6tIlbuBzjrFJ6L2qQ4BdV+d/
         BbHrYN75N80x4g7CF6ub5UJLQHOCoEkWVrw2ceY9QWLOdvMx5VQSI1HMxqGpK9oI0VJD
         rOK2p2JhhTSZqb4rMxfUdyb/xYKmwe4DZoefbj86USQuzSLOP90wGsa8roqRt20xxfiy
         Bu4bxDtibOiJldrMSkz9cjM1Sj4KliB+a14XMr/65e7v65nNjdqOBt77DonZgBMsJaIX
         MWCt1tiQDqenqGJq+uC0cvsf9EmDXpGwEZ0DP4dbaN+FvSSI4Ys6iySP+kGVYjrOHbuH
         f+Pg==
X-Gm-Message-State: AOAM532mIRLOjUyXfzTclC5U8IIwJEPBeafja+7jOBLRnwN4l7Pe7TTH
	30UYtc40W928EyPl0BalTCKb/aI5pzIp
X-Google-Smtp-Source: ABdhPJwhMRahyAhlXyQ90Fnk/d9WI4ljXzQ2CLJBYxkir71VWcq1klltm7LgjzmwvqHWB2Fd1rJ2WA==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr2013912wmh.42.1596103224617;
        Thu, 30 Jul 2020 03:00:24 -0700 (PDT)
Return-Path: <viktor.rosendahl@gmail.com>
Received: from greenhouse.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id i82sm1798253wmi.10.2020.07.30.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 03:00:24 -0700 (PDT)
From: "Viktor Rosendahl" <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>,
	Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Subject: [dunfell][PATCH v2] boost: backport fix to make async_pipes work with asio
Date: Thu, 30 Jul 2020 12:00:21 +0200
Message-Id: <20200730100021.17463-1-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1

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

