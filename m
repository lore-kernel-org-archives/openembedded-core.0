Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BC7D2502E
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 00:11:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21829.1768176686453131590
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 16:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dt64daK5;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alistair23@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so8412867a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jan 2026 16:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768176684; x=1768781484; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xx2N9C8xWjheZboOI7mhwIPQ+zvF70GKhcWzKvv23tY=;
        b=dt64daK5K3iPSqwo2p+cBbPLyglhuq2fMcP0SFDtk/S/SbT7AJeu0y2rGnatjrlbvj
         LOGGlSmySD3hUljz4eMUFxsktm3NoyzDInM8qBPWMaTcsrWl5WR6xT8F4Yn0JDDjENMQ
         TRq0rgLniUL5b/ScyTB7QNGFgmp5Y6ksAWK7GeUZLmqDWI1FFjacj1fkZx02/b+z6He6
         XVVD9/fZ328NeBC7xI1pg8f/B/F+2FJ8u4DwHLcR2vJEKQ6K0twYAY1PiEnfcBJ+a+3k
         4EYEcfr7JN0OaPD0CcMHshmxvQjvb6UCSD9EdijYunEKJ3qMPo3/hwvygVUddQ+zNGA0
         pDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768176684; x=1768781484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xx2N9C8xWjheZboOI7mhwIPQ+zvF70GKhcWzKvv23tY=;
        b=BMkojtNiQBQj0EXZIeIJZrA5+/nz2AJmcIL0/KrgZ0KlFd28PbX9f3Ul2bpT0f9L6E
         oIzD154aSaa5tKY52BebbMPioAaazisZTdLqsMIkrZuzFtcBoCdNkFw43BZIBvvXID+k
         cCxOq088tGERMToruTC0S9+wByyCLJ/gvcrUiOh4hrpNPmeJcWQJaTnVp52Bamaf5NWb
         81e83b0StuG/3wtKMLD2df/2CkHek/5O8+AzdUbMYZ+CY3HVCRZx+LX0ExAvmpa5plCB
         HP46O6TaYAwI66+YABbSf0V7MohQb3Cxxd+cbkOWV7vmKg7vPRNdGBNRN0Ah/9/j2I9Y
         9IAA==
X-Gm-Message-State: AOJu0Yxjrg/lW313PqNJu9gGI1u8mv0SfOURO+nD7IAgg5gHPcYMJjHp
	JXweFGj4CrfH2ZNSqI+05blL2CQGDAKpMfilto1pZSZ3+05HKLQnbIj4r3kZlaxEcKl4R/5L0bI
	gztFG+t7WcHtB0WeOQJjYVpTRL0chboY=
X-Gm-Gg: AY/fxX5G7BbKs6+vleS49S1vhoAQEV01keTYO4CSflTFIQ9vgU75g53fpoYQCyBj1Rs
	+nEeWwt57WgTJ+oKU76YIrp98k7+cTVIcwvbqfGTfmBfd3Jl3vhW7PJ/I2W9qHp+lOOXVJ1cs9S
	Zcs+gfIZKMQ2oH/03u7bvoN9ZEeqpnCZUlLf1HDAIFKbak0Mo3I/rrmfz5vz1UNTnpjOllguaV4
	eXcpFzFezgClkX13mR2KSc588JI8C8PdZmdGnn28B8EY9x94mDlo7NZOCMiQLQFJcPfrn1XzlIl
	/dq8xB2MEYFI3e3Il/nwHZdGq/q1JJG9Ojp2
X-Google-Smtp-Source: AGHT+IEZ1HZcf5AwkV0gkAJS1nLaaRnoVUNdXpnEAYLu7jgHxUf+Ba4cgQcPtn7bHuz7i+fHzm7pnLiNx/IjCZfBowQ=
X-Received: by 2002:a17:907:c0e:b0:b73:594e:1c47 with SMTP id
 a640c23a62f3a-b84452837b5mr1515804466b.26.1768176684449; Sun, 11 Jan 2026
 16:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com> <20251230141540.1974380-2-Harish.Sadineni@windriver.com>
In-Reply-To: <20251230141540.1974380-2-Harish.Sadineni@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jan 2026 10:10:58 +1000
X-Gm-Features: AZwV_QgQWyVV2fWkVE52SwyG1mkWJ8F_A9CpusG_L1fR4sH_Gz4tLpwripSL2ZU
Message-ID: <CAKmqyKOPwTu99sBGaz7NeOZ9SRa+=ocmKJTrZ3RgUUHpGsEfNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 01/15] bindgen-cli: extend BBCLASSEXTEND to
 include nativesdk
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com, 
	yoann.congal@smile.fr, elmehdi.younes@smile.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 00:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229179

On Wed, Dec 31, 2025 at 12:16=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> To support building Rust bindings in the SDK environment, bindgen needs t=
o
> be available for the `nativesdk` class as well.
>
> This is required as part of making Rust available, where bindgen is a com=
mon
> dependency for generating Rust FFI bindings from C headers during cross-c=
ompilation.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/me=
ta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
> index 2f3ec04e82..72dadfe52f 100644
> --- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
> +++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
> @@ -15,4 +15,4 @@ do_install:append:class-native() {
>         create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH=3D"${STAGING_=
LIBDIR_NATIVE}"
>  }
>
> -BBCLASSEXTEND =3D "native"
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228667): https://lists.openembedded.org/g/openembedde=
d-core/message/228667
> Mute This Topic: https://lists.openembedded.org/mt/116997862/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
istair23@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

