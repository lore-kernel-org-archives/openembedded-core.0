Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431A7C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 14:43:48 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.3182.1648840142265698336
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 12:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hx3E0pkb;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id z92so3990078ede.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 12:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CyYzt5CYOaubqMZNVfvUijrz2nJAt9fOMbA33EVsb74=;
        b=hx3E0pkbWg2MIQdKjOXG9MJsAIDA7vbIKYmHvp3/ZG/2T5zki2206K9/qDVXbkmPgm
         z0z5OHmBoptlLOMkBkkuwkDMzusImiEvSrvM4lAXcAHW8jGVOTkYz2V/OZkfKPTYCGhQ
         gGf9ym16xX1VIQKaA0rADiFu7RhYvx7ccrep4sG3yquasTUN2ZnFY3L5cqc6dgk+ONVa
         OXjiMwz/8etuf/y9l6v4gKRLfyzMCxTGomi2ZeZMGENbaFBr07zl5pmKOYkttpXld7GE
         jPd3LknIsljHY+jadYo9XXwYtWJd/sbiiohSz4wVGNXw4GtmeodUaQlT5VJzDfJAF4Fr
         i9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CyYzt5CYOaubqMZNVfvUijrz2nJAt9fOMbA33EVsb74=;
        b=etb6X3lJCM9nHi8UpabO1mYs6Sw9cNAM0jDzebFkeQ2iKXws5GMhhvyT2H9cqgQFcL
         sfokytmOInbvJBTcn6QVBTla7WKhiEyflrDYv58PiuBiY9rzXXLZ7WEYzZG/w4e2vQb8
         +CHPcStNufLmDyKSU6OVEg2Gmc3CyDQLsH10lR1KZEVnC0FEAjWNbXqXB+VuzIXnz8yz
         lsfGHE/lztXGOmltHZl5GUuXb4ol5rPPW4/X5eCVJlfJ/LfMYT/PlO49dVTVdU5wefNk
         nNYx1UogSy6Du9EMryDwP4WIdi9MIY0CzYLJtiWTOzfm+cPhAz8RV1blhaD7aSGMFPJI
         DAzg==
X-Gm-Message-State: AOAM530mQOsYHI7I+CIDOZ4OV5zSwWr290slHFkQGl3wXqK/z1Jh1JCt
	C6IKL9iQkGgeZzSjGX+uwpQhQ+xbHSOQIA==
X-Google-Smtp-Source: 
 ABdhPJzGtMnZlfuHD1Lbl3OWMdF+djvhYwMDLasNO+ltKlKerqbhkpYASHRUknS+h5L1kKhRM4/MFg==
X-Received: by 2002:a05:6402:3591:b0:419:26ea:1e22 with SMTP id
 y17-20020a056402359100b0041926ea1e22mr22545795edc.27.1648840140136;
        Fri, 01 Apr 2022 12:09:00 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 b7-20020a170906708700b006da8440d642sm1324778ejk.113.2022.04.01.12.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 12:08:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] boost: fix native build with glibc-2.34
Date: Fri,  1 Apr 2022 21:08:21 +0200
Message-Id: <20220401190821.2179786-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 14:43:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163944

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...e-warning-with-glibc-2.34-on-Linux-p.patch | 32 +++++++++++++++++++
 ...-elide-a-warning-that-caused-Solaris.patch | 24 ++++++++++++++
 meta/recipes-support/boost/boost_1.72.0.bb    |  2 ++
 3 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-Fix-Wsign-compare-warning-with-glibc-2.34-on-Linux-p.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch

