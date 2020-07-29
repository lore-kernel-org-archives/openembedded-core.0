Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.5894.1596029582962224803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WymVDuyM;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: viktor.rosendahl@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id f18so21676710wrs.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=r6SbIcZpGJqzu6aP2MM1sHyf7ntAzcPqtvTgkwyiTsM=;
        b=WymVDuyMBpeyaoDfa9dvZSzY2uBhd64Ef+6rUGFsFi6+Ppd1krGqiBQNyrCRz2107b
         fDDBhHnLOKwbmaPxwvQcF8ID0F+G+YrC/8AEXTs+3zSxaHwvTY2+5xt78VtkfzB/gmbV
         RbgcZvgzAKQ5PPlxBd3/CPpdTQH7bEbtsswWA1G1+6hbjQotP+0xnzZW+P9zgr7ezCt+
         Df1p7MBMB2vf+HmtbdicKEsx9qND2vNIjN+8FiO0LMnomiXfCEvgmlvJqPQk5t7WMkjs
         nhMwVNt/wlbcz17urMzsUnZlI0Tn59gtfEDxWrohVX5fjTisWDRzRqeoJNH2Ce8nJoEj
         wyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=r6SbIcZpGJqzu6aP2MM1sHyf7ntAzcPqtvTgkwyiTsM=;
        b=U/+HLoKE8hAG0QV4qj24oqs1qD5A6j/3Mwmw2NR/s5FzMAEX7DyWNj5dRiBhMSKrKX
         Z+Ln/i/dP6/Nmq9LTMHmkjQooorv3VjNtAQhX7yFfsB1KayGdFEYau+Wu5HjsIgE5Yuw
         QLldCmG5Eejp8ymNQXOsrA6oc1unIeBjqb92AasarVW2XQjzW9gXRfqUe3NdnyvIEwgQ
         o5aPpYYBgNPYbcZFsKZ56sPiZq0zt80VV1fu2hHJql/S1wzasKSEHE1fkU1Swg+kVbv8
         9ukxX07zJK3q6FyIjICmtCmS0XwvrfkLI8tSzPihGNL/4AdrrB3Hh/0zitVhCVUNoh+I
         uSpw==
X-Gm-Message-State: AOAM530tlCSNNxcYMZbcxuS8zvkhwRT7OSFA4jHS3ifstmvLdAkphdcJ
	ceXY2H26mdmmOMkzzKGbWEOpq3mD4Q==
X-Google-Smtp-Source: ABdhPJwRCOprRwLGlDGuHjGOaPNGJi1+tg/VGvGgATFmpJlldKyLcRbiWv3vurpKJVpZOCDxOCD5Xw==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr28367507wru.47.1596029580959;
        Wed, 29 Jul 2020 06:33:00 -0700 (PDT)
Return-Path: <viktor.rosendahl@gmail.com>
Received: from greenhouse.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id y77sm5190479wmd.36.2020.07.29.06.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 06:33:00 -0700 (PDT)
From: "Viktor Rosendahl" <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>,
	Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Subject: [dunfell][PATCH] boost: backport fix to make async_pipes work with asio
Date: Wed, 29 Jul 2020 15:32:56 +0200
Message-Id: <20200729133256.20229-1-viktor.rosendahl@bmw.de>
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
 .../0001-added-typedef-executor_type.patch    | 53 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch

diff --git a/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
new file mode 100644
index 0000000000..83d3749e15
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
@@ -0,0 +1,53 @@
+From 6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0 Mon Sep 17 00:00:00 2001
+From: Klemens David Morgenstern <klemens.morgenstern@gmx.net>
+Date: Fri, 22 Nov 2019 14:03:22 +0800
+Subject: [PATCH] added typedef executor_type;
+
+Upstream-Status: Backport [https://github.com/boostorg/process/commit/6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0]
+
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

