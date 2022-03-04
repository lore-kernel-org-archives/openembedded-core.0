Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172F6C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 23:39:31 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.911.1646437169664884309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 15:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WcZq1Go+;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id yy13so11645995ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 15:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TA5SymyDuLKhVppsxePYJ3+cJab0hOoyAoFYR/9it1E=;
        b=WcZq1Go+dsMgEKamG3kfGKtCU9J6D38DKlNhnqzqVbnpzY+pBkLedAMZTTVJqGvU7X
         ngse3zbyY/BOVRrcuCIqvq2MN0rsdm4tBYruY1ETo1WQYdDygKzbyzBxo4BFKLQCE7jR
         /iHj1Ragf5MVU0FE2o4c9XdXpdEuWUzozguMDqoXsEnX31uI9Rf74b4JJs1OwyekciXk
         nLYxsX8aI1txnvw69fGp/QwS+mxjMtPU1mZt7uXOXsQQFcDV+d4MfdaLMLYBrk/o6TRa
         jFBrU/J6F31w0LVzAUSO2Jl1o27kkE07/DiKa995JNju4shgw97ezRLSRPurKVHgIdsc
         k9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TA5SymyDuLKhVppsxePYJ3+cJab0hOoyAoFYR/9it1E=;
        b=VUGMtlT1AONfLr2By6PbNl9+PSF3S+/pw/jfAaRbh/nf0wLi4HNb2h6dDAC7Uzg5qU
         otYsE5rzI1WOrcoR0PcfEK4xwWY6Wl9wA8OneGJdLMx2PNE5GSU3RXvgKJZ1zWMhVsYS
         WnTjkgha803sLtdU/DCX3u0HZ3GL0IyI0hJfKjeUe2NLf+WKk/pwb8erHzBk9ooYW/wt
         sVxD/jpz6F1y0/0aRDr0wvcweOgAYN+EAtf2W2gaOw7z8Ie9WARmiatnXOq6Fmbqqxul
         ssmoI2mlXBoosXI9c/Klv/n3NQe8U160f0EpBq2g1sQ9xPTRf9a06ZmT2nqqpZqP+0qX
         v8Ag==
X-Gm-Message-State: AOAM5312B9ko2t4xIOb8npazQq3D36lGkJiUrwxZ6VUmKeY9wi5n1tWP
	YwkQYHmosK4eVzbilkda3leYC80M6FJ4OrZZGXQ=
X-Google-Smtp-Source: 
 ABdhPJxLfcDC5V8qfeDjDU6SpPwnYjWNqMnViiMvnmLxjX5PH+FHSSc8olpuZjPwXk998Bi49E2nZd/JymWwh0ylTmY=
X-Received: by 2002:a17:907:c13:b0:6d7:a03:8d9f with SMTP id
 ga19-20020a1709070c1300b006d70a038d9fmr930957ejc.141.1646437167969; Fri, 04
 Mar 2022 15:39:27 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAP9ODKrZT9A=fdjUekvAHEch9LFjNt3mnH+jnGXGK0DR0BOvww@mail.gmail.com>
 <AM9PR09MB46428B351F1207869AA667DFA8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1sp6ZO5ZL9WY2z7QP_eMDC9+uB3yBMpzFrKyaTNdHqYvGQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp6ZO5ZL9WY2z7QP_eMDC9+uB3yBMpzFrKyaTNdHqYvGQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 4 Mar 2022 18:39:16 -0500
Message-ID: 
 <CADkTA4Pt1dNSkN1SkWzBnV23Bdcx5qGPXaPUA1w3VafkJkMQVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add setuptools3_legacy
To: Khem Raj <raj.khem@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Ross Burton <ross@burtonini.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 23:39:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162760

On Fri, Mar 4, 2022 at 3:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Mar 4, 2022 at 11:20 AM Konrad Weihmann <kweihmann@outlook.com> w=
rote:
> >
> > If it's about meta-python why can't be placed there? I don't follow the=
 argument that some edge case stuff outside of core requires the project to=
 have additional (as of now not time limited) maintenance effort - if there=
 would be a clear plan to remove that before kirkstone release I might agre=
e, but with the release looming this all feels like abandoning the commitme=
nt for the upcoming release.
>
> it is about many layers e.g. meta-oe, meta-xfce, meta-python and
> perhaps many more that I have not come across yet. We want to enable a
> wider ecosystem and we
> do carry features in OE-core to do so from time to time. Core in
> itself is a reference distribution, its not meant to carry just what
> it needs to support a minimum distro
> it serves as a baseline for many distros which may include other
> layers. At times we do put specific features in specific layers, this
> is not one of those.

Agreed.

I'd prefer that this be in core, versus meta-python.

Bruce

>
> >
> > And just to emphasize my claim, if there's nothing in core that would r=
equire this patch it won't get tested, so it's another dead end.
> >
> > In the end it's the decision of the project leads, but I would be perso=
nally be disappointed to take the easy way out here.
> >
> > On 4 Mar 2022 19:01, Otavio Salvador <otavio.salvador@ossystems.com.br>=
 wrote:
> >
> >
> >
> > Em sex., 4 de mar. de 2022 =C3=A0s 13:56, Khem Raj <raj.khem@gmail.com>=
 escreveu:
> >
> > There are recipes in meta-oe and meta-python which would need this
> > and both layer only list core as sole dependency, if we put it in eithe=
r of
> > these layers, then one will depend on other which is not nice, so I rat=
her
> > would prefer it in core.
> >
> >
> > Couldn't those recipes (depending on Python) go to meta-python?
> >
> > --
> > Otavio Salvador                             O.S. Systems
> > http://www.ossystems.com.br        http://code.ossystems.com.br
> > Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162756): https://lists.openembedded.org/g/openembedde=
d-core/message/162756
> Mute This Topic: https://lists.openembedded.org/mt/89547022/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

