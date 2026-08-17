Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3126BC5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:05:15 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27675.1786964705305553844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QgPQDKUC;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso28104851fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786964703; x=1787569503; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0Z1jK7hIwPZi2Cv5i3tz+xaRhq9HW2B1aFZlMN59k4=;
        b=QgPQDKUCYt0+957p5dpWBzJ+85kNDuFrWRyOk4TflucC7strb/JH2Jgg2K8d91TfF0
         UxNEqIKJNpOTHoo3K9qUO1hPA1aPGDUL0wSvee9o+Ng0RCpQZ60m3y0CFq66wbfsz1W2
         Ts4v7QfBXG6SAXXSIQhsEB99PIjuSNafaDDzFrm1z4qdnCC5dsr+a2uf7gn0bFEtMtD5
         4Z3SV6ueVuaQ70QkuFXLSSHQS90RFzZq6fTjnusC7mcr6wUATuERsDuyydF/Zl6knhFx
         pKDyrO/3iiWuPJey3gdP5lyh9OUSJd2D2Xd8iI07RfXoXpQoES648zLm9Z3lc2NvSRHS
         j8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964703; x=1787569503;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x0Z1jK7hIwPZi2Cv5i3tz+xaRhq9HW2B1aFZlMN59k4=;
        b=gmdHokHYun6EZ6LWgJeEB+JhqlBI//BtndEvPUlvbJc/0+A4P5izS69wtAo8EmwRbe
         k1F8Gg6qFVPdnjuZ4lR6roamalOYhC0D0OW+he7rlfos69LwxFZtdgWe/EoD54edP2r0
         gj0Z+KJ5wOHuWvbxT1+aTprqBWSakuobjaWZYo3Wy/DpLAvykEv2yHO/fEXi1JyjnVvn
         PcukUky28Tc5/R4cjtz+T02sj1IdGOHTKEgHiYttJM1HA4Zu7zBQ/aEtA/Wl63NrgatG
         lCdkkYVrMegox6d2tK+CYL6AyLH70fG9YVnbFcn+ZeCZBh4KANp5b/CVDfvKMK6nnUmg
         x87A==
X-Forwarded-Encrypted: i=1; AHgh+RoN6DSv7Mp+6Mn1NrN7QMZ3dXV3isfiQaltGXJLmJFSHEBthUHhjgN36gFBlWfMC407E173sq1tRHy8aYqJim7ehg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+TD2vVzSCCecZwlcba26Iuo1fNX4RwwUdxysKyaphxSL/ARPJ
	6F77z3ba32+mguwD+vITf1q1Ltnyu64lGmFSAoHwmlAF3K//R/a3OumEBN/CEuB9q8M=
X-Gm-Gg: AR+sD11L8cTBvOMozDhZ/Au8faTn8L6HGoZ4PEuTvyx0QOgD+8YuwxTZekzlPH/urps
	BawwnKbb70wmfmZUXKZDV/GvlyxiyDPQCBNh361yLwMyaOQACECZXaPKEdPn3nIDGHVGdzAJRTQ
	6qC2k0JAUaEeHV6yoLzL1+RyOs5xdRLqIPA3C68TwxVy9ilzHvDHKZOSkWqy80nHaF7Fd2fXsfB
	8BJsQiMbFbo97BVLSyJz1gnn1tKcqFFHuAn37jyTq3eyrGute9L2JRA8uZPpsANrBpZKJO/UODQ
	TQSCFPzleK8PM6rcomuwuhHPXTkGTVjGwuPWDJ5FMTpClZCKzbn3W8Ui1Qk7lcVaud9yNfr9SBD
	GoU7DtBk+mr5lu3xYGrxOuE5nbGb3G+1n/k0I2OmhnsHm4IxTr5LMn7Nu0/gMkpUeXoKU1J19Z1
	46yICzG/JnfHPmz7YNGel9QaxogueV4qMZH6mNN+rtQu1oZdDCyWx9Zjkibo7AfZZxC6mCfPnp0
	teXRINXuBcpa/s=
