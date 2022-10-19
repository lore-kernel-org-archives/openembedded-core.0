Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82A6C43217
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 15:04:53 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web09.9284.1666191886491618551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 08:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J1tt/jnM;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id g130so19530236oia.13
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duQXd+LPcTCtwh0t+/Zm+xW83G89HdRYrkrapsGJfb0=;
        b=J1tt/jnMbPw21jaAY9UAxUgI5tdj8nNae0nD/Dphh6u4xSjvWyBtfPMpaYvcetFQkz
         Z3wATT4avYWOgUVUYRBzooOp+KjjWqnpKvp0vqJxFalu1DMfpBw5W//hm1Wiq8lwRcpx
         Lwf4sqnl7sbc8gqhIXFDv+7DadvsKiUSYSrLLsbKD/YCcQXLD6sOUzHwLf6NB3orbPNb
         egzc/KUy+VvwY+hHlNQXj2lMB8vdlX0MSTt2/cFvk/klY7sAgvW7TNAneI8pHmmpjZu/
         xz3Iv41pMnbM77lp48A8VOZMVd0UGJt4aEhQ3rYbun+J8h6FcEHi9Io5Mp6lQuz09I8I
         1x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duQXd+LPcTCtwh0t+/Zm+xW83G89HdRYrkrapsGJfb0=;
        b=vU7TQR9n03RezuCBeYC6bzPIRJq3JicWQZL3fujVf375EC5uXrznn00OJQUMYYccpN
         IhEl9RyWuuWHOAOJZVcSCeoqmHI1BQMRA1LYzunP6NyLI0d0Rn8jJMqJmmJ/8+zejRY8
         tNSnOzwAP8NDf25P1IGrc+0uQAdh6wTQ81TnhuVOOgpMqFZdjUGW2D1SOwsMXdsg+V96
         cnARjYqTYQx7zp1q5irDMQpPwcrvfvAJND3eFFvCPg6gDhCcmFC4Rw4vnrvn64HZ68mz
         2zBDL/HXbX9x93GCt+BZ7kKsqSZJMP4q+iUssTGZcEOJy7tfXjIFXZ2rcOAR8QiX/FsQ
         yDqA==
X-Gm-Message-State: ACrzQf20h/VDkRa0gD2LuzLcGfqQYNvv4kVFQaA6Noi54FQXpMQ2OiuT
	i9/PyUj7vvlhfNJxl6AEM+VRl/vvmia6Su4bdvVG5eE5
X-Google-Smtp-Source: AMsMyM4u9hgg0VH72qZK1OY6rnSOSeziK9jtfLG2r4eeKsyaHvLGqhyqalLp1FxPPVlFVDYcjDcjIqnFg2h+wuU3y7w=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr21329930oae.262.1666191875305; Wed, 19
 Oct 2022 08:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com> <CANNYZj870m=XRLUe1rjbFfR5C9BUGqrjWYOLa2WFzn7WG5nC3g@mail.gmail.com>
In-Reply-To: <CANNYZj870m=XRLUe1rjbFfR5C9BUGqrjWYOLa2WFzn7WG5nC3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Oct 2022 08:04:09 -0700
Message-ID: <CAMKF1speS_Z1tEPLqNhfF_-rr-rfJ-dyAE7sdntwtGWxp95kBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 15:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171969

On Tue, Oct 18, 2022 at 11:54 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 19 Oct 2022 at 08:34, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Can you show examples where this is needed? Custom variable does not =
seem a good idea. I also worry that it=E2=80=99ll break automated updates (=
it=E2=80=99s bad enough with mesa-gl, this might make it worse).
> >
> > https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mes=
a/mesa_git.bb
>
> "require recipes-graphics/mesa/mesa.inc"
>
> Using recipe includes across layers like this is not a good idea. It
> imposes requirements on core to continue providing the .inc, and not
> doing anything with mesa that can 'break' users of that include.
>

the reason for .inc to exist does include this usecase. oe-core
metadata is extensible by these constructs, it's similar
to bbclass perhaps a bit smaller in scope. Getting rid of .inc will
state that we do not allow other
layers to use it. These are APIs of sorts that oe-core exports and
people build on them, its fine if
they should be changed but there should some well understood path
otherwise they just make hard things harder.
The load of upgrading from one release to other is already high and it
keeps going up.

> Please make it self-contained.
>
> Alex

