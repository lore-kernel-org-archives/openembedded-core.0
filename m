Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.69955.1600114260257094966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 13:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZPaT4m1F;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id c8so837751edv.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=edTHEk+h3ik4XUOizrtSK28pvOTVIdF+jSc3LLtUD8g=;
        b=ZPaT4m1Fo7gDdedw21lFsXRh6FbbbzhmdCD8EU3XacntwxfggbDN4I2eHaVtm+5dvx
         +y8UwPzmq7WZepzuGxqikZCvIAmKQMpLqo3Nz0y+4lTc94/V7bVAwO6ca6B4ICl7hgEO
         I844WfD7OSbIXEHTC4fAfbhnufspfIFtCoY8BT7ZTUZs4a51YYnvB15HHGzixUHF1pP9
         rBnJbpBnivzfn70NdHN1DSBjgT1TK0Ty1l+YbzZwNgFpCAUJTRhkOaKuq3BeKlPq5/n9
         uu7E1RSq2047+K0Sd9FRlfSt9Surn3QSH0JToErvaUkctdywuxbusJ0ZlnUgkAOtgzp1
         HqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=edTHEk+h3ik4XUOizrtSK28pvOTVIdF+jSc3LLtUD8g=;
        b=lye7Lq0MVqiTarSeaLrk9LAEaguVPuJCudV1IAPoRrzuQlcnQpOmEBYnLHcQhxCwHc
         wr5eqz6AXfI6awGogU9ziqADn3jNJIFTq3ir5AO5dZx99rY8qVGQ4abxN6dZhG8/RCrs
         o6uEgwrSa7s7TjbVmVCrr15deKlLT4T8MGzgmaBSFLh2IAjaIOgVpZ8Wk/+C9z6kG92f
         Y9OlnZ2zms6i2jYc69sbaBHAHYXFyPr/12tO60tz/WG6Fe98kg9LwXkuT0MnQgXgGlB5
         XpI5NbkNK0odIENCc+/BEH5hFqqsTRCCQEXUGqrlbE3X9ev3ITsenF+bw5IMRIQri+tZ
         7GSA==
X-Gm-Message-State: AOAM533EWk7gyGw3lyawdo6Hr5tgq6JcPEl6t9dVMrg9MnxGM+elnqEm
	IVmt5DKSGB9vQkuOSdDzSLArxZ3/2X/0Y+aL1YM=
X-Google-Smtp-Source: ABdhPJwFkOGtKvoBGmm3qoSbkzqoWEZA26VSFK5+O0U1eVPxBjsO7LCy36JSN31S2Ai3EpHVnt5bdVEdiGQjO7Bh7d4=
X-Received: by 2002:a50:abc3:: with SMTP id u61mr18458312edc.129.1600114258426;
 Mon, 14 Sep 2020 13:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200914075222.22226-1-sno@NetBSD.org>
In-Reply-To: <20200914075222.22226-1-sno@NetBSD.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 14 Sep 2020 16:09:28 -0400
Message-ID: <CADkTA4PZBd-1O8tNPzFSj=2sD9o8z3kWDrP=vXM4d8rWSM+tnw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] lttng-modules: backport patch to fix build for linux-5.4.62+
To: Jens Rehsack <rehsack@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jens Rehsack <sno@netbsd.org>
Content-Type: text/plain; charset="UTF-8"

In my latest round of linux-yocto reference updates, I ran into these
same issues, but I needed to pull in more of the fixes on the 2.12
branch than just this to get things building against 5.8.9.

I didn't need to tweak any of the patches for v5.4.64+ here.

I have 10 backported patches and confirmed my 5.8.9 and 5.4.65 both
build with the changes.

I can submit that patch along with my reference kernel bumps later today.

Bruce


