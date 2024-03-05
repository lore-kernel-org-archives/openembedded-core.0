Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4E7C54E49
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 14:55:55 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.24817.1709650548157597029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 06:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QK+dXao/;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-472746606b4so1060461137.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 06:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709650547; x=1710255347; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpBKRSurPOf78jEhwK0Hbzthwa5YwwmUJ8d41NXV1qE=;
        b=QK+dXao/atXQMiBX+Vv6IsPHiMgDR9ZwaqLpfUahLjhUSKGpkkpNiwQqBkTHCc1RFH
         l1HCEVRop1cCamZHHQGOXOxdftgile4/FG5HjWM4mIrhpv8j/mrciltFF3McZFKwQHL2
         D58D42BWNQMiGg4/7mYVD+5NORiyqwqOuN0UA4JEDJxFiFwoUx9b3WHDW9eoefUWxRcl
         yrR29bkbDgDLUSwDcdQEXx1FnHbUrXCcqWn6ZMmeu2/JgoDXsitReFlRIKGBFHtyifZv
         Od2WTOm7nC4pVRQDCC3ceNI69OxZwrmsP1bgFbjpkkM2HFDPkzvuaisFVTQf2L+/DSdf
         0H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709650547; x=1710255347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpBKRSurPOf78jEhwK0Hbzthwa5YwwmUJ8d41NXV1qE=;
        b=FfcayjbWZWWNUznOGzukwD592Vp9hH8/RRjaOpX8ZU931ZwyreNvav60xDAnRl2rhF
         ObqoEC4MMlgvFZq6daBTX7eej7aQ6DNkNraLZlZeWqkhdfV1rvrTgWUQDgcLmo3OQ8bH
         XJP68CLlZIvUmUXK+XbjL8kDEeIhtUuGyBAmyDT1KJrFa+bLdN20ujaQOX5wQul4wMm6
         0wQmPt1sTtGEETD59Dk8z1MoECK8rYCr1yLsPIhwB1FRJ9vvfjIThwm5+RxIxqgQl2Io
         rjdleXZt/GPNXg0FKX2kxsUXmRQIG/OCTSODd3o7/AJJ/Ro25GUBeG1O8hdLXcwV5LX5
         zRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1/DyBbI77Pq5v0J+qlrP5Bt937ddXxDdM2ThyM+LWOF8o3Hyc94KmCnXkbq6Z/3NKCvI+cnYrhI4AlZhhMp7uVrxxzSsHw11WM6hEUieUcropBb/ePsy6
X-Gm-Message-State: AOJu0YwDx2fQ9EejCbTvbOVJoUvJcbVbrhV28OZXFx2OEfnPbDE1Ex9R
	H0/IFamuiPnzKSt+x4LWO0QvPrXE+xZsntyj9UtkdBXPz+vJ+qSZbfbvKBRzqxdYGv6Lt9KORnT
	ozEWmADgxUXBoVn0bMt8QEsG5nP8=
X-Google-Smtp-Source: AGHT+IGhq1t75H2rCTFqdXJcSiKvw5yiT/O1abdSiLrNv7vuuoufGk0EbGSqOJSNrigCMBPBuhOuR4g+XFolAG73NIw=
X-Received: by 2002:a05:6102:91:b0:472:63c5:64f6 with SMTP id
 t17-20020a056102009100b0047263c564f6mr1861869vsp.11.1709650546993; Tue, 05
 Mar 2024 06:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
 <CAMKF1sqZc2HR=iWKjDHQAVHHxTfXKv0DqcbHZr+-akTSvU24eA@mail.gmail.com>
 <e9a42854ce1e115e6f82088ae873f984a182596a.camel@linuxfoundation.org>
 <17B84BB9B5B6E4EC.16400@lists.openembedded.org> <CANPvuRnz--2ApD7u_uVUkRvQ7WH078V4xwDSRGvsEXhCs-NyHA@mail.gmail.com>
 <17B8756EC40C8FBB.30419@lists.openembedded.org> <10c3fd9adcd8c39a85f578ab690fc7a45b68cf9c.camel@linuxfoundation.org>
In-Reply-To: <10c3fd9adcd8c39a85f578ab690fc7a45b68cf9c.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 5 Mar 2024 14:55:36 +0000
Message-ID: <CANPvuRn1e5XWeqNPVEFmPJcpOwG8zuaknzVj28bz_nV2yNFMJA@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH v2 1/7] go: rework patch to avoid identation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000008b33100612eb09a6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 14:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196634

