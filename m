Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F227C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 19:24:52 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.32421.1747941891685924222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 12:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HFeNub3f;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c922734cc2so26522785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747941891; x=1748546691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4shhZM0+RnJHUqqOY0iRIFTzilSsBmXj5aIrxqNcOo=;
        b=HFeNub3fDZu0DuO4a780KdbbBtbeujTnFRVRPc5Kaz2SWVVfutY+JJW2tqdufDTeUq
         TRE4HVl/2ZrwBQKL6rjCItgW9q02zDkavymsENkAbeD5CBWGIXwRplbKcmwQyuhe7JfU
         KLswLTGsLN8FELzIyP6ekuUXc5RmkhPjPDIR0JA539fg2nPyZsscN7lBJZQA4vaXpA4c
         J4+pRDD/KlJLVWE00NMIiDEykErfPCn4LygCsKrSBJj+PMWJn2HzyrTvb28y61B0f2b0
         ivFa0Qy8BM4z8fJgPPoHSntyIAtS5WHq5YyIrCajHmQv8P4/sFk+rMpBE2AP/YAvxWBc
         8weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941891; x=1748546691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4shhZM0+RnJHUqqOY0iRIFTzilSsBmXj5aIrxqNcOo=;
        b=umzSV8huOys5Yx6tP0YFtpBsy+s7pHcLAcGr5xdyBV9tEKdb0AbP0AtS7NiEfvcv7J
         i1yI1FDeh97NipcPOLYu/4/eYni97CWohmgj++5gQ0/JMrtrRBUUBuPWeIJ1LnQ/WrEB
         DHtXY3TFbL48jiyoXNgj8QnDwirf2nFM0zPSG6rbRj+SanmvHGGEUqLDJX88EcWlhix/
         PWNZbgNky/pDvsfMMaEuhNBa2bgGEs7Xrx0fqVLJ6w/zbAJtINP54X7s1RHmAupyOwPb
         ogluGq+opHmfHI7UcXKsDPEoHrgT02oiTRkF4R09zMxL6s5nKylrFnOmP42nAJAb3Lnt
         ep6Q==
X-Gm-Message-State: AOJu0YxlAAGiDazwsfaH2Hky57wqRvQzdodB5b5V1jIFTYVHrPcXs8DW
	blUK1Yof0FlVPe0nopoP5CUKkOsAxLW9Eihao75zL1c55lOyZgjcIPf29TChLfznMrepDV4+gTB
	cy/6Je/jQEg6t3TwUcl2ANWPRjJp1daLefY4D
X-Gm-Gg: ASbGnctQ44XGpl6/os+EgiQAQ1upAvhsyMES16W/D3erRn+N/J8+8o+Yi4z7icX0Mr5
	61YgBn/4bYFFvijIAg0EmohirzIPKdXkhDT51N13AnXDKU1ijRXRivn80oMFoPC/rsOTDAMp7vq
	iIEuroBJUzKXKoeHhGFi/e344NcXqxuXb85PGxzCC3Rg==
X-Google-Smtp-Source: AGHT+IHhUDHe56vNdqqie76qacbJ1fZtk2F5b+yjAG+kxM9uEWJLNlDS88jZXDbS2BgK1r6kub+53eCW3x1KjwcxZus=
X-Received: by 2002:a05:6870:c6a3:b0:2d5:97d0:c03c with SMTP id
 586e51a60fabf-2e83e65445fmr585164fac.18.1747941879955; Thu, 22 May 2025
 12:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-27-db97c2eb3756@gmail.com> <BC4F1602-93E6-4BCA-BAC5-C1C9584ADBA6@arm.com>
In-Reply-To: <BC4F1602-93E6-4BCA-BAC5-C1C9584ADBA6@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 12:24:14 -0700
X-Gm-Features: AX0GCFt3rk6asTVCqAERowPGCsQeTHqyDffcpA5rt7j_34GeK-JO7HrrM--Z2h4
Message-ID: <CAMKF1sqVZ9dxTLq0Q3XiEujJN9nqHnvq0s=c7AqaJPADdv8=Wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 27/28] systemd-boot: Use gcc on musl/arm
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 19:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217149

On Thu, May 22, 2025 at 3:13=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 21 May 2025, at 07:20, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > clang does not support -mgeneral-regs-only option for arm
>
> > +# arm-poky-linux-musleabi-clang: error: unsupported option '-mgeneral-=
regs-only' for target 'arm-poky-linux-musleabi'
> > +TOOLCHAIN:libc-musl:arm =3D "gcc"
>
> Why is this specific to musl, does the choice of libc really control whet=
her this option exists in clang?
>

good question. I will rebuild once more for arm/glibc combo, The
option does not exist for arm in clang so glibc version should
fail as well. I wanted to keep the scope of these settings as narrow
as possible thats why make is libc-musl:arm

> Ross
>

