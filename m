Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA95C6FD18
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 03:03:34 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.57117.1681959811442209030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 20:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DjqnYwSU;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-32b47d6792dso3686705ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681959810; x=1684551810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkB9NTULPKdP68txgyYC0BrXM8hSztTEg9ekaCOotDk=;
        b=DjqnYwSURuEvI7Po/lFCfVrkvsThcoouADpOjHC1/WLkt89b39Kd1lpyv53TFjVLK3
         +QnMi2K9ekQG9fLo46EpFuP+SWQTiZXhP4es4URsLhyF2v0TACZ1kpSXSEAzWVpYTYQJ
         DNGI9fD1kKiS5TrnE7pc34kNj44cAkdPOpYBUiztrD951ctrGVZXBgulH3m4zgWXfQq0
         HNCWqDdX7clYWrNjeYjSh0uQ1xtBexpR9s4yUX/oHW+fvx0tpI+LQDpa8RaLcna46Q94
         0uexvTmjT0ehwYyJ8ZeoNWoDpvFP1nJHnX8Ws/ZgOEiWqNtVuIEmTUjd5yVsxJVJF0RU
         CkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681959810; x=1684551810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkB9NTULPKdP68txgyYC0BrXM8hSztTEg9ekaCOotDk=;
        b=WIkBpFt6AO7L0/uBvjLT6j06gQJUPLe+HQyWYKYyugPP0s9r247gJ4Eq03YV5dtUu+
         HCyWLydtBzpBoXEhJC9yMJxZFuDxEmCLSijjiAtPkV+AobI5GL9+7HeGz+GbvDBVQv0+
         7NTzjMVdlz2JlIdQPC7XC6Z73a7/CfTyqBgMmoYdHBN0EC6lNPS9svwgH+XGOTJSBeAL
         eHSM76fJpcTWzcSUX4eyw3lBZMeh+JT+GAOFU6xCnKvDozEYS6sZDYnv1ofRoonjG3N6
         3I2LmKAg4DV7M628K/R6UXuX1X0ei/dZWQRxVnaCaq/e8KQab9ouwVh3X7yoh8mhWQZk
         fKjQ==
X-Gm-Message-State: AAQBX9cwRl2+ywF8/ujPrwHDpDM4+N471/BdOdWyURJMnTOt8qPhfEcg
	D77RXsKH+SEuTWQzO42fgOyRCgzYrXKh4x4sCAM=
X-Google-Smtp-Source: AKy350bImcr/6FQS7+FnM176jC7A45kto1zIxLgAUvOL+fC+zItnB+dVZvv8sJeqHziYxYLKPaWqndFspMidbkvLwHo=
X-Received: by 2002:a92:c80c:0:b0:322:fe79:8141 with SMTP id
 v12-20020a92c80c000000b00322fe798141mr426150iln.1.1681959810627; Wed, 19 Apr
 2023 20:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
 <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
 <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
 <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com> <afb0f1d6405256d9dfc6bd5bc0a642ddb1dd82c5.camel@linuxfoundation.org>
In-Reply-To: <afb0f1d6405256d9dfc6bd5bc0a642ddb1dd82c5.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Apr 2023 23:03:25 -0400
Message-ID: <CADkTA4OwhsGOeY57Gu8RZz2quvwDJ36=0bTtmY45WsGKsKjLog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Christoph Lauer <christoph.lauer@email.de>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 03:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180233

On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
> > Hi,
> >
> > Not related with the previous discussion but just for
> > your information.
> > The rm_work.bbclass has an exception for the kernel recipes [1].
> > So I don't understand why we can't do the same for the make-mod-
> > scripts
> > who is the twin brother of all these kernel recipes.
> >
> > [1]
> > https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_wor=
k.bbclass#n168
>
> Ideally we wouldn't be doing this for the kernel recipes.
>
> There is also a big difference to that and the proposed patch. The
> proposed patch was preserving a specific directory rather than an
> entire recipe. Removing the task stamps but leaving a small piece of
> WORKDIR is quite different to preserving WORKDIR and STAMPS for a
> specific recipe. The former is not tested and will break things. The
> latter is better tolerated by bitbake.

Agreed.

Plus, I am working on this now.

I have static linking of the scripts/tools working, but what I haven't
figured out is how to do that without patching the Makefiles.

Next up will be some rpath trickery.

Bruce

>
> So yes, we could do the same. I'm sure there will be other recipes
> people want to preserve for other reasons. Where do we draw the line?
> We could preserve everything and drop rm_work, then we wouldn't have
> these problems? :)
>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

