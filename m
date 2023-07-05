Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E12EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 10:00:55 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.13372.1688551249325307076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 03:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YS5n8Sh6;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-57012b2973eso80819477b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688551248; x=1691143248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G4hbFkRZq1B16hESedDiK6cbJUcgf0gnzZ9l9ePD2pk=;
        b=YS5n8Sh63bk6fCZ/3FN8zK3ZERSQZioDqBYvMOtOV3hYs58ej/XAH9VXw2JFCbCbsc
         A2aZJw8Wc9NIoJgNZuGx1LdH293x5WitDF+4/Gb3dN7GyP+kJFoMb195tsxLVIOB6gex
         d96VAF/zImNc6c1pw7XpYfoO1Djb2koqjYzROkwqB7xdEzk1LTMJe7kVOCtLaSCWYMPG
         2y1UyG+GdBcqx5eUqKcX1O3XRJqk/7q2uYxmU5JUWuNDEMiTvysjY9nlVrtzkp50mUqw
         EFBzWJnDFCR8e7VUR3NNlUOAHb/iZgsfITev4V9pZNfj7ZoIQbgIHtZvPBCnE41QcLQ+
         gicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688551248; x=1691143248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4hbFkRZq1B16hESedDiK6cbJUcgf0gnzZ9l9ePD2pk=;
        b=j7uVyvBThIFuxcJGtfNhJFt088Q1tbDa4DLM9wHbVXsS2lbfAydpGpAs1c1m8ei6nz
         gKHKxTM6Lv/BkidsAxHGKWAXigLQq73ZfoPPFXra9f4GeUxtjm4K4iW4JSgh08Sble0z
         P+oypE0unYi9LrSP6An8pkSecgiiUdQl6mQ3mE0KLdM9llsP73ZmGofb65TeTOE2ceZt
         Twv//3Ii2lh21UDD7WHXL/tYeYquC6AT17nA65CpFSVWIuDHvl8WXRbUgjJBlWRhmfpY
         zw9FOLkarPdYFa2Hqp/k6Tn4QsgxucHOeqRT9pszydd4XGRX8+4HdZSXSnITGJmokco8
         /9Dg==
X-Gm-Message-State: ABy/qLYag5aXeHVxfzidiiS109s55Ux3t0xUYrslcLCB0mzaPdsQrZdc
	RYZQ/uq2+B0KXCdhk6t3Hz8ZQMQ7UVcnRhcKG7rmXu6oOKtfz5cM
X-Google-Smtp-Source: APBJJlHK1jkmyaA4IKyyEK+VTH6kupltYSUt70RtZqlLKElalFlTzHdVbRLKphZMp6eqzEKTcRJAR4gOIPoxUUsQsM4=
X-Received: by 2002:a05:690c:3603:b0:577:2376:c6be with SMTP id
 ft3-20020a05690c360300b005772376c6bemr14037425ywb.45.1688551248199; Wed, 05
 Jul 2023 03:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230704200907.20403-1-sudipm.mukherjee@gmail.com>
 <CANx9H-AHG59Fw4s5zQ-2yJRksJszGwdZghznqsjYyxjXnMAiEg@mail.gmail.com>
 <176EEE6570F0DE1C.25260@lists.openembedded.org> <CADVatmNN7Oy3Aw0u0J5s+GEPtiK1jeW27imf5P1_2eX60c2FOw@mail.gmail.com>
In-Reply-To: <CADVatmNN7Oy3Aw0u0J5s+GEPtiK1jeW27imf5P1_2eX60c2FOw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 5 Jul 2023 12:00:36 +0200
Message-ID: <CANx9H-Bg-Da4euSwAmSdtGOyd7X94Au0LUrtJJ9-dW1CtN+guQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pygments: upgrade to 2.15.1
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000055832105ffba7952"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 10:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183880

--00000000000055832105ffba7952
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 5, 2023 at 11:45 AM Sudip Mukherjee <sudipm.mukherjee@gmail.com>
wrote:

> On Wed, 5 Jul 2023 at 10:23, Sudip Mukherjee via
> lists.openembedded.org
> <sudipm.mukherjee=gmail.com@lists.openembedded.org> wrote:
> >
> > On Wed, 5 Jul 2023 at 08:45, Tim Orling <ticotimo@gmail.com> wrote:
> > >
> > >
> > >
> > > On Tue, Jul 4, 2023 at 10:09 PM Sudip Mukherjee <
> sudipm.mukherjee@gmail.com> wrote:
> > >>
> > >> Upstream has removed setup.py and started using pyproject.toml
> > >>
> > >> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > >> ---
> > >>  ...ython3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} | 6
> +++++-
> > >>  1 file changed, 5 insertions(+), 1 deletion(-)
> > >>  rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb =>
> python3-pygments_2.15.1.bb} (76%)
> > >>
> > >> diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> > >> similarity index 76%
> > >> rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> > >> rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> > >> index 16769e9263..7e3b286f41 100644
> > >> --- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> > >> +++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> > >> @@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
> > >>  LIC_FILES_CHKSUM =
> "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
> > >>
> > >>  inherit setuptools3
> > >
> > >
> > >  instead of setuptools3, inherit python_setuptools_build_meta
> > > Look at the build.backend variable in pyproject.toml for hints
> > > https://github.com/pygments/pygments/blob/master/pyproject.toml#L4
> >
> > Thanks Tim. I was going through all the python*.bbclass to find a
> > suitable one but obviously I missed it.
> > Will update, test and send a v2.
>
> nm, I can see you have already sent a patch for this.
>
> I decided to maintain it. Thank you for your contribution and bringing it
to my attention.


> --
> Regards
> Sudip
>

--00000000000055832105ffba7952
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 5, 2023 at 11:45 AM Sudip Mukherjee &lt;<a href=
=3D"mailto:sudipm.mukherjee@gmail.com">sudipm.mukherjee@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Wed, 5 Jul 2023 at 10:23, =
Sudip Mukherjee via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;sudipm.mukherjee=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 5 Jul 2023 at 08:45, Tim Orling &lt;<a href=3D"mailto:ticotimo=
@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Jul 4, 2023 at 10:09 PM Sudip Mukherjee &lt;<a href=3D"ma=
ilto:sudipm.mukherjee@gmail.com" target=3D"_blank">sudipm.mukherjee@gmail.c=
om</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Upstream has removed setup.py and started using pyproject.tom=
l<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Sudip Mukherjee &lt;<a href=3D"mailto:sudipm.m=
ukherjee@gmail.com" target=3D"_blank">sudipm.mukherjee@gmail.com</a>&gt;<br=
>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 ...<a href=3D"http://ython3-pygments_2.14.0.bb" rel=3D"=
noreferrer" target=3D"_blank">ython3-pygments_2.14.0.bb</a> =3D&gt; <a href=
=3D"http://python3-pygments_2.15.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-pygments_2.15.1.bb</a>} | 6 +++++-<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; &gt;&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://=
python3-pygments_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py=
gments_2.14.0.bb</a> =3D&gt; <a href=3D"http://python3-pygments_2.15.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.15.1.bb</a>} (76%)<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://p=
ython3-pygments_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyg=
ments_2.14.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python=
3-pygments_2.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments=
_2.15.1.bb</a><br>
&gt; &gt;&gt; similarity index 76%<br>
&gt; &gt;&gt; rename from meta/recipes-devtools/python/<a href=3D"http://py=
thon3-pygments_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygm=
ents_2.14.0.bb</a><br>
&gt; &gt;&gt; rename to meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-pygments_2.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygmen=
ts_2.15.1.bb</a><br>
&gt; &gt;&gt; index 16769e9263..7e3b286f41 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-=
pygments_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2=
.14.0.bb</a><br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-=
pygments_2.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2=
.15.1.bb</a><br>
&gt; &gt;&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt; &gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D36a13c9=
0514e2899f1eba7f41c3ee592&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 inherit setuptools3<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 instead of setuptools3, inherit python_setuptools_build_met=
a<br>
&gt; &gt; Look at the build.backend variable in pyproject.toml for hints<br=
>
&gt; &gt; <a href=3D"https://github.com/pygments/pygments/blob/master/pypro=
ject.toml#L4" rel=3D"noreferrer" target=3D"_blank">https://github.com/pygme=
nts/pygments/blob/master/pyproject.toml#L4</a><br>
&gt;<br>
&gt; Thanks Tim. I was going through all the python*.bbclass to find a<br>
&gt; suitable one but obviously I missed it.<br>
&gt; Will update, test and send a v2.<br>
<br>
nm, I can see you have already sent a patch for this.<br>
<br>
</blockquote><div dir=3D"auto">I decided to maintain it. Thank you for your=
 contribution and bringing it to my attention.</div><div dir=3D"auto"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
-- <br>
Regards<br>
Sudip<br>
</blockquote></div></div>

--00000000000055832105ffba7952--