--0000000000008b33100612eb09a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (domingo,
3/03/2024 =C3=A0(s) 23:03):

> On Thu, 2024-02-29 at 22:19 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2024-02-29 at 21:42 +0000, Jose Quaresma wrote:
> > >
> > >
> > > A quinta, 29/02/2024, 09:35, Jose Quaresma via
> > > lists.openembedded.org
> > > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu:
> > > >
> > > >
> > > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu
> > > > (quinta, 29/02/2024 =C3=A0(s) 08:18):
> > > > > On Wed, 2024-02-28 at 21:16 -0800, Khem Raj wrote:
> > > > > > Fails to compile bunch of  recipes using go e.g. influxdb,
> > > > > > crucible,
> > > > > > syzkaller in meta-oe see
> > > > > >
> > > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3667/st=
eps/15/logs/stdio
> > > > >
> > > > > Also fails for oe-selftest:
> > > > >
> > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6415/st=
eps/14/logs/stdio
> > > > >
> > > > > and on arm hosts:
> > > > >
> > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7999/st=
eps/13/logs/stdio
> > > > >
> > > >
> > > >
> > > >
> > > > Thanks for testing, I will take a look on all of this today.
> > >
> > > I have no progress today and unfortunately I won't have time to
> > > work
> > > on this in the next few days :( if anyone wants to continue with
> > > this
> > > effort, feel free to do so.
> > >
> > > my apologies.
> >
> > FWIW https://github.com/golang/go/issues/65887 looked relevant to the
> > first issue.
> >
> > We are really late in the schedule to pull in things like this so I'm
> > not sure we'll get this in at this point :/.
> >


Having the 1.21 bump was already a significant benefit for the project in
my opinion.
so if you drop the 1.22 the impact is much reduced.


>
> I've some tweaks in master-next I'm testing to see if it does sort
> 1.22...
>

I also will do some tests with your changes in main-next to see if I found
any runtime issue.

Jose


>
>
> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008b33100612eb09a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (domingo, 3/03/2024 =C3=A0(s) 23:03):<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, 2024-02-29 at 22:19 +0000, Richa=
rd Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Thu, 2024-02-29 at 21:42 +0000, Jose Quaresma wrote:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; A quinta, 29/02/2024, 09:35, Jose Quaresma via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu:=
<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; e=
screveu<br>
&gt; &gt; &gt; (quinta, 29/02/2024 =C3=A0(s) 08:18):<br>
&gt; &gt; &gt; &gt; On Wed, 2024-02-28 at 21:16 -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; Fails to compile bunch of=C2=A0 recipes using go e=
.g. influxdb,<br>
&gt; &gt; &gt; &gt; &gt; crucible,<br>
&gt; &gt; &gt; &gt; &gt; syzkaller in meta-oe see<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/88/builds/3667/steps/15/logs/stdio" rel=3D"noreferrer" tar=
get=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/88/b=
uilds/3667/steps/15/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Also fails for oe-selftest:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/80/builds/6415/steps/14/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/80/buil=
ds/6415/steps/14/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; and on arm hosts:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/97/builds/7999/steps/13/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/97/buil=
ds/7999/steps/13/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Thanks for testing, I will take a look on all of this today.=
<br>
&gt; &gt; <br>
&gt; &gt; I have no progress today and unfortunately I won&#39;t have time =
to<br>
&gt; &gt; work<br>
&gt; &gt; on this in the next few days :( if anyone wants to continue with<=
br>
&gt; &gt; this<br>
&gt; &gt; effort, feel free to do so.<br>
&gt; &gt; <br>
&gt; &gt; my apologies.<br>
&gt; <br>
&gt; FWIW <a href=3D"https://github.com/golang/go/issues/65887" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/golang/go/issues/65887</a>=C2=
=A0looked relevant to the<br>
&gt; first issue.<br>
&gt; <br>
&gt; We are really late in the schedule to pull in things like this so I&#3=
9;m<br>
&gt; not sure we&#39;ll get this in at this point :/.<br>
&gt;</blockquote><div><br></div><div>Having the 1.21 bump was already a sig=
nificant benefit for the project in my opinion.<br></div><div>so if you dro=
p the 1.22 the impact is much reduced.<br></div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"> <br>
<br>
I&#39;ve some tweaks in master-next I&#39;m testing to see if it does sort<=
br>
1.22...<br></blockquote><div><br></div><div>I also will do some tests with =
your changes in main-next to see if I found any runtime issue.</div><div><b=
r></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000008b33100612eb09a6--

