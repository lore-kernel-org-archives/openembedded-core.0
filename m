Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65804CFB45B
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 15:01:32 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.11507.1728399684923609023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 08:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2LYuOuw;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5d5eec95a74so2892468eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 08:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728399684; x=1729004484; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vu+uhaZXm1NMVUE3FDvFLMhPJ+uPXLjLvNP+NwyreNg=;
        b=V2LYuOuw8NzaY4GVRw5ZOTftSgGU/ISPxao1TU3M2YIusCGhGKT8r2gMvrErsmCyZJ
         jPfw9wV0q45IvU+v6DgpZEQHWSQUyzRHVbMquRxNpkdXquSb+ilFYubsv3/bphaRLKSc
         GsxSEOdgwBVzvMtHEnu2zSAt0EFWh3Wc7WVt5AcYLjdnMN1bmpoCVyrLEMSJtdxHRT5z
         sFatv6yUB2xkika67ag3GO4dbEbTGJVXQeBACwhA8xdj1n9HjHYooDfoKTf8opE3H9+o
         sSeXrHD3BVYDcYNJ7goskyuHxdzQkK4JrKF83Ii5UpSTdTVNmljoZwVz91Rpy0DkJT1n
         ztCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728399684; x=1729004484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu+uhaZXm1NMVUE3FDvFLMhPJ+uPXLjLvNP+NwyreNg=;
        b=cirV6D/UUsoe++vfW0S3fx+4EH4TFg8rRF5XDasY4yTrIR8/WxLuNtpDsMELvgZXi3
         GVYxLhzCoECT45sf336ASPp7nIDJQQXW+WSrQcCA8w2uLGIrmjUyJJ/gg0zPy1GckgO7
         4aUAPaUIePhx85XV4oytfYzQtCZWLnVur0bbakiiOToqrvsTWHhm+U7S5QYYCUAvsWx2
         6h/KWARNimx7z+ab6zlkyEhABbgndDniiqHp9Tz236N1RWPQe9Lr+4082EW68v9dXQjq
         y8tfNCuGh6oX1T053weEVJRCTyQXe3OERwHDpFocLb0chkIAcJ966ItWI+VGphBoYUdY
         Bq1g==
X-Gm-Message-State: AOJu0Yxmk6BG2+V2jfFqsz5EJ+smRdGK+QJmg3mohw//F32Rt9n68OTA
	7eo3//0Sp94lqOo8rcnWlDj7Iy4QkEWsBr2sC90WDD7cJiYGzQiRqv8hz1Lun0TcGL9tjtc778q
	WdJLoje5A0Hi6+YhYXUztLXxKeA8=
X-Google-Smtp-Source: AGHT+IEysGCy5LUjdT82w5OpqLU0R+vgF9qb41MAUoOg6arfm3R6O6+c7uD6JvS9YsnzrV/mRALY83kzzrfRlA4Vdts=
X-Received: by 2002:a05:6870:3327:b0:277:f399:705b with SMTP id
 586e51a60fabf-287c1d3c191mr12947803fac.1.1728399683715; Tue, 08 Oct 2024
 08:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <8d4ad42e-eed1-46c0-a255-2fef4462ae96@gmail.com>
In-Reply-To: <8d4ad42e-eed1-46c0-a255-2fef4462ae96@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Oct 2024 08:00:57 -0700
Message-ID: <CAMKF1srVfpkFB5fXWg=FmyROvxpciOyYSNWo0e+wutbY8jZGSA@mail.gmail.com>
Subject: Re: [OE-core] [styhead] gcc 14.2 fails to build for cortexa15t2hf-neon-poky-linux-gnueabi
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 15:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205292

On Tue, Oct 8, 2024 at 6:11=E2=80=AFAM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi,
>
> I have observed a gcc recipe build failure in the meta-mono CI here under=
 styhead:
> https://github.com/DynamicDevices/meta-mono/actions/runs/11232177725/job/=
31223236463?pr=3D231#logs
>

is this failure persistent or one-off ? how much RAM does the build system =
has ?

> The meta-mono CI uses the cortexa15t2hf-neon-poky-linux-gnueabi for its A=
RM32 builds.
>
> Is it a known issue?
>
> Thanks in advance,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205290): https://lists.openembedded.org/g/openembedde=
d-core/message/205290
> Mute This Topic: https://lists.openembedded.org/mt/108888373/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

