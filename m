Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93225C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 18:54:16 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.1572.1663095252239135812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EC80hBW3;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 29so18968243edv.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oS/ujJjeeNoUMXETmh3nxKDiaSblevWjX4AJVsKMGWA=;
        b=EC80hBW3KP+1O3EkweGuXVbexnE5GIp9HXaCafn8mpnX1HD20uNvnyeAIlbDk/oLe9
         qk6VSJOv/uOJFbSaq+DVkpzH5lK6TP7OmCvhfX+w9+M2/rfc5tsCyzd+ynLvaV1i+Yy5
         u40r8jsSyLn28BL8K9TdCNNqDrh5ZBEWanB3EJscC/TfUACFaVnjPuJYqBdx9Qi31pRG
         WswlUrZorSZ2d0+qPGCZCG8W7FeziXzzBMJECR04vH1IWzuxIAD8Yklf/4LFA2zCIYjs
         k58FKBkVWymCf/jTMO9EQ/IziDZ2gdq1HGkStyesQ9BbgR5FN4NJyBvXoxjA2A+6YOvn
         0VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oS/ujJjeeNoUMXETmh3nxKDiaSblevWjX4AJVsKMGWA=;
        b=oaUACCdQA2rkWx6p02oBNoAojLFfS1aCCBlkglB18gtHJd71u4aDq/tWHQIkN5mIpg
         U/dyVDSoI6trrUyIGOEvt9wFr0+ZHScrycWYElG1uhSg2lLgnpYlAoU9WcoGlHQNO3Sv
         c0mD3rrGbOpKm/TxDmzUn3PafPG5jQHmSi2x2kLjZk7B+fUPF+C2+E6+HfIWwNenw2wc
         9pywaN1hYJ+So2UyjRFTseyLKB6mn6dO3b4cmwYAMTMhmTDOsNQdfwzP59noGcb4v7gf
         TE04xgCLXmZlaE8etgiYzZEAtI8lj30k3gPs+7yi7w7xW0WqMvdgziTTejZD3tBMxZV9
         MLxg==
X-Gm-Message-State: ACgBeo3Bc4vH43i7sIzlAOr2o+tSG7jK0vIE+p85rsONkPJIAeQy8kHB
	RzYpHLDnGVSiKQFl3xK/16LFnB3ou/4SnciIuMOyQw==
X-Google-Smtp-Source: 
 AA6agR6zvde5HAyLtcL0UJNvteJt8RqSbtqM4HOtjFJ86vz4O/KkIkNPAWRlgUmH2wWXlSE2AxqcmIImh2KHx13sd1g=
X-Received: by 2002:a05:6402:5210:b0:451:d4ff:ab02 with SMTP id
 s16-20020a056402521000b00451d4ffab02mr9255406edd.345.1663095250540; Tue, 13
 Sep 2022 11:54:10 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1sqUOiZSP0+NV9LOZ+B4v6tZ_qKmA81XrKTsKqYRtcskig@mail.gmail.com>
 <28994.1663062196921833526@lists.openembedded.org>
 <d96f949e-99f9-82e9-088e-d351327adba9@gmail.com>
 <7cd419c6-f3fc-6ebe-8dee-ee969d26e88a@windriver.com>
In-Reply-To: <7cd419c6-f3fc-6ebe-8dee-ee969d26e88a@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 13 Sep 2022 08:53:59 -1000
Message-ID: 
 <CAOSpxdaxuDhrj1CtsYpDUpfdY0vuAC1336jRJJN3gasg8FS68g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] binutils: stable 2.38 branch updates
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
 Khem Raj <raj.khem@gmail.com>,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 18:54:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170607

On Tue, Sep 13, 2022 at 8:42 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-09-13 12:59, Khem Raj wrote:
> > On 9/13/22 2:43 AM, Sundeep KOKKONDA wrote:
> >> Hello,
> >> I am planning to take the gcc, glibc & binutils updates to Kirkstone.
> >> I found only the glibc-2.35 branch is having a few updates (given
> >> below).
> >> /f8ad66a4ca nscd: Fix netlink cache invalidation if epoll is used [BZ
> >> #29415]/
> >> /9e960717e1 Apply asm redirections in wchar.h before first use/
> >> /577c2fc7f3 elf: Call __libc_early_init for reused namespaces (bug
> >> 29528)/
> >> /83f1d9851e NEWS: Add entry for bug 28846/
> >> /cbd8685e82 socket: Check lengths before advancing pointer in
> >> CMSG_NXTHDR/
> >> /4bafc4001d alpha: Fix generic brk system call emulation in
> >> __brk_call (bug 29490)/
> >> /37fd2ac665 stdlib: Fixup mbstowcs NULL __dst handling. [BZ #29279]/
> >> /a1ec4157bc stdlib: Remove attr_write from mbstows if dst is NULL
> >> [BZ: 29265]/
> >> /813a8d0171 Update syscall lists for Linux 5.19/
> >> /e200127c6c riscv: Update rv64 libm test ulps/
> >> /8c172a6cb0 dlfcn: Pass caller pointer to static dlopen
> >> implementation (bug 29446)/
>
> Ideally you'd get that in this week since I think that 4.0.4 is being
> built on Monday, September 19th.
>
> CCing Steve in case he missed this thread.

It will have to hit the list in the next day or so to make it, since
it takes about 3 days for the test/review cycle.

Steve

>
>
> >> The binutils-2.38 has no new commits. And, gcc-11.x also not have any
> >> new release after 11.3.
>
> That's good to know. I was just wondering if there was going to be
> gcc-11.4 so this info is timely.
>
>
> >> In /master/ branch gcc_12.2, glibc_2.36 & binutils_2.39 versions are
> >> used. Kirkstone will continue to use the old versions?
>
>
> To answer this more directly than Khem. ;-)
>
> The Kirkstone branch will NOT update to the versions shown above. Users
> want a stable version
>
> for the supported timeline of a release; some even may be surprised that
> we update from 11.2 to 11.3
> even if it's all bug fixes.
>
>
> >>
> >
> > the glibc fixes are good so go ahead bump the SRCREV to latest on 2.35
> > branch
>
> Agreed.
>
>
> >  major version backports are exceptions. We can consider doing mixin
> > layers if needed for say newer compiler.
>
>
> Answered above.
>
> Thanks Sundeep!
>
> ../Randy
>
>
> >
> >>
> >>
> >> Thanks,
> >> Sundeep K.
> >>
> >>
> >>
> >>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170603): https://lists.openembedded.org/g/openembedded-core/message/170603
> > Mute This Topic: https://lists.openembedded.org/mt/92739561/3616765
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> # Randy MacLeod
> # Wind River Linux
>

