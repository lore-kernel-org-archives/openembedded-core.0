Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FF5C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 14:12:22 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.9596.1643897541305009363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 06:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fo5g14cL;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: krussell7711@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id q186so4237035oih.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 06:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zk7V/5DeJqKM6DJgCPn2tnRZ0y1b7oRNPvrOTs49UcM=;
        b=Fo5g14cLuLWdc10QTy502IlNm22SyoyU4fUQ9eiAGc6iamAQKUxLHig6h4XJS2FcQJ
         mCzhLGaZ09yMN0gK6N1MJm0jGSrwdZNccWJF8yl3F2ubIhcdbHrgpl6xloSSGQyov1KL
         5zSth+Vuby6mQOAoMYwEWThoW/HXNJN/7DgUhsQQEV9dWDCYObkwXTxUifRcF1tBKX3p
         QUMSSrYMpNz582Dtkga7mV/joytxyUjUzYk88chCQy43182mp5iiW/p92BFwmVt0dAb4
         +lfEVDUofwypC75UEeSoFPa58zwBEgU4Mk39XLoXhw/p9jBhV7EU+IQXH1CQPTq+C5Ic
         4WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zk7V/5DeJqKM6DJgCPn2tnRZ0y1b7oRNPvrOTs49UcM=;
        b=5QAZ/KWk/GzBeqFUG4tHPeexEtTqBnRzwk2eIvEmXAbloWahC6XkyqpxLR981bpVEk
         WnXbSrLPF/E708W3pCI1tSqAJN2DlgjUPzJzFxc1QSvYVqELbDvWlR5FEr4w+ULaUeJ1
         +yC+Lkeo9zAX2oJpWMkAmzdgU64p2C40h7P/gJwjHuFrFk/yF38JBlJa24bInWnn1vho
         dyfWFkoFBFoBu6l3hbrTkj/KxP/eS4+wIGeaHYex9WYiyNrY1VFe58Nis+R6U5Cl4u06
         Rpt6/FOqGV54517P3gBoV6DQ9vLiBVlNenuMkATJFGOIqrM66TySrc2hAOq5zTUCaSym
         BqoA==
X-Gm-Message-State: AOAM533JQh+uh7NmSy+PnkuSr1/DC5PnNJitR+2XL2dIuGCfYy1QC+mQ
	2qkV/1/ez46GwcgN8jjF00aU/VWoKat+EaN8Fkw=
X-Google-Smtp-Source: 
 ABdhPJxMuiikFBLKO+FaAcaRLJqP+LxVvaVZ1n+04Qebvy0klTsrtOt6dJoH81Lxlm2ZMrdwbgJFESjNBgYPP5K92sE=
X-Received: by 2002:a05:6808:f8e:: with SMTP id
 o14mr8209198oiw.12.1643897540311;
 Thu, 03 Feb 2022 06:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20210917080804.2545478-1-ch@denx.de>
 <CAFrQVPNNvMxNDgP7GkSQitP6_4D5u1wDvzZRcJKd195Byo4u2Q@mail.gmail.com>
 <fa9e9247-c4f0-8896-bf54-95a03eff2105@denx.de>
 <CAFrQVPNiHZ8MEv0uaHUpi4J=Erefa1GLzGYh_af19X6A-gxg4g@mail.gmail.com>
 <3aad56dc-ae73-6449-c680-b9da234830f0@denx.de>
In-Reply-To: <3aad56dc-ae73-6449-c680-b9da234830f0@denx.de>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Thu, 3 Feb 2022 09:12:09 -0500
Message-ID: 
 <CAFrQVPNeNPnOErKJN73gp-wrvVnWazfENppLoUey3AF5mzC4Ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: add systemd-udev-settle wants to
 service
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Alex Kiernan <alex.kiernan@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	Alban Bedel <alban.bedel@aerq.com>, Wes Lindauer <wesley.lindauer@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000effd6305d71db879"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 14:12:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161284

--000000000000effd6305d71db879
Content-Type: text/plain; charset="UTF-8"

Thanks, Claudius.  I really appreciate your responses.  I'm not trying to
be pedantic.  Since I don't have your test setup, I was just trying to make
sure I understood the context of the problem as I figure out how to deal
with issues this is causing in our setup.

I was also hoping one of the recipe maintainers of either systemd or
rng-tools would comment on systemd-udev-settle.

I'll take a look at the caam module to see if I can understand how it works.

