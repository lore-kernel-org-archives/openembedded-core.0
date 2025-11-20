Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A014ACF64BB
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 05:01:43 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27811.1763614897678688253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 21:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K0IbXkly;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63fc8c337f2so413587d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 21:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763614897; x=1764219697; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9i5G8M9di0J5OUh32BjmFtjweNQxU+TDTJqNhJDkLo=;
        b=K0IbXklyNwQfkbHq05zg6G9hkMQvb3Zunwj3Ur+CgAAEkITYcBwq1dn/+BuaP71Wdb
         m/PTmCBGb1coPqyowE/o0vN6M49nB2q8GmunwAzRtBVHDNAiDxn8ANuZLlitEx4Bpb7t
         764DEzdMD1IXOdBWElh24QED3ddFVLdigLy93VSCLms1EY4hOSCAKGj6n41LdDDS6VQK
         BctdDlb50c0eTWVuparfKHMmtY7SZNmWpFeuSBTgnxFz/jCweVCdAhtGgaTjlHww7Yjy
         1UrUoODJgbOqsOfYBaZk9gfCnrTIrgWkgNHaLsSy7AJynWbFGApMxbJ5BkfcaZOJpyZI
         N4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763614897; x=1764219697;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9i5G8M9di0J5OUh32BjmFtjweNQxU+TDTJqNhJDkLo=;
        b=IgfCu9tO8dJCjJoXZOXK3+wB+8Rq83fLSNt2uWUDmcbtCBEBIWFgHjh9eblhcaQ4/1
         1DM6kfHCaguXggNe7ybcybLy/7OrwQ2NwLxWtU0VBJPhcy4S6ThHTzSWvkASMnvQttpk
         D2yHlQ4Q5V0He1aNiVLt5Zqs7dPGPLhp3EVsJicKbXJCE2HjDh/JWYInuBxVQu8HmMdp
         kmCkmyenP1vgwdaG0lVqeoFTLT7GOUbGVw6YIPgqp22okZg4ytVJpP5osMzokp86L6mf
         3GX3JBHCM2OwyI8aKUtGwoD870XTWrUwAWjnX20OwJcZyh14tP7BDXFf/10Buqcn4nyW
         SkyA==
X-Forwarded-Encrypted: i=1; AJvYcCXSA327mkXFdqkNUkGsTzj9FVHl3ZssY2avTCTB0fgONQSUiJJutzLe30ci+FjEbxlRVqeZS9k5PZmQTo0uML8EKw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzq9Pa5ecfrUNaL5HfWFxGE8YzD4o08wB5ACi1jBoMuIltSad7o
	Is5upJbS/myU+u0Ux+n+tlFHCEYjnCu5Dq6BFui8V8W7O/V1SeLZJWiqom2kdSzGF/Prs5vfZwE
	ZfIbuVjfdRO21h4pWVof2AY6I6ukSwYY=
X-Gm-Gg: ASbGncvRZ0SrnzJmDtkuUrrlMFpOLWgx3Vw2cpVafms3hMqjlP0C+E+t14Cs0g6zXAA
	Js9nMcmhOTCLcv2C/mMPH4e5MlwXZSU0Rj5dLADKsmH/Gh/pXmbRd3ZKtdVDUhWjr8vCR/Ou56f
	3rpWI9VhJdpOrjgpTuqdo0bb3KghPnefH0sbMKMXZhnj5CjYyhaHalEbrUvrw5Ypm11uG5sXumz
	Y2AZfVxZFWH0m2wdE48rDxlecOAbSlNd2EwQIFRFuc+3GzSYV9+EdaPwCsDf047zUoaS4YkQXqF
	l+gRIBLontOcecNFpTF2IVDNcDbO6jgFV79k0KciBsrYlRG6tGeqRhXy17xzdtRpMXiTLMLryCh
	vU2utUS2TDdCcWU2YWeHwmcW5CeQ=
X-Google-Smtp-Source: AGHT+IEUdDBoHPFycdAQcPp1kb9F/eRi6N27H1h9NOsSvUf7bIdqs3ToWVaGaAajArdpQDyf+p7wjW3o692v005qdAw=
X-Received: by 2002:a05:690c:6c0e:b0:786:68da:3f4b with SMTP id
 00721157ae682-78a795a84d0mr31584497b3.31.1763614896785; Wed, 19 Nov 2025
 21:01:36 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sq=PB-ahsheN4iCD9w9MzmnCwUUZxTmaCJNBVhYpwKm1g@mail.gmail.com>
In-Reply-To: <CAMKF1sq=PB-ahsheN4iCD9w9MzmnCwUUZxTmaCJNBVhYpwKm1g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Nov 2025 21:01:10 -0800
X-Gm-Features: AWmQ_bmAYu-DRHtYreWBR3xzdijhaQ77CuHNr3xRJ8ImMs1dLxGdemp5Nn1x5cw
Message-ID: <CAMKF1soaUxXhsWJcQ3HG4TQQN-ETAQC09iJ05vQq04=SYqn6rA@mail.gmail.com>
Subject: Re: Whinlatter ( 5.3 ) release and maintenance for meta-openembedded layers
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000718c8e0643ff9758"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 05:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226603

--000000000000718c8e0643ff9758
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello All,

"whinlatter" branch for meta-openembedded has been created, please test it
with whinlatter oe-core in your distros and report problems and fixes

Thanks
-Khem

On Tue, Nov 18, 2025 at 8:05=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Hey All,
>
> Whinlatter release is in its final stages for OE-Core. Accordingly we wil=
l
> be branching meta-openembedded for whinlatter as soon as the OE-core is
> branched out.
>
> If you have patches lined up for this release, please send them by this
> week. I am also interested in ptest fixes particularly, if folks can run
> ptests on meta-openembedded layers and report, patches to fix the failure=
s
> are even better.
>
> Anuj Mittal has agreed to maintain this release along with scarthgap LTS
> that he has been
> doing an awesome job with. Ankur Tyagi will co-maintain whinlatter
> alongside Anuj to even out
> the load a bit.
>
> I will send an update again when the release branch is created.
>
> Thank you
> -Khem
>

--000000000000718c8e0643ff9758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>&quot;whinlatter&quot; branc=
h for meta-openembedded has been created, please test it with whinlatter oe=
-core in your distros and report problems and fixes</div><div><br></div><di=
v>Thanks</div><div>-Khem</div></div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 18, 2025 at=
 8:05=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Hey All,<div><br></div><div>Whinlatter release =
is in its final stages for OE-Core. Accordingly we will be branching meta-o=
penembedded for whinlatter as soon as the OE-core is branched out.</div><di=
v><br></div><div>If you have patches lined up for this release, please send=
 them by this week. I am also interested in ptest fixes particularly, if fo=
lks can run ptests on meta-openembedded layers and report,=C2=A0patches to =
fix the failures are even=C2=A0better.</div><div><br></div><div>Anuj Mittal=
 has agreed to maintain this release along with scarthgap LTS that he has b=
een</div><div>doing an awesome job with. Ankur Tyagi will co-maintain whinl=
atter alongside Anuj to even out</div><div>the load a bit.</div><div><br></=
div><div>I will send an update again when the release branch is created.</d=
iv><div><br></div><div>Thank you</div><div>-Khem</div></div>
</blockquote></div>

--000000000000718c8e0643ff9758--

