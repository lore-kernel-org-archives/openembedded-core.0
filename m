Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6786CC02188
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 00:59:04 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.7761.1738025934796497584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 16:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ApXAsfw0;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29fe7ff65e6so1702058fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738025934; x=1738630734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jEt+1P/ZtMbFfd1rmLAZXAgXy4fUuxWS9tPoVZYIOw=;
        b=ApXAsfw0VMQy/cuUFas+7jJlefuMPZSu0b+hBxzSvAFRWUdmUQXarZ0SN2iKC+o94o
         gj99HexZPyhHbJvZ3Nh+QW7/q2QrIEAuaqF/dyi++Jz5M4nG0GJBCo9P+xoc0M21niYu
         W+zgIXGGL57BeDJPCk6zjS2PoobFGpu9DU7jXbWo0Xga3o+iFchHYn3a6yrdtoQ9AtsT
         iKofGjUYeaS8av+tkGQMRM0xd2ghAC4X5NbDOWM2Mar7go/1RnXKP5RKhK/SAq2ugCkQ
         Z2P7JBLewetBm+tbGeLi2OjWwJ+r5AaZDLCwQmPFtNBE543Fdb7to+o65TIikmoW6ARp
         hrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738025934; x=1738630734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jEt+1P/ZtMbFfd1rmLAZXAgXy4fUuxWS9tPoVZYIOw=;
        b=Qun4VctRGszafaiiK/s4Iyeht3e+gBe9KkV8v95q4lfkLZofQheXSvHBeuJVWOmKhm
         Bz+O6YyseOqvXEwPTQKG7uPDieihF/jAdS6+nAuLBpWQ99FfVQn9UTccxFu/VwVKqUAg
         vhhcl2xk97c8biZ7XdAZwnWv8R696uAwsrvXMQQvDhIPNSTxaoH4G6johCTTYPdLA+1X
         BK/i+wOVnZCXjVPi7nQRuXZmped9ALtNFZXcZqGRVM7LoQBSx9ocXrF1OpH+MhJDPuDE
         GRYN2HMvAL9kkZiHKJZXjpAT3rLO6fsoMmn6ntyD7uOJoUEdtUMaiq7D7fS489urdZPP
         szFg==
X-Gm-Message-State: AOJu0YybAMuS8evnNF+RBNzFHeYQxUXnhP9zSe/Wf0xEXZ0PYaPSGp0J
	NDp3eJUq0pUoEgGur+fIC0HcYnHgAsp2ihrI7komMCO9RV1QL1sgCcxy2f9ZLpfqZAGap51gMg4
	Wg+dig635CLuTAhyjzHptPG3Xpi4=
X-Gm-Gg: ASbGncsa4VlYO1u2vQOqcm4sCp+phaXRFN1tiV56ApVqoQFszX7S8k+KeT5sDB1A4fh
	m+UluXFpt7PAll6XmXddOHL+fjkfwe6WI/r89D4fN3eoaM9iM8AfnXhPJCkAm
X-Google-Smtp-Source: AGHT+IE9kN/jS/QkJY+gfd0nX0/M1YyZRBH/WH2gOTJNwrBjH7XyHollyyR4T9GytEsNrsY9dyGQqHjsQWyFspMmujY=
X-Received: by 2002:a05:6871:5317:b0:29e:76d1:db3b with SMTP id
 586e51a60fabf-2b1c0912684mr25157661fac.5.1738025933989; Mon, 27 Jan 2025
 16:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20250127232040.4090484-1-ricardo@foundries.io>
In-Reply-To: <20250127232040.4090484-1-ricardo@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2025 16:58:27 -0800
X-Gm-Features: AWEUYZnGiON_ej-c7j1mzmw4_40V6FEtMhKkvFvXkH2pUrg_cwGWK0fzy7g8AYA
Message-ID: <CAMKF1sr9h4M1xZXAn_Hv25YrzXpjNqPLP1wQAptijFLdaWzF4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] efivar: enable support for riscv64
To: ricardo@foundries.io
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 00:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210310

Looks good to me.

On Mon, Jan 27, 2025 at 3:20=E2=80=AFPM Ricardo Salveti via
lists.openembedded.org <ricardo=3Dfoundries.io@lists.openembedded.org>
wrote:
>
> Release 39 includes support for riscv64.
>

release 39 fixes rv64 build when compiled natively, for cross compile
it should have worked even with older releases

> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  meta/recipes-bsp/efivar/efivar_39.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efiv=
ar/efivar_39.bb
> index fe213326a4c..b052e3838fe 100644
> --- a/meta/recipes-bsp/efivar/efivar_39.bb
> +++ b/meta/recipes-bsp/efivar/efivar_39.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "https://github.com/rhboot/efivar"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6626bb1e20189cfa95f2c508ba286=
393"
>
> -COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
> +COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
>
>  SRC_URI =3D "git://github.com/rhinstaller/efivar.git;branch=3Dmain;proto=
col=3Dhttps \
>             file://0001-docs-do-not-build-efisecdb-manpage.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210309): https://lists.openembedded.org/g/openembedde=
d-core/message/210309
> Mute This Topic: https://lists.openembedded.org/mt/110850211/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