On Thu, Feb 3, 2022 at 3:35 AM Claudius Heine <ch@denx.de> wrote:

> On 2022-02-02 17:26, Kyle Russell wrote:
> > Thanks, Claudius.
> >
> > On Wed, Feb 2, 2022 at 8:08 AM Claudius Heine <ch@denx.de
> > <mailto:ch@denx.de>> wrote:
> >
> >     Hi Kyle,
> >
> >     On 2022-02-02 13:38, Kyle Russell wrote:
> >      > Is this the correct approach?  Even the
> >     systemd-udev-settle.service man
> >      > pages recommends not using its service.  Were the kernel modules
> >     really
> >      > not loaded when rngd started?  Or is the original problem just a
> >     matter
> >      > of waiting for sufficient entropy?
> >
> >     IIRC, the rngd could not find any random source device node
> (/dev/hwrng
> >     in that case), so the service failed to start.
> >
> >
> > If /dev/hwrng didn't exist, this feels like the original problem was a
> > misconfigured
> > kernel or module that wasn't being loaded properly.
>
> Yes, however it is a timing issue. The module was loaded properly at
> bootup, however at the time rngd was started the module was not loaded
> yet and thus the service fails to start. If it would be delayed until
> the module is loaded everything would be fine.
>
> It does not happen if the module is compiled into the kernel or if a
> initramfs is used which loads the module (I think). I our case it
> happend with the caam module as an external module loaded on boot from
> the real root file system.
>
> >     The patch you are commenting on only adds `Wants` weak dependency to
> >     make sure `systemd-udev-settle.service` is pulled in to the job
> queue,
> >     the `After` ordering rule was already there.
> >
> >
> > Correct.  Just because an `After` exists does not mean the service gets
> > pulled into
> > the job queue, so prior to this change no other service was causing the
> > deprecated
> > systemd-udev-settle.service to be run during boot.  But now, every
> > device including
> > openssh (which has a default PACKAGECONFIG option for rng-tools) now
> depends
> > on this deprecated service, which may cause unexpected boot delays.
> >
> >     So changing this service file to be triggered by a udev event or
> maybe
> >     wrap it in a script, which makes sure the right modules are loaded
> and
> >     device nodes are available, could be an improvement, but it would be
> >     out
> >     of scope of this patch IMO.
> >
> >
> > I'm more curious whether this change should be reverted from upstream.
> > It seems
> > like a drop-in file could have been applied to your distro instead of
> > adding a dependency
> > on a deprecated service for all openssh users.
>
> This patch just adds a missing entry into the service file. If you have
> solved the described issue in some way and can revert this patch and
> remove the `Wants=systemd-udev-settle.service` then you can also remove
> the `After=systemd-udev-settle.service` at the same time and at that
> point you can just remove both of those entries directly in the patch
> that solved the timing issue.
>
> I agree that `systemd-udev-settle.service` should probably not be used
> anymore, however that file already used it in a non-functional way and
> all this patch did was make it fulfill its intended function.
>
> In retrospect I probably should have tried to find a way to remove the
> usage of `systemd-udev-settle.service` completely, when I looked into
> the issue, however all this patch in essence does is revive dead code,
> which was already in place.
>
> Also I think at that time I couldn't find a more precise instrument in
> systemds massive toolbox to delay the start of rngd and services that
> should be started in succession until the just the hardware random
> generator device is ready and `After=systemd-udev-settle.service` was
> already there. I guess some `ExecStartPre=` script which delays the
> start until the conditions are met could be implemented, but that seems
> a bit hackish.
>
> regards,
> Claudius
>

--000000000000effd6305d71db879
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Claudius.=C2=A0 I really appreciate your responses=
.=C2=A0 I&#39;m not trying to be pedantic.=C2=A0 Since I don&#39;t have you=
r test setup, I was just trying to make sure I understood the context of th=
e problem as I figure out how to deal with issues this is causing in our se=
tup.<div><br></div><div>I was also hoping one of the recipe maintainers of =
either systemd or rng-tools would comment on systemd-udev-settle.</div><div=
><br></div><div>I&#39;ll take a look at the caam module to see if I can und=
erstand how it works.</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 3:35 AM Claudius Heine &l=
t;<a href=3D"mailto:ch@denx.de">ch@denx.de</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 2022-02-02 17:26, Kyle Russell=
 wrote:<br>
