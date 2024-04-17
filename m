Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE73C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 22:33:24 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.514.1713393203104482202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 15:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p8G5drki;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.181, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61816fc256dso1948757b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 15:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713393202; x=1713998002; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DCCAloBXDytsRw2Q/tqFQbLdP+4HckvfqrQDH/iy+6I=;
        b=p8G5drkiquoShTxWgmaOU9cIQvbgz753+6zpNc00wr2WE1jRV3pHa6Gr1/++xwJARH
         J2D6QpcAJjDlS9NBfqcgstE93HugcQ3IufqIQ7a4umRHPK7flmb1NZ1p5lOFftSCDYqh
         mSQ54w5U0acmgY2pRE9nAZz/CYvVQvVKDSxBPObHlhgmOCEUF+yK3W7NLK9pJHIjQPag
         BsyXuT3X2F35Bt5l4xn7DBeG/HYVuR1FO/VF0pBzxABUw7VbgErOpMq72M3KYfZPyhez
         Ixf+aodPS9PIRSIXdkmFCpu8zm23WLIhjafZcoPIOBQoVv22WKtp8DeTfIPBJqF6bPg8
         XQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713393202; x=1713998002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCCAloBXDytsRw2Q/tqFQbLdP+4HckvfqrQDH/iy+6I=;
        b=LPsUKy1vOuv81F4VxRF8oeQj16Yhf5NoNYLWqwp0SHwKbQonKVco7CUR49GFK288D9
         ZCCmuVpf1Mbi/HLwNkCnXM9kRbYQji6PNQRxXucf+OoBZxl+mwV7Blf+6iyXAVWKXJHA
         vbA5U+TWr8CnVCZTiSq0s3dZRqTsmoCg4JJt9mNiGEP+DQWrEO029z3x31aqMtbQ2CLE
         A9hKspHxia5Oc1fmRHCVDNeaaundsOgLeNdT69z3MWUMpPD9eaRDrDLlJR8+/oEy85RV
         5larjFLUF/0vgIeoW/eSscp4Zb9oQ9gAcGgDNS+DcIhU10qPzWzQHrZNcTQpNN7TiBnx
         MlTA==
X-Gm-Message-State: AOJu0YxM3UP+q7Jqx3RvpnLxVRsYf/vazyC5KeujR0iuzG3mj7dO6BEa
	y1y3vIfoA8qKjjaCdb8KrxySeuSMW8xmTHh7uMEPWLVg6RDbiqR3qqEyuZL8Eavfhx3fhnfO744
	Kbm0Y1gETAQ4gBMHu9TlKH9rknSe1eWJZH8PxRw==
X-Google-Smtp-Source: AGHT+IHM58JGNyq/R7+OGthHqPPPT64VtCFi37a4Xt5lkCiJjP+0lQGlqDFu0gIALjs3y7qy5ENllWxarlYdVTN/95c=
X-Received: by 2002:a05:690c:360b:b0:609:ff22:1a88 with SMTP id
 ft11-20020a05690c360b00b00609ff221a88mr738796ywb.44.1713393202244; Wed, 17
 Apr 2024 15:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713385733.git.steve@sakoman.com> <915df62abd2986b2f9d73718e702cc6ce088d52b.1713385733.git.steve@sakoman.com>
 <7b6c45a05dde783826b5a73b1bdb0a821efd0701.camel@linuxfoundation.org>
In-Reply-To: <7b6c45a05dde783826b5a73b1bdb0a821efd0701.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 Apr 2024 15:33:12 -0700
Message-ID: <CAOSpxdacWHTw5sb4nNQ0rxTOjqrZC0gQi=Aa6Xz0-XFqSb1pig@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 6/7] ppp: Add RSA-MD in LICENSE
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002e5d2a061652714d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 22:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198490

