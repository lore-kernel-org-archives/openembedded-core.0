Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E63C48BCD
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.30311.1649039472290587585
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JopyTidX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so7763478pjm.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9ddgZXpEx+PhdyruPKxulsLcAp52PhOWE1Mr0ecfwNo=;
        b=JopyTidXnP6pgy/ri+9xOpWQXbxH1A9SXoI2La2rDpmng4Ps/6Qixp3rF0d+PwuIR6
         7BdRJsVYuSgLrNPsRpl8DGJuQtaG+J4NDQARzt7YFUy8nTYGE/qbdeYJ+G3J7+Ey8iZ1
         Y2lgXISZv17T4JoMep3ZirH9doasqVyzNeGvdjX0VtcTnFUZE0R7AP2OehDbbX+rqMhh
         XVG75Zyh/T3M6uKXRXGsDIPX6U//RtrO82uWRa64FGQ2yTxxdC49qD0JgnhaW/Fc9O1P
         om6sLIU+7asm0U5Fxx+eiVW+WF1QBRdiWUo5ljGAxbZM8LDjrfA+bibAbo/4Eqc7mJ1c
         ZqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ddgZXpEx+PhdyruPKxulsLcAp52PhOWE1Mr0ecfwNo=;
        b=y1HP1CFVYwyJuLAnsMqeSCISZUoTH0yUx5TSlazlGOua9AKpxq1KyF3TRe20wtGAeN
         dkXo7oMNjN9NP+Pzo20a+l5YWZYDm26jGOrUtu13ryHGSJrdsWsbk33Jd1lWU4teAmav
         +BPoLnzFTY5LKqTdmDZQ4k/2Ewe9oldgaRY7xKeaCmN8bHSMFrGoM7YVQLVK0u3ODn5A
         qR3/tXUHlVYSt/8fa8XefHbvdFBgBx8bwyEfVE2OTzMlKJOJub5HuuOJh86q5Dh+6tHZ
         EtVXzg75yUIGuRtFYM9C4MSxSRs7ZRrjfQ8LO7w/BTQazGAdw3NepA0JzsCNZy0Tet1u
         6C9Q==
X-Gm-Message-State: AOAM532P6+NRarKxonh8lQ8TtlK8D1aiY2lH6r9h/+Zll+m6UuED4njZ
	X/x3DzwhbVPwFJBfJ1uIyCocZOhEOKNEIQ/nyYA=
X-Google-Smtp-Source: 
 ABdhPJyyXyQKbrj+MYo13UDrQ7VGTuar2CehlnDQODqFo3ayyH/KpJAXZ2xPZxfWMAZ1cx8qRTghAg==
X-Received: by 2002:a17:903:18e:b0:156:b0e1:63d7 with SMTP id
 z14-20020a170903018e00b00156b0e163d7mr1234133plg.126.1649039471358;
        Sun, 03 Apr 2022 19:31:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.31.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:31:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/8] boost: fix native build with glibc-2.34
Date: Sun,  3 Apr 2022 16:30:27 -1000
Message-Id: 
 <ae8ef7575da0ca609df4f2848ea4220844258a15.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649026624.git.steve@sakoman.com>
References: <cover.1649026624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163978

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


