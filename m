Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF52C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:35:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.18353.1700656537224294734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EzcXGMK+;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ff26d7c0a6so434538866b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700656535; x=1701261335; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t/bab2FFkC+2bk3v6jeYUqln4kuAL7nTmynu1g4BDf4=;
        b=EzcXGMK+u5NDnjr4eYnCisf5Yttl0mYYI8O8pan79sGjPiCvTV58Y+5THWKuUsl/07
         pByqaeHpuadHdT2mFzcNdcT41UPUIiVdDnblRCujTt9pPVUMSzKg8nqIHyUSJrMV7pPM
         J9fCmvN5VS0HALq5K7nkTxCHwrE2Kq9lo6AK7VSmJY5SQH+qaOzOmE5ep/PavRpqqoMY
         upWeSbKH+sdAll7DIo3tzcbyq0TwjaAO4uoiV9FI8+x3xQHjjmzRLAdtYvrS9ALlNy5e
         x46C4ohfZhcqABQzlfACkj5Fhw6LiFw4BoewlhlJax6hhfqhKCic7hkViiGuuF5koqP+
         D+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700656535; x=1701261335;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t/bab2FFkC+2bk3v6jeYUqln4kuAL7nTmynu1g4BDf4=;
        b=K1D28omAZ7QRuvrg5SNI3Na09dWD+IrQGkDcwvgtjTBBbQIsn/bwHJruf/8aB7iOzh
         wgLtj1gCEmDKOyNgIJLVs+iReUaDMHV6ZxEmb+fRUpJoek2LOausCL0l2cJjSV+1xLzM
         f2JDFq7BMG+X6z13SzmQ/GWKMfb13+ypy4rh4A8QQMjyWUUxor5IyS1nb76kn8l2mg9z
         zn+WIp7xN+RoBwJzEoXMohxlfzodEDyNXrIJrGAFJa+5dngg4KE4PoJUoy32nrGb261Y
         ZXZ1Wwy6ntGp/NmQQjbmik3ecrPvPfib6RFNRft9aRUdR8iAJ/jW0ENTvvT7OJXRkJfL
         ecRg==
X-Gm-Message-State: AOJu0YwSN0X5LLIfd365Be0laRX/UHRJK/8HbT4ddUKE5mqIfXLBKr0h
	EhOzzabVeDo8SxxemYSfFqY=
X-Google-Smtp-Source: AGHT+IFqHNu22HmH4dRf/w7b76tO0CfHboIoq4IlufiZH9sWF4qsunCBLaQYIqQrtXQ47hZJmfM+8A==
X-Received: by 2002:a17:906:bf49:b0:9fd:6400:b62f with SMTP id ps9-20020a170906bf4900b009fd6400b62fmr1766851ejb.29.1700656535174;
        Wed, 22 Nov 2023 04:35:35 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id g26-20020a170906349a00b00a0451802b3csm790245ejb.4.2023.11.22.04.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:35:34 -0800 (PST)
Message-ID: <b27c4560ee3647d92d322b14e27a816bccb49f84.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the
 default
From: adrian.freihofer@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Christopher Larson
	 <kergoth@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Nov 2023 13:35:33 +0100
In-Reply-To: <CANNYZj9rKV2dYb1PYoQ=Zb+C2A8w7TVi+w6he=oxJHdWueE-eg@mail.gmail.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-4-adrian.freihofer@siemens.com>
	 <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
	 <1952881b121248aaae11df8b884caba82d567bec.camel@gmail.com>
	 <b98adc29-7e18-4c68-b94c-4b9b5b2a38db@Spark>
	 <b38107c74191ff9a5fa6fb0a9cf8a42cfed32225.camel@gmail.com>
	 <DB5PR02MB10213E5FE440BEAB46DA58849EFB4A@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <b3871a691e147ff70ac2145cc5af36a4c4c26837.camel@gmail.com>
	 <CANNYZj9rKV2dYb1PYoQ=Zb+C2A8w7TVi+w6he=oxJHdWueE-eg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191076

On Wed, 2023-11-22 at 13:25 +0100, Alexander Kanavin wrote:
> On Wed, 22 Nov 2023 at 13:23, Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
>=20
> > But I also have to say that recent documentation points out that
> > the
> > rootfs.tar must be extracted into the extracted rootfs-dbg which is
> > a
> > working solution. The issue which I have is with the SDK which
> > tries to
> > avoid building the tars and extracting them again just for
> > providing
> > the debug symbols on the host. This use case is probably new.
>=20
> Sorry for barging in without fully understanding the issue, but I've
> added debuginfod support to yocto precisely to avoid having to deal
> with large, awkward, slow debug filesystems. It's a lot leaner and
> slimmer approach.
>=20
Thank you Alex. Looking at that is already on my todo list. I think is
is a very interesting approach.
But I hesitated a bit because creating some files seems to be easier
than starting and stopping a daemon behind an IDE. And the fact that
debuginfod is available probably doesn't mean that rootfs-dbg is no
longer supported. So let's just get started and then improve.

Adrian



