Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EA0C3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 06:34:33 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7893.1692945269398681819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 23:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VUuAoR42;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fee600dce6so5310275e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 23:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692945267; x=1693550067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gzWldy7tpb0ZdBKqjUQfunHz6CZxwkvAoliShHAYJ3k=;
        b=VUuAoR42gs5MkgzjV+2QqfGEm6zb0p2TgohwCjc/cNr1AkVPVDCaqk6TDOtDhZX9cT
         WwZ66PWrcsPfZrSSuPyupOUPrkS3gwuJVxPGr2Ul0o86fng8ewTrPpFRnz2uaSnKLl8w
         N9PRytZUWwIHYVNmhekMxelJBnKpf49YSgaVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692945267; x=1693550067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gzWldy7tpb0ZdBKqjUQfunHz6CZxwkvAoliShHAYJ3k=;
        b=iTOEbDoZVMWhtkR806ZlFexwI+JtPcauGX41oQkcZaNBS0DXukoL+0GIO3vf/w4VgV
         52t5PzbUkCmfmvSrAknd2J+ZdFCrm01oV1+5ZnErq/THAqI+3XWRtdzZ0Z4I/NhRNIK/
         layte80ZmY5Yn5Y4PgtEvAbvpM1K2DQ/2AVJ5AQgnRkhDjE1+aR8qPsOjLRDP9YCMiDf
         6eznuMRhGHQHlDnmfrNrlfarCsL2i3O2ofkn8OXh6RUJmioIMk7hGcp7cuB4M+FkThjd
         0uu0bg5R5EQ/kKzJEYaaFsy0uNh2DWLf1naM6e4S3/EBl8+ugHkmB+URqyVwuApPon+f
         8TCg==
X-Gm-Message-State: AOJu0Yx/EsZcU615S0U1ojtKe43BZQ0BbE6XmNAtmtzSTCqBGqluGQka
	rbu08IvZkptd3bZZrKVQP+Sj5g==
X-Google-Smtp-Source: AGHT+IEt5wqyFlG2twH9vbB+W//hQ0zm/7c+I9KIPdectIKj3xcGBed8qHV9+haH2ZzTv6coGFKUTA==
X-Received: by 2002:adf:fac2:0:b0:314:4c1d:1c0a with SMTP id a2-20020adffac2000000b003144c1d1c0amr14201342wrs.46.1692945267535;
        Thu, 24 Aug 2023 23:34:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f51:6592:7dd5:4623? ([2001:8b0:aba:5f3c:5f51:6592:7dd5:4623])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d6107000000b0031c4d4be245sm1219347wrt.93.2023.08.24.23.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 23:34:26 -0700 (PDT)
Message-ID: <36fbac7375b4ecdb2abd552d18606e9e6b62aa28.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Fri, 25 Aug 2023 07:34:25 +0100
In-Reply-To: <ZOhJuUWYSU8MmaCK@nuoska>
References: <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
	 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
	 <ZOSoIXLG7vH/GC1l@nuoska> <177DB4530EBE3FA3.24073@lists.openembedded.org>
	 <177DBC07E94591CC.4797@lists.openembedded.org>
	 <177DD0B30D8FEDF8.27837@lists.openembedded.org>
	 <177DD39B5534099F.27837@lists.openembedded.org>
	 <177E1FB73F514F09.8058@lists.openembedded.org>
	 <177E56C1DFAB4DFC.13053@lists.openembedded.org>
	 <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
	 <ZOhJuUWYSU8MmaCK@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 06:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186691

On Fri, 2023-08-25 at 09:27 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Aug 24, 2023 at 09:18:03PM +0100, Richard Purdie wrote:
> > On Thu, 2023-08-24 at 15:04 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2023-08-23 at 22:16 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Tue, 2023-08-22 at 23:01 +0100, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > so the commands are stopping mid flow for unknown reasons or the =
ssh
> > > > > connection fails. I can't tell if this coincides with an rcu stal=
l or
> > > > > not. Both logs do have rcu stalls in.
> > > > >=20
> > > > > After these failures the system does continue to otherwise work
> > > > > normally and subsequent tests pass.
> > > > >=20
> > > > > I wonder if the slow emulation might be causing the networking to
> > > > > glitch and break the ssh connection.
> > > > >=20
> > > > > I'm at a bit of a loss on where from here.=20
> > > >=20
> > > > I thought I'd update the thread with new information.
> > > >=20
> > > > I went back to the start with this and looked again and what is goi=
ng
> > > > on. Interestingly, I found one of the autobuilder workers would
> > > > consistently fail the qemuppc-alt configuration for core-image-sato=
-
> > > > sdk. I paused the worker and experimented.
> > > >=20
> > > > I saw two different failures (included below). One shows systemd-ud=
evd
> > > > timing out on it's watchdog after 3 minutes and resetting, includin=
g
> > > > taking out an ssh session running the cpio configure command. There=
 was
> > > > no RCU stall reported.
> > > >=20
> > > > The second failure shows systemd-logind as well as systemd-udevd wi=
th
> > > > the 3 minute time out, the kernel complaining about missed IRQs, an=
 RCU
> > > > stall and lots of breakage following including cut ssh commands.
> > > >=20
> > > > I could not get the cpio build test to complete.
> > > >=20
> > > > Interestingly, I came back to the same image/worker later this even=
ing
> > > > and now it all works fine. The difference is earlier there was a wo=
rld
> > > > build running on the worker, which continued to wind down even afte=
r I
> > > > paused the worker. By the evening, that background load was no long=
er
> > > > present and the ppc image works in isolation. This tells us the iss=
ue
> > > > is system load dependent and only occurs on loaded systems.
> > > >=20
> > > > I suspect I need to replicate the load and retry locally, see if I =
can
> > > > reliably reproduce the hang. The watchdog won't be present on sysvi=
nit
> > > > systems which also show the issues but I'd guess there is still som=
e
> > > > other starvation/timeout occurring.
> > >=20
> > > I've now seen the failure on the autobuilder:
> > >=20
> > > * with linux-yocto 6.1.38
> > > * with linux-yocto 6.1.46
> > > * with qemu 8.0.4
> > > * with qemu 8.0.3
> > > * with qemu 8.0.0
> > >=20
> > > I was a little suspicious of:
> > >=20
> > > "hw/ppc: Fix clock update drift"
> > > https://gitlab.com/qemu-project/qemu/-/commit/73d6ac24c81f1aeae554d46=
9616c9181511e6523
> > >=20
> > > but we've tested with and without that.
> > >=20
> > > qemu has just released 8.1.0 so perhaps we should try that next.
> >=20
> > qemu 8.1.0 brings with it a new set of problems but I've reproduced the
> > hang with 8.1.0 so it does not solve that.
> >=20
> > I'm really struggling to understand which change brought in these
> > issues for qemuppc.
>=20
> Are these issues visible on mickledore branch? Maybe mickledore with kern=
el 6.1 stable update or
> qemu 7.2 update to 8.y.x could be tested too. At least then kernel or qem=
u could be blamed
> for the issues.

Not that I know of.

I have now also reproduced the failure with glibc 2.37 instead of 2.38
including the fortify sources change and the 6.1.34 kernel so there is
something else causing this.

I've wondered if we need to try going back to qemu 7.2. It may also be
worth ruling out binutils.

It shouldn't be systemd as the sysvinit images show the issue too.

Cheers,

Richard



