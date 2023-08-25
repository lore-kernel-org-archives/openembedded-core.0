Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BABBC3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 05:04:53 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.7141.1692939885772350656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 22:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ISfMj0t0;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50078e52537so753452e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 22:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692939884; x=1693544684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MMF5hQq37DyiUfysQRZZ+x0xMwQsvsWnHjhERLqX2cA=;
        b=ISfMj0t0tE0a/JuhfHqEX91Yp9X7ur4l9EwKeR0y9T4eY7TvkdG2LbR1ualRUoBif+
         KT3gt6Fgew9/H0j63MSIVXZ1DlGPcX/3KiOiPf6WVkvjoBAR54LKj6beYn9Ae7o99U0D
         hNSBR6xfDsA6AAy0YO7U6f4biXC/H46WyrvvImKMUJX+as5dodXCT7lPcNTm4oZo6iUb
         3VaqYu/VojGSDx/HO/IgcTD0ZmS7OPsIiPMDDxwUvkX4u1OAIdTySieJf47SXZ4GzkGa
         0klqmyJcTFXnIpgV2gUM1YsjaHnKhdYVlVEzvZ7TqjC0zjK0PdBwVXCH2hftIb52mOY4
         tKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692939884; x=1693544684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMF5hQq37DyiUfysQRZZ+x0xMwQsvsWnHjhERLqX2cA=;
        b=IeV6eUxmuLp3pWOZuU9/k+dF0XtkRuIDZyw19JYwA86Ep8l46ZbmG5Z/znnlztp28H
         LwIdAtlsuN64MU4HlPfaoq4hEqDM4G2QN2ZOhpeeuYV2hlMusbHuPnTz2PkwUoCNaOZX
         BFhvCoxC/JQ8biIS8RKsGe+EGjD1LXZyDtwOs6viz93WBKse6fzN4EsD/b5hUDsPpjWU
         jEE+8XfdBAKi6G3ccoob+/SJdkQiAG2C2bR4p7ClaSsrQnHg0fBdv4U8aFQg8nTM0jyY
         3xBSYrsDQxJBwUDhh9rMT2GKP8p6cithkVdxTBRLi7YK5qCgticJxets34M757DnQ9tk
         Pv7A==
X-Gm-Message-State: AOJu0YwFAcZ+EnCmj/KOmffNkeI6oK2+/J4NUwlYwG8rvM2JX9FKc5lA
	NVaQ/bDGi9hCtpZNZCj9AAgoH6UDm8LxmRYwrEc=
X-Google-Smtp-Source: AGHT+IHh1myVex3knJaIyAFHShj4zozEuWe9OcZP71y3vz/BMK0ikLbJXV8ZOT6kb3lJrOv/MIR2DVZ6dbmsH+X2S6s=
X-Received: by 2002:a05:6512:1106:b0:500:85bc:4c6 with SMTP id
 l6-20020a056512110600b0050085bc04c6mr12978912lfg.48.1692939883473; Thu, 24
 Aug 2023 22:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
 <ZNt45UVb0Ps/kKLM@windriver.com> <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
 <ZN7j425iXGBPbS5i@windriver.com> <177DAAB2E4C3384A.4797@lists.openembedded.org>
 <177DAFEBFB5EB0D2.24073@lists.openembedded.org> <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
 <ZOSoIXLG7vH/GC1l@nuoska> <177DB4530EBE3FA3.24073@lists.openembedded.org>
 <177DBC07E94591CC.4797@lists.openembedded.org> <177DD0B30D8FEDF8.27837@lists.openembedded.org>
 <177DD39B5534099F.27837@lists.openembedded.org> <177E1FB73F514F09.8058@lists.openembedded.org>
 <177E56C1DFAB4DFC.13053@lists.openembedded.org> <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
In-Reply-To: <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 25 Aug 2023 07:04:31 +0200
Message-ID: <CA+cAkeqrEFYK8=ahRX9_MeGH3+OVmQAAc3TRkcYhKbDs2gb4_g@mail.gmail.com>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006171b90603b848c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 05:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186689

