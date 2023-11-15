Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21E4C2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 16:28:57 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.17767.1700065729819131167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 08:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ECEMVZiU;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: kergoth@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5bd33a450fdso5602869a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700065729; x=1700670529; darn=lists.openembedded.org;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SiS4I4+qUUbR754Cc/CtVDizui0uRkBCabQVMzp0z3g=;
        b=ECEMVZiUFN2KNszIJNKm3BhGF1twM3EWcZZ5kRsc2r8LlVNPL6PR4bTcFLJNKY/Jd3
         oucYOGwEwY8XEMzW6N3TDzI473nHOgh/whpS3Xv8YRkzvkVkZTH6MRJDyF66KpNRE48/
         ZQlheA+ZJhJfgEt6xEpnIqj3sMo59fdj0rw+sFIXXYWfx3nW9BpI7Gk3tNG9UcwVKVZg
         IIjiL7eil2ZzGBY4hAZE49jir78KbWEH4eR/f56uB5nA0G5glx5iVkTC+xnLXu/SrTeR
         icvctX85SLqdN6RaIOapQxE5pJY9xAp5vnH4sFLkMuDo9vSqZoeegYPrtr2NxQYTsVxX
         +m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065729; x=1700670529;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiS4I4+qUUbR754Cc/CtVDizui0uRkBCabQVMzp0z3g=;
        b=RUiI3G68FD7KBdjaX/TbeCNaynXIwVcAMrK4H5SdxbbITboB8iHhnEeo8qVuDM1tNY
         kOyxj0E2Bw2m8KKHXjNMJWbCX8sMB/F9z5gYD8+eauz8N6CxG2Qfjgcy6Gj2FfMblGtS
         SkRIIhch5auAGzZnma8eRXRcmy1pBuLWZiRHbNB3a3vfvY6f8mqfiH/MFcWVQhFQ1uxL
         qwztieMo5UzZJgQvX1Hb7zHN1xyif5GM1NgcCm84B0dxFe4Z6Eo/qc6MaiR92mB3Apkx
         xdypHssmNVnK+1vvuRK6Qw+RKQrYCf6lKitoLxV0HpYZasu2w6blHBznWQsxGJZVsekH
         4rXQ==
X-Gm-Message-State: AOJu0Yxb1zfJj5fHj8P7OezjudBRA8oBLhR66qEobj5Mzma9YQroKTJl
	9aOo0jsldktYB1IgsykyNqk=
X-Google-Smtp-Source: AGHT+IG9zWT2JNwP10Z+Pq6rwrQ5f50CX4ChZIw2gOB1/BFJR3M7wsyLkQQLOdk5uG4/Pypz2zeVDw==
X-Received: by 2002:a05:6a20:e11e:b0:187:4487:c5e9 with SMTP id kr30-20020a056a20e11e00b001874487c5e9mr4293090pzb.47.1700065729172;
        Wed, 15 Nov 2023 08:28:49 -0800 (PST)
Received: from [2600:8800:6cc0:300:401a:e502:70:0] ([2600:8800:6cc0:300::1005])
        by smtp.gmail.com with ESMTPSA id j23-20020a62b617000000b0066a4e561beesm3092299pff.173.2023.11.15.08.28.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:28:48 -0800 (PST)
Date: Wed, 15 Nov 2023 09:28:33 -0700
From: Christopher Larson <kergoth@gmail.com>
To: "=?utf-8?Q?alex.kanavin=40gmail.com?=" <alex.kanavin@gmail.com>, 
 Joakim.Tjernlund@infinera.com
Cc: "=?utf-8?Q?openembedded-core=40lists.openembedded.org?="
 <openembedded-core@lists.openembedded.org>
Message-ID: <caa2bef7-9da7-4daf-83b9-e5247dd615af@Spark>
In-Reply-To: <4d8c459ce91ac4071c77c352006d0272d30efc90.camel@infinera.com>
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
 <20231114203608.1490318-3-joakim.tjernlund@infinera.com>
 <CANNYZj_c1dCdhhuPhnNdQ+9PKQ_FPdbB-b2miypMM9jQuofBcg@mail.gmail.com>
 <4f3483d322d0d4afb65b31ba06b3e0d383b62b6b.camel@infinera.com>
 <CANNYZj9DWffE1qOKO1SpqeMJcfXeaFxOMFFUieivDK-9ooH0yg@mail.gmail.com>
 <4d8c459ce91ac4071c77c352006d0272d30efc90.camel@infinera.com>
Subject: Re: [OE-core] [PATCH 2/3] shadow: Add PW_SUBDIR
X-Readdle-Message-ID: caa2bef7-9da7-4daf-83b9-e5247dd615af@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6554f1be_36f6b474_17301"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 16:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190735