--0000000000002e5d2a061652714d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024, 2:33=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2024-04-17 at 13:35 -0700, Steve Sakoman via
> lists.openembedded.org wrote:
> > From: Poonam Jadhav <ppjadhav456@gmail.com>
> >
> > ppp package has "RSA Data Security" license text
> > in Message-Digest Algorithm source file md5.c and md4.c
> > Add RSA-MD in LICENSE field for ppp package
> >
> > Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-connectivity/ppp/ppp_2.4.9.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> > index 7e3ae43b58..b7f71b673d 100644
> > --- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> > +++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> > @@ -5,7 +5,7 @@ SECTION =3D "console/network"
> >  HOMEPAGE =3D "http://samba.org/ppp/"
> >  BUGTRACKER =3D "http://ppp.samba.org/cgi-bin/ppp-bugs"
> >  DEPENDS =3D "libpcap openssl virtual/crypt"
> > -LICENSE =3D "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-late=
r &
> LGPL-2.0-or-later & PD"
> > +LICENSE =3D "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-late=
r &
> LGPL-2.0-or-later & PD & RSA-MD"
> >  LIC_FILES_CHKSUM =3D
> "file://pppd/ccp.c;beginline=3D1;endline=3D29;md5=3De2c43fe6e81ff77d87dc9=
c290a424dea \
> >
> file://pppd/plugins/passprompt.c;beginline=3D1;endline=3D10;md5=3D3bcbcdb=
f0e369c9a3e0b8c8275b065d8 \
> >
> file://pppd/tdb.c;beginline=3D1;endline=3D27;md5=3D4ca3a9991b011038d085d6=
675ae7c4e6 \
> >
>
> This isn't in master yet!
>

Good catch! I'll text this patch and request that out be sent for master.

Steve

>

--0000000000002e5d2a061652714d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Apr 17, 2024, 2:33=E2=80=AFPM Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@lin=
uxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Wed, 2024-04-17 at 13:35 -0700, Steve Sakoman via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.open=
embedded.org</a> wrote:<br>
&gt; From: Poonam Jadhav &lt;<a href=3D"mailto:ppjadhav456@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">ppjadhav456@gmail.com</a>&gt;<br>
&gt; <br>
&gt; ppp package has &quot;RSA Data Security&quot; license text<br>
&gt; in Message-Digest Algorithm source file md5.c and md4.c<br>
&gt; Add RSA-MD in LICENSE field for ppp package<br>
&gt; <br>
&gt; Signed-off-by: Poonam Jadhav &lt;<a href=3D"mailto:poonam.jadhav@kpit.=
com" target=3D"_blank" rel=3D"noreferrer">poonam.jadhav@kpit.com</a>&gt;<br=
>
&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.9.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">ppp_2.4.9.bb</a> | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.9=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ppp_2.4.9.bb</a> b/met=
a/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.9.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">ppp_2.4.9.bb</a><br>
&gt; index 7e3ae43b58..b7f71b673d 100644<br>
&gt; --- a/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.9.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">ppp_2.4.9.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.9.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">ppp_2.4.9.bb</a><br>
&gt; @@ -5,7 +5,7 @@ SECTION =3D &quot;console/network&quot;<br>
&gt; =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://samba.org/ppp/" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">http://samba.org/ppp/</a>&quot;<br>
&gt; =C2=A0BUGTRACKER =3D &quot;<a href=3D"http://ppp.samba.org/cgi-bin/ppp=
-bugs" rel=3D"noreferrer noreferrer" target=3D"_blank">http://ppp.samba.org=
/cgi-bin/ppp-bugs</a>&quot;<br>
&gt; =C2=A0DEPENDS =3D &quot;libpcap openssl virtual/crypt&quot;<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause &amp; BSD-3-Clause-Attribution &amp; G=
PL-2.0-or-later &amp; LGPL-2.0-or-later &amp; PD&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause &amp; BSD-3-Clause-Attribution &amp; G=
PL-2.0-or-later &amp; LGPL-2.0-or-later &amp; PD &amp; RSA-MD&quot;<br>
&gt; =C2=A0LIC_FILES_CHKSUM =3D &quot;file://pppd/ccp.c;beginline=3D1;endli=
ne=3D29;md5=3De2c43fe6e81ff77d87dc9c290a424dea=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://pppd/plugins/pas=
sprompt.c;beginline=3D1;endline=3D10;md5=3D3bcbcdbf0e369c9a3e0b8c8275b065d8=
=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://pppd/tdb.c;begin=
line=3D1;endline=3D27;md5=3D4ca3a9991b011038d085d6675ae7c4e6=C2=A0\<br>
&gt; <br>
<br>
This isn&#39;t in master yet!<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Good catch! I&#39;ll text this patch and reque=
st that out be sent for master.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Steve</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000002e5d2a061652714d--