--0000000000006171b90603b848c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 24 ao=C3=BBt 2023, 22:18, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Thu, 2023-08-24 at 15:04 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2023-08-23 at 22:16 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Tue, 2023-08-22 at 23:01 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > so the commands are stopping mid flow for unknown reasons or the ss=
h
> > > > connection fails. I can't tell if this coincides with an rcu stall =
or
> > > > not. Both logs do have rcu stalls in.
> > > >
> > > > After these failures the system does continue to otherwise work
> > > > normally and subsequent tests pass.
> > > >
> > > > I wonder if the slow emulation might be causing the networking to
> > > > glitch and break the ssh connection.
> > > >
> > > > I'm at a bit of a loss on where from here.
> > >
> > > I thought I'd update the thread with new information.
> > >
> > > I went back to the start with this and looked again and what is going
> > > on. Interestingly, I found one of the autobuilder workers would
> > > consistently fail the qemuppc-alt configuration for core-image-sato-
> > > sdk. I paused the worker and experimented.
> > >
> > > I saw two different failures (included below). One shows systemd-udev=
d
> > > timing out on it's watchdog after 3 minutes and resetting, including
> > > taking out an ssh session running the cpio configure command. There w=
as
> > > no RCU stall reported.
> > >
> > > The second failure shows systemd-logind as well as systemd-udevd with
> > > the 3 minute time out, the kernel complaining about missed IRQs, an R=
CU
> > > stall and lots of breakage following including cut ssh commands.
> > >
> > > I could not get the cpio build test to complete.
> > >
> > > Interestingly, I came back to the same image/worker later this evenin=
g
> > > and now it all works fine. The difference is earlier there was a worl=
d
> > > build running on the worker, which continued to wind down even after =
I
> > > paused the worker. By the evening, that background load was no longer
> > > present and the ppc image works in isolation. This tells us the issue
> > > is system load dependent and only occurs on loaded systems.
> > >
> > > I suspect I need to replicate the load and retry locally, see if I ca=
n
> > > reliably reproduce the hang. The watchdog won't be present on sysvini=
t
> > > systems which also show the issues but I'd guess there is still some
> > > other starvation/timeout occurring.
> >
> > I've now seen the failure on the autobuilder:
> >
> > * with linux-yocto 6.1.38
> > * with linux-yocto 6.1.46
> > * with qemu 8.0.4
> > * with qemu 8.0.3
> > * with qemu 8.0.0
> >
> > I was a little suspicious of:
> >
> > "hw/ppc: Fix clock update drift"
> >
> https://gitlab.com/qemu-project/qemu/-/commit/73d6ac24c81f1aeae554d469616=
c9181511e6523
> >
> > but we've tested with and without that.
> >
> > qemu has just released 8.1.0 so perhaps we should try that next.
>
> qemu 8.1.0 brings with it a new set of problems but I've reproduced the
> hang with 8.1.0 so it does not solve that.
>
> I'm really struggling to understand which change brought in these
> issues for qemuppc.
>
> Cheers,
>
> Richard
>

Hello Richard,

I didn't understand the issues but I recently came across some keywords you
used here (rcu, NOHZ warnings, ratelimit...) in a Linux rt thread I just
read : https://www.spinics.net/lists/linux-rt-users/msg27085.html

 I hope you may find it helpful for your investigation but if you was
already aware of that, my bad.

Cheers.

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186672):
> https://lists.openembedded.org/g/openembedded-core/message/186672
> Mute This Topic: https://lists.openembedded.org/mt/100733646/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006171b90603b848c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le jeu. 24 ao=C3=BBt 2023, 22:18, Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank" rel=
=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Thu, 2023-08-24 at 15:04 +0=
100, Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On Wed, 2023-08-23 at 22:16 +0100, Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer=
 noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; On Tue, 2023-08-22 at 23:01 +0100, Richard Purdie via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noref=
errer noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; so the commands are stopping mid flow for unknown reasons or=
 the ssh<br>
&gt; &gt; &gt; connection fails. I can&#39;t tell if this coincides with an=
 rcu stall or<br>
