Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3396C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 16:20:20 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.27928.1747930811183431266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y07YHINS;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-60402c94319so4796370eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747930810; x=1748535610; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b5MQcq8/tat/N0ncA3+Nzd6F8lFZ8MGkxytHsu82bk=;
        b=Y07YHINSQlKzfbL1CIeTKM6W1JylPTCIt08I2IrMcNZ6wBLqaUAk1kWIIDtsJEKwXj
         41LOmkr1Ff99pZe4q2QOvtff62Q0EdjlAlW0VM01esXD61mZwGrydRh80UFEVW8CMmiL
         d7gfprfsR4tr61sQpuiIBS+hpmd/QNoH8QjY6hYufvwicT5m+TipTpA6mcL0tJsNy00G
         QAo3ZV6389VNKJvvG90PwsmQpQ4tg4XgYvcho0gDiqZRIUHgBow3Hbsp9kiW42R1pppV
         wCAsGpVGHIwfBTbOyNfMW1s8R8UGXLl58NH15Hm3DaSU2eihLk2PxIvXPjdE3lAWJmwI
         ws2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930810; x=1748535610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b5MQcq8/tat/N0ncA3+Nzd6F8lFZ8MGkxytHsu82bk=;
        b=XMVfjwLyvG0WZcqX40qDZOhOdlS+IT9C6u0NzR5z+9sD57+G8DFkxZ/mIJfEzm7ula
         izuQF8Zp5AMQUpRKQRSy/vn45W5DuJ/1dmuTqGifx5K9lye5AoZZ/nClPV7pZXbh6+V+
         JOKGo4fDMX/rBzZZvFMor2hmgAmI30K8CWsLhaL1lsoCPd6eLSuKZvkwGaoklyD2n+R8
         5zQPqhrznWd77HxjqhpYpCqMSOwupCW+pwVI8kxIDeKFBMkwpKiA2P0qQohE3ds3whoW
         EBINKtFXP41hxc/0lz/G7aEV2SBtvjTRA2g9GfPXOV3QGjQBEb5gYGefQ2leT4lSPYlf
         nZPw==
X-Gm-Message-State: AOJu0Yxiu3YXsUYy4iP1HAgk526vg3nYLWg4EFGPRNli8FUlgbLm6UJv
	+N4EFiHYc2sic7dKJw40C7RJDcvjS5CJ4LgDOxKco34RvmhdhTN03i69ABDIhuXf6l5SOJxQMmO
	ygJwtIxpdaah4FigbkcZ0rsVUeBTVr64=
X-Gm-Gg: ASbGnctigvCb8zbQNIkXxaUHcc+Hndy8Fqh6uDuihY2aanCRj2VciS5b8/Zq0WoImpb
	5ulMPA5UrUsim0sj6ybioDk6LXqod5pikBuQgdPaXqdCaSa3qpTAVpasLAEzSRlt3YRgobSA8cO
	p+XEQ1gmRS4kFNd5AuBAttVGnOeatGACKQ
X-Google-Smtp-Source: AGHT+IHZrRB7MOmNxzm+JbGiU7G08WSJIvZ5KkNv4TvRfcFECQE69oLc2EEGDd1q94RKmIvLXSyUS9QZg853uuWV5rs=
X-Received: by 2002:a05:6870:440d:b0:2d5:1d1:8613 with SMTP id
 586e51a60fabf-2e3c1cdfe38mr15110525fac.23.1747930810328; Thu, 22 May 2025
 09:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-20-db97c2eb3756@gmail.com> <6DBF807F-B9A8-48EA-8FB5-4D4964611CC6@arm.com>
In-Reply-To: <6DBF807F-B9A8-48EA-8FB5-4D4964611CC6@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 09:19:44 -0700
X-Gm-Features: AX0GCFuEfE-ovj4KyMCARcTG-KsgumyFXX6vjH7YkF9QR7ymF9W5XIBRutMCtSc
Message-ID: <CAMKF1soiZ3O93+AQkrRHN4UY2bDAJptrS=Vg1h_phVcPdZZU9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 20/28] systemtap: Pin to build with GCC
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 16:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217132

On Thu, May 22, 2025 at 3:02=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 21 May 2025, at 07:19, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > clang find a lot of warning
> >
> > | In file included from ../git/tapset-procfs.cxx:11:
> > | ../git/session.h:169:47: error: 'used' attribute ignored on a non-def=
inition declaration [-Werror,-Wignored-attributes]
> > |   169 |   static const char* morehelp __attribute__ ((used));
> > |       |                                               ^
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/recipes-kernel/systemtap/systemtap_git.bb | 4 ++++
> > 1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/reci=
pes-kernel/systemtap/systemtap_git.bb
> > index 21d50ffb04977bdd9666fbabb5e27289aff01370..254bac4d6f9c8637c575b4b=
7896322bd42e96841 100644
> > --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> > +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> > @@ -99,3 +99,7 @@ do_install:append () {
> > }
> >
> > BBCLASSEXTEND =3D "nativesdk"
> > +
> > +# Emits lot of warning which are treated as errors
> > +# They must be looked into before disabling
> > +TOOLCHAIN =3D =E2=80=9Cgcc"
>
> Upstream configure.ac has a =E2=80=94disable-error which is probably the =
right thing to do:
>
> https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dblob;f=3Dconfigure.ac;h=
=3D6fc9527650413569300aa41cb154757ecc06be97;hb=3DHEAD#l126
>

yeah it is not sufficient though, there still are warnings reported as
errors - https://termbin.com/o1qn

> Ross

