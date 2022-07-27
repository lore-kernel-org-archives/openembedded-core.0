Return-Path: <rustyhowell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33765C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:32:01 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.21205.1658935914684307797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hI1im0Ig;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: rustyhowell@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id z25so27715951lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MPoM7VnA+N5PU/+XUf1a/aSRfkHSaEehJ6QgVo0gP/8=;
        b=hI1im0Igq9Gw+SafwhJ2ekaNoNXbd+YYzTOJyeQHMx8uZYdjQWNVmBLJ4bOPE1qmmr
         LUAEi6gQ7OO3CQ9yLH6SWa2w8ogQF97ZnIermYmCkKKaSNjdSoE+JP+KPxzEmw2cPeXB
         hRrfLT7ERlxbOF0+vaxv9a7WOVTsOTCJzvJzUL7hWTld4/PiWVNANg9PVjp3WOAGS/cv
         Xs7uPbxks1YhOWQQRC3lr92qjY74SbBQ3Ar75HC2+FOoe/Nbd3C/3AxK68X0HcTbB0fL
         k0n3NYQ+J5NAsWPoU1NLjGljV/GYO4zkZ9qPLAQx158Dd6Mj6/2spA6BYYj/FS72FAmF
         UPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MPoM7VnA+N5PU/+XUf1a/aSRfkHSaEehJ6QgVo0gP/8=;
        b=6wzEMhxP2YuLmanpuCvn6OZElBwMNXh1rqxeWemi2fWwLD+rKCrRLtPlkzBBHNUTGf
         xrm8xcUC0lYADpS8v5Fqc57Y69BwSy7pzZ5Dt1031JRmOrTgKlpWb6P585wQVkVr+0IP
         QG/H1DckL8djQFyLnVjk5QZEfX7Y7QYI4bvSzyFabkSOwHJZpBUzkihaBX4S32cErcSC
         ZJpkh5iGhBy/+pxeNocPdV+5caeaAQzP1m5IRfrPuhovyWnQ40BPhMTNcitxaLG5EelB
         JNi4L981YiWaCGtQAbBRnDsCxIFn/y6ArqfzBFvcWJmtZT4RXm2H2Gr0tDqqBQHMaPfh
         ulLg==
X-Gm-Message-State: AJIora+wYlIswBorWKSBY1D78BnQriFTLMcfjmJ0Des0rQKqRxtA6F70
	FzdS2NdpMvmJl2bpWxaQ8Hf+vMZMWFSRK6u+aEc=
X-Google-Smtp-Source: 
 AGRyM1t0LL4Ybo7LT4JvgL2nmsF3axxNTvtY7yMJyn9sVj9RZRhqvJgSdKXWHLO5TmcaYrVBlDa7GnS+HHLr0DZVYaM=
X-Received: by 2002:a05:6512:2350:b0:48a:794b:382 with SMTP id
 p16-20020a056512235000b0048a794b0382mr7960929lfu.185.1658935912733; Wed, 27
 Jul 2022 08:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220726211328.2122681-1-rustyhowell@gmail.com>
 <20220727125339.70e1886c@booty>
 <CANNYZj-FJHUQgVb3GXWjEd6mkQE2-wkX2vUky3pJXQLdq6LPVQ@mail.gmail.com>
 <9DF62C6C-0996-4520-B4AD-F8E579C8931A@arm.com>
 <22FA8BA8-2F9D-4914-9C05-5385EBA4D90A@arm.com>
 <7536019F-34C9-44D8-9380-425C4FE67207@arm.com>
 <CAE+BM3m3CvX=86M8FqodzNDS-5VoAVghMVYxeQovLvgxiJ3d1Q@mail.gmail.com>
 <CANNYZj86BMm6avp+5gGqw_6x=MN18HQKJFLAi5_Ov6j8W2jS=g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj86BMm6avp+5gGqw_6x=MN18HQKJFLAi5_Ov6j8W2jS=g@mail.gmail.com>
From: Rusty Howell <rustyhowell@gmail.com>
Date: Wed, 27 Jul 2022 09:31:36 -0600
Message-ID: 
 <CAE+BM3kTm33ZosV9TvnEK5gAb_Bbjd2j7mvgTZuVsa76iP2bUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c8a1cc05e4cb1d30"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 15:32:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168571

--000000000000c8a1cc05e4cb1d30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will do.