X-Received: by 2002:a2e:bc07:0:b0:3a1:4a:8a3d with SMTP id 38308e7fff4ca-3a1327cd98amr20958231fa.22.1786964703089;
        Mon, 17 Aug 2026 04:05:03 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1aafb3sm3260101fa.26.2026.08.17.04.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:05:02 -0700 (PDT)
Date: Mon, 17 Aug 2026 14:05:01 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/4] lttng-modules: update from 2.15.2 to
 2.16.0-rc2
Message-ID: <aoLq3Tmi75dFRKCs@nuoska>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
 <20260814064812.1071873-2-mikko.rapeli@linaro.org>
 <2b6fbd07547d07ddb00539fc0bf7b8434633f26e.camel@linuxfoundation.org>
 <an77qXLFBuw245kW@nuoska>
 <CADkTA4PdqyL4GjRAE+ob4vYMxVuKdQZ22Yc+3kTE-O1NMrji2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4PdqyL4GjRAE+ob4vYMxVuKdQZ22Yc+3kTE-O1NMrji2Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243610

Hi,

On Fri, Aug 14, 2026 at 08:50:20AM -0400, Bruce Ashfield wrote:
> On Fri, Aug 14, 2026 at 7:27 AM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > On Fri, Aug 14, 2026 at 11:48:32AM +0100, Richard Purdie wrote:
> > > On Fri, 2026-08-14 at 09:48 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > > > To support kernel version 7.2. Fixes build error:
> > > >
> > > > > lttng-syscalls.c: In function 'lttng_syscall_event_enabler_create_event':
> > > > > lttng-syscalls.c:612:17: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
> > > > >   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > > >       |                 ^~~~~~~
> > > > > lttng-syscalls.c:101:1: note: include '<string.h>' or provide a declaration of 'strncpy'
> > > > >   100 | #include <instrumentation/syscalls/syscalls_unknown.h>
> > > > >   +++ |+#include <string.h>
> > > > >   101 | #undef TRACE_SYSTEM
> > > > > lttng-syscalls.c:612:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > > > >   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > > >       |                 ^~~~~~~
> > > > > lttng-syscalls.c:612:17: note: include '<string.h>' or provide a declaration of 'strncpy'
> > > > > lttng-syscalls.c:704:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > > > >   704 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > > >       |                 ^~~~~~~
> > > > > lttng-syscalls.c:704:17: note: include '<string.h>' or provide a declaration of 'strncpy'
> > > >
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > >  .../{lttng-modules_2.15.2.bb => lttng-modules_2.16.0-rc2.bb} | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >  rename meta/recipes-kernel/lttng/{lttng-modules_2.15.2.bb => lttng-modules_2.16.0-rc2.bb} (94%)
> > >
> > > This probably needs to have a PV of 2.16.0~rc2 else the version sorting
> > > when we upgrade to the release won't work...
> >
> > Then the version is different compared to upstream tags. For CVEs I can set
> > CVE_VERSION.
> >
> > > Do we know how far off the final release is?
> >
> > Honestly I don't know. Past releases seem to have around six weeks between
> > last release candidate and actual release. v2.16.0-rc1 was tagged 7 weeks ago,
> > v2.16.0-rc2 just two weeks ago so feels like it is quite close now.
> 
> That's why I've always avoided the lttng-modules -rc releases and have opted
> to just cherry-pick the patches supporting the newer kernels when I go through
> an uprev cycle.
> 
> That being said, the -rc isn't any riskier than that approach, I just don't like
> timing their release.

Digging a bit more into this I found that the needed patches are also in upstream 2.15 stable
branch pending release. I will pick those separately to current 2.15 recipe and they can be
dropped when new point release update is done.

Cheers,

-Mikko

