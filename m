Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844ECE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 18:09:58 +0000 (UTC)
Received: from so254-41.mailgun.net (so254-41.mailgun.net [198.61.254.41])
 by mx.groups.io with SMTP id smtpd.web10.2069.1734113393408923787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 10:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=CLunN7rb;
 spf=pass (domain: asterius.io, ip: 198.61.254.41, mailfrom: bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt; s=mailo; t=1734113391; x=1734120591;
 h=Content-Type: Cc: To: To: Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References: MIME-Version: Sender: Sender;
 bh=p1uv34YFx5mI98SKI2KpMO/Ob77WIpgCZkv+c51EVng=;
 b=CLunN7rbda5n1UfgGuS4hpVnXEQ46Nn/vj05x4ftf7cMDGHMuzGSGBakXNYBV1J700bQliM7u8dJ2WVa10uUjueijqVxMntqtWi0pao+SJaq3/GVnGqpDQR9G/PWUUhf0vfRvANX/jfE1ryg1h0OZk3GSucH4JabzzzxFL84YE8=
X-Mailgun-Sending-Ip: 198.61.254.41
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyJiMTQwMSIsIm9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciLCIzYTU2ODUiXQ==
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53]) by
 a9da4f3a65be with SMTP id 675c786e8381d8801c80b5ce (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Fri, 13 Dec 2024 18:09:50 GMT
Sender: derek@asterius.io
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso230196966b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 10:09:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWk5aKL8qgaG09LM+Uv6i+ftoYE4tuGpSk+Yag+dQU6SnrunLi7mABIDGL0/MARZ/+uIKaKYmzJul9NnsXgY2vgzw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/DhtnmbcFR/cbGE7zV4ZQMajR+A5S6FkCYO6xpJ0E0PsEZOQl
	MalmzWsI4tRbWmJp7UmzODXkjpDkytRoQnDFUnF2eHNmvUiFt0BcpzBvO+Zh5E8U1NLDGeiHLmn
	XaBf24PBe8xJcdAko59z3CZ4v0i0=
X-Google-Smtp-Source: AGHT+IFgURgnMAc/5UYITU5BQC8HW9Uor+BlWJhvEEcZQPc0rUc1rQyiHNJgzUdhV7Jy4kKgANkkI/Gp5/Ar3/s1gH8=
X-Received: by 2002:a17:907:2d9f:b0:aa6:81dc:6635 with SMTP id
 a640c23a62f3a-aab77907995mr330757266b.18.1734113388987; Fri, 13 Dec 2024
 10:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20241212185619.1599668-1-derek@asterius.io> <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
 <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com>
 <CANNYZj_bngoCTdTHjYmnptiSBu8SLV8SxVgr0ZgV1NyesmhHLg@mail.gmail.com> <DE3FC97A-159D-4603-9121-1A6C27FF9AEA@arm.com>
In-Reply-To: <DE3FC97A-159D-4603-9121-1A6C27FF9AEA@arm.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 13 Dec 2024 12:09:37 -0600
X-Gmail-Original-Message-ID: <CADNbA1puBC4tf+CmwPy4Ej8d4jMNWwXUx3fAnUmWyNgMk5osrQ@mail.gmail.com>
Message-ID: <CADNbA1puBC4tf+CmwPy4Ej8d4jMNWwXUx3fAnUmWyNgMk5osrQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
To: Ross Burton <Ross.Burton@arm.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008d149906292abc37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 18:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208690

--0000000000008d149906292abc37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

I'll give that normalization another shot.  I saw a couple older packages
not following the normalized filenames, but those could be outliers.
Thanks for the pointer.

-Derek

On Fri, Dec 13, 2024 at 12:07=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 13 Dec 2024, at 15:14, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, 13 Dec 2024 at 15:53, Derek Straka <derek@asterius.io> wrote:
> >> Thanks for your note.  I=E2=80=99m working through the remaining downs=
tream
> recipe changes today which should address the rest of the UNKNOWN_BROKEN
> recipes.
> >>
> >> While looking at it yesterday, the download packages come primarily in
> two archetypes:
> >> 1. Those that replace =E2=80=98_=E2=80=99 with =E2=80=98-=E2=80=98 in =
the source archives
> >> 2. Those that leave the =E2=80=98_=E2=80=99 ONLY in the archives
> >>
> >> Given that, I think it=E2=80=99s unlikely there=E2=80=99s a clean fix =
in the bbclass
> without a more invasive change to the upstream check logic.  I can,
> however, package all the changes for one-core into a single patchset and
> submit a v2.  That will at least address all the core updates in one fell
> swoop.
> >>
> >> Does that sound reasonable?
> >
> > Seems so, yes.
> >
> > Historically pypi upstream checks have been a pain, as there has been
> > a constant stream of seemingly random breaking changes, of two types:
> >
> > 1. _ being replaced by - and vice versa
> > 2. CamelCasing being replaced by lowercasing and vice versa.
> >
> > I haven't been able to figure out any pattern in this, or come up with
> > a universal check. If you can simply fix up core recipes to not return
> > UNKNOWN_BROKEN, I'd appreciate.
>
> I=E2=80=99ve some partial branches that attempt to bring sanity to this b=
ut yes,
> it=E2=80=99s a mess.
>
> The good news is that https://peps.python.org/pep-0625/ says that sdist
> filenames should be normalised and from what I can tell everything but
> setuptools does normalise, and the use of setuptools is falling.
>
> The simple update API says that the project name is normalised, so we can
> add a little normalise function:
>
> def pypi_normalize(s):
>     import re
>     return re.sub(r"[-_.]+", "_", s).lower()
>
> And use that to turn the PYPI_PACKAGE into the right thing, surely?
>
> Rationalising this is the source of at least three wip branches I have
> locally, so I=E2=80=99d love to see it sorted.
>
> Ross

--0000000000008d149906292abc37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<div><br></div><div>I&#39;ll give that normalizati=
on another shot.=C2=A0 I saw a couple older packages not following the norm=
alized filenames, but those could be outliers.=C2=A0 Thanks for the pointer=
.</div><div><br></div><div>-Derek</div></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 13=
, 2024 at 12:07=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@ar=
m.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 13 Dec 2024, at 15:14, Alexander Kanavin via <=
a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blan=
k">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.or=
g</a>&gt; wrote:<br>
&gt; <br>
&gt; On Fri, 13 Dec 2024 at 15:53, Derek Straka &lt;<a href=3D"mailto:derek=
@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt; wrote:<br>
&gt;&gt; Thanks for your note.=C2=A0 I=E2=80=99m working through the remain=
ing downstream recipe changes today which should address the rest of the UN=
KNOWN_BROKEN recipes.<br>
&gt;&gt; <br>
&gt;&gt; While looking at it yesterday, the download packages come primaril=
y in two archetypes:<br>
&gt;&gt; 1. Those that replace =E2=80=98_=E2=80=99 with =E2=80=98-=E2=80=98=
 in the source archives<br>
&gt;&gt; 2. Those that leave the =E2=80=98_=E2=80=99 ONLY in the archives<b=
r>
&gt;&gt; <br>
&gt;&gt; Given that, I think it=E2=80=99s unlikely there=E2=80=99s a clean =
fix in the bbclass without a more invasive change to the upstream check log=
ic.=C2=A0 I can, however, package all the changes for one-core into a singl=
e patchset and submit a v2.=C2=A0 That will at least address all the core u=
pdates in one fell swoop.<br>
&gt;&gt; <br>
&gt;&gt; Does that sound reasonable?<br>
&gt; <br>
&gt; Seems so, yes.<br>
&gt; <br>
&gt; Historically pypi upstream checks have been a pain, as there has been<=
br>
&gt; a constant stream of seemingly random breaking changes, of two types:<=
br>
&gt; <br>
&gt; 1. _ being replaced by - and vice versa<br>
&gt; 2. CamelCasing being replaced by lowercasing and vice versa.<br>
&gt; <br>
&gt; I haven&#39;t been able to figure out any pattern in this, or come up =
with<br>
&gt; a universal check. If you can simply fix up core recipes to not return=
<br>
&gt; UNKNOWN_BROKEN, I&#39;d appreciate.<br>
<br>
I=E2=80=99ve some partial branches that attempt to bring sanity to this but=
 yes, it=E2=80=99s a mess.<br>
<br>
The good news is that <a href=3D"https://peps.python.org/pep-0625/" rel=3D"=
noreferrer" target=3D"_blank">https://peps.python.org/pep-0625/</a> says th=
at sdist filenames should be normalised and from what I can tell everything=
 but setuptools does normalise, and the use of setuptools is falling.<br>
<br>
The simple update API says that the project name is normalised, so we can a=
dd a little normalise function:<br>
<br>
def pypi_normalize(s):<br>
=C2=A0 =C2=A0 import re<br>
=C2=A0 =C2=A0 return re.sub(r&quot;[-_.]+&quot;, &quot;_&quot;, s).lower()<=
br>
<br>
And use that to turn the PYPI_PACKAGE into the right thing, surely?<br>
<br>
Rationalising this is the source of at least three wip branches I have loca=
lly, so I=E2=80=99d love to see it sorted.<br>
<br>
Ross</blockquote></div>

--0000000000008d149906292abc37--

