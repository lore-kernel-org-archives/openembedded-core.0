Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B549C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 14:47:14 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.7013.1639752433686825098
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 06:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h1AyRUyE;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id v203so7073974ybe.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 06:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o/Eh8xHK2xJps9RyYeY4JJKWxzIc0kHi8eqZ2Xl8erY=;
        b=h1AyRUyEWT4/peaoKKVsIus6fffB4QvyZ6RRA+rE5S5Y003fFbSUeFubn0ep24T6+7
         ACzlZyF6a6JspT8WG5eHEuBwPiyMAL78ZWJd8qEbL8CpS970m1Qm6v4fQp8Vsom0LUhw
         VYS5X/OonlZ//E+IR8CRw2sD3rahYkwSlPBJeFaLXtco871qx0yZa6kfKDra35JAmlCe
         7031nX3UYcXS7mItKr+ch4yCjx/iMnKbYApkHZzT+qFLnbl1SmWP8T5DbhzslWK6tVpo
         IMrPiM/wSoF0LYBZMvwIzT4KQCT9btrC8OQ6fF5oZBpz5eBzZNpgT1r7dhX2p/Rv9F1C
         oKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/Eh8xHK2xJps9RyYeY4JJKWxzIc0kHi8eqZ2Xl8erY=;
        b=JHwMpg7vx/+lC+wBqszQlNcMGyVMFJ3n+PILm0EjdPCNODgwAFiLcBdhc/6wqY/8ih
         SrA6iqscVMo1c5/v9v1EH5jok6Cxmsw1p4R8iysrs7g4UQPn2Uvc2VhnvQVyQMv/JhAG
         9AvFffYjlKA+pPUd4ZMW1kWiWwl+LfS+5s8GcLrFeV2Ky7zuNetEHmuYSynflOHeQmvr
         Sq4rT3y+spRxWxsywHJgbhnpUH1mxLLjZQLadhx5Rs1RV5q4mhpGa03Jf6aaOT8ubjFf
         grwQDJPruGwdtP7sYynf/lR4bQeBB3eNY0CNQESY7ztqe1MIHOBKE0uve9FLEU3E1rvd
         ZJNg==
X-Gm-Message-State: AOAM530v68AjHLlDbyqoFS50uSdRF+YZjazy/AbblN666eRb2mRH/2o0
	kj6nCNMy3VMd3hugYNiO9qqsKmYoOR1NnKebSok=
X-Google-Smtp-Source: 
 ABdhPJzi8Qf9YrgQxjMue7JB2VgRrhhwuplUeyszmS6XMNENbgcSd2n9d/y51cpxqDoqSKktIy94p4iRPm2aQ21mIJY=
X-Received: by 2002:a25:7355:: with SMTP id o82mr4170944ybc.187.1639752432826;
 Fri, 17 Dec 2021 06:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20211217113722.21974-1-ranjitsinhrathod1991@gmail.com>
In-Reply-To: <20211217113722.21974-1-ranjitsinhrathod1991@gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Fri, 17 Dec 2021 04:47:02 -1000
Message-ID: 
 <CAGDS+n=kyFAA7QXUGT0wDeMMirEkTN+EnU6ObA3OqOkYcxokjA@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] boost: Add a NULL check for the
 pointer which causes a crash
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 14:47:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159827

On Fri, Dec 17, 2021 at 1:37 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>
> Issues seen in boost asio call when used within shared libraries
> particularly in aarch64.
> The discussion with boost maintainers is on going at
> github.com/chriskohlhoff/asio/issues/588 originally reported at
> github.com/chriskohlhoff/asio/issues/642. The crash is quite frequent
> with no solution in sight at present.
> As a workaround this simple patch that checks the nullness of the
> call stack seems to avoid the crash.

Not sure I feel good about "seems to" !

Especially when the comments in the linked pull request include:

"Please don't merge this just yet. While I no longer get SIGSEGVs with
this patch, my event loop (io.run()) now just quits. There is a deeper
underlying issue here."

and

"Closing. As noted elsewhere, this change is not correct. The
compensating_work_started function is only called from inside the
scheduler where we must have a valid, non-null call stack. That it's
null may indicate that something is seriously wrong with the way the
program is built. (A build issue with shared libraries perhaps?)
Suppressing it like this will instead introduce a subtle,
hard-to-debug work counting problem."

So I'd like to see a little more discussion before we decide to take this patch.

Steve