&gt; Thanks, Claudius.<br>
&gt; <br>
&gt; On Wed, Feb 2, 2022 at 8:08 AM Claudius Heine &lt;<a href=3D"mailto:ch=
@denx.de" target=3D"_blank">ch@denx.de</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@denx.de<=
/a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Kyle,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022-02-02 13:38, Kyle Russell wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Is this the correct approach?=C2=A0 Even the<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0systemd-udev-settle.service man<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; pages recommends not using its service.=C2=A0=
 Were the kernel modules<br>
&gt;=C2=A0 =C2=A0 =C2=A0really<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; not loaded when rngd started?=C2=A0 Or is the=
 original problem just a<br>
&gt;=C2=A0 =C2=A0 =C2=A0matter<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; of waiting for sufficient entropy?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0IIRC, the rngd could not find any random source dev=
ice node (/dev/hwrng<br>
&gt;=C2=A0 =C2=A0 =C2=A0in that case), so the service failed to start.<br>
&gt; <br>
&gt; <br>
&gt; If /dev/hwrng didn&#39;t exist, this feels like the original problem w=
as a <br>
&gt; misconfigured<br>
&gt; kernel or module that wasn&#39;t being loaded properly.<br>
<br>
Yes, however it is a timing issue. The module was loaded properly at <br>
bootup, however at the time rngd was started the module was not loaded <br>
yet and thus the service fails to start. If it would be delayed until <br>
the module is loaded everything would be fine.<br>
<br>
It does not happen if the module is compiled into the kernel or if a <br>
initramfs is used which loads the module (I think). I our case it <br>
happend with the caam module as an external module loaded on boot from <br>
the real root file system.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0The patch you are commenting on only adds `Wants` w=
eak dependency to<br>
&gt;=C2=A0 =C2=A0 =C2=A0make sure `systemd-udev-settle.service` is pulled i=
n to the job queue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0the `After` ordering rule was already there.<br>
&gt; <br>
&gt; <br>
&gt; Correct.=C2=A0 Just because an `After` exists does not mean the servic=
e gets <br>
&gt; pulled into<br>
&gt; the job queue, so prior to this change no other service was causing th=
e <br>
&gt; deprecated<br>
&gt; systemd-udev-settle.service to be run during boot.=C2=A0 But now, ever=
y <br>
&gt; device including<br>
&gt; openssh (which has a default PACKAGECONFIG option for rng-tools) now d=
epends<br>
&gt; on this deprecated service, which may cause unexpected boot delays.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0So changing this service file to be triggered by a =
udev event or maybe<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrap it in a script, which makes sure the right mod=
ules are loaded and<br>
&gt;=C2=A0 =C2=A0 =C2=A0device nodes are available, could be an improvement=
, but it would be<br>
&gt;=C2=A0 =C2=A0 =C2=A0out<br>
&gt;=C2=A0 =C2=A0 =C2=A0of scope of this patch IMO.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m more curious whether this change should be reverted from upstr=
eam.=C2=A0 <br>
&gt; It seems<br>
&gt; like a drop-in file could have been applied to your distro instead of =
<br>
&gt; adding a dependency<br>
&gt; on a deprecated service for all openssh users.<br>
<br>
This patch just adds a missing entry into the service file. If you have <br=
>
solved the described issue in some way and can revert this patch and <br>
remove the `Wants=3Dsystemd-udev-settle.service` then you can also remove <=
br>
the `After=3Dsystemd-udev-settle.service` at the same time and at that <br>
point you can just remove both of those entries directly in the patch <br>
that solved the timing issue.<br>
<br>
I agree that `systemd-udev-settle.service` should probably not be used <br>
anymore, however that file already used it in a non-functional way and <br>
all this patch did was make it fulfill its intended function.<br>
<br>
In retrospect I probably should have tried to find a way to remove the <br>
usage of `systemd-udev-settle.service` completely, when I looked into <br>
the issue, however all this patch in essence does is revive dead code, <br>
which was already in place.<br>
<br>
Also I think at that time I couldn&#39;t find a more precise instrument in =
<br>
systemds massive toolbox to delay the start of rngd and services that <br>
should be started in succession until the just the hardware random <br>
generator device is ready and `After=3Dsystemd-udev-settle.service` was <br=
>
already there. I guess some `ExecStartPre=3D` script which delays the <br>
start until the conditions are met could be implemented, but that seems <br=
>
a bit hackish.<br>
<br>
regards,<br>
Claudius<br>
</blockquote></div>

--000000000000effd6305d71db879--

