Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCA6C87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 17:48:41 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.28637.1754675317692319724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 10:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZOVQ7GTL;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e9033498768so2545990276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 10:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754675317; x=1755280117; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpkIgUflVk347A9VVOsn9fK6i88eUmFfMPL1uHG13Xs=;
        b=ZOVQ7GTLGdJDtpKoYlYh1UEBCMTlun7BNaTHQHP10FEo0YTv2XcLve/LIr4udwSkcT
         TMUbormdWDyAcUhqCZxV6XwGHOIl77xs6bBI4R47CjYKUCtM2/hN0kgz4w7rJaYysbFX
         sLbz/zT8ZGCQ7spO7EqYyfBrtQu2LlWgRP4+B6oHYAqXdV8CTIjU/icKpN+2fgh5Nqkc
         u9kQdIfoqRuTRvNz+6u+vr35NovD80+w5V3+1Fm5MunA5qs1OpgAoqMukcU47C5MZjX4
         UTFICXwyQ+XpB/NtSYJizHbpmc8N9ytqKsUzgdTILDhMOIvItTIhdtuDRYekVNAhxuL8
         ntBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754675317; x=1755280117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpkIgUflVk347A9VVOsn9fK6i88eUmFfMPL1uHG13Xs=;
        b=rZ1WlONjDFC7Eky+c0vYNzofnbddcHUSZn6sv5ZGtlBsu22LIfUahElejhbVcC2Q5i
         7+3HDdJ6Gf32WtRTdhoFmFA/VK8PuZ+/EfSqHmMZKEKSJDFKVBf+7vCLD3lJcQdrjLWn
         FFn8yVxsLvNRAEeGx+UCgWjmUs8GkpUxH5Ezz/W86MMthM+osTw7OJ0mBgakupU1D094
         CHSu5kB3km6REoolFK2jzEp1CQIiynDvol468FroFvAo3hM661jcpltI1qGoUc1OKLg+
         Mzw/J7yzGGbCktN//yE4ubgtTEeHGprWg0Pfbd6DIUE/qpSxzp2Kgm78Fl/rNE5ipnk3
         0GoQ==
X-Gm-Message-State: AOJu0YzbfmDwaqpTO81GTSw9cBpD7/VuPWNaqIAp2mZUZQ4dobJk5Np0
	wkzLA8Y18IZHnCA1+yyQFpSsyUj9+1OVl9ySKSp4hWvndP9450oFOVt7ROc/eW58Gf/PPmKcZnW
	gheIkIn+QDutk+FguQJijQYxUejqTMfE=
X-Gm-Gg: ASbGncudHngi9Gfu97h8+8HGo+IFgjs+5cd5OTr8qAqrhAwE+wMmZHfzt0vdaSy1Ume
	yeC7xCo/n3AriJY+X4/wWFyMDQ7iKKKZTueOcLvYnw3wV0jDpp8kLUhPjtL5lHATCt1dDElXbfh
	f8fttjnvDTkTdi7rS1lF9+ltO2rnfNZ0i2/CqMoki2A2ljUhGY1aSdfz/J/JQXP0bDiPyR5HF/m
	AEI5A==
X-Google-Smtp-Source: AGHT+IGp27XfL9KKVDpQYkYU/yu5+iyPRTWFrloRAaglv5EGchPAoHPK9TOLCq4Qt7JS5xQvY4rHNAkyKr8R51lWhFo=
X-Received: by 2002:a05:6902:154d:b0:e8f:ec13:20fb with SMTP id
 3f1490d57ef6-e904b5f7769mr3687060276.48.1754675316604; Fri, 08 Aug 2025
 10:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <f9092d37-56a3-47c7-bb04-396d7ba61691@ti.com>
In-Reply-To: <f9092d37-56a3-47c7-bb04-396d7ba61691@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Aug 2025 10:48:10 -0700
X-Gm-Features: Ac12FXw16WNM3cNCW3pZ3V5OXhg_Q9IfHrYO9X3Lr2FcCVbGPLVALJjhLuEhOQg
Message-ID: <CAMKF1spicyRpN1EYdDMJPn8e8He1qdCgbB1pKrCS0U+nfR-2oQ@mail.gmail.com>
Subject: Re: clang package sizes
To: Ryan Eatmon <reatmon@ti.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 17:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221666

On Fri, Aug 8, 2025 at 7:24=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
> I've been noticing that the master final build sizes have increased a
> lot from scarthgap to master.  Some increase is inevitable, but I was
> seeing an almost 10gig increase in size.  So I started comparing our
> scarthgap builds against our master builds and I tracked down the
> biggest offender to the packages (.ipk).
>
> So I dug further, wrote a perl script to compare the two directories and
> found two very big offenders.
>
> INC:   94M -> 4.1G  4366.38%  clang-staticdev
> INC:   18M -> 3.4G  19242.22%  clang-dbg
>
>  From the meta-clang setup in scarthgap to the oe-core versions of the
> packages I'm seeing a huge blow up.  Can anyone with some knowledge of
> the differences between the two approaches verify that this is expected
> and not just something overlooked in the new setup?

If you are using poky then you will notice

require conf/distro/include/yocto-space-optimize.inc

which should have helped, are you comparing this with poky or poky
derived distro ?

>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

