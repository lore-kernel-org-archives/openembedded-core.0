Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BDAC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 11:45:58 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.9021.1644493553315750173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=t8dq212e;
 spf=pass (domain: burtonini.com, ip: 209.85.160.170,
 mailfrom: ross@burtonini.com)
Received: by mail-qt1-f170.google.com with SMTP id z1so4851789qto.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uzMSvHy4rjVm9GYchMpPwVyzAqMVr6LB5GsXTkrHNXE=;
        b=t8dq212eR1FN+98MpBvZ59H2lsee3Ci3ityDsdF88HVSMb7iafafpBdEEdKTlrhgIn
         UeINNgim49h5AmkyXpr5308auO4VIMgSQOsj5syjNk1NGPach9DIV7kpeGJChnAuh79c
         p4QD8gLzCOoozwMGnTcxzu15SJOcECSKtLZ7IGBkhUI38aFRtOLEIi3l8WXkW3TiFtNG
         XAsJyzEvJlmP06LYcbEmNuhKfh4Cry6LZe5cYAM43KyODqWLDTLszgGnl6jUTS6WVVWB
         k+oNTX9ofkalSuITngUEHK4Bdqi247eKonJdJ1FNTGFv8n2Ofq/W2cdDV112EBDbmw8K
         FYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uzMSvHy4rjVm9GYchMpPwVyzAqMVr6LB5GsXTkrHNXE=;
        b=dAv8vApLv/nDFAJRkyEPrMLcGpf4hmvtOLKsTFZU9DlvC/uX6wEcwekC8+ntRObomn
         B2KB4lbBnYYn66moRp20Q4+gKTGgSLBmAXUTG15228qI9ALRklDU1PxNc6MrUCjOjYXE
         1nPv5oXiiDQmRA+fWef67F+OuzsgEKq3lfNXDJ8YM41B5sPibSHKHYHyqcOleRzxxiwF
         MpOCYHk4yDxSAa86Yro95w18siAPT2RwyUHZ7NoY4oHXefzzb/nKaoZSrido4Gh3Sx3A
         wgbdxOXxvLlfUoXPpv8MdNZ6UGF5KwjFryleuPr1mvNu1sSWPYEwrEZ4Bl3UDhJEGUF/
         TrFQ==
X-Gm-Message-State: AOAM530kWRi1jlzBaEvhYsBhvm9dYi3oyBWPwVj5PJCige5XxtwSJBy4
	s9PefmJFTngnk29git9TFqE8CMbT/f96Xp9P8wOYtw==
X-Google-Smtp-Source: 
 ABdhPJyoWwT2hQI4szjBDelHuss6oZW+rH5+PpWxe8x4DhRHSZ5zDmhmALh+wNIvLbAs/Nui8R58g8SLdUjN9ehs1/w=
X-Received: by 2002:ac8:5854:: with SMTP id h20mr4497769qth.22.1644493552077;
 Thu, 10 Feb 2022 03:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20220209173036.3823144-1-ross.burton@arm.com>
 <20220209173036.3823144-2-ross.burton@arm.com>
 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
 <43fe0dbf3548f549d1c0161d2a55f633a9c27122.camel@linuxfoundation.org>
 <CADkTA4Ms8yb5Jn3K8N2BZktLYHtfDwp0ym_OVke16G4ER_739w@mail.gmail.com>
 <CAAnfSTvsN7DSuiGvSfLF2OgJXNW7QEZK+LZdNuvTcrYk3eUMvA@mail.gmail.com>
 <c54b8a5fbe59b21a862d5b6519e4f8872458f694.camel@linuxfoundation.org>
In-Reply-To: 
 <c54b8a5fbe59b21a862d5b6519e4f8872458f694.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Feb 2022 11:45:41 +0000
Message-ID: 
 <CAAnfSTujoz8v_+Cddjut2mO5d2FNDYBZtnXR87j8Ych_wYoEnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] kernel-module-split: modules should
 recommend the kernel image
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 11:45:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161610

On Thu, 10 Feb 2022 at 10:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > Obviously this won't work in the situations where you want a normal
> > image with a kernel but also a initramfs with a kernel module in it,
> > as that behaviour isn't machine specific but image specific.
> >
> > If this was a recommends then it could be removed via PACKAGE_EXCLUDE,
> > but we'd need to be sure that nothing from the kernel ended up getting
> > pulled in via a single module.
>
> I think making this a RRECOMMENDS and doing that may enable more workflows and
> make things easier all around. Can you check and see if it does pull other
> unwanted stuff in? I'm hoping it doesn't.

Tested.  Our initramfs pulls in a kernel module, and
PACKAGE_EXCLUDE=kernel-image-* stops the image itself being pulled in.
It does pull in the kernel-5.15-yocto-standard package, but that just
contains a few module config files.

Patch incoming!

Ross

