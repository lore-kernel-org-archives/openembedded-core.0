Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914ABC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 11:37:48 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.5091.1639741068020160442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 03:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ba/Jz9ap;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 133so1809626pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=ZWreudd+xhxddZOxyg2ijgUQOTfJT4vULEpJp/Hv30s=;
        b=Ba/Jz9apuz07KK5Q9NVSRX6d1OT9yUuE85vYj2adh99yEI76H3SXpP2ftKYBrOVvZp
         LUG5ejUK/GHVcjCsmLmdMm4InCgYRn6HcMZ0Xp5zayEc/bHbxa455xRhdywdrmKJCmNQ
         R+SnLOpD4sXt/FrkJXHKEZ0KWWxE32w5o46uPze6+9VKvUMhUZRlJ67uD92zOCcow1dI
         DgmWdL4Ns9SrZoJbeskq5fG1HR/aOuBwmAQTxeqx1tzZqkq8t2fJGTRPSqG79eYDupie
         ORFX7AfXR6K1IVqv97CYeJCuIUct+v0Q16FgH7Op+FprL8MgyEaba1SlQJ3S0kHd6/eA
         Hx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZWreudd+xhxddZOxyg2ijgUQOTfJT4vULEpJp/Hv30s=;
        b=oYflTUXBwRvFOxqdMWVdrGTZK/+bOsmr9jUSGkWHII8LkeMh+hStp1JA0z8VL8I3BL
         sxHQZ+7OqARK+5Y4iPaRhpwaduOo37jBPX0WzlTiWOuvEl4WzsmpYZSZV037Yis60rdN
         sMLjJIx/JQ35exynEUTqX2otRgFQyzXzFXChAStGHjcFTYQMplWMvIedbEMfQbAO7v09
         JqljgbQ/FSH6on0G0GvBOxQG1G871N6KgOZwpabw2cv0M5fJDDkJFUTvL5031+3QJe8i
         AWZtdqYE7p5cbcHuVegGpLCEtj7mruACXl6Y5bkct2KPyvWy0vn4w0Sg87j7ir+fHM/p
         RqTQ==
X-Gm-Message-State: AOAM530dYUXkqc6CNTOVFL1Dds4o4UmlJacL5mRzyQY2+I2PkKIZfG7w
	9RsYzbfXdKmsHEFcLOFNWT8ekb5c7bk=
X-Google-Smtp-Source: 
 ABdhPJwshuVPtTAkNYXJzV1n1LCLgPtupaXmC4lV8bLz04TYmTsUqgpq8QxAmb0zkmTFZSjEotYQjA==
X-Received: by 2002:aa7:9990:0:b0:4a1:57ff:3369 with SMTP id
 k16-20020aa79990000000b004a157ff3369mr2697286pfh.31.1639741067139;
        Fri, 17 Dec 2021 03:37:47 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4042:4d80:4533:1014:c796:b7ef:e693])
        by smtp.gmail.com with ESMTPSA id
 q190sm8416742pgq.38.2021.12.17.03.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 03:37:46 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH] boost: Add a NULL check for the pointer which
 causes a crash
Date: Fri, 17 Dec 2021 17:07:22 +0530
Message-Id: <20211217113722.21974-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 11:37:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159821

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
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch

diff --git a/meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch b/meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch
new file mode 100644
index 0000000000..5ffea59e29
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
+index 4ef5c8668..02fc0d2e5 100644
+--- a/boost/asio/detail/impl/scheduler.ipp
++++ b/boost/asio/detail/impl/scheduler.ipp
+@@ -317,8 +317,8 @@ void scheduler::restart()
+ 
+ void scheduler::compensating_work_started()
+ {
+-  thread_info_base* this_thread = thread_call_stack::contains(this);
+-  ++static_cast<thread_info*>(this_thread)->private_outstanding_work;
++  if (thread_info_base* this_thread = thread_call_stack::contains(this))
++    ++static_cast<thread_info*>(this_thread)->private_outstanding_work;
+ }
+ 
+ void scheduler::post_immediate_completion(
diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
index df1cc16937..7fb8526b33 100644
--- a/meta/recipes-support/boost/boost_1.72.0.bb
+++ b/meta/recipes-support/boost/boost_1.72.0.bb
@@ -9,4 +9,5 @@ SRC_URI += " \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-revert-cease-dependence-on-range.patch \
            file://0001-added-typedef-executor_type.patch \
+           file://0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch \
            "
-- 
2.17.1


