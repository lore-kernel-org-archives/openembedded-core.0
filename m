Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.23160.1602873031624471761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 11:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uGoCc7Mt;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id e7so1957351pfn.12
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 11:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5sayQvQDZsE518d/nDc0pevt+RX8Ov0RcRfL7ct5v/c=;
        b=uGoCc7MtS/T/BNRwqq6qIcrES2W3bx2gnIFSIjxmSOJ62jahtuahRmlMVj25sDuBon
         3gI/4ywabeiBtSwv6qwPEFxkHUCZ+S8I1sICkbjNSPDUfI1jKYR0irqjq8AV+67X+YF3
         NVZtpPe8Y5E9pIuwbslvWHtFk/QQjr+Ewrsp2Dlneh0gySkkrtQYRoRqUXhZgL2cU1Dl
         prq3eiqVFqwBo10oF2FF9Bs548cd9Nxn3ObdVA7Kap10RqIO6ZWu2xJVBUPHB9hm6YNq
         Wh4h8mgf3DEr1h3Z8uKrvLRA4iOZoXTCTLtr8BsASMVXXbZQd6r5dcD42R6WtdlP0N3J
         CXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5sayQvQDZsE518d/nDc0pevt+RX8Ov0RcRfL7ct5v/c=;
        b=QkWG1lM0ykAeQzW9EUFC3L3zKGGIpajpSsHjVIlra4mX+yfI9QbTTmIMzsECN7HCrV
         e4EdmAX476yrvE7W3RBcjKRqb8AZCtqI0x2Ull1XNebehpQGncjWjVLhAaTzvrhrFpac
         w8uLtn8NxoUSWclX0gS8tdUKXEfZM3cFCNd3ZJtERI0YoMgXdZx39nWpDzxXcnOOfDQx
         5+7iSD1fulkk32RxxihTbstFpImUsI99ZZAQGCG6zW3jFwDP+GrnS/2O54b77TRQzgr9
         oFlKgNCaNitISBvqFJJ/0ct54CIob9vvQ+XTkz8/2hujhfoUqCZurk2kOq2vNxke0wis
         Z1BQ==
X-Gm-Message-State: AOAM533Mqf9oVEGMlQNo4usDFfPFtEs7zPcFLnXrbEjoNATCUL0XvpZ/
	lcEyDHYq/9ovGliSVGUt8505i9EnoC7IWA==
X-Google-Smtp-Source: ABdhPJwEgqJ3Pw/K4QQqpG4fJgXrMmFBwZghXZDHWvBAJEPxTEavgJYOl3zaq1zfbJahwdAAv3udug==
X-Received: by 2002:aa7:941c:0:b029:156:2bff:5988 with SMTP id x28-20020aa7941c0000b02901562bff5988mr5170760pfo.22.1602873030462;
        Fri, 16 Oct 2020 11:30:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id g1sm3552209pjs.30.2020.10.16.11.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:30:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] boost: Fix build on 32-bit arches with 64bit time_t only
Date: Fri, 16 Oct 2020 11:30:22 -0700
Message-Id: <20201016183023.3020816-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...efine-SYS_futex-if-it-does-not-exist.patch | 54 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.74.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch

diff --git a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch b/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
new file mode 100644
index 0000000000..523568e9bc
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
@@ -0,0 +1,54 @@
+From d6f7b6064dc91d1d5fa18554b40b14822ab7a32b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Oct 2020 11:13:22 -0700
+Subject: [PATCH] fiber,libs: Define SYS_futex if it does not exist
+
+__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
+they only have 64bit variant of time_t. Glibc defines SYS_futex interface based on
+__NR_futex, since this is used in applications, such applications start
+to fail to build for these newer architectures. This patch defines a
+fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
+working
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ boost/fiber/detail/futex.hpp | 5 +++++
+ libs/log/src/event.cpp       | 4 ++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/boost/fiber/detail/futex.hpp b/boost/fiber/detail/futex.hpp
+index e64bd5990..16bee64f1 100644
+--- a/boost/fiber/detail/futex.hpp
++++ b/boost/fiber/detail/futex.hpp
+@@ -17,6 +17,11 @@ extern "C" {
+ #include <linux/futex.h>
+ #include <sys/syscall.h>
+ }
++
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++#define SYS_futex SYS_futex_time64
++#endif
++
+ #elif BOOST_OS_WINDOWS
+ #include <windows.h>
+ #endif
+diff --git a/libs/log/src/event.cpp b/libs/log/src/event.cpp
+index 5485154d7..2c7c0381f 100644
+--- a/libs/log/src/event.cpp
++++ b/libs/log/src/event.cpp
+@@ -31,6 +31,10 @@
+ #include <linux/futex.h>
+ #include <boost/memory_order.hpp>
+ 
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++#define SYS_futex SYS_futex_time64
++#endif
++
+ // Some Android NDKs (Google NDK and older Crystax.NET NDK versions) don't define SYS_futex
+ #if defined(SYS_futex)
+ #define BOOST_LOG_SYS_FUTEX SYS_futex
+-- 
+2.28.0
+
diff --git a/meta/recipes-support/boost/boost_1.74.0.bb b/meta/recipes-support/boost/boost_1.74.0.bb
index 5e9e0d87d7..b01b390a59 100644
--- a/meta/recipes-support/boost/boost_1.74.0.bb
+++ b/meta/recipes-support/boost/boost_1.74.0.bb
@@ -7,4 +7,5 @@ SRC_URI += "file://arm-intrinsics.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
+           file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
            "
-- 
2.28.0

