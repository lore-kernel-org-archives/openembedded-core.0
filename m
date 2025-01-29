Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A80C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 22:48:25 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.3174.1738190900726258184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 14:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j5SsXu5O;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3eb9a0a2089so93694b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 14:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738190900; x=1738795700; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B5rrFdsGg+G4XUT+GviXXSgnM7Fu89eCvgUPUKV+4cc=;
        b=j5SsXu5O/DBzdUUpjGPX9Hb1srSL0QlrWU0POqs6Cdf2vtdl/1c//YBoGNBgulIHtt
         Ir44RHbWA4a/MxLOpXgLHxWWdfgrEpoeOfo72jCraPPf4L8/ahU6QqoYnYFPhAFzmTK1
         wsD8U8N/1Sf1ts07o2gJ7TexsfbaIhkA+0J7SO/NInQZUs8totRcmWFPdUbdN3wR5bqW
         tcMwIUtsCPvULbCfO3O93DO5qFxRPNozmX410gh8JOrPKn6NYeWPl6NwqnSGWtUSUk0a
         kJ9hhQRmkx5HM41zZBumTZxxUYJrBWk8DoteOTtQIGnxTfHvyAaXpwTysUbw5CFQZTvS
         mlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190900; x=1738795700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5rrFdsGg+G4XUT+GviXXSgnM7Fu89eCvgUPUKV+4cc=;
        b=jdFGmkqgyVr+TfFAQvWOuZhq/ZjPAn6MkCUu/Co7v1Vgw65AhEBBWca4FLUqe8upfr
         pwmes0JGJnUOCe9H4eZJerT290Ee/yEYIMJZU7FvaCzojTkMxtAHPLZIpPbLvlnaWtIP
         zxzInMa53c4WDkJVhpkTsV0ZcddfcDEd75h9AXjipVqxLo6yollrO2DArvQn8pJ0xGDc
         g8lms8Du37WTt1CLG3MAAED13OdNnlzLxnOzkAogmoVST5r0up+WSGn4Jposlf6As+Gk
         PVnW4zTIhNcME6RV5q/glihaGTf/VbwsGhLt9ht8kz7ySKHYhvba/VsE8Djn8Lyl1qnl
         nTBw==
X-Forwarded-Encrypted: i=1; AJvYcCWxoGGJcRl4HGPNHIPdbM9LuHG31ntwIPwqeQbkutM8m7sg8fdovRH3PTpoZNr7BZDPnSyoKL3O0zLo8w0eiFQCuw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcurDwFEsUCrvkGpLJxAxaHlEcYTDcenrnX2DpbceL46arOOy6
	ILF9J7/7k+H2oSy9Typ/WdhASRB3BAv1t0ibFH83W2QYqshfrx30LnHRc/7k8ZQsYvgsp36kzIc
	YK8/lr9nHccMXV8yOnxmYYEubHHA=
X-Gm-Gg: ASbGncvAQ0dadxXDrr2AtijpEYtwpPSuSU/wG6EizATWjcxWsTh+QI1ZSNrbIZSTsn4
	24IPBc5Zo1KN2B8TBqq7gup0Pw4vp3FPS5YGBIFJ+Rnu0dSmLI4hLQ+zLWd5SlTU15HSMYWlwIA
	==
X-Google-Smtp-Source: AGHT+IEf+n8wBkCDaHuASAf5c3ua9LA1Ex4iClbktbUDe2JdyTCDSzcUS2t7Uzlf+EIe7NGTNPBBxBTFQfAqFkXflo8=
X-Received: by 2002:a05:6808:164a:b0:3eb:7147:2560 with SMTP id
 5614622812f47-3f323a14a26mr2895418b6e.9.1738190899768; Wed, 29 Jan 2025
 14:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20250128145736.2258098-1-thomas.perrot@bootlin.com>
 <93d70055fbc62dd0dc765f2d2bd471b73f35df9d.camel@gmail.com> <43a26c5d6a85866fbf86dfacd5a034416abbd636.camel@linuxfoundation.org>
In-Reply-To: <43a26c5d6a85866fbf86dfacd5a034416abbd636.camel@linuxfoundation.org>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Wed, 29 Jan 2025 23:48:10 +0100
X-Gm-Features: AWEUYZkpWEqusgyLiXL2sF3hsVuiIn5e3tH2ziO7K2j2j3leo6lyNyl1bhuYds0
Message-ID: <CAB3asfia=NPV8QJjfpS7jxrk1UJEVoZxNV0YUV8zYAUXQp58nQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] u-boot: Convert ${UBOOT_ENV}.cmd into ${UBOOT_ENV}.env
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: thomas.perrot@bootlin.com, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000021f929062ce01b31"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 22:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210420

--00000000000021f929062ce01b31
Content-Type: text/plain; charset="UTF-8"

Richard Purdie <richard.purdie@linuxfoundation.org> schrieb am Mi., 29.
Jan. 2025, 23:39:

> On Wed, 2025-01-29 at 23:11 +0100, Adrian Freihofer via
> lists.openembedded.org wrote:
> > Hi Thomas
> >
> > On Tue, 2025-01-28 at 15:57 +0100, Thomas Perrot via
> > lists.openembedded.org wrote:
> > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > >
> > > It is U-Boot environment files that contain environment variables
> > > in a binary format, that enables compact data storage and allows
> > > for faster loading and processing by U-Boot.
> >
> > I'm honestly not able to understand the intent of this change from this
> > commit message (I'm not a native speaker). But the u-boot and fitImage
> > related code is already quite complicated because there are so many use
> > cases that might be supported somehow. So it would be very helpful if
> > changes were submitted with a clear description of the use case.
>
> I'd add that for new branches in the code like this we really need new
> test cases too.
>
> Here is a branch doing this for the already supported scr script type:
> https://git.yoctoproject.org/poky-contrib/log/?h=adrianf/fitimage-test-uboot-env
>
> Adrian
>


> Cheers,
>
> Richard
>

--00000000000021f929062ce01b31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org=
</a>&gt; schrieb am Mi., 29. Jan. 2025, 23:39:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Wed, 2025-01-29 at 23:11 +0100, Adrian Freihofer via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Hi Thomas<br>
&gt; <br>
&gt; On Tue, 2025-01-28 at 15:57 +0100, Thomas Perrot via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer=
" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; From: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.c=
om" target=3D"_blank" rel=3D"noreferrer">thomas.perrot@bootlin.com</a>&gt;<=
br>
&gt; &gt; <br>
&gt; &gt; It is U-Boot environment files that contain environment variables=
<br>
&gt; &gt; in a binary format, that enables compact data storage and allows<=
br>
&gt; &gt; for faster loading and processing by U-Boot.<br>
&gt; <br>
&gt; I&#39;m honestly not able to understand the intent of this change from=
 this<br>
&gt; commit message (I&#39;m not a native speaker). But the u-boot and fitI=
mage<br>
&gt; related code is already quite complicated because there are so many us=
e<br>
&gt; cases that might be supported somehow. So it would be very helpful if<=
br>
&gt; changes were submitted with a clear description of the use case.<br>
<br>
I&#39;d add that for new branches in the code like this we really need new<=
br>
test cases too.<br>
<br>Here is a branch doing this for the already supported scr script type: =
<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/fitim=
age-test-uboot-env">https://git.yoctoproject.org/poky-contrib/log/?h=3Dadri=
anf/fitimage-test-uboot-env</a><br><br>Adrian<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmai=
l_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>

--00000000000021f929062ce01b31--

