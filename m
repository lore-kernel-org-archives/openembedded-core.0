Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A319BC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 12:31:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.5642.1639744287100858305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 04:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CQmtF9U3;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id e17so1723329plh.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Xeph788WbDcw9Fr/DjUc7nxwAxNZmwNPCncxHT867qM=;
        b=CQmtF9U3qLuBmnqfcto27oKmgiZRQ7XvrlCFPUoUv1SpuNdHih1fiJUJzNY09irNHQ
         jQ/5X95w+QcfSTpNhG/9O+FIc/XytofJ90Nu7f/fff+jeKPsbVcA25sOCoLN4Ku20bVH
         f2023NW3nMPdrhZWgdO9krbbSZBI9kVeaejus6DxUN/Xjlifjg1N1VfamfZ2lLWL3dZD
         eGRqSOs6vp8TgmIgQThHGfBn/RSnM9jtsbW0A1S1lDNyx6Mp0kRxRnAxhWss+LsQ9KrG
         3yClY+kKVdlG9sYXsD7ZDmcFZwGC71V8SW10cfMgCRfy/xXzcKryHl+zrC4QgMqgebgd
         IgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Xeph788WbDcw9Fr/DjUc7nxwAxNZmwNPCncxHT867qM=;
        b=I4KBeo5ARlOKgriN8r4MniPq+nF1F4g3FRW4GDAB7sVugorfuj29IkVlSQJPYlJDAc
         3Fsr0XpW3CLhHFekhEzt3J9XFBDdRe1JIofSldcjO7UiqLgIfftyMjZ6hrzEAs1MEbgp
         7Xiilg9Ihl1AlI8rsSL7feZgRra2NOqRB8IFkfJO0S46TR9Vfo+sdRQvVqAxDB7ZOKSR
         g+vF5MasYyZiwsOauymaiBZLjiPRN858RU7HCSoydkdeFQN9DWwHF6cBqV+B2U9qUPq4
         ZO5+FXW4Q4QU+bTL93XlkL6F6O3ttGBsOIkgji7Z+luA2v9pNoWuiy4i5Hq0qyx4gm/j
         Xb1Q==
X-Gm-Message-State: AOAM532H3jgF36BSTedhaNhsRkvQ3/tblxKdpR9+riEYTJKbo6JF86A4
	QmhZgP3yJh+8WJ0ukrspEudufY4Vm7k=
X-Google-Smtp-Source: 
 ABdhPJwy7iJbdeEMaSnoYFIr3Hv35CQlOe5tghA7ikcwJUAwtTuzmUKwG2mXKkTqpLDMm8cUdImVVA==
X-Received: by 2002:a17:902:904c:b0:148:a2e8:27a1 with SMTP id
 w12-20020a170902904c00b00148a2e827a1mr2924053plz.168.1639744286150;
        Fri, 17 Dec 2021 04:31:26 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4042:4d80:4533:1014:c796:b7ef:e693])
        by smtp.gmail.com with ESMTPSA id
 r76sm8176206pgr.61.2021.12.17.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 04:31:25 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][PATCH] boost: Add a NULL check for the pointer which causes a
 crash
Date: Fri, 17 Dec 2021 18:00:33 +0530
Message-Id: <20211217123033.25576-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 12:31:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159822

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Issues seen in boost asio call when used within shared libraries
particularly in aarch64.
The discussion with boost maintainers is on going at
github.com/chriskohlhoff/asio/issues/588 originally reported at
github.com/chriskohlhoff/asio/issues/642. The crash is quite frequent
with no solution in sight at present.
As a workaround this simple patch that checks the nullness of the
call stack seems to avoid the crash.

Typical Crash backtrace:
Thread 1 (LWP 907):
0  boost::asio::detail::scheduler::compensating_work_started (this=0x559e174230) at /usr/include/boost/asio/detail/impl/scheduler.ipp:321
1  boost::asio::detail::epoll_reactor::perform_io_cleanup_on_block_exit::~perform_io_cleanup_on_block_exit (this=0x7f861ab348, __in_chrg=<optimized out>)
at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:712
2  boost::asio::detail::epoll_reactor::descriptor_state::perform_io (events=<optimized out>, this=0x7f800023d0) at
/usr/include/boost/asio/detail/impl/epoll_reactor.ipp:730
3  boost::asio::detail::epoll_reactor::descriptor_state::do_complete (owner=0x559e174230, base=0x7f800023d0, ec=..., bytes_transferred=<optimized out>)
at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:774
4  0x0000007f894a4398 in boost::asio::detail::scheduler_operation::complete (bytes_transferred=17, ec=..., owner=0x559e174230, this=0x7f800023d0)
at /usr/include/boost/asio/detail/scheduler_operation.hpp:40
5  boost::asio::detail::scheduler::do_run_one (ec=..., this_thread=..., lock=..., this=0x559e174230) at
/usr/include/boost/asio/detail/impl/scheduler.ipp:447
6  boost::asio::detail::scheduler::run (this=0x559e174230, ec=...) at /usr/include/boost/asio/detail/impl/scheduler.ipp:200
7  0x0000007f895e444c in boost::asio::io_context::run (this=0x559e174b70) at /usr/include/boost/asio/impl/io_context.ipp:63

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 ...L-check-for-the-pointer-which-causes.patch | 54 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.78.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch

diff --git a/meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch b/meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch
new file mode 100644
index 0000000000..273b6b5e6d
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch
@@ -0,0 +1,54 @@
+From d5efa47962b0101d9ec305b38a1520e9c13f118e Mon Sep 17 00:00:00 2001
+From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Date: Mon, 31 May 2021 14:40:12 +0100
+Subject: [PATCH] boost: Add a NULL check for the pointer which causes a crash
+
+Issues seen in boost asio call when used within shared libraries
+particularly in aarch64.
+The discussion with boost maintainers is on going at
+github.com/chriskohlhoff/asio/issues/588 originally reported at
+github.com/chriskohlhoff/asio/issues/642. The crash is quite frequent
+with no solution in sight at present.
+As a workaround this simple patch that checks the nullness of the
+call stack seems to avoid the crash.
+
+Typical Crash backtrace:
+Thread 1 (LWP 907):
+0  boost::asio::detail::scheduler::compensating_work_started (this=0x559e174230) at /usr/include/boost/asio/detail/impl/scheduler.ipp:321
+1  boost::asio::detail::epoll_reactor::perform_io_cleanup_on_block_exit::~perform_io_cleanup_on_block_exit (this=0x7f861ab348, __in_chrg=<optimized out>)
+at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:712
+2  boost::asio::detail::epoll_reactor::descriptor_state::perform_io (events=<optimized out>, this=0x7f800023d0) at
+/usr/include/boost/asio/detail/impl/epoll_reactor.ipp:730
+3  boost::asio::detail::epoll_reactor::descriptor_state::do_complete (owner=0x559e174230, base=0x7f800023d0, ec=..., bytes_transferred=<optimized out>)
+at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:774
+4  0x0000007f894a4398 in boost::asio::detail::scheduler_operation::complete (bytes_transferred=17, ec=..., owner=0x559e174230, this=0x7f800023d0)
+at /usr/include/boost/asio/detail/scheduler_operation.hpp:40
+5  boost::asio::detail::scheduler::do_run_one (ec=..., this_thread=..., lock=..., this=0x559e174230) at
+/usr/include/boost/asio/detail/impl/scheduler.ipp:447
+6  boost::asio::detail::scheduler::run (this=0x559e174230, ec=...) at /usr/include/boost/asio/detail/impl/scheduler.ipp:200
+7  0x0000007f895e444c in boost::asio::io_context::run (this=0x559e174b70) at /usr/include/boost/asio/impl/io_context.ipp:63
+
+Upstream-Status: Submitted [https://github.com/chriskohlhoff/asio/pull/330]
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ boost/asio/detail/impl/scheduler.ipp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/boost/asio/detail/impl/scheduler.ipp b/boost/asio/detail/impl/scheduler.ipp
+index 089e36e8e..017c3d497 100644
+--- a/boost/asio/detail/impl/scheduler.ipp
++++ b/boost/asio/detail/impl/scheduler.ipp
+@@ -321,8 +321,8 @@ void scheduler::restart()
+ 
+ void scheduler::compensating_work_started()
+ {
+-  thread_info_base* this_thread = thread_call_stack::contains(this);
+-  ++static_cast<thread_info*>(this_thread)->private_outstanding_work;
++  if (thread_info_base* this_thread = thread_call_stack::contains(this))
++    ++static_cast<thread_info*>(this_thread)->private_outstanding_work;
+ }
+ 
+ bool scheduler::can_dispatch()
diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes-support/boost/boost_1.78.0.bb
index f4b6ed8576..8161d79750 100644
--- a/meta/recipes-support/boost/boost_1.78.0.bb
+++ b/meta/recipes-support/boost/boost_1.78.0.bb
@@ -6,4 +6,5 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://de657e01635306085488290ea83de541ec393f8b.patch \
+           file://0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch \
            "
-- 
2.17.1