&gt; &gt; &gt; not. Both logs do have rcu stalls in.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; After these failures the system does continue to otherwise w=
ork<br>
&gt; &gt; &gt; normally and subsequent tests pass.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I wonder if the slow emulation might be causing the networki=
ng to<br>
&gt; &gt; &gt; glitch and break the ssh connection.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I&#39;m at a bit of a loss on where from here. <br>
&gt; &gt; <br>
&gt; &gt; I thought I&#39;d update the thread with new information.<br>
&gt; &gt; <br>
&gt; &gt; I went back to the start with this and looked again and what is g=
oing<br>
&gt; &gt; on. Interestingly, I found one of the autobuilder workers would<b=
r>
&gt; &gt; consistently fail the qemuppc-alt configuration for core-image-sa=
to-<br>
&gt; &gt; sdk. I paused the worker and experimented.<br>
&gt; &gt; <br>
&gt; &gt; I saw two different failures (included below). One shows systemd-=
udevd<br>
&gt; &gt; timing out on it&#39;s watchdog after 3 minutes and resetting, in=
cluding<br>
&gt; &gt; taking out an ssh session running the cpio configure command. The=
re was<br>
&gt; &gt; no RCU stall reported.<br>
&gt; &gt; <br>
&gt; &gt; The second failure shows systemd-logind as well as systemd-udevd =
with<br>
&gt; &gt; the 3 minute time out, the kernel complaining about missed IRQs, =
an RCU<br>
&gt; &gt; stall and lots of breakage following including cut ssh commands.<=
br>
&gt; &gt; <br>
&gt; &gt; I could not get the cpio build test to complete.<br>
&gt; &gt; <br>
&gt; &gt; Interestingly, I came back to the same image/worker later this ev=
ening<br>
&gt; &gt; and now it all works fine. The difference is earlier there was a =
world<br>
&gt; &gt; build running on the worker, which continued to wind down even af=
ter I<br>
&gt; &gt; paused the worker. By the evening, that background load was no lo=
nger<br>
&gt; &gt; present and the ppc image works in isolation. This tells us the i=
ssue<br>
&gt; &gt; is system load dependent and only occurs on loaded systems.<br>
&gt; &gt; <br>
&gt; &gt; I suspect I need to replicate the load and retry locally, see if =
I can<br>
&gt; &gt; reliably reproduce the hang. The watchdog won&#39;t be present on=
 sysvinit<br>
&gt; &gt; systems which also show the issues but I&#39;d guess there is sti=
ll some<br>
&gt; &gt; other starvation/timeout occurring.<br>
&gt; <br>
&gt; I&#39;ve now seen the failure on the autobuilder:<br>
&gt; <br>
&gt; * with linux-yocto 6.1.38<br>
&gt; * with linux-yocto 6.1.46<br>
&gt; * with qemu 8.0.4<br>
&gt; * with qemu 8.0.3<br>
&gt; * with qemu 8.0.0<br>
&gt; <br>
&gt; I was a little suspicious of:<br>
&gt; <br>
&gt; &quot;hw/ppc: Fix clock update drift&quot;<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/73d6ac24c81f1=
aeae554d469616c9181511e6523" rel=3D"noreferrer noreferrer noreferrer" targe=
t=3D"_blank">https://gitlab.com/qemu-project/qemu/-/commit/73d6ac24c81f1aea=
e554d469616c9181511e6523</a><br>
&gt; <br>
&gt; but we&#39;ve tested with and without that.<br>
&gt; <br>
&gt; qemu has just released 8.1.0 so perhaps we should try that next.<br>
<br>
qemu 8.1.0 brings with it a new set of problems but I&#39;ve reproduced the=
<br>
hang with 8.1.0 so it does not solve that.<br>
<br>
I&#39;m really struggling to understand which change brought in these<br>
issues for qemuppc.<br>
<br>
Cheers,<br>
<br>
Richard<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Hello Richard,=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I didn&#39;t understand the issues but I recently came across some keyw=
ords you used here (rcu, NOHZ warnings, ratelimit...) in a Linux rt thread =
I just read :=C2=A0<a href=3D"https://www.spinics.net/lists/linux-rt-users/=
msg27085.html" target=3D"_blank" rel=3D"noreferrer">https://www.spinics.net=
/lists/linux-rt-users/msg27085.html</a></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">=C2=A0I hope you may find it helpful for your investigation=
 but if you was already aware of that, my bad.=C2=A0</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Cheers.=C2=A0</div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186672): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186672" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
186672</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100733646/621=
3388" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/100733646/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:fred=
eric.martinsons@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">=
frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000006171b90603b848c0--

