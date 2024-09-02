Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F71CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:36:18 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.35681.1725273368206094732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CJoAsZTa;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: erik.schilling@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c218866849so4272044a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725273366; x=1725878166; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw/MBfFb+x7C7WsyZwnSai3swU5YYkflx75sZNJCgwE=;
        b=CJoAsZTaBmp97Kyt3l8qyS+3EcsdQTJ2g5iDQwIUeGzMk7P46nK8cm7DOjwPeX1bqd
         6xNvkJAC8VxoXDEsNNkjOHZ8XxaIo1k2fnXds3vvFRmmYNzNgxcFVq4ndSVJ9vCSV4jJ
         v0RUY9xpwo+pYlx4yc+giFrgyiM5WOhW3YxHWnTI5+bdPUxTJSS2UL5uJ39E5As0kjZE
         nGgEYNgYVKDHYJBhzpa5iiyxv4vOG13VqVpTq2M+5aNEYcHtC5jLIbPALa9ovlNUl3eB
         L0u/8i/PM1NV9/XDmkVIEuWfYM0u2r0yX8r29ZtKW/Yc/ADwkmmLhaVsECpeePbR4Aqs
         YEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273366; x=1725878166;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uw/MBfFb+x7C7WsyZwnSai3swU5YYkflx75sZNJCgwE=;
        b=Tkj0WQxfTuOTgp10d/eo6Px15qPPbPSan4UdAcEGXKAS0rEMC+Or68E7oUFPyuy9Uo
         LL9Cp9HNO6O79tK1D9hYOwqPv24OhlPG/cuxXJlxJiTnmtaBQDvPU6sl1Xnr8u7jyK+Q
         27xAWL8zDaeNlojw+vX4curQWvk+dUiwGcflIFnJa7LTgTD1La/S5rB3wPOV9+UzGD3n
         TPx82BKxerwT/XzyIjmkncC9uKuWQK2/o2KqPGVkuNXRUxnXC53kTmi9c0/z+fNPEQYv
         5uW1UnBUtx/08LB4CI21H0Gw+00rZMcdEBhPFOSO9fkuxgsKTDhxbPSTcOvDtJshGiRK
         qPug==
X-Forwarded-Encrypted: i=1; AJvYcCV57los0vJvIzsD1z+7mt8iHlS4eSJbYOJrIzYVYHNBTuxlaEaHhDZhewwhYgDX6zTtZZga9sVr9AyKY9RsWOwQFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0RVHsKEI7YpHfDramFMej/skxK0kfUrezLYxNZsxc9mYw9y66
	hI/BVD+qOGJwf+HzkoTdKJPZm+SWTAwQtzjCnGOgBYoYfDEF2w/92J9AqFaCt4s=
X-Google-Smtp-Source: AGHT+IGkrVDmlX7LRBMMCQTVboQqbaCioqkmPgLpL+O5yZrfUD0BHUdNaelvpSSpjfzuCkYyaGdKFw==
X-Received: by 2002:a05:6402:278f:b0:5c2:6311:844f with SMTP id 4fb4d7f45d1cf-5c26311870fmr926135a12.17.1725273366057;
        Mon, 02 Sep 2024 03:36:06 -0700 (PDT)
Received: from localhost ([2001:9e8:d593:9900::f39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7c055sm5097998a12.47.2024.09.02.03.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:36:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Sep 2024 12:36:05 +0200
Message-Id: <D3VQD69SHB74.L9535F43A4BV@linaro.org>
Cc: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>,
 "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>, <mikko.rapeli@linaro.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH 1/3] systemd-tools: add recipe
X-Mailer: aerc 0.18.2
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-2-mikko.rapeli@linaro.org>
 <99e13a8ab6cea2424298d97466ad48540cee1209.camel@linuxfoundation.org>
 <ZtWOBWtSoCnyZ2DF@nuoska>
 <CANNYZj-57xLA-UnJ+nJvdpcu=+AgygMPoz2Pjzxs-QE+vxJ=nQ@mail.gmail.com>
In-Reply-To: <CANNYZj-57xLA-UnJ+nJvdpcu=+AgygMPoz2Pjzxs-QE+vxJ=nQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204086

On Mon Sep 2, 2024 at 12:17 PM CEST, Alexander Kanavin wrote:
> Wait. Isn't this ukify.py thingy already provided from
> systemd-boot-native recipe?

Yes. It was added while I did this change as part of a PoC ~a year ago.

I am not a huge fan of it having landed in systemd-boot-native. I
think there are further tools that would be interesting to have in a
systemd-native-style recipe (for example systemd-repart [1]). But as of
now, I agree that this recipe is probably not required!

- Erik

[1] https://lore.kernel.org/all/20240426-systemd-repart-v1-1-a6a710a14a8c@l=
inaro.org/

>
> Alex
>
> On Mon, 2 Sept 2024 at 12:06, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> >
> > Hi,
> >
> > On Mon, Sep 02, 2024 at 10:59:22AM +0100, Richard Purdie wrote:
> > > This will fail in CI as there is now maintainers file entry...
> >
> > Chen, since you are systemd maintainer, would you mind if I add
> > systemd-tools for you too? It's only the ukify python script
> > currently for native use cases at build time.
> >
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -795,6 +795,7 @@ RECIPE_MAINTAINER:pn-systemd-compat-units =3D "Chen=
 Qi <Qi.Chen@windriver.com>"
> >  RECIPE_MAINTAINER:pn-systemd-machine-units =3D "Chen Qi <Qi.Chen@windr=
iver.com>"
> >  RECIPE_MAINTAINER:pn-systemd-serialgetty =3D "Chen Qi <Qi.Chen@windriv=
er.com>"
> >  RECIPE_MAINTAINER:pn-systemd-systemctl-native =3D "Chen Qi <Qi.Chen@wi=
ndriver.com>"
> > +RECIPE_MAINTAINER:pn-systemd-tools-native =3D "Chen Qi <Qi.Chen@windri=
ver.com>"
> >  RECIPE_MAINTAINER:pn-systemtap =3D "Victor Kamensky <victor.kamensky7@=
gmail.com>"
> >  RECIPE_MAINTAINER:pn-systemtap-native =3D "Victor Kamensky <victor.kam=
ensky7@gmail.com>"
> >  RECIPE_MAINTAINER:pn-sysvinit =3D "Ross Burton <ross.burton@arm.com>"
> >
> > Cheers,
> >
> > -Mikko
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204069): https://lists.openembedded.org/g/openembed=
ded-core/message/204069
> > Mute This Topic: https://lists.openembedded.org/mt/108223984/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


