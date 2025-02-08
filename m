Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9045C0219E
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:08:22 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.9313.1739023699588221142
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jgcgoLw0;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e461015fbd4so2338310276.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023699; x=1739628499; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsqUXwDJDKsaBP10rFS09FFzJ4y3Uu5zXYYGV25Efx4=;
        b=jgcgoLw0nz+BMHejNQy8Sxsac4c4TDBatFuP9zvaxXkOxygdDdaNT757cTVddZ/nGb
         dXJGC1ggvJIEzJjqsWOWR34OLCXdV6Xy7AitpqhLTjtnjUGiKJM0XEOt+hUHPKw7if93
         HbnoaeOnSdzHKlm33hovk4atqQ5tCidTPlpXL3go4T65JjIywla4Xl5nWXn52J4cziis
         LA6G7gaHKY2rKq6Wxp6+BBfbhuvRTdcBwuP8X9u60Cwx8BYPRAjV/TRA0knwwSyHRALZ
         iQu1kFrRfWnTxj8zpAT4ivtRWjBvkQFs23pKR894C4X7fosau9n8TYSy2mvybvW43+ks
         r6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023699; x=1739628499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsqUXwDJDKsaBP10rFS09FFzJ4y3Uu5zXYYGV25Efx4=;
        b=RMNdqwwHmZuOY8BGgQN2k+HmyPd76FbC5WslMOPLUpndAC6GGHFwgOmxIyBdZMWEgJ
         dxWEuTaOUBiOi+5S4xw4H0t/FnRh/ZFglYifj9a8oCHlTI49t5X1GflSUakRJunMF2aA
         xk5C+uM+6q+MQQd/JXlN8ux/pyT4GARJeV+vZTEBNIMo8MkYG5AlNDx2u+sp+uOJS3pS
         iA47lm5nh62SMz7b0xLkyGGgZnp6+dnMgnkbps0Qv4CXRl6NzsHBezo4kYqpEw1pkkVE
         t+LJOXw/M9mUGkBRUIFbV93S9ZsrvAyCACLuMSl6rPas0Xm+ion/TZOfx2GCql/+B9N0
         QsFA==
X-Gm-Message-State: AOJu0YxRgDVp/iPS7uk+8SMvvHD+e4wrt0SRebSmLaEcE1rtAq1p69ZG
	rWdoInRBZ1eoBlCMvypTfjGR0rfC5BWsmFi/2bwCojAaoG5Kqd5LErlFxdfKq2PVKNryoE/Xcu6
	x8KY3iGzG6wh8JzU31PyeFGZCXTj/bgvwELhRyw==
X-Gm-Gg: ASbGncvFf9kZtdyBZkUXfpeJxvZF+A7kN55ottYDpD0KdNdSKqHw5N1IRgSajHJfBqU
	fMpXcJhd/zZbY4mVaeHEErnjUV8fXhBzFFGEf4aBhbKTR+dqHoMBZ2fmvxl7GGlV0962KIAnL
X-Google-Smtp-Source: AGHT+IHYQjtXG7kAqXXLb6Pmf/LB1Zj4mwwSwrtd2i412zXZGePifwx5G9gHVGeaB01f18KDyQG23DLm/ZprZDq9T+Y=
X-Received: by 2002:a05:690c:6c10:b0:6f9:ac35:4489 with SMTP id
 00721157ae682-6f9b29a85e9mr59924927b3.34.1739023698772; Sat, 08 Feb 2025
 06:08:18 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdYfp_rjUkofvCQk6VFbJj8TkCv-eWjb=V5U5TavT++Pfg@mail.gmail.com>
 <7067.1738686633751194071@lists.openembedded.org> <CAOSpxdYXfpROfknEGgNGdxmyfekOKgstxgOQZtvMuC015NPQuw@mail.gmail.com>
In-Reply-To: <CAOSpxdYXfpROfknEGgNGdxmyfekOKgstxgOQZtvMuC015NPQuw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 8 Feb 2025 06:08:08 -0800
X-Gm-Features: AWEUYZkOkOmgsRWCVETj6oBBU2dxApJicbCaQO2XZOAAspTl0UtY02Ol8tBbGzI
Message-ID: <CAOSpxdYMRrqo_GapdqNbAhwyosP7X1O=+2QN_bgdC9FNUyD43A@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] gnupg: upgrade 2.4.4 -> 2.4.5
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211034

On Tue, Feb 4, 2025 at 9:53=E2=80=AFAM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> On Tue, Feb 4, 2025 at 8:30=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
> lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Hi Steve, It's not clear to me how this error relates to gnupg. It seem=
s to be related to rust somehow. gnupg isn't mentioned anywhere in the log.
>
> Understood, but without the patch I get an error free build, and with
> the patch I get these errors.
>
> I've tried twice with and without your patch, and the issue is reproducib=
le.
>
> I'm open to suggestions, copying Alex since he's more familiar with
> building rust than I am!

After taking a number of rust fixes I retried this patch and the
problem no longer occurs.

So I've included this patch in the set currently out for review.

Steve

> > rust.RustSelfTestSystemEmulated.test_rust: FAILED (499.08s)
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#210811): https://lists.openembedded.org/g/openembed=
ded-core/message/210811
> > Mute This Topic: https://lists.openembedded.org/mt/110922127/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

