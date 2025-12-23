Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2761BE6F064
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:31:12 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96624.1766475070956680777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pbgc5YHV;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959187c5a9so4222929e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 23:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766475069; x=1767079869; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wFL6HEcBsQzA8KedyvLYAIXTmpjUxlvgcdusOaW9tZ8=;
        b=pbgc5YHVFRYD/Xzxjvc76fNh+2p4qDhy312Z78pAb5VxeZsjkBsRH/mlwUAawwHmj4
         Rj5Cv9tuxVNCunOt/OV3H/3FvxQunQ2/ldhIKm+4HEKrNSCCQFak1X+I70xOhRtawm9E
         VMJovYKFj0Pdx/K8ACT7Ds2VGQOgBjBpEta6erypKgPxfAVHZxKAA6zR6909r5enDBQF
         KmTRvlQpDftY87zTTuJnf28mWEa/PwQ9clCTjv6rnVt119bRP+yV6kaBrgKoLT4FF5XD
         cOewF7jcPuAw/DtP5j1HCVcJ/ocMHYNWvuWDsouYM/1Zi76jfY98SlAA1xduHlNzKCrR
         ysZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766475069; x=1767079869;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFL6HEcBsQzA8KedyvLYAIXTmpjUxlvgcdusOaW9tZ8=;
        b=QU9ZvPug4DHeZwOHSsb6LuC2JvWanselCvGzQuvkmK1HAbgjUL407XvDjdo8gm4NoG
         YE1Ik1Anbje+nkx6c8l2uL2ainaNhSdQrtPNTK6SSoqBLC96TxihURafOHZmjVVzU2XW
         KYNZHK5BEL8Yg2uVbpVw6jvwbU7bVRdjsj3f2X2PYK9UP9+6iRfPmqXhO+DOk47Hb56L
         JQ5RXxwgFQ6FqqFyAVlqI8GHumGgI8gX2IA0F4VlbG+JBLYJerZz1Jpl4Ai1pHCo2k9n
         38FQ2LqQ+YvP6LqfgOYfx8sB67sZVmBT1AvI41cbqWtRsmTVWgyv0PsI8H7HOMuQMCwx
         ZNHw==
X-Forwarded-Encrypted: i=1; AJvYcCWiSr4dSPZaBCFxGq0ujq/oX23dS9/B/TszNElBoZczlzx84KYzmBuymdzWLay/FvdKrKrrA/tKt1RnK7W+myDJnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YziFzNyAkM5/jbpUfWSm9KMpe4ulEP3UeMuYdCeYps27vv9/ZIn
	iC+AP72Dy0mI2DFpx9sEHJChwGbWNT7FDsicgvMiFlOD0nE4S78EUcwQTboSso5Y8mu1jgSznQO
	FXI4ujJo=
X-Gm-Gg: AY/fxX6BpTpmpknqTKSzD85/qgO0hwbf3sQ7p4Xbr4dUykCvf9kPT7ixF/j9BL955vH
	pMd3+Arg/+6mGOpLEpwtghI4KRSt4Ec52u9K5bci5URoqhGzQXDiRUZ1fUL3uI8pO9TtHiDN38p
	K7/5ki5Cz+aqYu86KazJQwrky4WsEKG8419q9WFfzLT8+W//ZpGLyFwHyUe7pYheVPEhJv+bBAA
	DXNPv1IGNab/uibvSyLCAvPbtXg4QjAQr/rXoctAP1eZVnJzKqzDP5t6oyrMZBx2ZA/31wgTmbE
	QQSK/rsPXcgqcFcUJzQNUVBH1V3x6d+BbHIPRQvUItPAXGJM/ZNTxpsL+N5s86Fg5L2DtxMeKjT
	AXOioDhoaGMLlTxw09XPO0yqGpeZNIBegRoHxcArIAyM3QDxKGaxOaPkYLHgS5GY1Yd/0O+PasC
	V1lGs/h+P+0xxC3MN2uEjdbH8lPnU/aPu65k6mFsVw7p/E
X-Google-Smtp-Source: AGHT+IElcXLmAPzpdNz5+ljLpO6N/VyFjcFtQueR2pvkPiJ7ZjsbqHe52RajfrTMa8cn/bsT46bHTA==
X-Received: by 2002:a05:6512:1541:10b0:59a:1bdf:c437 with SMTP id 2adb3069b0e04-59a1bdfc55dmr3005728e87.11.1766475068899;
        Mon, 22 Dec 2025 23:31:08 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628388sm3884401e87.99.2025.12.22.23.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 23:31:08 -0800 (PST)
