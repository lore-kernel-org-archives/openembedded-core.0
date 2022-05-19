Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D44DC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 16:03:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web09.9393.1652976205019370817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 09:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XXFCQ09P;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id l13so3263959lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BaQOxtqpQKQkyIo1jGiUzx05T0Qt/B9xNLBzitNL+D0=;
        b=XXFCQ09PWvaqw0HU+xbRnKvFmXrGjVvHAkE4oNQSLBb9tXhSGTSEqQa7MbU52wX7A9
         NfpYOvPlHv2Ih3DNws1G+u7uVoqlnZWSavvXd7hl03M8Mj0d4K44btNX9YsukUdV1FSu
         fdaCctST6GJRxqS3phL9g6TB6dzvvyC81MaJLxTX6r7ANRWIyPt1OffcMXlruDvLD7nQ
         uuKbb5cBsEdxyPhDEDd9sPKJe0CzwdrhtHMZVrAYMWR2SzasiLeySPjxhkAOFqwUKGK8
         9TKj10boVeOCgPSFfqmbMh4yAeP8lujWB+zqLWVZQ8IUv9/UX8ZZd7FaOg/0ckDhUxrj
         Yq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BaQOxtqpQKQkyIo1jGiUzx05T0Qt/B9xNLBzitNL+D0=;
        b=rhky1ABDaO9Svd+bXmYy5Oyrz1YIW0reM+V0DWNpDiNPq+FCuHm/fMAeHejEpckDQ6
         8hhDWsWBI1dk8AC3BHxjrmeUawFGHh1EOGzlTIo04ani/QnvHBWrHnzaRSTwACFziDlZ
         65JLAXj7gZi7/htVr+QlgVcBXBvwN/CQPtnCfzsayn7l66fxCQE2e42TV9X0GSW6Nogc
         SXfwgimaBJnTsjkjF5z1DsB57KICzFdcbTgqLunhU8ee0OhkAQUt6AXEeAPVgZXnlSkn
         bARmHha7bBBgFPXIMgkvBlEQggBvkoQWIwEJjeivDOcmszD5r1PGiUovjgzaVCO9C7E4
         CaCg==
X-Gm-Message-State: AOAM530l9xTO2ZkYn6tppqKM2v8agMS/9k6GItwbxJY3MxHaDBLLQGdf
	qwcJf5tYbWwfAX/ONMfyOaSVxj4K7e+kyWlfzZY=
X-Google-Smtp-Source: 
 ABdhPJy2mTqumja7wsm2kfBNhByiOhCzhvA6FKEv14zVsygWOIUMLmP6VpUwn3I1nxwFBksEl1yQnYmV+txAAXyrz18=
X-Received: by 2002:a05:6512:1520:b0:443:ec43:5fe8 with SMTP id
 bq32-20020a056512152000b00443ec435fe8mr3886903lfb.589.1652976203048; Thu, 19
 May 2022 09:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652973084.git.bruce.ashfield@gmail.com>
 <b982f36796617300aa27c3868fb911879de615c0.1652973084.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <b982f36796617300aa27c3868fb911879de615c0.1652973084.git.bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 May 2022 12:03:11 -0400
Message-ID: 
 <CADkTA4Mm=hrGQo1NGyeDCo-ZeB6xW8YmRcQeXHyAYQ8r=AwrSQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] lttng-modules: fix build against 5.18-rc7+
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 16:03:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165902

On Thu, May 19, 2022 at 11:15 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> lttng-modules fails to build against 5.18-rc7, the details of the fix
> are as follows:
>
>    The commit [fix: sched/tracing: Don't re-read p->state when emitting
>    sched_switch event (v5.18)] was correct, but the kernel changed their
>    mind with the following commit:
>
>       commit 9c2136be0878c88c53dea26943ce40bb03ad8d8d
>       Author: Delyan Kratunov <delyank@fb.com>
>       Date:   Wed May 11 18:28:36 2022 +0000
>
>           sched/tracing: Append prev_state to tp args instead
>
>           Commit fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting
>           sched_switch event, 2022-01-20) added a new prev_state argument to the
>           sched_switch tracepoint, before the prev task_struct pointer.
>
>           This reordering of arguments broke BPF programs that use the raw
>           tracepoint (e.g. tp_btf programs). The type of the second argument has
>           changed and existing programs that assume a task_struct* argument
>           (e.g. for bpf_task_storage access) will now fail to verify.
>
>           If we instead append the new argument to the end, all existing programs
>           would continue to work and can conditionally extract the prev_state
>           argument on supported kernel versions.
>
>           Fixes: fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting sched_switch event, 2022-01-20)
>           Signed-off-by: Delyan Kratunov <delyank@fb.com>
>           Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>           Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>           Link: https://lkml.kernel.org/r/c8a6930dfdd58a4a5755fc01732675472979732b.camel@fb.com
>
>    By reordering the parameters (again) we can get back up and building.
>
> Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2022-May/030185.html]

