Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A30E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 21:27:29 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.6136.1734125248143814717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 13:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Atw+CPh4;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2a3c075ddb6so395052fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 13:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734125247; x=1734730047; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IUTPDyvZVrK4OIapAaeM1uTxmutnP1bcHpyRbBe3N2I=;
        b=Atw+CPh4eNu8+r+uY8oxngdL5OltFmupK0ir0h6xC8/c/NLaE3iQ+xhg5ZngqrSS5r
         AqePOCM8kn0A/8alb/aR6WxnRGe/mjHImaGP4XFp1Ibb8dQLrWwBiP2RrqR9TY44h+QP
         0xdpT3swZboS28p8Er/Fs+nVAG6J2jSL5dj299v5VP/vuv5Qk7ve+mUVU+gdiKU/E9Sb
         Eig2srhDXciOwOJXgQSJfRdIQBSkiELPKs0Zmwr0Db2yr5aVCiUpD1gRplTyAU/wDEV7
         Ox8cdVkz4xkxgN8DYsfvZ7jVz1g4i7fsOMXs7F0zL4SshviTfuqUvzLxGqWPUrPuLzgX
         K34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734125247; x=1734730047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUTPDyvZVrK4OIapAaeM1uTxmutnP1bcHpyRbBe3N2I=;
        b=E3GcYi01pT/BYW0kvb793UJpEtXp2qNM2UYEtEiz1wkjsUBQ+PiP5CFo9cbXj/HNz8
         IRo0eSWlpSaR4xk751NMXzuUUoDD6L1OjwMPE/YJEk+AlmGxq0rSHAmfNNErdbOQtumw
         O7MyAxm2Xf3PlqJddhNtoqjuKDYmRhBmirtyUqWbEl/uFPH8MKWcwtKz+xLnul4k07Tn
         GHsDmka9d3l6bjhkkist31G0DAXa/LSQKOqOQGDbIYS4W751/zF3CPCNTHqpL28OGv/p
         JUvuq4BWaaR8RzC06u6r1tePzwQ6kfJlD1nrt0pHc/eqg9F0UsTAkDMPruv18jyI4cMR
         bN2Q==
X-Gm-Message-State: AOJu0Yw/OWsG4ewpkIib6VpxTgt/wzTzxAkPzDEGyQ+a2C4r+lB0irIc
	YDyu3wwMvaqvp4ZtenQfmUuaRA7ogoL00fLA0cOkpU1E7HoqRyyEsNbamorLObNGesO4LqZUP+9
	QiMSbz/O9dtSebI8xSmlMxpwnOSI=
X-Gm-Gg: ASbGncuHkuMlXpXQwVXZtrjcJIfG84To92ht12ja4Pe0SYG2C0CyT0hnoUmozrWjGQa
	NB7Pq2BTsdyU30GY4QQYUqZ/faawePjuQWPGVM8uL
X-Google-Smtp-Source: AGHT+IGQqp1/36f25FxIdLh6+fEDnoXliyMLGco/Dxkm+Y67O5gT6lgHm2A2mLJ+5k4y+3gT16fx3/gZVc5O9t0XdfM=
X-Received: by 2002:a05:6871:460b:b0:29e:76c8:be2e with SMTP id
 586e51a60fabf-2a3ac8b83b9mr2337643fac.28.1734125247297; Fri, 13 Dec 2024
 13:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com> <b44dff5fa418020c37422d849f2a50ee5425e61a.camel@linuxfoundation.org>
In-Reply-To: <b44dff5fa418020c37422d849f2a50ee5425e61a.camel@linuxfoundation.org>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Fri, 13 Dec 2024 22:27:16 +0100
Message-ID: <CAB3asfgetjAb=5H5k8s6gk1fB+bh879AH8_KUsW3OXqYp+p2hg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 0/5] systemd split networkd package
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c824106292d7f90"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 21:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208696

--0000000000005c824106292d7f90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Fr., 13. Dez. 2024 um 12:18 Uhr schrieb Richard Purdie <
richard.purdie@linuxfoundation.org>:

