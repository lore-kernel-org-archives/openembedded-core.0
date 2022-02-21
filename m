Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C23C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 06:20:32 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.7854.1645424432180375769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 22:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kv+e6xz7;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 t4-20020a17090a3b4400b001bc40b548f9so1432572pjf.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 22:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VOWJpv+X5aslNR2Nhi3hhUMhPV8WpHigrscUuidqFBk=;
        b=kv+e6xz7jVtIFNpgOEd6kTpnIywk98OhK8SmEwf39dyxqV+q3YbEm/odL5DdDMThFe
         Q7l0sOAZinprdupkcw+IMr49fxWqFhiVecLr52PJUVwOx4SYtGigExcBVH7hM787WsSQ
         6uHsOQQnuj28Jj1Hj8V6MxPVPgHhiSJVhmSpf4mqvTFs5fKK2CnFoAtwZLduIKRXxJqq
         bVgEUXJOwBGrIUClFi8Ol2qmzDq6e2/7ILAFQ4gtOnovyRJeH4KlvzMZazspCb6IWuDC
         KKmZPCtrKMygo9emX/lIIfxuimb2AcSWYfCPxl0HmupZgqcBOONPwbXfJaICEQQJjwNm
         zvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VOWJpv+X5aslNR2Nhi3hhUMhPV8WpHigrscUuidqFBk=;
        b=niXp6/XW2PBz4JNzJcn6aHOHz8Gvytjjhpz9qjvZUbeRBW1Avv2OUyfLh3LLqg+8iT
         4+NRoLybS4kVBZfDbOoYREMv/HOpJ+0H+oQ+7VLqvANjW0+QXEywxheRALwSFWmALfpt
         a99CTubY0/Uya7gkqgpjFW8QLJ3jjk8KtWwZdYDD+nJ0yNvMZ6pMCwPSZzFszhYgxyT3
         irX+7PPvrsjPNG4eF8fau2DGG3aq28LJOaLaXDMeHkSDSZehEDULBTC8tPGg57E1UjV9
         f/Cwe0FTFLfm0ayS4Wu5n1PcOTYl0macjSbqXjGE0O1vj2p3AaHBaO4ls+5fodQNJy4A
         MABQ==
X-Gm-Message-State: AOAM532XmCsNHIP9f9wWrDP7BA2oNIJHsLWQK54Dkc0Uty+sXwr5edPM
	qeJUykOwaymKeE7BtJDEeOixpqXhrR6rMw==
X-Google-Smtp-Source: 
 ABdhPJzn1NXr4AG3qXroDRrIKEjtCqbCfdo+3cTT+Oj4PNaVMqhUMe/JWPx0QXV50e7NGBBSGdhgRg==
X-Received: by 2002:a17:903:2283:b0:14d:4cd3:45b1 with SMTP id
 b3-20020a170903228300b0014d4cd345b1mr17510374plh.115.1645424431432;
        Sun, 20 Feb 2022 22:20:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 g1sm10645567pfu.32.2022.02.20.22.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 22:20:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] boost: Fix build on 32bit arches with 64bit time_t defaults
Date: Sun, 20 Feb 2022 22:20:28 -0800
Message-Id: <20220221062028.122453-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 06:20:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162013

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...on-32-bit-architectures-using-64-bit.patch | 36 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.78.0.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch

diff --git a/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch b/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
new file mode 100644
index 00000000000..20dc3ca54e3
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
@@ -0,0 +1,36 @@
+From b15d8d0754bb545ba10d0cfba8bbfdfb22a62c38 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Feb 2022 22:03:14 -0800
+Subject: [PATCH] futex: fix build on 32-bit architectures using 64-bit time_t
+
+Fix the following build failure on 32-bit architectures using 64-bit
+time_t (e.g. riscv32):
+| ./boost/fiber/detail/futex.hpp:31:23: error: use of undeclared identifier 'SYS_futex'
+|     return ::syscall( SYS_futex, addr, op, x, nullptr, nullptr, 0);
+|                       ^
+| 1 error generated.
+
+Upstream-Status: Submitted [https://github.com/boostorg/fiber/pull/292]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ boost/fiber/detail/futex.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/boost/fiber/detail/futex.hpp b/boost/fiber/detail/futex.hpp
+index e64bd5990..d0353e9e5 100644
+--- a/boost/fiber/detail/futex.hpp
++++ b/boost/fiber/detail/futex.hpp
+@@ -12,6 +12,10 @@
+ 
+ #include <boost/fiber/detail/config.hpp>
+ 
++#ifndef SYS_futex
++#define SYS_futex SYS_futex_time64
++#endif
++
+ #if BOOST_OS_LINUX
+ extern "C" {
+ #include <linux/futex.h>
+-- 
+2.35.1
+
diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes-support/boost/boost_1.78.0.bb
index f4b6ed85762..58be9dcf122 100644
--- a/meta/recipes-support/boost/boost_1.78.0.bb
+++ b/meta/recipes-support/boost/boost_1.78.0.bb
@@ -6,4 +6,5 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://de657e01635306085488290ea83de541ec393f8b.patch \
+           file://0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch \
            "
-- 
2.35.1


