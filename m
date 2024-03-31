Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091F0CD1288
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 08:28:24 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.13660.1711873701023664048
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 01:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GDfrrn29;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-22963f0e12cso1956523fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 01:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711873700; x=1712478500; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTrAkasDdhQkhdluC9MfNwU9vTQpWsuuLZjt7aiHP2w=;
        b=GDfrrn29n2UBirYlTgCQz0ErOFrdVs+g2xNNuBcLGgBEvyXMhPBgxp4NzIwvlZ5kNq
         r4zFxRYT7TU4HoPkqYeGlM1WzWqH6e0Ur/V+NaX16MHwYliCjk1qi9bdVIKMI7T22tz9
         uUdTkBr5ll5SUNqkHyZKg2yWCEyuQHGvk6kWZsKzy5xwSIVex8qMa6jzyE3SdMUog3zf
         9awZxYaNX2te4p3KAqACWBJE7pR+m/NL4bgrGJsNwco37tlSinmLkWY2Zo4/R1wvzHPf
         0kH7Vbrkpc6mFkKDNDkWT6gSkxNGsJpRYQiwu6NARuVp65pgbzIJm1SCCZFTsLJPE422
         zuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711873700; x=1712478500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTrAkasDdhQkhdluC9MfNwU9vTQpWsuuLZjt7aiHP2w=;
        b=Db4Oh1FJHcVidQr0nI45/0kSuptd42y4PoJ0PVfnIiN7RnK6ldnpffMSEEZgoaoqFy
         HiSGm5ol/CNU2Ew1MNdbR5q08B+JvGQ5g3+waN6sphqIV4E5/+T8fBv+Ou/ZHsr6faXB
         2tNNCqr63210i8VgJSUnh3xRBg32yNOyV/uKVy3aLMlE+FSsClx6Qi881hxa4WT78BPR
         BwSrrdcSV8piJnFf6VJiWmkoSE3ji58EIvfZ99RYeMclTCx0IUGHWcxpQuKSZtxx3z21
         nhr+SLVeRrWu3t4ZGOCaIb19dM4qyJLqtWA9crERzWkdnH1G2kuVXwHCxkCw2+A1LkXG
         8r/w==
X-Forwarded-Encrypted: i=1; AJvYcCXhkZhjTbdVLyJtKbikD4UpIxvMic497Wc1+Ri1u7K4wQK9IjOC2wm9scQF3g9kAifmWudGzQWChv0FbUDOzjerUU4eFYHaG1Qqmis7zDnxjOBcudfFiWlz
X-Gm-Message-State: AOJu0YxEbjLrJ7rcQwGkLo5WG4tFMN4D/HnNCMHB5uXJDC5WLJ1R9d3O
	WLjU/LYLXhWln7T3fFWdFok1X+5ZpXzZMd8IcRCCk743GSB47DwDhBO/JBhgvrDRZHu8b2ws2Ld
	9+l/8j38IvsZIZqRRT7ZABZzcdern7DRv
X-Google-Smtp-Source: AGHT+IEXSMRLx9On77sTCsMBb6bQTuqaBq+e7qLlKUSYnpmPB1+IOKoQxi+AAJZGXjZ9Mx/jM3fFKAX+8sRrfdGk0iw=
X-Received: by 2002:a05:6870:ac07:b0:220:8d0d:e25e with SMTP id
 kw7-20020a056870ac0700b002208d0de25emr7140902oab.47.1711873700065; Sun, 31
 Mar 2024 01:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240329055034.3942360-1-raj.khem@gmail.com> <20240329055034.3942360-2-raj.khem@gmail.com>
 <36955edbe50ee6fbb2320ff5c304722ae957a344.camel@linuxfoundation.org> <20240331082400af4e1f1f@mail.local>
In-Reply-To: <20240331082400af4e1f1f@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Mar 2024 01:27:53 -0700
Message-ID: <CAMKF1sre5e3475zOTpz7T3jM+PTt5P0ooVHabUZBGr77=7T+BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] valgrind: Re-enable fixed test cases
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 08:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197657

yeah drop it for now. I need to check x86 results with gcc