> On Thu, 2024-12-12 at 16:55 +0100, Adrian Freihofer via
> lists.openembedded.org wrote:
> > v2 fixes the build warning
> >
> > First of all, this patch series fixes a bug in systemd.bbclass that
> > forces service files with an Also=3D relationship to be in the same
> > package. This may often be the case, but as long as the RDEPENDS
> > between the packages are set correctly, it is no problem to distribute
> > the service files over several packages.
> >
> > If service files referenced with Also=3D are no longer automatically ad=
ded
> > to the list of FILES, build errors caused by unpacked files are
> > expected. A bitbake world has shown that there are only two recipes in
> > oe-core that use automatic packing: busybox and dropbear. There are 2
> > patches that fix this.
> >
> > Also=3D relation are probably most often used for sockets. Consequently
> > the systemd.bbclass should also allow to split socket files into
> > separate packages. However, that's proably practically not used and
> > would cause tons of packaging errors. Therefore the automatic packaging
> > feature for sockets is not changed.
> >
> > The latest patch splits systemd-networkd into its own package. This add=
s
> > a little extra complexity, but splitting systemd into packages is a goo=
d
> > step towards making Yocto more usable in binary form.
>
> The changes to busybox and dropbear suggests there are some
> considerations needed here from a migration perspective as people
> upgrade past this change? Is there some documentation we should be
> adding to the migration guide along with these changes?
>

Yes, there is a certain risk that some recipes will require adjustments.
Maybe something like this would be helpful:

If a systemd service file had referred to other service files by =E2=80=9CA=
lso=E2=80=9D
starting them, the other service files were automatically added to the
FILES variable of the same package.
This prevents such services from being packaged into different packages.
Therefore, this automatic has been removed for service files (but not for
socket files).
Now all service files must be explicitly added to FILES.

Adrian


>
> Cheers,
>
> Richard
>
>
>

--0000000000005c824106292d7f90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">Am Fr., 13. Dez. 2024 um 12:18=C2=A0Uhr schri=
eb Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Thu, 2024-12-12 at 16:55 +0100, Adrian Frei=
hofer via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; v2 fixes the build warning<br>
&gt; <br>
&gt; First of all, this patch series fixes a bug in systemd.bbclass that<br=
>
&gt; forces service files with an Also=3D relationship to be in the same<br=
>
&gt; package. This may often be the case, but as long as the RDEPENDS<br>
&gt; between the packages are set correctly, it is no problem to distribute=
<br>
&gt; the service files over several packages.<br>
&gt; <br>
&gt; If service files referenced with Also=3D are no longer automatically a=
dded<br>
&gt; to the list of FILES, build errors caused by unpacked files are<br>
&gt; expected. A bitbake world has shown that there are only two recipes in=
<br>
&gt; oe-core that use automatic packing: busybox and dropbear. There are 2<=
br>
&gt; patches that fix this.<br>
&gt; <br>
&gt; Also=3D relation are probably most often used for sockets. Consequentl=
y<br>
&gt; the systemd.bbclass should also allow to split socket files into<br>
&gt; separate packages. However, that&#39;s proably practically not used an=
d<br>
&gt; would cause tons of packaging errors. Therefore the automatic packagin=
g<br>
&gt; feature for sockets is not changed.<br>
&gt; <br>
&gt; The latest patch splits systemd-networkd into its own package. This ad=
ds<br>
&gt; a little extra complexity, but splitting systemd into packages is a go=
od<br>
&gt; step towards making Yocto more usable in binary form.<br>
<br>
The changes to busybox and dropbear suggests there are some<br>
considerations needed here from a migration perspective as people<br>
upgrade past this change? Is there some documentation we should be<br>
adding to the migration guide along with these changes?<br></blockquote><di=
v><br></div><div>Yes, there is a certain risk that some recipes will requir=
e adjustments. Maybe something like this would be helpful:</div><div><br></=
div>If a systemd service file had referred to other service files by =E2=80=
=9CAlso=E2=80=9D starting them, the other service files were automatically =
added to the FILES variable of the same package.<br>This prevents such serv=
ices from being packaged into different packages. Therefore, this automatic=
 has been removed for service files (but not for socket files).<br>Now all =
service files must be explicitly added to FILES.</div><div class=3D"gmail_q=
uote gmail_quote_container"><br></div><div class=3D"gmail_quote gmail_quote=
_container">Adrian<br></div><div class=3D"gmail_quote gmail_quote_container=
"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--0000000000005c824106292d7f90--

