Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0347DC25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 11:35:37 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.13089.1717587321348381261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 04:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XHHedSWG;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so80999941fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717587319; x=1718192119; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RdRMpw1TOzXp3i/oxUyry9/AZOMX/zq9B9uRIFtMUTI=;
        b=XHHedSWGGaaNgpfcr6MuRYaWJ9QlynDihnQXvJ71Atyey/vzdO3+kK+FVq1Z2Kt2zq
         3Vpn4eDSF5nH5QlcBCLety5aIC8+U6wBFVOGtao/afVZ+4FZWywqML6a1tdPoO2tyy72
         kP6kGS/d4UqFMFF2bRNr3zHNoOoH9mvW03fRaHkWmHWyT0OWxDO00tODTzwwxiMBmiOq
         et0lAfbSUm9D3QZuF2GtJEWFHXgzH9QhJn7QYO9cXg4UvLcW8SF0tGoG85hxKXezoKZF
         HP4oKd+Tlu0p4spkjTUuVckuhvX9soWCq9/wETwCqElAJ7Q4yGGPT/geGhaB9HRBzD1y
         IyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717587319; x=1718192119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdRMpw1TOzXp3i/oxUyry9/AZOMX/zq9B9uRIFtMUTI=;
        b=oxf6lyfqAPW1TDHh4m+qBKCpuUjjwNBsZ9TqfAmRs89arVs8cLJXrbkLJvmKygf1G0
         PRKeGTqLv2xTn53WPVnriBqsK/3S6M9EMdLTMqz3ASwyDIZG+HyOqk+yfpRWiW1LniNC
         y3jxfPz6MHua5Q0rDkufH8m2BEIlYHP2kutw4lYCZBS16lq2+S5YwXXcUCsHkXJh1fgy
         YzcFDemrw+YjlZHeqCs0E21xijR8Svtcfy4L6sUBeIiB/NUD4v5EXzx52oIsP7p3/vb/
         Dt00mDo6DsVR3PPopDj8QlSeyx5cWGRPBF/cpcELZmzFSFb4MD/mrYpM1wkOzi3dm8bX
         LtNw==
X-Forwarded-Encrypted: i=1; AJvYcCWUlSd6YWBZz4NSMBWv4PAY5rLpr5FwWAi7o3I595BdHRJU+hY949BJ00VdEFvqi6mPRk3YTpO8vrkzfCeW67/6LlCbS099szBEX7NHtwoTJSRWXNEbV7zR
X-Gm-Message-State: AOJu0Yy6ks+flGuhc2eCx/s3Lsg0UBTw5CJ+LkXL6AiTv1ZivI3b/b74
	IWkaXkxthczD5dqBZ/rW8EZvGs2sZQmNQwTU3XqlMATCY/QL7FpJnENAsIwkMeN11+K78Y7aclT
	UrfEVp+MVd2sOvStB8AFs7ayhl6Y=
X-Google-Smtp-Source: AGHT+IEyxywY5IA1hZkoc5NBmY606e+AoTWx3bkg2GZ7uiKg6bsE1ve5KVx2mx7JTBhsNydJQzSuUldGMWTJbQAdIgo=
X-Received: by 2002:a05:651c:234:b0:2ea:59a1:2810 with SMTP id
 38308e7fff4ca-2eac7a988ebmr12463071fa.48.1717587319301; Wed, 05 Jun 2024
 04:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <aa532133-c872-4bde-8479-dba12de225c7@bootlin.com>
 <beedf05b-3b5e-4468-a6d1-46d7d6734246@cherry.de> <17D5C581F2EC238F.7636@lists.openembedded.org>
In-Reply-To: <17D5C581F2EC238F.7636@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Jun 2024 13:35:07 +0200
Message-ID: <CANNYZj92YgWuYYw+ofrRSJ-TW60AHksUOyY7xeY9sneUEv8DcA@mail.gmail.com>
Subject: Re: [OE-core] mesa: build failure in CI, dependency not found
To: alex.kanavin@gmail.com, Markus Volk <f_l_k@t-online.de>
Cc: quentin.schulz@cherry.de, joaomarcos.costa@bootlin.com, 
	openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 11:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200361

I think we could ask Markus to look at this update to 24.1, as he's
done work with libclc  dependency previously (and authored the patch
for it, which should preferably be dropped).

Alex


On Tue, 4 Jun 2024 at 12:13, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> I don't think you need the full log. The key part is:
>
> Run-time dependency libclc found: NO (tried pkgconfig)
> > |
> > | ../mesa-24.1.0/meson.build:852:12: ERROR: Dependency "libclc" not
> > found, tried pkgconfig
> > |
>
> So you could find meson.build in ${S}, find line 852 in it, and see
> why that line is being processed and what enables the block of code
> it's in. We also have a libclc patch that looks highly suspicious to
> me (and should be dropped tbh).
>
> Alex
>
> On Tue, 4 Jun 2024 at 11:37, Quentin Schulz via lists.openembedded.org
> <quentin.schulz=cherry.de@lists.openembedded.org> wrote:
> >
> > Hi Joao,
> >
> > On 6/3/24 5:39 PM, Joao Marcos Costa via lists.openembedded.org wrote:
> > > Hello,
> > >
> > > The following error was raised in Swat's CI:
> > >
> > > | Run-time dependency libclc found: NO (tried pkgconfig)
> > > |
> > > | ../mesa-24.1.0/meson.build:852:12: ERROR: Dependency "libclc" not
> > > found, tried pkgconfig
> > > |
> > > | A full log can be found at
> > > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/build/meson-logs/meson-log.txt
> > > | ERROR: meson failed
> > > | WARNING:
> > > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874:171 exit 1 from 'exit 1'
> > > | WARNING: Backtrace (BB generated script):
> > > |     #1: bbfatal_log,
> > > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 171
> > > |     #2: meson_do_configure,
> > > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 160
> > > |     #3: do_configure,
> > > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 149
> > > |     #4: main,
> > > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 184
> > > NOTE: recipe mesa-2_24.1.0-r0: task do_configure: Failed
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6680/steps/12/logs/stdio
> > >
> > > Mesa was upgraded a few days ago. Could it be related to this error?
> > >
> >
> > Likely yes, can you provide some info on how I can reproduce this
> > locally so I don't have to hunt this?
> >
> > Maybe you also have access to the full log somewhere?
> >
> > Cheers,
> > Quentin
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200323): https://lists.openembedded.org/g/openembedded-core/message/200323
> Mute This Topic: https://lists.openembedded.org/mt/106464279/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

