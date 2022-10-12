Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B816C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 14:58:37 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.248.1665586713502090448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 07:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aPvwuh7b;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id d26so31457796eje.10
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f3ueMHH/CCfT6UiegjV6o/l6VzFnodYglU1DGAnelbM=;
        b=aPvwuh7bHyIiEN1yB4LvnEHsDQG3XYS6by3DRUeGnnKvOMYfN0sE5gJc97hQr+LJsZ
         Ow7zi1pwo760xL583YmbJbpPHo8oOh9x4++jb0JeNjKx3+eiVt7+5fmL0r8799YN66oH
         b1ZB40pJR/qBcM0TwujnbVPtxFstUcG6sPCwpGaGkhcVN40X0Po9L8JqjGX6ugB0WGBY
         wIFAveYE8FalZIFl8QRer3m7vAmB32v4X98iflNCndNDDIAWXKOWNIWLNF4JFxLpglq6
         GlJAykXu2TPn/zBQgt91z090JexF9MK0CEUYs5x6yb4MrcE9vwXpHxAs628crWquRodn
         IC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3ueMHH/CCfT6UiegjV6o/l6VzFnodYglU1DGAnelbM=;
        b=iY/aPE5QYQ1NOHkJRywlHwo4VeIh117pjni/zgUTq7TcVK/DmFnMOWwCOuah5RbpkY
         hjZoKHyvMSG0dOalUQK6u6PcY06iy7gqt5lDkRKrstU/RGRIO0eKT6DbYpAAwM0MWvFa
         wL11aJEIx1bhbxF9vaTHQI/tU7j9YtfJ4J+ZKkR8yMbMQ8GonKhlJHsNjrMdvqXWyqmN
         rD1uhz9213Jq0M9ZY7P5keNvx+rGGpfsbq8/qZnCIb0D9irdeM1a5nw/XsV3mOZQcN+H
         FvMo5+cHGtwGhdrF5dSvPYUjQg8UmViMKPw42PYySHOymG2Kdq8lzTSIvDrU0SEqPg/B
         0ETQ==
X-Gm-Message-State: ACrzQf21E4tzVMAb7jJYP1iEFHTgawdkwuoOqXBA8Iccg8Anjr+cMS8p
	Q2YnBMfoFxQA+JNfjOCT3P3m6ioITHEu9eAMhtw=
X-Google-Smtp-Source: AMsMyM4q1Ww8GTekEnSjaWqyRBd8I6eVjrj7wKOizs9Vf+49Ed6cBcsy9UGC5x0+ZuJWydyPy0djMwjvPjFXFRf2CV0=
X-Received: by 2002:a17:906:cc10:b0:78d:f741:9d87 with SMTP id
 ml16-20020a170906cc1000b0078df7419d87mr2031568ejb.295.1665586711808; Wed, 12
 Oct 2022 07:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175520.2850089-1-alex@linutronix.de> <CAB=6tBQza_dU6PsUsn4ND4WKE2vxAwa_8Lh3seVck7bC87Hrdw@mail.gmail.com>
 <CANNYZj-Y-obgA204+_04vAHpJkx4b2PKTZOVphvguhgMRX1YvQ@mail.gmail.com>
In-Reply-To: <CANNYZj-Y-obgA204+_04vAHpJkx4b2PKTZOVphvguhgMRX1YvQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 12 Oct 2022 07:58:20 -0700
Message-ID: <CANx9H-BeMGoT9YMegMG24GGoF+rEvOqvyMVHjbUyE3V54deB5w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/2] cargo-update-recipe-crates.bbclass: add
 a class to generate SRC_URI crate lists from Cargo.lock
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Chuck Wolber <chuckwolber@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000004cd13905ead7a013"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 14:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171666

