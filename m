Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E60CECAAD2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 12:01:29 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.58415.1661688082307122766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 05:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WmN7rfsJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id q16so5588646ljp.8;
        Sun, 28 Aug 2022 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=T0Eqodm2tOFPXtKAOIimV0ub+TYjLwppM2EYGV+Z3nU=;
        b=WmN7rfsJsXVzIkve6gq5u0pMwmiNy7e3TfbYekTNubvxC2j0w8Epc4U8lUDTrGi0S5
         VifwaQoSOrgfiZKoj0UmNMgU+ZlhjsEZm3/KHS5yGhBadUd+NVapJdHPKEol3BKwy7wU
         iUySGrrLXRKcop8L9f6nQxgxBYoIkCbXmmhbQM+7c3XIn6r8IDKmUEcOGJQEEIN8aJbD
         np3mrK5h3cI8FMp119F/TWn6lPNxBVFKTQKx8jBt0kGK3C5Sys8AMI1Qd7OUGLEjZAOy
         NxOWHVhNPCaUDTk+WqG3oAqjZEvva0H7mx23bPOCHmZRUK5Ejnr9fu1GCrmcTX9CMs2V
         3LoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=T0Eqodm2tOFPXtKAOIimV0ub+TYjLwppM2EYGV+Z3nU=;
        b=V+Wcwdgc5XchKJTYXfOmyZkVLWFTNES2WLIoyDRMfjpXleKTFV2sxp+H73WVHXi09I
         Vbuypm/h98OqCkuEZcCX7VaR1WOiYvragQwnx6Kqs0grqd9txYCcglHHL/OiHCKh8+MR
         fVFDgdDezGR5XX0K4cV9XIoRO+vpsN6Gz9s4A6t+lOBUmiD++Hj2v02Pa36xJkIzZGsE
         S1io9sG5cEckgiWJB5Z8HEOyksFkmIbAicGwNnm5pjnNtf70gnLYuAavnJDPApFZOIAd
         GmauEibQlH4qQRpriSUsK/5wWvA+ZF/KCdTyVM9AuVr6Ya8gR0Dm+kWfPg04/JmaI6Vq
         PB5A==
X-Gm-Message-State: ACgBeo22Eyl7koD2aXWA5PtSYn06j/aF3hNvQEZyETmAKN4xRknhEmf/
	Fq1E6L6zAXR3WrjvNpfJ1tAZsIg300tuEJgVEkk=
X-Google-Smtp-Source: 
 AA6agR4XbSP1+oBU581GbxD1TdyNQi/PQMrmxNhrxmmz+5tVs5N2qMdMjbE2M11r1uEvpZ70mSEniMrBz8N+AyO+tjA=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr4411677ljk.56.1661688080031; Sun, 28
 Aug 2022 05:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220825203451.2074080-1-alex@linutronix.de>
 <170EEE7825BF9D73.11791@lists.openembedded.org>
 <20220827213209.02c7bba4@booty>
 <170F511AB039C9FD.22386@lists.openembedded.org>
In-Reply-To: <170F511AB039C9FD.22386@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Aug 2022 14:01:08 +0200
Message-ID: 
 <CANNYZj-bDq3VaZTu68SS7VgZ_31680f+mxcC-gGYXox42+jXqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] bitbake-layers: add a command to save the
 active build configuration as a template into a layer
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 12:01:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169980

Okay, all this fixing and re-fixing might have become confusing. I
pushed the latest, complete, rebased patchset here, so you can simply
take that:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/setup-layers

Alex

On Sat, 27 Aug 2022 at 23:32, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Sat, 27 Aug 2022 at 21:32, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > This series appears to have generated other errors on several qemu
> > builds:
> >
> >   ERROR: core-image-sato-1.0-r0 do_testsdkext: Couldn't install the extensible SDK:
> >
> > To me the correlation with your code was not immediately obvious, but
> > as Ross suggested I removed your patches and the failure disappeared.
> >
> > Some logs:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/5114/steps/16/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5737/steps/15/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5724/steps/16/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5721/steps/16/logs/stdio
>
> Thanks, I've sent a corrected patch for this as well now ( [OE-core]
> [PATCH] scripts/oe-setup-builddir: add a check that TEMPLATECONF is
> valid ).
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169973): https://lists.openembedded.org/g/openembedded-core/message/169973
> Mute This Topic: https://lists.openembedded.org/mt/93257020/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