On Sun, Mar 31, 2024 at 1:24=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 30/03/2024 08:31:10+0000, Richard Purdie wrote:
> > On Thu, 2024-03-28 at 22:50 -0700, Khem Raj wrote:
> > > These tests have been fixed in prior to 3.22 release
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/valgrind/valgrind_3.22.0.bb | 6 ------
> > >  1 file changed, 6 deletions(-)
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6452/=
steps/13/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6257/=
steps/13/logs/stdio
> >
> > Failed ptests:
> > {'valgrind': ['memcheck/tests/leak_cpp_interior', 'drd/tests/pth_mutex_=
signal']}
> >
> > so they're not fixed.
> >
>
> Failed test details...
> drd/tests/pth_mutex_signal.stderr.diff
> ************
> --- pth_mutex_signal.stderr.exp
> +++ pth_mutex_signal.stderr.out
> @@ -2,14 +2,34 @@
>  mutex initialized
>  thread attributes initialized
>  thread created
> -sleeping
> -signalling
> -sleeping
> -nullHandler running
> -unlocking
> -contender locked mutex
> -contender unlocking mutex
> -contender unlocked mutex
> -joining thread
>
> -ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
> +Process terminating with default action of signal 6 (SIGABRT)
> +   at 0x........: __pthread_kill_implementation (pthread_kill.c:?)
> +   by 0x........: raise (raise.c:?)
> +   by 0x........: abort (abort.c:?)
> +   by 0x........: __libc_message_impl.cold (libc_fatal.c:?)
> +   by 0x........: __libc_fatal (libc_fatal.c:?)
> +   by 0x........: futex_fatal_error (futex-internal.h:87)
> +   by 0x........: __futex_lock_pi64 (futex-internal.c:203)
> +   by 0x........: __pthread_mutex_lock_full (pthread_mutex_lock.c:?)
> +   by 0x........: pthread_mutex_lock (drd_pthread_intercepts.c:?)
> +   by 0x........: contender_start (pth_mutex_signal.c:?)
> +   by 0x........: vgDrd_thread_wrapper (drd_pthread_intercepts.c:?)
> +   by 0x........: start_thread
> +   by 0x........: clone (in /...libc...)
> +Thread 2:
> +Destroying locked mutex: mutex 0x........, recursion count 1, owner 1.
> +   at 0x........: __libc_write (write.c:?)
> +   by 0x........: write (write.c:?)
> +   by 0x........: _IO_file_write@@GLIBC_2.2.5 (fileops.c:?)
> +   by 0x........: new_do_write (fileops.c:?)
> +   by 0x........: _IO_new_file_xsputn (fileops.c:?)
> +   by 0x........: _IO_file_xsputn@@GLIBC_2.2.5 (fileops.c:?)
> +   by 0x........: fwrite (iofwrite.c:?)
> +   by 0x........: main (pth_mutex_signal.c:?)
> +mutex 0x........ was first observed at:
> +   at 0x........: pthread_mutex_init (drd_pthread_intercepts.c:?)
> +   by 0x........: main (pth_mutex_signal.c:?)
> +
> +
> +ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
>
> Failed test details...
> memcheck/tests/leak_cpp_interior.stderr.diff
> ************
> --- leak_cpp_interior.stderr.exp
> +++ leak_cpp_interior.stderr.out
> @@ -1,4 +1,7 @@
>
> +Conditional jump or move depends on uninitialised value(s)
> +   ...
> +
>  valgrind output will go to log
>  VALGRIND_DO_LEAK_CHECK
>  x bytes in 1 blocks are definitely lost in loss record ... of ...
> @@ -35,10 +38,10 @@
>  LEAK SUMMARY:
>     definitely lost: x (+0) bytes in 1 (+0) blocks
>     indirectly lost: 0 (+0) bytes in 0 (+0) blocks
> -     possibly lost: x (-x) bytes in 5 (+1) blocks
> -   still reachable: x (+x) bytes in 3 (-1) blocks
> +     possibly lost: x (-x) bytes in 4 (+0) blocks
> +   still reachable: x (+x) bytes in 4 (+0) blocks
>                        of which reachable via heuristic:
> -                        newarray           : x (+x) bytes in 1 (+1) bloc=
ks
> +                        newarray           : x (+x) bytes in 2 (+2) bloc=
ks
>                          multipleinheritance: 0 (-x) bytes in 0 (-2) bloc=
ks
>  To see details of leaked memory, give 'full' arg to leak_check
>
> @@ -46,11 +49,11 @@
>  LEAK SUMMARY:
>     definitely lost: x (+0) bytes in 1 (+0) blocks
>     indirectly lost: 0 (+0) bytes in 0 (+0) blocks
> -     possibly lost: x (-x) bytes in 5 (+0) blocks
> -   still reachable: x (+x) bytes in 3 (+0) blocks
> +     possibly lost: x (+x) bytes in 5 (+1) blocks
> +   still reachable: x (-x) bytes in 3 (-1) blocks
>                        of which reachable via heuristic:
>                          length64           : x (+x) bytes in 1 (+1) bloc=
ks
> -                        newarray           : 0 (-x) bytes in 0 (-1) bloc=
ks
> +                        newarray           : 0 (-x) bytes in 0 (-2) bloc=
ks
>  To see details of leaked memory, give 'full' arg to leak_check
>
>  leak_check summary heuristics stdstring
> @@ -133,5 +136,6 @@
>
>  All heap blocks were freed -- no leaks are possible
>
> +Use --track-origins=3Dyes to see where uninitialised values come from
>
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