Upstream has a fix in flight as well, that should merge today.

We can hold on this patch, and I'll update it tomorrow (or as soon as)
the patch lands in lttng-modules.

Bruce

> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...x-__trace_sched_switch_state-5.18-rc.patch | 88 +++++++++++++++++++
>  .../lttng/lttng-modules_2.13.3.bb             |  1 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch
> new file mode 100644
> index 0000000000..1f6e8a3c34
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch
> @@ -0,0 +1,88 @@
> +From fbcc510cab67b918a6103c3b1903b1b69f28d399 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Thu, 19 May 2022 10:46:19 -0400
> +Subject: [PATCH] sched/tracing: fix __trace_sched_switch_state (5.18-rc7+)
> +
> +The commit [fix: sched/tracing: Don't re-read p->state when emitting
> +sched_switch event (v5.18)] was correct, but the kernel changed their
> +mind with the following commit:
> +
> +   commit 9c2136be0878c88c53dea26943ce40bb03ad8d8d
> +   Author: Delyan Kratunov <delyank@fb.com>
> +   Date:   Wed May 11 18:28:36 2022 +0000
> +
> +       sched/tracing: Append prev_state to tp args instead
> +
> +       Commit fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting
> +       sched_switch event, 2022-01-20) added a new prev_state argument to the
> +       sched_switch tracepoint, before the prev task_struct pointer.
> +
> +       This reordering of arguments broke BPF programs that use the raw
> +       tracepoint (e.g. tp_btf programs). The type of the second argument has
> +       changed and existing programs that assume a task_struct* argument
> +       (e.g. for bpf_task_storage access) will now fail to verify.
> +
> +       If we instead append the new argument to the end, all existing programs
> +       would continue to work and can conditionally extract the prev_state
> +       argument on supported kernel versions.
> +
> +       Fixes: fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting sched_switch event, 2022-01-20)
> +       Signed-off-by: Delyan Kratunov <delyank@fb.com>
> +       Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> +       Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> +       Link: https://lkml.kernel.org/r/c8a6930dfdd58a4a5755fc01732675472979732b.camel@fb.com
> +
> +By reordering the parameters (again) we can get back up and building.
> +
> +Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2022-May/030185.html]
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +---
> + include/instrumentation/events/sched.h | 15 ++++++++-------
> + 1 file changed, 8 insertions(+), 7 deletions(-)
> +
> +diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
> +index 339bec9..f9e9c38 100644
> +--- a/include/instrumentation/events/sched.h
> ++++ b/include/instrumentation/events/sched.h
> +@@ -23,8 +23,9 @@
> + #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
> +
> + static inline long __trace_sched_switch_state(bool preempt,
> +-              unsigned int prev_state,
> +-              struct task_struct *p)
> ++              struct task_struct *p,
> ++              struct task_struct *n,
> ++              unsigned int prev_state )
> + {
> +         unsigned int state;
> +
> +@@ -356,20 +357,20 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_wakeup_template, sched_wakeup_new,
> + LTTNG_TRACEPOINT_EVENT(sched_switch,
> +
> +       TP_PROTO(bool preempt,
> +-              unsigned int prev_state,
> +               struct task_struct *prev,
> +-              struct task_struct *next),
> ++              struct task_struct *next,
> ++              unsigned int prev_state),
> +
> +-      TP_ARGS(preempt, prev_state, prev, next),
> ++      TP_ARGS(preempt, prev, next, prev_state),
> +
> +       TP_FIELDS(
> +               ctf_array_text(char, prev_comm, prev->comm, TASK_COMM_LEN)
> +               ctf_integer(pid_t, prev_tid, prev->pid)
> +               ctf_integer(int, prev_prio, prev->prio - MAX_RT_PRIO)
> + #ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
> +-              ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(preempt, prev_state, prev))
> ++              ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(preempt, prev, next, prev_state))
> + #else
> +-              ctf_integer(long, prev_state, __trace_sched_switch_state(preempt, prev_state, prev))
> ++              ctf_integer(long, prev_state, __trace_sched_switch_state(preempt, prev, next, prev_state))
> + #endif
> +               ctf_array_text(char, next_comm, next->comm, TASK_COMM_LEN)
> +               ctf_integer(pid_t, next_tid, next->pid)
> +--
> +2.19.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
> index 2b00534e53..96b6491a4b 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
> @@ -20,6 +20,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch \
>             file://0009-Rename-genhd-wrapper-to-blkdev.patch \
>             file://0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch \
> +           file://0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch \
>            "
>
>  # Use :append here so that the patch is applied also when using devupstream
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

