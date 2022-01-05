Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B56C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 22:40:16 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.785.1641422414469566646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 14:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Sku1EEIX;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id u25so2369005edf.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 14:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8l83I0IYerHnFXdM7BfMIUKCJ0xkPvuliusasy1KH5c=;
        b=Sku1EEIXzNlbvOTnTPvg+Nrorj2N2pPMalPwDvVmubpIBS0MvS1nlWcf+q6E3J17up
         tjjIOcq9KcIRPLqysLJ1ZhcuqG8nSLMBGFSp3GdkeTgjUJ9VfbMcqJBQ6R0V3LsnW4AE
         Fsm8TUQe2CLHccpMsVB3vXN3YBVQayISZcIJ0c/IMR0nEoQV8muj35h4lsW2y8zP3BTy
         o2WhT9FM5Tnwwss/dqe8FnzwwjplsMKaWJK5gC6aW28sSXXpa05Qht2Ct4fhQMZ3o2aK
         l1cFQUGMfe1FrAQG4K6FKC631PCCd5OGV5j7pRst8lT+xxN6s6j1Zt7wSincb/bBVJP1
         7kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8l83I0IYerHnFXdM7BfMIUKCJ0xkPvuliusasy1KH5c=;
        b=fnKawbUR5U3K3SFKPJko0m/+wsWIKf+E6MzGiHtV0XPqbsaOkhGkPDmJMeM3G/ZIlB
         24ltp/CxyJan4fEeL80WW4ofP243ZwrNXc2xWdQWobO1R5fLMXSL0NObF4724wMkcEKO
         1qzH8tTQwQ3IWQ1xlDPziqhvs3xrYYg49/wc8GvaCqkMNdnAAcCMkimUWbkVQdWc/cbg
         1wIdTjIAmtlgw6n+6KvkU019EYQ/eRxYstxtOec9hdT1p/oZN3VydImW1F05zBqHP3F8
         lO4jS9tmpVZnvNoMlyZoA+H1NySh9n+lEZ8FhpJBQH/z0QpAQE1QoZWj4ds7wGbim4mJ
         8mDw==
X-Gm-Message-State: AOAM5304wOf09l2Y455i4u4WLIhrXtzEi452TkHRaJVqsJQqQZW6J79O
	7gXlgQ0PElYhBa4T5MZuuML0f7jjn4rKxehfYzTyRg==
X-Google-Smtp-Source: 
 ABdhPJyoDx87/4EnbRNEpygNj2Qby/AIVGUX45l8XAxV0zYOdfcoovt1fK42RkfZXkMJIJzd/VEHRQ9VjaLAWLAEKVQ=
X-Received: by 2002:a17:906:9753:: with SMTP id
 o19mr44345581ejy.243.1641422412692;
 Wed, 05 Jan 2022 14:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20220105222141.25234-1-marex@denx.de>
 <b8b9cfc2-d054-820d-9659-c9170b3828a0@denx.de>
In-Reply-To: <b8b9cfc2-d054-820d-9659-c9170b3828a0@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 5 Jan 2022 12:40:01 -1000
Message-ID: 
 <CAOSpxdY6-jz=z-v-h9zcSzjhWiWocjYYGg=MYcXLzHhgXzy+UQ@mail.gmail.com>
Subject: Re: [PATCH] weston: Backport patches to always activate the top-level
 surface
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 22:40:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160217

On Wed, Jan 5, 2022 at 12:25 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/5/22 23:21, Marek Vasut wrote:
> > In case the device has only touchscreen input device and no keyboard or mouse,
> > the top level surface is never activated. The behavior differs from a device
> > which has a keyboard (or gpio-keys, or even uinput-emulated keyboard), where
> > callchain activate()->weston_view_activate()->weston_seat_set_keyboard_focus()->
> > weston_keyboard_set_focus()->wl_signal_emit(&keyboard->focus_signal, keyboard)->
> > handle_keyboard_focus()->weston_desktop_surface_set_activated(..., true); sets
> > the top level surface as activated. On device with touchscreen, the above is
> > never called, hence the top level surface is never activated. Add explicit
> > weston_desktop_surface_set_activated(shsurf->desktop_surface, true); into
> > activate() to always active the top level surface.
> >
> > This fixes at least two known issues on such devices:
> > - Wayland terminal cursor is an empty bar (full bar with keyboard present)
> > - Chromium dropdown menus are randomly placed (they are placed correctly
> >    when keyboard is present, because then chromium can find the activated
> >    top level surface)
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Steve Sakoman <steve@sakoman.com>
>
> And that Subject should've had [dunfell] tag, sorry.
> Do you need a resend ?

No, I've got it!

Thanks,

Steve

