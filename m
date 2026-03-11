Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B5B105D26E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 11:03:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18629.1773227025338332307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 04:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HO8DRWbR;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: liu.ming50@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae88e16485so30282745ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 04:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773227025; cv=none;
        d=google.com; s=arc-20240605;
        b=hscijtSb/na8xVshiKgkGwzoXlaqGNpOPcIPr89PlrgBBUe5MlC7ckSSO9xJNYnute
         X9Eu5Wxb86GzkmRI7oBc7P2VakN6GzUaIzKMeKykHOi6OIGplKKEwydnRxItlxvCXgk5
         gaHYxHPRw/zVgxKXZXcocB5+zVL4nRFXV4zEybZJvvTwO2rPUmY8r0fLickE2qJT6lGT
         s4A6JlU1Tn61JJiSOvTGGeRo+3zs2yA1aaW2UPAypGJ01a1ewpZsBtwZz3vTpQ1zYguH
         IHfYYFbY4QjCASqZoWR9YVFUdWb3SgoHJG82P/1nW7+LqNoQIgN2sEz7FEYud7FFjqjn
         ZG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yHGg5huc8s+8UJNwOL5qRLkmNvSZnymP9ItUEylb128=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=WlumZHyR0LzSOXKSX2zEswQonxoyFgoi8iYemNmwjmd4onN41DxZwkRM2wRLNr3pRa
         Vu6pfjtVmuy7ex/he03DGudDdRrbDMr98abXn+wlVSxyL8D5/RlDiqcsHNC5fR4blZ8o
         SSDzEUoVIBI7R57Byf5S9t+VXETCj8tixcaFXhtILCjqOcbGIaPvE/oaVZvXWo4CK6QK
         3JxTtMQEqhPnty7zav8uPol/BhRtH3RGFVdq5zO9keDejEtHE9va3heAcsqj38X74G4Q
         MVicf0e/oheWBEG6Y5XiMK7Ug31/O4oRTk2yB7yehd3rVV7VDHzmzUtWIAAoAvnwmNDQ
         Ijgg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773227025; x=1773831825; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yHGg5huc8s+8UJNwOL5qRLkmNvSZnymP9ItUEylb128=;
        b=HO8DRWbRsI2z1dfavBUXEg6PDospjCzGwyu6bPcoI4x5i0Fi1tQJRmMmblGWhYZpNC
         Q0TSY4T6fl1m2nrtvx8t2T+hFXAapPD63ZddDUBJFBihfjmOepUobuAC37lcuwH1/P0E
         5KcO2gGBIy+fjHilvagfqMEMVt4HDseQkfZ2Dk1FKein+rPhgqDLJRw/fPWwqOyHQzip
         h0UrMRVC5eaei3yWAuNKXqLfucAKt7RgCyeqpeDyrjpizI5DgkOY6PILjf9HwiWVBDjo
         r1MitfkfvLc3L14QO/m9wqt+hllHDEtWvBurEYv1glBw8zpYvH6hXx1il1FrDjwPlSzA
         4bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773227025; x=1773831825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHGg5huc8s+8UJNwOL5qRLkmNvSZnymP9ItUEylb128=;
        b=bnAlqOZn6rqqtoIIp2RDGqwPOA/yzEsm3/9R9XgfGcfj/iPK2QjpP8gGpvA9X9KQU/
         IIKXIxiENzNEOjU4Kt3UYvOmLLeo+za8F7robnYbEPmS/6SjcR/rPJkGdaHPSmW+alJ7
         bJGsaHepYvBNKnZon3Li18OJpUL0zSqS2rldph0QpiGG+b8k362Wkr6rszDg/No0Fobj
         caG+bawgG/g9c/1uBbtaR3kZAJkQxz6ZmVsAOpXEEvZtxWPDX0+O0GbXamgnjvdk5+sz
         GFBdSM/XWo+hmO/t8xmEozimBljZ4c0iAcCgTYf7Vnomd1NUOluLQfMwthenuQMS18YS
         hHxA==
X-Gm-Message-State: AOJu0YwSLPjGvDDYiKN0NogrSFdxEjmCZPKUrIvkMXpo8buhcHDzMhnd
	PsbJ/5skCZhCOsX2v1g/J2ivCyAji4Ke5YWfIuPZKBRcBrObBlzwZd+M5zy+Rz6XSJVrDCLVaHq
	HFvAWLyN2DoQS/4VDszkd7joW5w3JGGYcNQ==