On Mon, Sep 14, 2020 at 3:52 AM Jens Rehsack <rehsack@gmail.com> wrote:
>
> From: Jens Rehsack <sno@netbsd.org>
>
> Backport patch from lttng-modules/stable-2.12
>     87b2aff fix: writeback: Fix sync livelock due to b_dirty_time processing (v5.9)
>
> with minor modfication to catch
>     6623c19042b6 writeback: Fix sync livelock due to b_dirty_time processing
>
> from linux/stable-5.4 v5.4.62+
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 ++++++++++++++++++
>  .../lttng/lttng-modules_2.12.2.bb             |   1 +
>  2 files changed, 118 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> new file mode 100644
> index 0000000000..96a1c486ef
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> @@ -0,0 +1,117 @@
> +From 87b2affc3eb06f3fb2d0923f18af37713eb6814b Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Mon, 31 Aug 2020 14:16:01 -0400
> +Subject: [PATCH] fix: writeback: Fix sync livelock due to b_dirty_time
> + processing (v5.9)
> +
> +See upstream commit:
> +
> +  commit f9cae926f35e8230330f28c7b743ad088611a8de
> +  Author: Jan Kara <jack@suse.cz>
> +  Date:   Fri May 29 16:08:58 2020 +0200
> +
> +    writeback: Fix sync livelock due to b_dirty_time processing
> +
> +    When we are processing writeback for sync(2), move_expired_inodes()
> +    didn't set any inode expiry value (older_than_this). This can result in
> +    writeback never completing if there's steady stream of inodes added to
> +    b_dirty_time list as writeback rechecks dirty lists after each writeback
> +    round whether there's more work to be done. Fix the problem by using
> +    sync(2) start time is inode expiry value when processing b_dirty_time
> +    list similarly as for ordinarily dirtied inodes. This requires some
> +    refactoring of older_than_this handling which simplifies the code
> +    noticeably as a bonus.
> +
> +Change-Id: I8b894b13ccc14d9b8983ee4c2810a927c319560b
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +---
> + .../events/lttng-module/writeback.h           | 39 ++++++++++++-------
> + 1 file changed, 26 insertions(+), 13 deletions(-)
> +
> +Upstream Status: Backport
> +
> +diff --git a/instrumentation/events/lttng-module/writeback.h b/instrumentation/events/lttng-module/writeback.h
> +index ece67ad..e9018dd 100644
> +--- a/instrumentation/events/lttng-module/writeback.h
> ++++ b/instrumentation/events/lttng-module/writeback.h
> +@@ -384,34 +384,48 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balance_dirty_wait, writeback_wbc_balanc
> + #endif
> + LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeback_wbc_writepage)
> +
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0)) || (LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,62))
> ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> ++      TP_PROTO(struct bdi_writeback *wb,
> ++               struct wb_writeback_work *work,
> ++               unsigned long dirtied_before,
> ++               int moved),
> ++      TP_ARGS(wb, work, dirtied_before, moved),
> ++      TP_FIELDS(
> ++              ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> ++              ctf_integer(unsigned long, older, dirtied_before)
> ++              ctf_integer(int, moved, moved)
> ++      )
> ++)
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> + LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> +       TP_PROTO(struct bdi_writeback *wb,
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> +                struct wb_writeback_work *work,
> +-#else
> +-               unsigned long *older_than_this,
> +-#endif
> +                int moved),
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> +       TP_ARGS(wb, work, moved),
> +-#else
> ++      TP_FIELDS(
> ++              ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> ++              ctf_integer(int, moved, moved)
> ++      )
> ++)
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> ++      TP_PROTO(struct bdi_writeback *wb,
> ++               unsigned long *older_than_this,
> ++               int moved),
> +       TP_ARGS(wb, older_than_this, moved),
> +-#endif
> +       TP_FIELDS(
> +               ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> +-#else
> +               ctf_integer(unsigned long, older,
> +                       older_than_this ? *older_than_this : 0)
> +               ctf_integer(long, age,
> +                       older_than_this ?
> +                               (jiffies - *older_than_this) * 1000 / HZ
> +                               : -1)
> +-#endif
> +               ctf_integer(int, moved, moved)
> +       )
> + )
> ++#endif
> +
> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,8,0))
> + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> +@@ -460,7 +474,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> +               ctf_integer(unsigned long, dirty_limit, global_dirty_limit)
> +       )
> + )
> +-#else
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> +
> +       writeback_global_dirty_state,
> +@@ -485,7 +499,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> +       )
> + )
> + #endif
> +-#endif
> +
> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> +
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> index 0e1a209ce8..f58b3bf0d7 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> @@ -10,6 +10,7 @@ include lttng-platforms.inc
>
>  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
> +           file://0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch \
>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>             "
>
> --
> 2.17.1
>
> 



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
