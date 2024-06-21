Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18790C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 14:24:51 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.74444.1718979881066348935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 07:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E1MW6sTq;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5295eb47b48so2585921e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718979879; x=1719584679; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tuo/HjHSqCqeNETnCJYZAGa2TnMIXNIvX0RztOdKd4=;
        b=E1MW6sTqVUvBRWXhjDYAWzk36AwrEAAo3hnBJB7v2pXLK1wkDK7WPXue7xZCey89wG
         xLpT42ML9d8Xd3hSR1mva/S9/ZMBxhsKktd+8X3WDpOvx3whfLhs9qyaN3wSQA7nKJrq
         FywhedCH62FSycI+1uJ4mjLVmac9cMgGDwCCZNzHGR9+8+K1TTasoYfN1hsaZvufpAch
         3wzQsi0oYIJ6/h6Ba+bU9ucrKFtXa7huSJABYctSWlxZF7rD+aGAQiPZxfbmXdFxR7Dk
         T+12c4pVSlW0H36hJP4t7GwTAgAzQLK9clPYAP942Bw/cv+QLc3SZaIeCLbKjByXl2+C
         T4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979879; x=1719584679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tuo/HjHSqCqeNETnCJYZAGa2TnMIXNIvX0RztOdKd4=;
        b=ntdTNcgJVURjjBOK8/oDYPctBBZDX8fI5RkqU+RzL5aAs4xkYbBd+dP1tjOl9OnYae
         FVXUg4nHyO/vH1ErVxGDslmQKSyK4MnUaipBtgdaBIsQNNyxdtPzGClVU45UKeQcymi6
         0c461Er8EhBTDrP9bITiUtMk9WZWmw05+P7JeIXe9YSgm8D+ZSpCGm1yB2yi4hICshiA
         l5v+asb/Z9KKvj8L6JkNX7npWS/RJLdC0d8+p5wuujN9PqaLHDDlSYQR3lVvWwQdatPg
         mD9EoPcoZ6H7o7Xtu3FRXX+jrzNMmKkJaulZHeduWqfiS6Z7BbWMmq2599Pa/KCrcdcO
         2Hfg==
X-Gm-Message-State: AOJu0Yx+kcaiuZm/TUQYoM+rCd/+EgnJ7OPcR0zYziqcGhKp6s2e/Wm/
	iqMazEXxXSzumAR6MLckDTCJNEzIF83BqaN0nxsC+2yiv5uqP60M0lrZpNW69bY0Sq7X0vz6qjR
	ABh3inElylKR7DbC6DNQrO1U3hQc=
X-Google-Smtp-Source: AGHT+IEU/yiacDrFV8qzzB1i0/ebDmRVNSkdRXSrugc1t3OiRXiEeaaBAh7l3OMXMuh6hQQ9cL755gR7mTlyhuBQZjE=
X-Received: by 2002:a05:6512:3995:b0:52c:8591:1f7b with SMTP id
 2adb3069b0e04-52ccaa5ac6fmr6173076e87.24.1718979878609; Fri, 21 Jun 2024
 07:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com> <2024062106243817fca166@mail.local>
In-Reply-To: <2024062106243817fca166@mail.local>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 21 Jun 2024 08:24:25 -0600
Message-ID: <CAJdd5GbKrnaG+VccTEEvWk8tzoXrKug+pWBXKXxUkc5_SY8G8g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 0/7] Add SPDX 3.0 support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 14:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201025

On Fri, Jun 21, 2024 at 12:24=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Unfortunately, this still causes failures:

Thanks, I'll take a look

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7060/st=
eps/23/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9481/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/9574/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/9149/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6555/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4969/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/9220/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/518/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/165/builds/514/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/9186/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/9166/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/8044/s=
teps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/8038/s=
teps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/6112/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9159/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9145/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6733/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8994/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6122/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6122/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/8923/st=
eps/15/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6837/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6881/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6906/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6892/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3501/s=
teps/15/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/9099/st=
eps/23/logs/stdio
>
>
> On 19/06/2024 16:13:22-0600, Joshua Watt wrote:
> > This patch series add support for SPDX 3.0 and sets it as the default.
> > Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
> > the same time; users may choose to specifically use SPDX 3.0 instead of
> > 2.2 by doing INHERIT +=3D "create-spdx-3.0"
> >
> > v2: Added tests and addressed feedback
> >
> >
> > Joshua Watt (7):
> >   classes-recipe/image: Add image file manifest
> >   classes/create-spdx-3.0: Add class
> >   classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
> >   selftest: spdx: Add SPDX 3.0 test cases
> >   classes-recipe: nospdx: Add class
> >   classes/spdx-common: Move SPDX_SUPPLIER
> >   Switch default spdx version to 3.0
> >
> >  meta/classes-recipe/image.bbclass            |   58 +
> >  meta/classes-recipe/image_types.bbclass      |    2 +
> >  meta/classes-recipe/image_types_wic.bbclass  |    1 +
> >  meta/classes-recipe/nospdx.bbclass           |   13 +
> >  meta/classes-recipe/packagegroup.bbclass     |    2 +
> >  meta/classes/create-spdx-2.2.bbclass         |    8 +
> >  meta/classes/create-spdx-3.0.bbclass         | 1116 ++++
> >  meta/classes/create-spdx-image-3.0.bbclass   |  203 +
> >  meta/classes/create-spdx.bbclass             |    2 +-
> >  meta/classes/spdx-common.bbclass             |   32 +-
> >  meta/lib/oe/sbom30.py                        | 1118 ++++
> >  meta/lib/oe/spdx30.py                        | 5996 ++++++++++++++++++
> >  meta/lib/oeqa/selftest/cases/spdx.py         |  119 +-
> >  meta/recipes-core/meta/build-sysroots.bb     |    5 +-
> >  meta/recipes-core/meta/meta-world-pkgdata.bb |    3 +-
> >  15 files changed, 8654 insertions(+), 24 deletions(-)
> >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> >  create mode 100644 m: failures:eta/classes/create-spdx-image-3.0.bbcla=
ss
> >  create mode 100644 meta/lib/oe/sbom30.py
> >  create mode 100644 meta/lib/oe/spdx30.py
> >
> > --
> > 2.43.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#200929): https://lists.openembedded.org/g/openembed=
ded-core/message/200929
> > Mute This Topic: https://lists.openembedded.org/mt/106770352/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

