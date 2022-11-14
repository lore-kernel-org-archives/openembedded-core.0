Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F404DC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 16:36:50 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.7769.1668443809516745143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 08:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GtfXhT74;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id c1so20181069lfi.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 08:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu8h/4kimQquhyhZJ/7dngmmlJ6nGvsaGxSP4ddiHuA=;
        b=GtfXhT74ktCpeRHUoJUR5jw4P4yCQtFXAUgrg6Gxgp00VT9v+KqjKIJns5XiayzjZr
         J+eLxbbA+ZROCt7Dy9SpOqRhtqEtcO9qwFA0G43pqzOOxKjG+jfA7Jy2ycvLsCt7ca64
         Z1FCs5l/hTRNJr+55YUPAbW862SQEDvCpQa/nCZOxRaSWN4uS3YIPpKhHQKIr2RwTyaJ
         +ljFsOvwqvHGPGocNXNCPsukdTRPiDoJBAUPofOuB2kxpp2rXrFELbpj+pec3zHDiwyR
         LGMUqjjf2MmH4S3RqhYOuVRmXOQ9QyhFYA9eRZrCg/lp73ZzLmzwYFN2ikyJZaih6bKY
         eXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mu8h/4kimQquhyhZJ/7dngmmlJ6nGvsaGxSP4ddiHuA=;
        b=Qj1D+wTpXhuGaHyP3EFsYMcB+Y5INvJTE9IXxeErWyNaCWI7llK/VZy7XmMqWYXjdz
         iR8mbG0GEXItiiXDD/Zd3CG3WDaIj7908pg38xaC5rDXlg2f9t5frBoLdTh7+0lsjRSm
         5K41x8bDCeO5bbZb6opKlC3IRgvxIsWPS89gFlhDPcDq8x7AHaWRFpJenM/hD6wxYZJu
         7+hhq1n1YjacTkTV7/R/uDs65unDb/T+bxn+arBoEKO6jQbfsmvm6DR4HRBkX6RiVHGC
         8tIAVeMJhUPWDTblTnSuzf2vFFLk1OWSqns47MHSsJvIG8MTRWyOXVLj0bYE3XozevFl
         QMyg==
X-Gm-Message-State: ANoB5plofvmQCQVOxgY65roZq/JnM48kn/rYtUvwJRDGosUdPSWul5QI
	DEYKKQOWsdcHfKJd8qQstFQopkPlKp4VIW1nhhg=
X-Google-Smtp-Source: AA0mqf5qJ1LeROhnh9fLt7bH/Jd6Pto5TeKvgNA/81qVIvqWKkWlLzEcO80/0D4Sdc4vY5oiURuGPj1YWad5buVabt4=
X-Received: by 2002:a05:6512:c6:b0:4b1:5125:2f14 with SMTP id
 c6-20020a05651200c600b004b151252f14mr4210809lfp.345.1668443807559; Mon, 14
 Nov 2022 08:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20221114133504.2392154-1-alex@linutronix.de> <9417858a6829fc4dc81546e94a78542fea51989c.camel@linuxfoundation.org>
 <172777C031C3B2CB.6692@lists.openembedded.org> <CANNYZj-_ZYP6NUBnZu2mOgY2o4x=ZzM4aBnuURVRRehLYiwnjw@mail.gmail.com>
In-Reply-To: <CANNYZj-_ZYP6NUBnZu2mOgY2o4x=ZzM4aBnuURVRRehLYiwnjw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Nov 2022 17:36:36 +0100
Message-ID: <CANNYZj9siEQWd8ZT7GZeyApjkNg14CBgSVSjiMFd+M8GHpk-zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: do not rely on native llvm-config in
 target sysroot
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 16:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173252

And here's the ticket for meson where this issue originates:
https://github.com/mesonbuild/meson/issues/11043

Apparently llvm-config is not the only, or even the recommended way to
get settings, it's just that meson is using it instead of relying
entirely on cmake configs.

Alex

On Mon, 14 Nov 2022 at 15:25, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Anyway. I filed an upstream ticket:
> https://github.com/llvm/llvm-project/issues/58984
>
> Alex
>
> On Mon, 14 Nov 2022 at 14:50, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >
> > On Mon, 14 Nov 2022 at 14:41, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >
> > > The trouble is how many people are ever going to check whether the
> > > output of llvm-config changes? We really need to work with upstream to
> > > make this util cross safe...
> >
> > Yes, by making it a thin wrapper over pkg-config. I am completely
> > baffled why many projects, llvm included, have some kind of lifetime
> > allergy to pkg-config.
> >
> > Alex
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173243): https://lists.openembedded.org/g/openembedded-core/message/173243
> > Mute This Topic: https://lists.openembedded.org/mt/95018621/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

