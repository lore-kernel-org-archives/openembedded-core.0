Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7253EC25B06
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:07:40 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.8271.1660234049937770286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IwZb11fv;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id s9so19779808ljs.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=a9+lOG5va2ZYHi8KxZmETo8Unck+RAA1SrXxGgM6/Ng=;
        b=IwZb11fvcC+gNKTQy/EUeAUqk3e7I/pgsh8+Sb2ZtaUzHO4YEDR/Os23fK1iDvlWkB
         XAMWv69k4b2LWpgteUxkl2Eb1iTIjYgRe/ywTSy9ShC+KajI5TDpaYsd1JRXQAe6A/HI
         VQMitmDP6OIfxOtN/9oAhOG/sAHkAs2au9WfnNI8SOhSH3zxeYHCoL4iz3Xap8uQsAEw
         7rKypemqdx9vgUSGY6a2FfIkjVSuVEDAQ7w0PJIM5zHnlO7D88WzHYOQBVPZYtlOIcxP
         wWPm+/VqLpLvFu4UjFG+wwYO6BeqBfDyjf02t4y6BdrYh36U3T930QNKyKFR0p9iYFWK
         rdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=a9+lOG5va2ZYHi8KxZmETo8Unck+RAA1SrXxGgM6/Ng=;
        b=JQnLazDS8ClNHIvfC8r7iaP+dKGIj2xYdQ3XkQ1BPLYl2OqBVBlwL6GAgKALE+Kq1h
         FG/YJm6hmxfHalS3EOwLqf1dUAZH4hHejYGoXrC8s+9U5XwJpfbrH/GBphTvTpXmmHa1
         Ay7qtEVyVp74u4foSyFx/YSaa3bBrLHRbUDyj7f7tYPblZnaGAOQRQVeAJ7M3bjljgQK
         SgDCSYYagdg41YEZPFFmIXgsaHubT/1ZGYQL0qnlkGcDfstkshzswtwvNMcUcpCR14Bf
         VwieN8GgtyZcdc2ZFmF+A5u6o7WLcjCU9/hsPfu3Pmh4KRgYwNaddvrHG74BPlZ6dZyR
         2GIg==
X-Gm-Message-State: ACgBeo1+8AauQm1z5SRB10ZaYeO0jWeRhAIdMypKFLrCFAoKJWkcg1vK
	XsT7srLV6GJlMEKhu6J07bj1PET192l4ggIp8uI=
X-Google-Smtp-Source: 
 AA6agR74PSO83N8IwTXcgBltQrxR21j375ALiYwq1Kk8E/PPb5OqEe+I6sSjefTVbq5kt4hvHzAhiUJ8Ii/K8lljRnI=
X-Received: by 2002:a2e:9415:0:b0:25e:477b:adc9 with SMTP id
 i21-20020a2e9415000000b0025e477badc9mr9706026ljh.109.1660234048044; Thu, 11
 Aug 2022 09:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220811154005.4084669-1-trini@konsulko.com>
 <CANNYZj82WqbCr2MktnE8GrowoRiXL=W2GGOVpgzgi9Ud9YJJOg@mail.gmail.com>
 <20220811160416.GW1146598@bill-the-cat>
In-Reply-To: <20220811160416.GW1146598@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Aug 2022 18:07:16 +0200
Message-ID: 
 <CANNYZj-O7y0O3v_NfFmpRR3LbLFGcFOtWT+i3HjfDdMzSE3WZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemux86-64: Allow higher tunes
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 16:07:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169252

On Thu, 11 Aug 2022 at 18:04, Tom Rini <trini@konsulko.com> wrote:
> > This is less useful than it may seem, and merely moves the supported
> > CPU from circa-2006 core 2 to circa-2008 core i7. You won't get AVX or
> > anything newer, which requires adding these instructions to qemu
> > usermode (a project I'd like to do if I had the time).
>
> True but it's also the case that tune-corei7.conf is the newest one in
> oe-core, yes? I had previously peeked in meta-intel which has a
> skylake tune, but bringing that in is something I'd leave to Intel/WR
> folks to take care of.

Yes, from making things consistent perspective this change is fine.

The skylake tune in meta-intel gives its users two less than great
choices: disable qemu usermode, or disable everything that qemu
doesn't support (AVX and up).

Alex

