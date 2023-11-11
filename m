Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9024EC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:20:36 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.1094.1699726827109441912
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C3QNGdks;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso483736566b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 10:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699726825; x=1700331625; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQe3vrjh6kycwQOwuJ7WJ4WbQ5nI0dc3sAgrEcqZcY4=;
        b=C3QNGdksIBZrPSvy3am4/3mjnooWyjWhNjGfEVoTOqUkpjKoanv3Qd5w2u0e6GCLQ9
         SbvA8ucJSGZWniBITl6WYIBNAizyn6E/zYqKD/ZyQ9PEMtInQbHnoZysUOTIOuMNG9H6
         pCBcT8zmH8Coy0yntE7swCTjto1J3pHrFhpiqK6I0dqx7EODOZQ9QAOng9C2HQR+1UFy
         4UmaEO1rrApHP8YdnSWpKmdOhvt4dIzCVuEOg4tpTOE55Y42VVoIi8alN2Q496Cp2qVt
         EOLequY8an16qjZoB+RMWuPcPuuAMY7dnOC9parD2hrr+naEn2amIUQsxAVd5IQoHtV1
         l+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699726825; x=1700331625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQe3vrjh6kycwQOwuJ7WJ4WbQ5nI0dc3sAgrEcqZcY4=;
        b=pzkEJpducs0xt7uFa0yckuzF8I9qA5H+14VBcXZX7jPLDw8m43MNfQPRPu1j4IMCVt
         OeVkQG1SRyG54OJlEyy7y0U9dTfvU3/ANzoCRxGn7pXUDCiSs0OjmEMnasGACvevMMs5
         vmkQrrsSvIXF9xi1YTE+dKCypr8WCG0Se5GksdNJwRdFWKCXlmvRIHosaGuyfx00oPWQ
         Qa49YG11/O0+3Aqjstpb0Qm8vTESialeFcR15TNjY+M0vI54qmhgjiyXZTwr869M1HEx
         exQsLhRnUMsVuJfTLKkZOsNcy/Tal+vc4MSVH3S0mh5/3QclH43CTfhAOxIcAEQ78DqW
         km7A==
X-Gm-Message-State: AOJu0YwwrzL1f5XkVWQodwSwiXlu6LKN4r2TlvLRcMmOw4P4IhedkWI+
	zxAXwGgiQf8cGJwfYi7eR9NopMbfZOyf5CXt2895nQ==
X-Google-Smtp-Source: AGHT+IFR2+Y5i2YYjwPIIIEeLZSqPPoNYTQlMv5Ccyk/pRZ7TwABsWQndYF4Wenv1BEzlV+k1ADJ8gn+MzQsxHPh5yo=
X-Received: by 2002:a17:906:a8d:b0:9c7:4d3e:1e50 with SMTP id
 y13-20020a1709060a8d00b009c74d3e1e50mr1494747ejf.76.1699726825472; Sat, 11
 Nov 2023 10:20:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699714834.git.steve@sakoman.com> <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
 <98dcc905adef3d2d828af60abdaa40291abd458d.camel@linuxfoundation.org> <CAMKF1sqRD+yX+gFHSPhmrdY2nBHpLh24YYHv6HusfkSS5tmT5w@mail.gmail.com>
In-Reply-To: <CAMKF1sqRD+yX+gFHSPhmrdY2nBHpLh24YYHv6HusfkSS5tmT5w@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 11 Nov 2023 08:20:14 -1000
Message-ID: <CAOSpxdZLvOAhz9t-m3BeOzpXjLjSELQMJpqn6hCpcxZY2wx3CA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 18:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190436

On Sat, Nov 11, 2023 at 8:08=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sat, Nov 11, 2023 at 9:36=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> > > We are seeing reproducibility issues where gcc-cross sometimes defaul=
ts
> > > to gnu11 and other times to gnu17.
> >
> > Why is gcc-cross doing that? It is supposed to be deterministic so we
> > really need to get to the bottom of this :/.
>
> I think the previous patch to enforce OE cflags is exposing this
> problem.

No, the problem also exists without the previous patch.

Richard suggested the backport as a potential solution, since it fixed
a repro issue in master.

It turned out to not be a complete fix in dunfell, hence my second patch.

I agree that it would be good to get to the bottom of the gcc
reproducibility problem.  But until we do, this second patch will fix
the issue now and will do no harm once gcc is fixed since it is just
explicitly specifying what should be the gcc default.

Steve

> Now, it could be a
> bug in how gcc is invoked or in gcc itself,  but there is one file
> that shows up these c11 tags
> in debug info segments.
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#190434): https://lists.openembedded.org/g/openembed=
ded-core/message/190434
> > Mute This Topic: https://lists.openembedded.org/mt/102526884/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

