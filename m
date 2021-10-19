Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF60C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 18:02:01 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.13522.1634666520110651452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X32PtlPB;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id r17so717729qtx.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2vK579gJSc2zk/ptx1fJhb85WbEkjKC7ZTiWI2KbUkk=;
        b=X32PtlPB3qzkciq5KiY7rt+detl9HRDCiMU2vsMF2eXxne+uxOMIHuZuBm36lQtPeu
         zYhMilgfjiVVGxb3WU7/y82dh24IQACaZKhhLnNB1VcoTJUnBmcMp1fJo8mvsEtktUzk
         fgGyAUPWnx6m4E6IHRXiT9lMbRBrWua8GO6o40KnUh73g6F5gA/BLEiZeWbW+8LTvP4c
         8g5tarKmpDq7wRcrzrzJwSUwe1IPbUgwZY978KihF2rtn7kOeupVtJ5C4/C4NpGgNN3F
         ohJ3RxFWWSuZh7DnKKVKVP49SsAM9M8tQBPMuRhG52VE5U1xF9bXh33FYqlfe2tQ9zjU
         9dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vK579gJSc2zk/ptx1fJhb85WbEkjKC7ZTiWI2KbUkk=;
        b=J1nS6bnpFIeB8jxRACwTdYBq/uKdm14tTTOe4mC2n8pDsLk1g4k/GFVwFF+frZ5Ztm
         3nKS/cRbor/7n7eNpFA7F9R73lFnDo/U8O6fWymZOj0t0wueudScYmiaim0dQ0IDupXy
         RQNXTk979yVwj7MRpMTCSVqRhxBQzGbw+oEKolvXT3guKp9fbDVbuAK5DpzPHggAPngN
         M4ME75n+qrbD8mvQGRxH51NdGCkSmEI+t3F7RkUf02oSiwaIGPAT8cozBx406035xjos
         ZtOqP8PXJ/dv0lcv+ZOMApRXxAkv8URlo0hA8PDAEL2xwtXbkXA2tAA/Bm9onesL1dOo
         FcjQ==
X-Gm-Message-State: AOAM5337GZJXpNb0tn0VRTRNCtCmM7DkpwKvVcilwApsVl0HSSbGYf5I
	X6hFYWMZ/+a+cb+zf9e7GQeRVwh/w55jjk4W9yk=
X-Google-Smtp-Source: 
 ABdhPJwWsX+FMj+DKhYHeFmrJNrs29vsSzsgA18Ql44OriwMzZqqw7aNGRWviq0pmfAV1DI/Ow/+9DCuZJqbVdBy67c=
X-Received: by 2002:a05:622a:1114:: with SMTP id
 e20mr1609718qty.225.1634666519155;
 Tue, 19 Oct 2021 11:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-65-alex@linutronix.de>
 <ebae2be9-c655-3f39-cd09-eeef03b30e3d@gmail.com>
 <CANNYZj_OUE5cgp_ARRxU=Yub2vn12T_ZtrNn6qsdsStHgEzw-A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_OUE5cgp_ARRxU=Yub2vn12T_ZtrNn6qsdsStHgEzw-A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Oct 2021 11:01:32 -0700
Message-ID: 
 <CAMKF1spZeH3_qxaEgey84gO=D8=MfWAxREe2ETmaECwkPGQeUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 65/65] systemd: disable seccomp on mips32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 18:02:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157194

On Tue, Oct 19, 2021 at 10:45 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Can you explain why please?
>
> Alex
>
> On Tue 19. Oct 2021 at 18.47, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 10/19/21 8:34 AM, Alexander Kanavin wrote:
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >   meta/recipes-core/systemd/systemd_249.5.bb | 3 +++
>> >   1 file changed, 3 insertions(+)
>> >
>> > diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
>> > index 70f8813895..47d5209f96 100644
>> > --- a/meta/recipes-core/systemd/systemd_249.5.bb
>> > +++ b/meta/recipes-core/systemd/systemd_249.5.bb
>> > @@ -111,6 +111,9 @@ PACKAGECONFIG:remove:libc-musl = " \
>> >       utmp \
>> >   "
>> >
>> > +# https://github.com/seccomp/libseccomp/issues/347
>> > +PACKAGECONFIG:remove:mips = "seccomp"
>> > +
>>
>> this should be mipsarch

the issue is across all mips which is more than just mips Big endian (
which is what mips denotes in above conext)

>>
>> >   CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
>> >
>> >   # Some of the dependencies are weak-style recommends - if not available at runtime,
>> >
>> >
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#157184): https://lists.openembedded.org/g/openembedded-core/message/157184
>> > Mute This Topic: https://lists.openembedded.org/mt/86442719/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >

