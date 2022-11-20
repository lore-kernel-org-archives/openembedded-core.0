Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C592C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 11:45:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.10781.1668944705851266341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 03:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dht5oT9e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so7072195wms.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 03:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bisew/PrcF8d3N9+b74NVi4bWMkq4LpXexlLylPI6w0=;
        b=dht5oT9e1ztSvKc4y5QjiTHnnOyA/PbP3hcu0mhrczZCVljX6cDmtAo4LsZdKPwMib
         kNT046C3yz0Ela8oktTjZE0pENjBA+hjRvEvt0DvUvWmLaAnam42idG+tJTX6Ff6e5FD
         sjJuVeqWA+O6XZ0S74bJ6FqnCT+WMCqsafZ1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bisew/PrcF8d3N9+b74NVi4bWMkq4LpXexlLylPI6w0=;
        b=5Cok5n0UpBlcOiHrj0Y39zIQLNgU5yRKqORT6RL3hlOrX/MkWmFY3QvOnA1yG1QvZo
         gcFYi11c81O06Lt9qBLoyLjxGdVLX2bM38K1PDYvzUyqVTwQyCGUCEjRVkeUhJzohjrD
         GhqLukKRSmav88neOK+afwXKMa7tegz+xpRKgY2oE5N3c/U0tpsmSyxmnekv6XSwc32z
         82IfN7W6PQSuBxy/EKk0ecZ8hKSRB48V2QGd9lcLXUrSK2lKeO/yegb5akOrjjw0IKQy
         2bATndCJSMadvlAb8xrxaMH9pCs1GNi3fSC+mQQMgRHuGtK/UP6cu0OXgR9Ebuomxwau
         0IAg==
X-Gm-Message-State: ANoB5pk7HzE7prdczJ7bC+gwu2hyu457Ek/9ZIEKWdJYjqYisLIm7d+Z
	jMcGYcFFrrCCpqEI2cyvXGl/5Q==
X-Google-Smtp-Source: AA0mqf6UAVU3vyhUlaax4kBhSvd1/LPur/V1LPBhEMTfKSoID5EEl/RPvg/eGgSWm9/ugU6pVnGdsw==
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id ay18-20020a05600c1e1200b003cf9ad3a20emr3181366wmb.151.1668944704102;
        Sun, 20 Nov 2022 03:45:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2bb5:a83:72f4:d580? ([2001:8b0:aba:5f3c:2bb5:a83:72f4:d580])
        by smtp.gmail.com with ESMTPSA id l8-20020adfa388000000b002417f35767asm8747464wrb.40.2022.11.20.03.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 03:45:03 -0800 (PST)
Message-ID: <1d1bbb3fb18bb7b81da38bcafd479ec74dde06e5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Anton Antonov
	 <Anton.Antonov@arm.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Nov 2022 11:45:02 +0000
In-Reply-To: <4c2db9a4441a470fb1555b68b6bffb62@axis.com>
References: <20221118144253.1156045-1-Anton.Antonov@arm.com>
	 <7dc90b995d7a9688188b8756871181e46b2e296a.camel@linuxfoundation.org>
	 <AM7PR08MB53201A46A1080F4AAFA7E318FC099@AM7PR08MB5320.eurprd08.prod.outlook.com>
	 <8b2ecf15502e08644ffbc1c7cbea6d3862da68a1.camel@linuxfoundation.org>
	 <4c2db9a4441a470fb1555b68b6bffb62@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 11:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173578

On Sat, 2022-11-19 at 01:57 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard
> > Purdie
> > Sent: den 18 november 2022 17:36
> > To: Anton Antonov <Anton.Antonov@arm.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use
> > default compiler flags defined in CC crate
> >=20
> > On Fri, 2022-11-18 at 16:21 +0000, Anton Antonov wrote:
> > > =C2=A0 I=E2=80=99ve tested your approach. It doesn=E2=80=99t work for=
 whatever reason.
> > > CRATE_CC_NO_DEFAULTS is empty exported for native recipes:
> > >=20
> > > $ MACHINE=3Dqemuarm bitbake rust-native -e |grep
> > > CRATE_CC_NO_DEFAULTS
> > > # $CRATE_CC_NO_DEFAULTS [3 operations]
> > > #=C2=A0=C2=A0=C2=A0=C2=A0 [export] "${'1' if d.getVar('CRATE_CC_NO_DE=
FAULTS') =3D=3D
> > > 'true' else '0'}"
> > > export CRATE_CC_NO_DEFAULTS=3D""
> > > # $CRATE_CC_NO_DEFAULTS:class-native
> > > CRATE_CC_NO_DEFAULTS:class-native=3D""
> > >=20
> > >=20
> > > =C2=A0 I also tried:
> > > CRATE_CC_NO_DEFAULTS[export] =3D
> > > "${@oe.utils.conditional('CRATE_CC_NO_DEFAULTS', '', '0', '1',
> > > d)}"
> > > with the same result =E2=80=93 empty export.
> >=20
> > I think it might need to be 0 or "" instead of '0'. It would be
> > nice if
> > we could make False work too but I worry that might not.
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> None of this will work unless you change the code in
> bitbake/lib/bb/data.py=20
> to use d.getVarFlag(var, "export") instead of d.getVarFlag(var,
> "export", False).
> However, I assume that is not wanted given that support for
> foo[unexport] =3D "1"=20
> was introduced to counteract a foo[export] =3D "1".

Good point, which reminds me why the code does this. Expanding the
value for all export variables would have a significant effect on some
performance sensitive code :(.

From memory I think there was a bit more to unexport than that. Looking
at the history:

https://git.yoctoproject.org/poky/commit/?id=3D0da3c82a66e02bf2d3780e23427d=
476766a0bcfc

I think it wasn't enough just to not export some things, we wanted to
actually unset them in the shell environment.

We may have later done more environment cleaning which made this
unnecessary, less sure about that. I did remove a lot of the unexports
(e.g. MACHINE and DISTRO) but SHELL[unexport] =3D "1" remains.

Cheers,

Richard