On Wed, Jul 27, 2022 at 8:35 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I think Ross is merely helping you to reach the correct solution, but
> everyone would appreciate if you write and submit the actual fix :-)
>
> Alex
>
> On Wed, 27 Jul 2022 at 16:32, Rusty Howell <rustyhowell@gmail.com> wrote:
> >
> > Thanks for the quick responses.   It took us a while to figure out why
> we were seeing weird behaviour with our products, and we ultimately figur=
ed
> out the conffiles are being replaced during the update.   I am working of=
f
> of Hardknott currently, so that's my mistake not switching to master.  An=
d
> I guess I misunderstood who is allowed to "sign off" on patches. I assume=
d
> I couldn't since I'm not a regular. But in any case, it looks like Ross
> Burton may be on to a better solution than what I have to fix the issue.
> >
> > Rusty
> >
> > On Wed, Jul 27, 2022 at 8:09 AM Ross Burton <ross.burton@arm.com> wrote=
:
> >>
> >> > So we=E2=80=99re definitely not generating the DEBIAN/md5sums files =
that
> dpkg-deb likes to have. However, this file in proper Debian packages
> doesn=E2=80=99t contain hashes for the conffiles, so I can only imagine t=
hat dpkg
> generates them on install, which leads to the question of where that is
> meant to happen.
> >>
> >> dpkg =E2=80=94configure does this, but we=E2=80=99re neutering it by r=
enaming all
> foo.dpkg-new files to foo in the deb install() function.
> >>
> >> If we=E2=80=99re going to rename foo.dpkg-new to foo, then that is whe=
re we go
> and update the status file.
> >>
> >> Alternatively, we don=E2=80=99t do that, and every package needs to ru=
n its
> configure step on first boot.
> >>
> >> Ross
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#168563):
> https://lists.openembedded.org/g/openembedded-core/message/168563
> >> Mute This Topic: https://lists.openembedded.org/mt/92637328/4800265
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> rustyhowell@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000c8a1cc05e4cb1d30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will do. <br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 8:35 AM Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I =
think Ross is merely helping you to reach the correct solution, but<br>
everyone would appreciate if you write and submit the actual fix :-)<br>
<br>
Alex<br>
<br>
On Wed, 27 Jul 2022 at 16:32, Rusty Howell &lt;<a href=3D"mailto:rustyhowel=
l@gmail.com" target=3D"_blank">rustyhowell@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks for the quick responses.=C2=A0 =C2=A0It took us a while to figu=
re out why we were seeing weird behaviour with our products, and we ultimat=
ely figured out the conffiles are being replaced during the update.=C2=A0 =
=C2=A0I am working off of Hardknott currently, so that&#39;s my mistake not=
 switching to master.=C2=A0 And I guess I misunderstood who is allowed to &=
quot;sign off&quot; on patches. I assumed I couldn&#39;t since I&#39;m not =
a regular. But in any case, it looks like Ross Burton may be on to a better=
 solution than what I have to fix the issue.<br>
&gt;<br>
&gt; Rusty<br>
&gt;<br>
&gt; On Wed, Jul 27, 2022 at 8:09 AM Ross Burton &lt;<a href=3D"mailto:ross=
.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; So we=E2=80=99re definitely not generating the DEBIAN/md5sums=
 files that dpkg-deb likes to have. However, this file in proper Debian pac=
kages doesn=E2=80=99t contain hashes for the conffiles, so I can only imagi=
ne that dpkg generates them on install, which leads to the question of wher=
e that is meant to happen.<br>
&gt;&gt;<br>
&gt;&gt; dpkg =E2=80=94configure does this, but we=E2=80=99re neutering it =
by renaming all foo.dpkg-new files to foo in the deb install() function.<br=
>
&gt;&gt;<br>
&gt;&gt; If we=E2=80=99re going to rename foo.dpkg-new to foo, then that is=
 where we go and update the status file.<br>
&gt;&gt;<br>
&gt;&gt; Alternatively, we don=E2=80=99t do that, and every package needs t=
o run its configure step on first boot.<br>
&gt;&gt;<br>
&gt;&gt; Ross<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#168563): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/168563" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/168563</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9263=
7328/4800265" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/92637328/4800265</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rustyhowell@gmail=
.com" target=3D"_blank">rustyhowell@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000c8a1cc05e4cb1d30--