>
> Typical Crash backtrace:
> Thread 1 (LWP 907):
> 0  boost::asio::detail::scheduler::compensating_work_started (this=0x559e174230) at /usr/include/boost/asio/detail/impl/scheduler.ipp:321
> 1  boost::asio::detail::epoll_reactor::perform_io_cleanup_on_block_exit::~perform_io_cleanup_on_block_exit (this=0x7f861ab348, __in_chrg=<optimized out>)
> at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:712
> 2  boost::asio::detail::epoll_reactor::descriptor_state::perform_io (events=<optimized out>, this=0x7f800023d0) at
> /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:730
> 3  boost::asio::detail::epoll_reactor::descriptor_state::do_complete (owner=0x559e174230, base=0x7f800023d0, ec=..., bytes_transferred=<optimized out>)
> at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:774
> 4  0x0000007f894a4398 in boost::asio::detail::scheduler_operation::complete (bytes_transferred=17, ec=..., owner=0x559e174230, this=0x7f800023d0)
> at /usr/include/boost/asio/detail/scheduler_operation.hpp:40
> 5  boost::asio::detail::scheduler::do_run_one (ec=..., this_thread=..., lock=..., this=0x559e174230) at
> /usr/include/boost/asio/detail/impl/scheduler.ipp:447
> 6  boost::asio::detail::scheduler::run (this=0x559e174230, ec=...) at /usr/include/boost/asio/detail/impl/scheduler.ipp:200
> 7  0x0000007f895e444c in boost::asio::io_context::run (this=0x559e174b70) at /usr/include/boost/asio/impl/io_context.ipp:63
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  ...L-check-for-the-pointer-which-causes.patch | 54 +++++++++++++++++++
>  meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch
>
> diff --git a/meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch b/meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch
> new file mode 100644
> index 0000000000..5ffea59e29
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost/0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch
> @@ -0,0 +1,54 @@
> +From d5efa47962b0101d9ec305b38a1520e9c13f118e Mon Sep 17 00:00:00 2001
> +From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +Date: Mon, 31 May 2021 14:40:12 +0100
> +Subject: [PATCH] boost: Add a NULL check for the pointer which causes a crash
> +
> +Issues seen in boost asio call when used within shared libraries
> +particularly in aarch64.
> +The discussion with boost maintainers is on going at
> +github.com/chriskohlhoff/asio/issues/588 originally reported at
> +github.com/chriskohlhoff/asio/issues/642. The crash is quite frequent
> +with no solution in sight at present.
> +As a workaround this simple patch that checks the nullness of the
> +call stack seems to avoid the crash.
> +
> +Typical Crash backtrace:
> +Thread 1 (LWP 907):
> +0  boost::asio::detail::scheduler::compensating_work_started (this=0x559e174230) at /usr/include/boost/asio/detail/impl/scheduler.ipp:321
> +1  boost::asio::detail::epoll_reactor::perform_io_cleanup_on_block_exit::~perform_io_cleanup_on_block_exit (this=0x7f861ab348, __in_chrg=<optimized out>)
> +at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:712
> +2  boost::asio::detail::epoll_reactor::descriptor_state::perform_io (events=<optimized out>, this=0x7f800023d0) at
> +/usr/include/boost/asio/detail/impl/epoll_reactor.ipp:730
> +3  boost::asio::detail::epoll_reactor::descriptor_state::do_complete (owner=0x559e174230, base=0x7f800023d0, ec=..., bytes_transferred=<optimized out>)
> +at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:774
> +4  0x0000007f894a4398 in boost::asio::detail::scheduler_operation::complete (bytes_transferred=17, ec=..., owner=0x559e174230, this=0x7f800023d0)
> +at /usr/include/boost/asio/detail/scheduler_operation.hpp:40
> +5  boost::asio::detail::scheduler::do_run_one (ec=..., this_thread=..., lock=..., this=0x559e174230) at
> +/usr/include/boost/asio/detail/impl/scheduler.ipp:447
> +6  boost::asio::detail::scheduler::run (this=0x559e174230, ec=...) at /usr/include/boost/asio/detail/impl/scheduler.ipp:200
> +7  0x0000007f895e444c in boost::asio::io_context::run (this=0x559e174b70) at /usr/include/boost/asio/impl/io_context.ipp:63
> +
> +Upstream-Status: Submitted [https://github.com/chriskohlhoff/asio/pull/330]
> +
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + boost/asio/detail/impl/scheduler.ipp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/boost/asio/detail/impl/scheduler.ipp b/boost/asio/detail/impl/scheduler.ipp
> +index 4ef5c8668..02fc0d2e5 100644
> +--- a/boost/asio/detail/impl/scheduler.ipp
> ++++ b/boost/asio/detail/impl/scheduler.ipp
> +@@ -317,8 +317,8 @@ void scheduler::restart()
> +
> + void scheduler::compensating_work_started()
> + {
> +-  thread_info_base* this_thread = thread_call_stack::contains(this);
> +-  ++static_cast<thread_info*>(this_thread)->private_outstanding_work;
> ++  if (thread_info_base* this_thread = thread_call_stack::contains(this))
> ++    ++static_cast<thread_info*>(this_thread)->private_outstanding_work;
> + }
> +
> + void scheduler::post_immediate_completion(
> diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
> index df1cc16937..7fb8526b33 100644
> --- a/meta/recipes-support/boost/boost_1.72.0.bb
> +++ b/meta/recipes-support/boost/boost_1.72.0.bb
> @@ -9,4 +9,5 @@ SRC_URI += " \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
>             file://0001-revert-cease-dependence-on-range.patch \
>             file://0001-added-typedef-executor_type.patch \
> +           file://0001-boost-Add-a-NULL-check-for-the-pointer-which-causes.patch \
>             "
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159821): https://lists.openembedded.org/g/openembedded-core/message/159821
> Mute This Topic: https://lists.openembedded.org/mt/87787403/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