--0000000000004cd13905ead7a013
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 5, 2022 at 1:56 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Wed, 5 Oct 2022 at 07:32, Chuck Wolber <chuckwolber@gmail.com> wrote:
> > Can you elaborate on this?
> >
> > I only ask because we are using this[1] and this[2] to build this[3]
> recipe for hardknott.
> >
> > 1. https://github.com/meta-rust/meta-rust/blob/master/lib/crate.py
> > 2. https://crates.io/crates/cargo-bitbake
> > 3.
> https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb?h=kirkstone
>
> As you can see in [1], crate:// fetcher is not using cargo, it's using
> wget - so the question of resolving and listing dependencies from
> Cargo.lock falls on the tooling that writes and updates the recipe
> itself. cargo-bitbake failed at the installation step for me (both
> with --locked and without it), and in general I do not think we should
> rely on external tools with unknown maintenance status. The lists of
> open issues and pull requests are not at all reassuring:
> https://github.com/meta-rust/cargo-bitbake
>
>
I have cargo bitbake running locally, but in recent python3-cryptography
and python3-bcrypt upgrades
it produced crate://* SRC_URI that actually failed to build. I had to
manually loop through builds until
I sussed out all the versions that would work. This proves Alex's point.

Having looked at the implementation, I am very much in favor of this
proposal. In fact, I wonder if
a similar approach could help with golang and maybe even nodejs/npm. But
that is for another day.

Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171453):
> https://lists.openembedded.org/g/openembedded-core/message/171453
> Mute This Topic: https://lists.openembedded.org/mt/94022674/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004cd13905ead7a013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 5, 2022 at 1:56 AM Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Wed, 5 Oct 2022 at 07:32, Chuck Wolber &lt;<a href=3D"mailto:chuckw=
olber@gmail.com" target=3D"_blank">chuckwolber@gmail.com</a>&gt; wrote:<br>
&gt; Can you elaborate on this?<br>
&gt;<br>
&gt; I only ask because we are using this[1] and this[2] to build this[3] r=
ecipe for hardknott.<br>
&gt;<br>
&gt; 1. <a href=3D"https://github.com/meta-rust/meta-rust/blob/master/lib/c=
rate.py" rel=3D"noreferrer" target=3D"_blank">https://github.com/meta-rust/=
meta-rust/blob/master/lib/crate.py</a><br>
&gt; 2. <a href=3D"https://crates.io/crates/cargo-bitbake" rel=3D"noreferre=
r" target=3D"_blank">https://crates.io/crates/cargo-bitbake</a><br>
&gt; 3. <a href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-devt=
ools/python/python3-cryptography-vectors_36.0.2.bb?h=3Dkirkstone" rel=3D"no=
referrer" target=3D"_blank">https://git.yoctoproject.org/poky/tree/meta/rec=
ipes-devtools/python/python3-cryptography-vectors_36.0.2.bb?h=3Dkirkstone</=
a><br>
<br>
As you can see in [1], crate:// fetcher is not using cargo, it&#39;s using<=
br>
wget - so the question of resolving and listing dependencies from<br>
Cargo.lock falls on the tooling that writes and updates the recipe<br>
itself. cargo-bitbake failed at the installation step for me (both<br>
with --locked and without it), and in general I do not think we should<br>
rely on external tools with unknown maintenance status. The lists of<br>
open issues and pull requests are not at all reassuring:<br>
<a href=3D"https://github.com/meta-rust/cargo-bitbake" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/meta-rust/cargo-bitbake</a><br>
<br></blockquote><div><br></div><div>I have cargo bitbake running locally, =
but in recent python3-cryptography and python3-bcrypt upgrades</div><div>it=
 produced crate://* SRC_URI that actually failed to build. I had to manuall=
y loop through builds until</div><div>I sussed out all the versions that wo=
uld work. This proves Alex&#39;s point.</div><div><br></div><div>Having loo=
ked at the implementation, I am very much in favor of this proposal. In fac=
t, I wonder if</div><div>a similar approach could help with golang and mayb=
e even nodejs/npm. But that is for another day.</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171453): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171453" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171453</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94022674/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94022674/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004cd13905ead7a013--

