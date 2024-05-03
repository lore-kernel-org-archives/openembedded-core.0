Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25695C10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 10:43:48 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.9680.1714733024093790205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 03:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MdZPbMr2;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51ef64d04b3so3542695e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714733022; x=1715337822; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtkiYJ06oK2LJV97gMHLxsysrOoHjS2qIbhC0/w3DlU=;
        b=MdZPbMr2uhJRBrijPKgPHG/C8ZH3YgpIN5+ShlrRLvE4MCflDqqq4UGRi8Yohh1eoP
         BJx9B3JPnE5Bx0gRoXVLUpxCpHO2c3jCvMGQC1EP8Erus37+Xe6fA7l75113Ti2eee5a
         v5GhIoRo7YapwnSQ2Yy45/96S70enrVLtWedZoA5FTyB/Gn86qTK+c9aQPUEJ1pQyPWt
         sCdM1+7d6Wm5IzI+33GvtTxmAfUQ+IoABg+XnhiJSoQOWrPGARo1tyd7oSMK42Rvb96l
         6g9HB27sgRztxCX6c8q8NeHvN5CyPeopekPqgDDDeJ0wYr5JGwDMJmtXdlARN2YbEoi5
         NelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714733022; x=1715337822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtkiYJ06oK2LJV97gMHLxsysrOoHjS2qIbhC0/w3DlU=;
        b=qZK8MOiFDzt5s7KIduHMKUpqSt5hvPKd+frKdsChHmQiQ1ACx13QtxwM0IzxuD7Wms
         QkiE7da5Z4hH1Xv5eFePnhl8wt/LbOoHkW5TGCfTw7ZzrF6GgXM951n4aTe1txGW4tll
         c6CnLChwHDwNV7Zfjp+FJiOYGAXDCpVuqfFWHNbw/u2f2Z3Qz7FZIJ2S72OD16cglvAC
         BTrHPDTQXj4/SjP3p7r2FG7p/4uP3z0B8K3tRAl/ZhbL5YAxZx1lG2NrqGSH6PM5pYcQ
         3gDrdS7wCWuzzKd3rwGjXppJ5DjJMneUsi2UEUT16IL/ZVm5ShBP/WNemWZ8fRzAk+UD
         yArQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu+UjSoJPPlCsJXRL9A3KHEqFmm8l7aTIe2eqe7JVtFNjwivAnitI5M0gOkAMF3sG5myDz1/MJgyHcPLcQ9MIt7qwejR5DDymXDUThQT6l0UT1jq2l9/zQ
X-Gm-Message-State: AOJu0YxPunqlEn9HD7N6hd0FsYcLFyvi6BArPosfEtbYU+/79/w17osb
	f/rkAIDLO2J01+SJdhLth5/NB2bFIVx95bPpfqMdLeZou25W9rDv7euIgckoIc0upsKTw445okH
	iipPk3Ozivmfv4hKEzX6trPSGAjI=
X-Google-Smtp-Source: AGHT+IFf6wgGB0izCfToOSdaUYRPKUOm4awjhJDG+NzxQOFSUSJ7hKHYamz4xYCgJ9g47Q6IjnGbK1iDE/+VD8mxvqI=
X-Received: by 2002:a05:6512:1390:b0:51e:233f:767 with SMTP id
 fc16-20020a056512139000b0051e233f0767mr2473573lfb.45.1714733021918; Fri, 03
 May 2024 03:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240503102624.594443-1-mikko.rapeli@linaro.org>
 <CANNYZj8RStk4X-HkTp01THZdrtZ+AF3pLoDm6v04TsFKumSVDA@mail.gmail.com> <ZjS-QQ1wDTt-lXsc@nuoska>
In-Reply-To: <ZjS-QQ1wDTt-lXsc@nuoska>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 May 2024 12:43:29 +0200
Message-ID: <CA+chaQeXOqrc_UKyYUt=JCiJfJyxDNGSFwn3f9q7mi6NiGA1pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: fix pkg-config file libdir from /usr
 back to /usr/lib
To: mikko.rapeli@linaro.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198972

On Fri, May 3, 2024 at 12:37=E2=80=AFPM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> Hi,
>
> On Fri, May 03, 2024 at 12:32:42PM +0200, Alexander Kanavin wrote:
> > I=E2=80=99m sorry, this doesn=E2=80=99t look right. Shouldn=E2=80=99t w=
e rather ensure $(LIBDIR) is
> > correctly set? Besides, hardcoding to lib is certainly incorrect as it =
will
> > break multilib. We constantly have to fix upstreams in the opposite
> > direction.
>
> Yes, you and Ross on #yocto are right. This is not right. I tried also se=
tting
> LIBDIR=3D${BASELIB} in do_install() and do_configure but those did not wo=
rk
> either. openssl builds scripts are quite hard to work with...

Isn't it easier to fix tpm2-openssl then?

I had similar issue in chip which was using "pkg-config
--variable=3Dprefix openssl" and didn't expect it to be empty in "if
prefix[-4] =3D=3D '/usr'" and rather patched chip than changing openssl.

