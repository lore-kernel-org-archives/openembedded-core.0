Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F19C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 16:53:27 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.86792.1705337605920583624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 08:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YPPa154i;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2053f5e97b2so5363763fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705337605; x=1705942405; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s5yREfvGELJ09AWA+5WsSH/srRbAUeyPZIxMVJ2og7A=;
        b=YPPa154iV+9H7wO8Y7X3fPFDsBtgYlEBsi9LzQlNHSo0/Qi+7UAuDvTFsk6vfIpOX7
         /bq6/qJ82DTS0Nucx4urqlc8E1cr0FeyiFlb+4CMoPTlYApnJNw0qagM3qFXDaPm6eXI
         NIZrVScP2K58K+tBLBBa6ySiPnDEkQ8UA7DyOn8XpBG9fNoxOVlEpf5Lj96fJSm4SoCu
         mtCHvqpBU81CKeYdSJrVJ01pDOoHNe1p4earyed9dRsGn9h12yiuMtWoSMkOZ3Zv5ykP
         E+YATe78ydhQcCLl6agPm2XI96eAQi0VbCT1zBEcEIvevC37TaRnepMw7FABgvCltnOK
         b0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337605; x=1705942405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5yREfvGELJ09AWA+5WsSH/srRbAUeyPZIxMVJ2og7A=;
        b=gh+khpHQmu2tC+Liy2tnWVW1jgNf+Kr8tCUt9LNQZ7DkCjrpLRMrPZrT3zz8rjgtF6
         xei81gJtxDdWxcrcLfTLcjktNIAEFQDtAH6BjbH4Q8KUZz4Yqkp9/Aptrn9BJMwqnMAd
         0VgoFv31UvAspondUZRNjsziRT9s6Q6Gu9wxqQdko+b5DJ86OuliFRDYsIWmPHuehPVM
         A1EjMrDjSaJqd3LMCIrTinp+wPzLfRXFMWPXub36hwByIjAXY2gsjy/+wNbomB+KGDp5
         UlYhmIEDYA87YdLEanz1jqmhNpB3qwD1CbTrYSHS16NZ7/bCdnjqAVdQQOjX/ZMpl7Zz
         4yEQ==
X-Gm-Message-State: AOJu0YyGvVLWawey6QQmK5xuzI2iMl0aTFj9FVo4bHckNfp0jhFp9ZhR
	aBX9ekbwWkSc/nmSTlwtd5ySNKslW0NF1dZ86s0=
X-Google-Smtp-Source: AGHT+IFDMyrj/ndN8fitI7uT3dpZzkeTiO9P/CJRNDd1NjNmfcaqJ1DhurTo18UmED1mBioXG2j9TK5lQsJnL+hwTt0=
X-Received: by 2002:a05:6871:5b23:b0:206:d94c:64d4 with SMTP id
 op35-20020a0568715b2300b00206d94c64d4mr3365175oac.11.1705337604822; Mon, 15
 Jan 2024 08:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20240109192923.3183219-1-raj.khem@gmail.com> <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
 <CANNYZj_oydN+0ODz_kCjus74uzF-wUhcZ1nfmYqrRo+BoupB4A@mail.gmail.com> <3642B18A-B5F2-40EF-B1A9-303923477117@arm.com>
In-Reply-To: <3642B18A-B5F2-40EF-B1A9-303923477117@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jan 2024 08:53:14 -0800
Message-ID: <CAMKF1soNT6kc-jCNsop1qaQVxDphZEO3DNa5AB4jwP=2Rd729w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
To: Ross Burton <ross.burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000028592f060efeda0b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 16:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193688

--00000000000028592f060efeda0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 6:04=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 15 Jan 2024, at 13:49, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >> We could #if 0 out every test that failed and rejoice in our 100% pass
> test cases but that would be a terrible idea, so why is this different?
> >
> > This is what we already do for intermittently failing ptests all over
> > the stack. Rejoice!
>
> Hopefully we assess the test and determine if the odds are good that it i=
s
> in fact timing related before doing this!
>
> > This issue is reported upstream, and the link is in the patch. Yes,
> > given sufficient time one can become an expert in intricacies of glib,
> > openssl, and their interaction, and then develop a real fix all by
> > themselves, but I think a more fair expectation is exactly what Khem
> > is doing: report upstream, add a reasonable workaround, follow up
> > upstream requests in the reported ticket.
>
> This is a configuration that upstream doesn=E2=80=99t support and we don=
=E2=80=99t enable
> by default, so I=E2=80=99m leaning towards Khem carries the patch alongsi=
de the
> bbappend to turn on the openssl backend in the first place.


Where does it say it does not support? On the contrary there are patches in
this area sent recently

Yes I can carry all of changes we need locally that=E2=80=99s not an issue =
we are
already carrying many of them they just make it harder to contribute back
to project as these pile up



>
> Ross

--00000000000028592f060efeda0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jan 15, 2024 at 6:04=E2=80=AFAM Ross Burton &lt;<a =
href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 15 Jan 2024, at 13:49, Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; We could #if 0 out every test that failed and rejoice in our 100% =
pass test cases but that would be a terrible idea, so why is this different=
?<br>
&gt; <br>
&gt; This is what we already do for intermittently failing ptests all over<=
br>
&gt; the stack. Rejoice!<br>
<br>
Hopefully we assess the test and determine if the odds are good that it is =
in fact timing related before doing this!<br>
<br>
&gt; This issue is reported upstream, and the link is in the patch. Yes,<br=
>
&gt; given sufficient time one can become an expert in intricacies of glib,=
<br>
&gt; openssl, and their interaction, and then develop a real fix all by<br>
&gt; themselves, but I think a more fair expectation is exactly what Khem<b=
r>
&gt; is doing: report upstream, add a reasonable workaround, follow up<br>
&gt; upstream requests in the reported ticket.<br>
<br>
This is a configuration that upstream doesn=E2=80=99t support and we don=E2=
=80=99t enable by default, so I=E2=80=99m leaning towards Khem carries the =
patch alongside the bbappend to turn on the openssl backend in the first pl=
ace.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Where does i=
t say it does not support? On the contrary there are patches in this area s=
ent recently</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
" dir=3D"auto"></blockquote><div dir=3D"auto">Yes I can carry all of change=
s we need locally that=E2=80=99s not an issue we are already carrying many =
of them they just make it harder to contribute back to project as these pil=
e up</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex" dir=3D"auto"><br>
<br>
Ross</blockquote></div></div>

--00000000000028592f060efeda0b--