Date: Tue, 23 Dec 2025 09:31:06 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: bruce.ashfield@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/21] linux-yocto: combined and consolidated
 pull request
Message-ID: <aUpFOgfOv3FOk8vH@nuoska>
References: <cover.1766087617.bruce.ashfield@gmail.com>
 <5044d0ec483159af764bfd2b51baf08e6410ec8e.camel@linuxfoundation.org>
 <CADkTA4OCyZUO5ASTEi+i7iyhYD9Zp8byzYOa+4UBLfGt2w+xnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4OCyZUO5ASTEi+i7iyhYD9Zp8byzYOa+4UBLfGt2w+xnA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228456

Hi,

On Mon, Dec 22, 2025 at 10:34:14PM -0500, Bruce Ashfield via lists.openembedded.org wrote:
> On Mon, Dec 22, 2025 at 9:13 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Hi Bruce,
> >
> > On Thu, 2025-12-18 at 15:22 -0500, bruce.ashfield@gmail.com wrote:
> > > As discussed in the weekly engineering call, I'm sending this as
> > > single series even though it crossed boundaries of the repositories.
> > >
> > > I don't have access to meta-yocto-contrib yet, so I haven't pushed
> > > the component parts to contrib branches yet, but will do that for
> > > future pull requests.
> > >
> > > I'm using this as a first run through some things I've cooked up
> > > to coordinate the patches across the repos. The formatting is my
> > > own, so apologies if it isn't clear .. and we'll see if it all
> > >
> > > Now to the series for OE-core:
> > >
> > >  - We have stable updates to 6.12
> > >  - A kern-tools fix
> > >  - Updates to 6.17
> > >  - Removal of 6.17
> > >  - Introduction of 6.18
> > >  - Bump to libc-headers to 6.18
> > >
> > > I've built and booted what I can locally, and I know that the
> > > major architectures work, and are functional with respect to
> > > core features.
> > >
> > > I have more libc-headers testing running against meta-oe and
> > > muslc, so there may be some breakage there and I'll help deal
> > > with that if it happens.
> > >
> > > The update and then removal of 6.17 is on purpose. In case any
> > > one was using it, they should get the latest tested before it
> > > starts to be removed.
> > >
> > > For meta-yocto:
> > >
> > >   - removal of any remaining 6.17 references
> > >   - introduction of 6.18
> > >
> > > The meta-yocto default changes are obviously REALLY RFC/RFT
> > > there will be issues, but I've provided them anyway to make it
> > > clear that we are going to 6.18 as the new default for all the
> > > variants.
> > >
> > > Once we get 6.18 fully green and the h/w references udpated,
> > > I'll remove 6.12 and 6.16 from master. That isn't in this series
> > > by design.
> >
> > I ran this through some testing and it isn't straight forward.
> >
> 
> Back online after a 10 hour drive!
> 
> > We need a newer strace with the newer kernel so I queued that patch
> > from Robert. That caused ptest failures so I disabled the failing bpf
> > strace ptests.
> 
> ok. I'll ignore strace and assume that bump will handle it.
> 
> >
> > ltp failed to compile so I backported a patch to fix that.
> >
> 
> ack'd
> 
> > We still have a cryptodev-module failure:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2922
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2897
> > (all world builds I think)
> 
> I can handle this one, it'll be.a day or so, but I also haven't checked
> the  autoupdate list yet to see if this is in it. I'll check the lists before
> I start and see if anyone else has an update in flight.
> 
> >
> > and an initramfs module space problem:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2931
> 
> And a config warning (easy for me to fix).'
> 
> For the space. Is it only genericarm64 that we do this test on ?  It
> could either e normal kernel size increases, or it could be all the work
> that has been done in genericarm64's config that has causes this.
> 
> If it is normal kernel, then I can have a look for something obvious,
> and then we can increase the size. If it is only genericarm64, then
> we should get Mikko's opinion on what might be options we could
> tweak to reduce the size.

This is normal. More drivers as modules, dependencies to firmware and slight
increase in kernel size hitting the limit again. I think increasing the limit
is the way to go now. I've been hitting this limit locally with 6.17 kernel too
after some more arm64 drivers are enabled.

Cheers,

-Mikko

