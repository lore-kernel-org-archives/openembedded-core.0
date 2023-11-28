Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450F5C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 19:00:46 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.728.1701198044160750771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 11:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iWrs7upk;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: chuckwolber@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c6b30aca06so73004051fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 11:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701198042; x=1701802842; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sr+oHKClv8C/toxeKWHBFIpoQQSYLzNLhB/J6LylAXo=;
        b=iWrs7upka3eSzg5sAGQ6RTcll8z2o9HqYpKL5RLFVT4jfCcw/DEMKmq+Awx8aeRyFn
         xPvHH8oDmoJTHyPoIc8bD84mDO/0UTYLvdLn8329Uh8lesHtKKF9Km3h15ibPbC+I6wn
         oBb+Skgp+J1OStPNqFegDeNpF7cFkF5GXapzUHvgkAAPMVT9ZJ4u+GOshL2we7tf9Sf5
         2voGiZoAFj4C/odws4m1AmYxIhfR/d3GTtytVdv2iOIyeyvYZfvgHLpMxP9dR09FvENy
         RUS3Xr8Ewa/NeH7WKeOPethMnFdFESTS2Iyn4OkSLGuEb5pXTLFrYEsnnBHbLxMaeK4f
         kgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701198042; x=1701802842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr+oHKClv8C/toxeKWHBFIpoQQSYLzNLhB/J6LylAXo=;
        b=OI7b4Lfo4WKADf1xhQPXH4mWUK2Nb5xUJt5/7Bd9HlkjliVTQzER0ac8o5BnFMSeHc
         jP4Yfs0fs62/u1ewojHmj1WW7OPVFsohiAL4ZPr0RCS9JMD9yDumf/618D8D8eDU6Vao
         WOF5TK3gduExj6tpDtkgvd+rofVggmXICWUjHQWChXQxAn2HfPtC/xTEzN9KsWJJAHg2
         aVkMSJDCXJHzKOXMBTR6aC2oEg0Im9HaGkocc/DrMuIyjGHfkTA/w2AOr4eaQq1ddRaO
         mKWcAZbXrvnpuXOk1umFXJ9e8FtAXKra7mAXAfXw/gedhrbg2vpzlJ/vZCr/iRYWS1+Z
         K/lA==
X-Gm-Message-State: AOJu0YxwppYXayUCwxa70aTy/kbTq3wp4fUFelMvoKrjQBQrYIrFbQaq
	7Db9ixKoJMiUPt3JMQYX0HKVoFVVApK6Uwh59J8=
X-Google-Smtp-Source: AGHT+IEsRh+FRN6xHGpCMzbFaMVfDYZJK6JrtFZKT2VibXE99uCqYZvGb9PWGKz5b+KMgXP/0V3qebvF1LwpqkaVkF4=
X-Received: by 2002:a2e:7d19:0:b0:2c9:baee:6cd6 with SMTP id
 y25-20020a2e7d19000000b002c9baee6cd6mr523890ljc.6.1701198041888; Tue, 28 Nov
 2023 11:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20231107151243.10853-1-andrey.popov@yadro.com> <53356C03-3699-43FC-B8A5-70609982F612@arm.com>
In-Reply-To: <53356C03-3699-43FC-B8A5-70609982F612@arm.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Tue, 28 Nov 2023 11:00:30 -0800
Message-ID: <CAB=6tBQqsC0XpFQ3z5EmNz2+2TqiVAeazf0dyL2tnVDgTkV=eQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
To: Ross Burton <ross.burton@arm.com>
Cc: "andrey.popov@yadro.com" <andrey.popov@yadro.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fabbb0060b3b08a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 19:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191384

--000000000000fabbb0060b3b08a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 9:55=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:

>
> I=E2=80=99ll reply with comments on the code shortly, but my initial thou=
ghts are
> mainly does anyone actually use ISO images still, especially on non-x86
> systems?  I=E2=80=99m curious what problem you=E2=80=99re trying to solve=
 here.
>

I can only speak for the projects I am involved in - yes, ISO usage is
still *very much* alive and well. Mostly x86 type systems for the time
being, but non-x86 is on the horizon.

..Ch:W..

--=20
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--000000000000fabbb0060b3b08a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Nov 28, 2023 at 9:55=E2=80=AFAM R=
oss Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</=
a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
I=E2=80=99ll reply with comments on the code shortly, but my initial though=
ts are mainly does anyone actually use ISO images still, especially on non-=
x86 systems?=C2=A0 I=E2=80=99m curious what problem you=E2=80=99re trying t=
o solve here.<br></blockquote><div><br></div><div>I can only speak for the =
projects I am involved in - yes, ISO usage is still *very much* alive and w=
ell. Mostly x86 type systems for the time being, but non-x86 is on the hori=
zon.</div><div><br></div><div>..Ch:W..<br></div></div><br><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div><b><span style=3D"font-family:monospace">&quot;Pe=
rfection must be reached by degrees; she requires the slow hand of time.&qu=
ot; - Voltaire</span></b></div></div></div></div>

--000000000000fabbb0060b3b08a5--

