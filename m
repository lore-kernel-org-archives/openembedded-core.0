Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D74C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:47:59 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.2184.1642711679053700256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:47:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pJOFwkKV;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id b16so13200369uaq.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QnGQjEsgBabmTl3t9c/CkAHHGAGciBQ9evzyqkiv/Io=;
        b=pJOFwkKVMoAvj7ieC6oPkflAK2wRgL09Mo3Fu0nys03X/bxUBJwpxkVhvuv/TS0C9B
         7+bmpmYXxaJZWY4r7Ts3AgQqoz6/Pb42GLRyTs5OIKdOGoj8+u6YMZ1Z5PhK1wD1DPuT
         uz72ifyCKZBXgUafLnGXKYxYKiJfhualfaM1l96DDPO2SIGUQQlINR0KQ1nufOi7t9aR
         JvyKvAlRr3mMvRW24lV6s8aJNKjzzFyEzJm2WQvHhzFEXLIYB25FZ2EdVUsv9Pe2oPJ7
         9QIakvHd3ox0d8mPM/4YPKlaw5jwBBYSU9jw+iylZvTZW+lzrwTRs0kDN+OyOzZ8tkwy
         IXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QnGQjEsgBabmTl3t9c/CkAHHGAGciBQ9evzyqkiv/Io=;
        b=vJKwZGdfFU3oOs4tcovBlMjsDkIu0BS3RJhMfRyFLU8UodUT0jMEAzpM/rmsYbxJ/g
         JVcbXl45K15Knbn6vy5xfyB7sKUP69bheNHh2jytAOBugCJeJbPZZI3Sx34cr0ipU+Z2
         jfhgxZeuNksPrsKkV7ASWD2ZHVeXKUtyR6CZBkZQLBaQl+PbkzlE5nbv+VnrbbXEkdUy
         Lp8b5+s1LNSppiejFE+aG5R672U/JaN/Mc74WefvM8yKp6gGJoQftwuU2uFOFTucvNAu
         B2JYf2/z89HEQ4dT+wSqaRZDydbx+MQaJGEwXkKZYa4JDWGe0VN0+T5qwEj5RvZ3kgkv
         I6bw==
X-Gm-Message-State: AOAM530V1+c5sLVhkSyMd2drQyjck4wR1ooEedQhtP4FOc8SMsS12r+P
	o+3IL5qwdwkLPKedK6mMPEMC9pYL657A82Z8rFo=
X-Google-Smtp-Source: 
 ABdhPJyxPuJq8YALKe1e/nGFl+W3f5ZHTw0RCMUNldy8Pm/nbwUgp9GFbaowUcQx5MrZhxODKhIWUVkcVIDRQ9XzTdM=
X-Received: by 2002:a67:d903:: with SMTP id t3mr393328vsj.42.1642711678126;
 Thu, 20 Jan 2022 12:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20220118185043.1778569-1-marex@denx.de>
 <CANNYZj8mJNZW=N-cgSzGGR8Av7Lij=NFzpK6cLWpyMjyHP2Oww@mail.gmail.com>
 <CAMKF1srtAJi+xvqJ1qNoi9rnCKpeN226r76o6AY=CMXe3x24Lg@mail.gmail.com>
 <7e645982-b148-680c-c6aa-89724716f659@denx.de>
 <CAMKF1soPeRuNjAtjFEONmS_i5oHPcBhWd0FeHh9VcVFO4D8jpA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soPeRuNjAtjFEONmS_i5oHPcBhWd0FeHh9VcVFO4D8jpA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 21:47:47 +0100
Message-ID: 
 <CANNYZj-Zxv4yXcMbpFTp9yuKzO9_B_FrTSD9-ZtnC55xj+3KiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Update from 4.4.1 to 5.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000000b0ff105d6099ecc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:47:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160788

--0000000000000b0ff105d6099ecc
Content-Type: text/plain; charset="UTF-8"

Not all of these are ffmpeg caused, e.g. picking a few random items shows
they are new meson issues:

https://errors.yoctoproject.org/Errors/Details/622936/
https://errors.yoctoproject.org/Errors/Details/622943/

I think we should also check whether something is abandonware, e.g.
minidlna had its last commit in Nov 2020.

Alex

On Thu, 20 Jan 2022 at 21:33, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 20, 2022 at 12:28 PM Marek Vasut <marex@denx.de> wrote:
> >
> > On 1/20/22 21:15, Khem Raj wrote:
> > > there are bunch of failures in meta-openembedded as well  see
> > >
> > > https://errors.yoctoproject.org/Errors/Build/138784/
> >
> > So, how shall we proceed here ?
> >
> > I suspect Alex will send a patch for the problem detected in oe-core and
> > then oe-core with ffmpeg 5.0 won't be broken anymore.
> >
> > As for the rest of the recipes in meta-openembedded, they will likely be
> > catching up to ffmpeg 5.0 over time, so we can either upgrade them, or
> > patch them. I suspect the former is more favorable approach.
>
> Someone needs to fix them.
> as seen this is not a trivial amount of recipes to fix. Generally its
> cordial to
> keep meta-openembedded working for extended testing and CI.
>
> >
> > However, what is not clear to me is whether this breakage in
> > meta-openembedded is a blocker for this patch to be applied to oe-core
> > (with the fix from Alex), or not ?
>

--0000000000000b0ff105d6099ecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Not all of these are ffmpeg caused, e.g. picking a fe=
w random items shows they are new meson issues:</div><div><br></div><div><a=
 href=3D"https://errors.yoctoproject.org/Errors/Details/622936/">https://er=
rors.yoctoproject.org/Errors/Details/622936/</a></div><div><a href=3D"https=
://errors.yoctoproject.org/Errors/Details/622943/">https://errors.yoctoproj=
ect.org/Errors/Details/622943/</a></div><div><br></div><div>I think we shou=
ld also check whether something is abandonware, e.g. minidlna had its last =
commit in Nov <span title=3D"Thu Nov 12, 2020 12:06 AM UTC">2020.</span></d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 Jan 2022 at 21:33, Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 20=
, 2022 at 12:28 PM Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=
=3D"_blank">marex@denx.de</a>&gt; wrote:<br>
&gt;<br>
&gt; On 1/20/22 21:15, Khem Raj wrote:<br>
&gt; &gt; there are bunch of failures in meta-openembedded as well=C2=A0 se=
e<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Build/138784/" =
rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors=
/Build/138784/</a><br>
&gt;<br>
&gt; So, how shall we proceed here ?<br>
&gt;<br>
&gt; I suspect Alex will send a patch for the problem detected in oe-core a=
nd<br>
&gt; then oe-core with ffmpeg 5.0 won&#39;t be broken anymore.<br>
&gt;<br>
&gt; As for the rest of the recipes in meta-openembedded, they will likely =
be<br>
&gt; catching up to ffmpeg 5.0 over time, so we can either upgrade them, or=
<br>
&gt; patch them. I suspect the former is more favorable approach.<br>
<br>
Someone needs to fix them.<br>
as seen this is not a trivial amount of recipes to fix. Generally its cordi=
al to<br>
keep meta-openembedded working for extended testing and CI.<br>
<br>
&gt;<br>
&gt; However, what is not clear to me is whether this breakage in<br>
&gt; meta-openembedded is a blocker for this patch to be applied to oe-core=
<br>
&gt; (with the fix from Alex), or not ?<br>
</blockquote></div>

--0000000000000b0ff105d6099ecc--