--6554f1be_36f6b474_17301
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Nov 15, 2023 at 7:09=E2=80=AFAM -0700, Joakim Tjernlund via lists.open=
embedded.org <Joakim.Tjernlund=3Dinfinera.com=40lists.openembedded.org>, =
wrote:
> On Wed, 2023-11-15 at 14:45 +0100, Alexander Kanavin wrote:
> > On Wed, 15 Nov 2023 at 14:42, Joakim Tjernlund
> > <Joakim.Tjernlund=40infinera.com> wrote:
> > > > Pending... what exactly=3F
> > >
> > > Pending merge
> >
> > If a patch is pending merge, the correct status is 'Submitted' (with =
a
> > link). If it's already been merged, the correct status is 'Backport'
> > (also with a link). 'Pending' is a frowned-upon status used only when=

> > there's a genuine obstacle to upstream submission.
>
> I had no idea, will stay away from Pending then. Thanks.
>
> >
> > > > In other words, upstream first, please. This is clearly not somet=
hing
> > > > that oe-core should not be carrying and maintaining and rebasing.=

> > >
> > > Upstream merged it, see https://github.com/shadow-maint/shadow/comm=
it/ee3a79c6952f8ca649c286c7f76639d9d1dedaad
> >
> > You need to resubmit here with the correct upstream-status then.
> >
>
> Will do, I am just not sure on the overall patch submission procedure a=
nd what OW in general thinks.

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html=23=
patch-upstream-status=C2=A0in the new contributor guide covers it pretty =
well now.

--
Christopher Larson
chris=5Flarson=40mentor.com, chris.larson=40siemens.com, kergoth=40gmail.=
com
Principal Software Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemens =
Digital Industries Software

--6554f1be_36f6b474_17301
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageReplySection=22>
<div dir=3D=22auto=22>On Nov 15, 2023 at 7:09=E2=80=AFAM -0700, Joakim Tj=
ernlund via lists.openembedded.org &lt;Joakim.Tjernlund=3Dinfinera.com=40=
lists.openembedded.org&gt;, wrote:</div>
<blockquote style=3D=22border-left-color: rgb(26, 188, 156); margin: 5px;=
 padding-left: 10px; border-left-width: thin; border-left-style: solid;=22=
>On Wed, 2023-11-15 at 14:45 +0100, Alexander Kanavin wrote:<br />
<blockquote style=3D=22border-left-color: rgb(230, 126, 34); margin: 5px;=
 padding-left: 10px; border-left-width: thin; border-left-style: solid;=22=
>On Wed, 15 Nov 2023 at 14:42, Joakim Tjernlund<br />
&lt;Joakim.Tjernlund=40infinera.com&gt; wrote:<br />
<blockquote style=3D=22border-left-color: rgb(52, 152, 219); margin: 5px;=
 padding-left: 10px; border-left-width: thin; border-left-style: solid;=22=
>
<blockquote style=3D=22border-left-color: rgb(211, 84, 0); margin: 5px; p=
adding-left: 10px; border-left-width: thin; border-left-style: solid;=22>=
Pending... what exactly=3F</blockquote>
<br />
Pending merge</blockquote>
<br />
If a patch is pending merge, the correct status is 'Submitted' (with a<br=
 />
link). If it's already been merged, the correct status is 'Backport'<br /=
>
(also with a link). 'Pending' is a frowned-upon status used only when<br =
/>
there's a genuine obstacle to upstream submission.</blockquote>
<br />
I had no idea, will stay away from Pending then. Thanks.<br />
<br />
<blockquote style=3D=22border-left-color: rgb(230, 126, 34); margin: 5px;=
 padding-left: 10px; border-left-width: thin; border-left-style: solid;=22=
><br />
<blockquote style=3D=22border-left-color: rgb(52, 152, 219); margin: 5px;=
 padding-left: 10px; border-left-width: thin; border-left-style: solid;=22=
>
<blockquote style=3D=22border-left-color: rgb(211, 84, 0); margin: 5px; p=
adding-left: 10px; border-left-width: thin; border-left-style: solid;=22>=
In other words, upstream first, please. This is clearly not something<br =
/>
that oe-core should not be carrying and maintaining and rebasing.</blockq=
uote>
<br />
Upstream merged it, see https://github.com/shadow-maint/shadow/commit/ee3=
a79c6952f8ca649c286c7f76639d9d1dedaad</blockquote>
<br />
You need to resubmit here with the correct upstream-status then.<br />
<br /></blockquote>
<br />
Will do, I am just not sure on the overall patch submission procedure and=
 what OW in general thinks.</blockquote>
<div dir=3D=22auto=22><br />
<a href=3D=22https://docs.yoctoproject.org/contributor-guide/recipe-style=
-guide.html=23patch-upstream-status=22 target=3D=22=5Fblank=22>https://do=
cs.yoctoproject.org/contributor-guide/recipe-style-guide.html=23patch-ups=
tream-status</a>&=23160;in the new contributor guide covers it pretty wel=
l now.<br />
<br />
--<br />
Christopher Larson<br />
chris=5Flarson=40mentor.com, chris.larson=40siemens.com, kergoth=40gmail.=
com<br />
<span style=3D=22color:var(--textColor);background-color:var(--background=
Color)=22>Principal Software Engineer,&=23160;Embedded Linux Solutions,&=23=
160;Siemens Digital Industries Software</span></div>
</div>
</body>
</html>

--6554f1be_36f6b474_17301--