X-Gm-Gg: ATEYQzxYHEuwONc5K//KERx+ZBXF5zAtI1wmhuvGUMhGBkMTY5I9iEu1/0G9OcGUO7J
	gB0UvMz6MaiZ5tC0a0orZt0/HivISWsIQ9DEnIjIgCaDXl58ubGWhF6htaLNwS050LvwfXAamRB
	XA9w9WTu6MouPQKCwrn7GfAcbZVkV1B5Czy3kF03wF2M6/GNMS3MP8Io8MNswIj/7rsOyXK5T7V
	a5SUiupY2lbiOq9fYfmHBH2FhPgQjDfmUpfP59Sb/sqvLyyby97Vqu681d6U7T0IzQ6YfIh4z+W
	+oys93oy4WVuZx8lvljP3STFafx40VohtEtrudW39LTXi9NegHaMvhs71JNG7NazIR65hxM=
X-Received: by 2002:a17:902:e5c5:b0:2a1:e19:ff0 with SMTP id
 d9443c01a7336-2aeae890990mr23649565ad.39.1773227024570; Wed, 11 Mar 2026
 04:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260311104359.194321-1-liu.ming50@gmail.com> <9029a33449f495475953ea561dce5047cf4008fe.camel@linuxfoundation.org>
In-Reply-To: <9029a33449f495475953ea561dce5047cf4008fe.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 11 Mar 2026 12:03:33 +0100
X-Gm-Features: AaiRm53PWRm1R82HZHgIaT5N9LHBclFSh1kSeNwsZAWwUkHgVbK_vKNadnto_0g
Message-ID: <CALatG=7PR_XOCv_yxJpoG-qqutsmzO2ktbNinEHfVFaztZHQpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands.bbclass: use DATETIME as
 system timestamp
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e7dacb064cbd9633"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 11:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232867

--000000000000e7dacb064cbd9633
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, that=E2=80=99s a good point, please ignore it.

//Ming Liu


On Wed, 2026-03-11 at 11:43 +0100, Ming Liu via lists.openembedded.org
> wrote:
> > DATETIME is being used in BUILD_ID and some other places to mark the
> > build time, let's use it as system timestamp, to have a consistent
> > system-wide timestamp.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes-recipe/rootfs-postcommands.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass
> b/meta/classes-recipe/rootfs-postcommands.bbclass
> > index f0c7ee658d..43001e09b5 100644
> > --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> > +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> > @@ -424,11 +424,12 @@ rootfs_update_timestamp () {
> >               # Convert UTC into %4Y%2m%2d%2H%2M%2S
> >               sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS=
}
> +%4Y%2m%2d%2H%2M%2S`
> >       else
> > -             sformatted=3D`date -u +%4Y%2m%2d%2H%2M%2S`
> > +             sformatted=3D${DATETIME}
> >       fi
> >       echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
> >       bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatte=
d"
> >  }
> > +rootfs_update_timestamp[vardepsexclude] =3D "DATETIME"
>
> This could be a little tricky as this timestamp is meant to be the
> latest thing in the image. DATETIME is fixed when the build starts and
> therefore if files are modified during the image, those could have a
> later values.
>
> I'm therefore not sure this is a good idea.
>
> Cheers,
>
> Richard
>

--000000000000e7dacb064cbd9633
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">OK, that=E2=80=99s a good point, please ignore it.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">//Ming Liu</div><div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2026-03-11 at 11:43=
 +0100, Ming Liu via <a href=3D"http://lists.openembedded.org" rel=3D"noref=
errer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; DATETIME is being used in BUILD_ID and some other places to mark the<b=
r>
&gt; build time, let&#39;s use it as system timestamp, to have a consistent=
<br>
&gt; system-wide timestamp.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-recipe/rootfs-postcommands.bbclass | 3 ++-<br>
&gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/cl=
asses-recipe/rootfs-postcommands.bbclass<br>
&gt; index f0c7ee658d..43001e09b5 100644<br>
&gt; --- a/meta/classes-recipe/rootfs-postcommands.bbclass<br>
&gt; +++ b/meta/classes-recipe/rootfs-postcommands.bbclass<br>
&gt; @@ -424,11 +424,12 @@ rootfs_update_timestamp () {<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Convert UTC in=
to %4Y%2m%2d%2H%2M%2S<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sformatted=3D`da=
te -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sformatted=3D`date -u=
 +%4Y%2m%2d%2H%2M%2S`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sformatted=3D${DATETI=
ME}<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0echo $sformatted &gt; ${IMAGE_ROOTFS}/etc/ti=
mestamp<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0bbnote &quot;rootfs_update_timestamp: set /e=
tc/timestamp to $sformatted&quot;<br>
&gt; =C2=A0}<br>
&gt; +rootfs_update_timestamp[vardepsexclude] =3D &quot;DATETIME&quot;<br>
<br>
This could be a little tricky as this timestamp is meant to be the<br>
latest thing in the image. DATETIME is fixed when the build starts and<br>
therefore if files are modified during the image, those could have a<br>
later values.<br>
<br>
I&#39;m therefore not sure this is a good idea.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000e7dacb064cbd9633--

