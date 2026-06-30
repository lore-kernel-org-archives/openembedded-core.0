Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07828C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 07:35:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15666.1782804914679585312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 00:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xMmY7NOO;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493a97fad2fso20246055e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 00:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782804913; cv=none;
        d=google.com; s=arc-20260327;
        b=UsQzPuoewAVheIRksk/zlQnhIr1p0dg4nuiG/kaO+gIkPw7JMLCo7tFJN5984lDSV2
         wC3Z+V9wpd+rEXS8bggwI1Fw8J4UjNr0XeqfINFAAho9P0p0YOmFSy6aAgwFNjY7YeWH
         /kBobce3e3TUkNODomo6xPAUhfiGdrr+dHZjUQPk87HafRyJz3b4wI7qzAZULAWNllxE
         JjY/bA3nXmovvjpuhv9sVHvr4I8Fka0PKgOwP/qgu5EiL6VCZzLR3QDOhc5IiQk94Aos
         76MqTHCcsVhjUMaqrsRV20Y6Xc1yxh0hQU7RHg8p6bkjd1qiXuAh/peq0NaxsRqpolCz
         EhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=34drkTPTQT4WuNZaRe2sRPHaGSkPFfuBmZOCHPpBiB0=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=B50XX8gMNSvCM/PVoBb6b2ih4BWwqPM4vMI1JoE74+yZ01Xn7/0d2kmfLEdAqahxmD
         xpshezaln3jCQGWUm4yK9TUnrSb6QWWuEr8WHTks+3mHzoLA5S3CxcVLjqQA4cSE6Plh
         fC4OzEU8jR8CK2R2iFoUel51Z2jpU2JZHQTtEa52z/vmgjMssmK12TrrnsAxq9RM9y6j
         0huOHDVpOEikQdPBTTo7nJmCMV2sPXNhJMLKubGrej63Oj0L+mY75wnZnLaWd7F9gxpT
         hoX2PtewPJw/5V/8O7yKsBLS7rE+fGmstRRMmARl5jljTbn/zGxUTVmH2Y076YHeGqZ6
         EGSg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782804913; x=1783409713; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=34drkTPTQT4WuNZaRe2sRPHaGSkPFfuBmZOCHPpBiB0=;
        b=xMmY7NOOi2aiUuz91a6rhAjIOXCtInrLz5VoGi2D47msiBt6AbpE+SI2ADEV6QBKW5
         bpMEJSqIcp1vtch/h6GKKXaE/jU9te0nf/Ksg9bdOytaOOa2hTDjnu4bj5VvgqTXfDpE
         /PziUA+N0bvN9ZkQvhX9dxfTUzAYCXI60D1FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804913; x=1783409713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34drkTPTQT4WuNZaRe2sRPHaGSkPFfuBmZOCHPpBiB0=;
        b=LQivaQUaeMZ5cyFMViCihLUy+1N8a09BW+DW7aWzHby+K62rGyPaG93jvNE04+wzmH
         oF5M9u4C22jRcy8XUbyoKG/GkeSlxOfF3bOHfy3inF/v9xj0pnglK0lQ03Mop4JbWM8a
         sRnNA3HFSU+JEP3GrBfgQ5v/Y6wnaUzvqQglSCua0KtE05ClGydkVQnSUwlg+OW2jv1L
         ov9aw3dXo6MrsGHXs76bpEMnxpGed10l+RjvfKb5NgAdbfo6b6AgWiVx5Q+9/yFezW5N
         fbiC8gxHBVpeg8sDkHLikVKH6saqa9jVQp6S2zakjraAUus/oiCRIpnxDtg6IrkDCM60
         GI0w==
X-Gm-Message-State: AOJu0YzUmKzSxq5fsb5rKvkoEkvPzkIi12v+Q8z1xGIl+bRH0Uflwq/N
	5eG0cqgEGbyboTmQg+5Puw+gXfVBbLCNBd6jLqa0En/X1LMSfC2matf8NNC6Ul4nEoQ4Q8qFvZQ
	7YIygiWbvG+AVdRcsT7gRiAyMqQAo7fCvZoPQw/Wcbg==
X-Gm-Gg: AfdE7cniUu1Ulc+aHxxO0dT6trdQ9U2cg8Ir8NptqUuboBHKx0hBnwDBtxPIbrqfyuy
	bwcdTzyf+BFgcvvISWS66/ZJhn2rwqVl8tGbQq3FvtNlDfs0lqbQU1ewRjuwSK7ZPdL/ySLYaZC
	GW2NczjDKJCodhrTgbktXel3kdX+nqrB6AmiPK18fgtYNgl7kd8j9pjW5tZTiZD7iaaMf8mhOfW
	ThF2tq9MPMSrq4MpYqsgXpjzy3zCIv5TsoDhcoPZEDHdvaYML1QeK8AY7WEWJc0+c0rBP+oQDNM
	4xyrF/Lr/z41D7PRFvDIAowGEVWa1w==
X-Received: by 2002:a05:600c:4fcd:b0:493:aab3:c090 with SMTP id
 5b1f17b1804b1-493b8287064mr38638725e9.9.1782804912724; Tue, 30 Jun 2026
 00:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260602150018.189097-1-richard.purdie@linuxfoundation.org>
 <DJLWBE1WSDSN.G0FEJAKOMOUI@smile.fr> <82485f53d8cdfc2fded0f3786cbe97fb105e9902.camel@linuxfoundation.org>
In-Reply-To: <82485f53d8cdfc2fded0f3786cbe97fb105e9902.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 30 Jun 2026 09:34:46 +0200
X-Gm-Features: AVVi8Cd7zzWc7gBkwiag2RGFIIjJaHZZMJ6r03oT2bszijmHbk9ojjAKCb8dBp0
Message-ID: <CAMSfU+4hVA5oHERs8D0_pR2eWVeFeKdhogvvQLqGTD6XOgciXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dropbear: Clarify LICENSE and drop PD
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000086ed4e0655739daa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239860

--00000000000086ed4e0655739daa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 30 juin 2026 =C3=A0 08:42, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Tue, 2026-06-30 at 00:44 +0200, Yoann Congal wrote:
> > On Tue Jun 2, 2026 at 5:00 PM CEST, Richard Purdie via
> lists.openembedded.org wrote:
> > > The "public-domain" code has a MIT license header so we can remove
> > > that from LICENSE (MIT is already listed).
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-core/dropbear/dropbear_2025.89.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb
> b/meta/recipes-core/dropbear/dropbear_2025.89.bb
> > > index 957a0901fb0..ece065265ff 100644
> > > --- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
> > > +++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
> > > @@ -5,7 +5,8 @@ SECTION =3D "console/network"
> > >
> > >  # some files are from other projects and have others license terms:
> > >  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
> > > -LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause & PD"
> > > +# The 'public-domain' file is headered as MIT
> > > +LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause"
> > >  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D25cf44512b7bc8966a48b6b1a9b7605f"
> >
> > While reviewing backporting this patch for scarthgap, I've look at the
> > licences of dropbear:
> > The "'public-domain' file headered as MIT" is (I think):
> > https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/src/curve25519.c
> > (indeed MIT header)
> >
> > But:
> > * vendored libtommcrypt is "PD OR WTFPL"
> >
> https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/libtomcrypt/LICENSE
> > * vendored libtommath is "Unlicense"
> >
> https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/libtommath/LICENSE
> > ... is that OK that those don't appear in LICENSE?
> >
> > If yes, then the argument is still valid for scarthgap and I'll will
> > backport.
>
> Well spotted, I think you're right that I didn't get this quite right.
> It should be:
>
> "MIT & BSD-3-Clause & BSD-2-Clause & (PD | WTFPL) & Unlicense"
>
> assuming those libs are always used in the build.
>
> We should probably just make it:
>
> "MIT & BSD-3-Clause & BSD-2-Clause & WTFPL & Unlicense"
>
> since PD just causes us pain and WTFPL is effectively the alternative.
>

Ok, I'll drop that for scarthgap for now, send a fix for master and then,
look backporting this.

Thanks!


>
> Cheers,
>
> Richard
>
>

--=20
Yoann Congal
Smile ECS

--00000000000086ed4e0655739daa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 30=
 juin 2026 =C3=A0=C2=A008:42, Richard Purdie &lt;<a href=3D"mailto:richard.=
purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Tue, 2026-06-30 at 00:44 +0200, Yoann Congal wrote:<br>
&gt; On Tue Jun 2, 2026 at 5:00 PM CEST, Richard Purdie via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> wrote:<br>
&gt; &gt; The &quot;public-domain&quot; code has a MIT license header so we=
 can remove<br>