diff --git a/meta/recipes-support/boost/boost/0001-Fix-Wsign-compare-warning-with-glibc-2.34-on-Linux-p.patch b/meta/recipes-support/boost/boost/0001-Fix-Wsign-compare-warning-with-glibc-2.34-on-Linux-p.patch
new file mode 100644
index 0000000000..46c706931b
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-Fix-Wsign-compare-warning-with-glibc-2.34-on-Linux-p.patch
@@ -0,0 +1,32 @@
+From f9d0e594d43afcb4ab0043117249feb266ba4515 Mon Sep 17 00:00:00 2001
+From: Romain Geissler <romain.geissler@amadeus.com>
+Date: Tue, 10 Aug 2021 14:22:28 +0000
+Subject: [PATCH] Fix -Wsign-compare warning with glibc 2.34 on Linux
+ platforms.
+
+In file included from /data/mwrep/res/osp/Boost/21-0-0-0/include/boost/thread/thread_only.hpp:17,
+                 from /data/mwrep/res/osp/Boost/21-0-0-0/include/boost/thread/thread.hpp:12,
+                 from src/GetTest.cpp:12:
+/data/mwrep/res/osp/Boost/21-0-0-0/include/boost/thread/pthread/thread_data.hpp: In member function 'void boost::thread_attributes::set_stack_size(std::size_t)':
+/data/mwrep/res/osp/Boost/21-0-0-0/include/boost/thread/pthread/thread_data.hpp:61:19: error: comparison of integer expressions of different signedness: 'std::size_t' {aka 'long unsigned int'} and 'long int' [-Werror=sign-compare]
+   61 |           if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
+      |                   ^
+
+Upstream-Status: Backport [1.78.0 https://github.com/boostorg/thread/commit/f9d0e594d43afcb4ab0043117249feb266ba4515]
+---
+ boost/thread/pthread/thread_data.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boost/thread/pthread/thread_data.hpp b/boost/thread/pthread/thread_data.hpp
+index bc9b1367..c43b276d 100644
+--- a/boost/thread/pthread/thread_data.hpp
++++ b/boost/thread/pthread/thread_data.hpp
+@@ -58,7 +58,7 @@ namespace boost
+           std::size_t page_size = ::sysconf( _SC_PAGESIZE);
+ #endif
+ #ifdef PTHREAD_STACK_MIN
+-          if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
++          if (size<static_cast<std::size_t>(PTHREAD_STACK_MIN)) size=PTHREAD_STACK_MIN;
+ #endif
+           size = ((size+page_size-1)/page_size)*page_size;
+           int res = pthread_attr_setstacksize(&val_, size);
diff --git a/meta/recipes-support/boost/boost/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch b/meta/recipes-support/boost/boost/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch
new file mode 100644
index 0000000000..3784cf9165
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch
@@ -0,0 +1,24 @@
+From 74fb0a26099bc51d717f5f154b37231ce7df3e98 Mon Sep 17 00:00:00 2001
+From: Rob Boehne <robb@datalogics.com>
+Date: Wed, 20 Nov 2019 11:25:20 -0600
+Subject: [PATCH] Revert change to elide a warning that caused Solaris builds
+ to fail.
+
+Upstream-Status: Backport [1.73.0 https://github.com/boostorg/thread/commit/74fb0a26099bc51d717f5f154b37231ce7df3e98]
+---
+ boost/thread/pthread/thread_data.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boost/thread/pthread/thread_data.hpp b/boost/thread/pthread/thread_data.hpp
+index aefbeb43..bc9b1367 100644
+--- a/boost/thread/pthread/thread_data.hpp
++++ b/boost/thread/pthread/thread_data.hpp
+@@ -57,7 +57,7 @@ namespace boost
+ #else
+           std::size_t page_size = ::sysconf( _SC_PAGESIZE);
+ #endif
+-#if PTHREAD_STACK_MIN > 0
++#ifdef PTHREAD_STACK_MIN
+           if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
+ #endif
+           size = ((size+page_size-1)/page_size)*page_size;
diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
index df1cc16937..b3ec11933c 100644
--- a/meta/recipes-support/boost/boost_1.72.0.bb
+++ b/meta/recipes-support/boost/boost_1.72.0.bb
@@ -9,4 +9,6 @@ SRC_URI += " \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-revert-cease-dependence-on-range.patch \
            file://0001-added-typedef-executor_type.patch \
+           file://0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch \
+           file://0001-Fix-Wsign-compare-warning-with-glibc-2.34-on-Linux-p.patch \
            "
-- 
2.35.1