&gt; &gt; that from LICENSE (MIT is already listed).<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/recipes-core/dropbear/<a href=3D"http://dropbear_2025.=
89.bb" rel=3D"noreferrer" target=3D"_blank">dropbear_2025.89.bb</a> | 3 ++-=
<br>
&gt; &gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-core/dropbear/<a href=3D"http://dropbea=
r_2025.89.bb" rel=3D"noreferrer" target=3D"_blank">dropbear_2025.89.bb</a> =
b/meta/recipes-core/dropbear/<a href=3D"http://dropbear_2025.89.bb" rel=3D"=
noreferrer" target=3D"_blank">dropbear_2025.89.bb</a><br>
&gt; &gt; index 957a0901fb0..ece065265ff 100644<br>
&gt; &gt; --- a/meta/recipes-core/dropbear/<a href=3D"http://dropbear_2025.=
89.bb" rel=3D"noreferrer" target=3D"_blank">dropbear_2025.89.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/dropbear/<a href=3D"http://dropbear_2025.=
89.bb" rel=3D"noreferrer" target=3D"_blank">dropbear_2025.89.bb</a><br>
&gt; &gt; @@ -5,7 +5,8 @@ SECTION =3D &quot;console/network&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0# some files are from other projects and have others licens=
e terms:<br>
&gt; &gt; =C2=A0#=C2=A0=C2=A0 public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2,=
 PuTTY<br>
&gt; &gt; -LICENSE =3D &quot;MIT &amp; BSD-3-Clause &amp; BSD-2-Clause &amp=
; PD&quot;<br>
&gt; &gt; +# The &#39;public-domain&#39; file is headered as MIT<br>
&gt; &gt; +LICENSE =3D &quot;MIT &amp; BSD-3-Clause &amp; BSD-2-Clause&quot=
;<br>
&gt; &gt; =C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D25cf44512b7=
bc8966a48b6b1a9b7605f&quot;<br>
&gt; <br>
&gt; While reviewing backporting this patch for scarthgap, I&#39;ve look at=
 the<br>
&gt; licences of dropbear:<br>
&gt; The &quot;&#39;public-domain&#39; file headered as MIT&quot; is (I thi=
nk):<br>
&gt; <a href=3D"https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/src/c=
urve25519.c" rel=3D"noreferrer" target=3D"_blank">https://github.com/mkj/dr=
opbear/blob/DROPBEAR_2026.91/src/curve25519.c</a><br>
&gt; (indeed MIT header)<br>
&gt; <br>
&gt; But:<br>
&gt; * vendored libtommcrypt is &quot;PD OR WTFPL&quot;<br>
&gt; =C2=A0 <a href=3D"https://github.com/mkj/dropbear/blob/DROPBEAR_2026.9=
1/libtomcrypt/LICENSE" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/mkj/dropbear/blob/DROPBEAR_2026.91/libtomcrypt/LICENSE</a><br>
&gt; * vendored libtommath is &quot;Unlicense&quot;<br>
&gt; =C2=A0 <a href=3D"https://github.com/mkj/dropbear/blob/DROPBEAR_2026.9=
1/libtommath/LICENSE" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/mkj/dropbear/blob/DROPBEAR_2026.91/libtommath/LICENSE</a><br>
&gt; ... is that OK that those don&#39;t appear in LICENSE?<br>
&gt; <br>
&gt; If yes, then the argument is still valid for scarthgap and I&#39;ll wi=
ll<br>
&gt; backport.<br>
<br>
Well spotted, I think you&#39;re right that I didn&#39;t get this quite rig=
ht.<br>
It should be:<br>
<br>
&quot;MIT &amp; BSD-3-Clause &amp; BSD-2-Clause &amp; (PD | WTFPL) &amp; Un=
license&quot;<br>
<br>
assuming those libs are always used in the build.<br>
<br>
We should probably just make it:<br>
<br>
&quot;MIT &amp; BSD-3-Clause &amp; BSD-2-Clause &amp; WTFPL &amp; Unlicense=
&quot;<br>
<br>
since PD just causes us pain and WTFPL is effectively the alternative.<br><=
/blockquote><div><br></div><div>Ok, I&#39;ll drop that for scarthgap for no=
w, send a fix for master and then, look backporting this.</div><div><br></d=
iv><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000086ed4e0655739daa--

