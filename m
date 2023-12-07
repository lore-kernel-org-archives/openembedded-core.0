Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A373DC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 22:40:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.105948.1701988802264479295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 14:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b4HcIjxf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40b595bf5d2so17239515e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 14:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701988800; x=1702593600; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQqj4ZXrovganTR5Y0fOhAh4Pvl9cn6ynvfwAqteWgE=;
        b=b4HcIjxfAnyZNb32c8iiJ2i6AWty/QmUoBCrmn78oZwICG0TUS+tB1ubMoZKDARymW
         BA1Ef2JvyITp7V7b8Tl4pfUHP9+NM4JQhSbqzKN2VbtTDOqPhsSGpXDB+lwEZ/KW0+vS
         zJT7unqM/02RMbmy05FNHaGkXgjRlXVexyE20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701988800; x=1702593600;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQqj4ZXrovganTR5Y0fOhAh4Pvl9cn6ynvfwAqteWgE=;
        b=rTOxj3IdfsX97CQ+28/PrvcVSJ2fTEZWe88irjDy8I5DwoDo69/QaYh/vrzOdZus3+
         8or73ST4vLq8DgQWODgit3Ugt7FHH5fHf/5Q149IbnNVFtRDYAfax3TzH3hKSux9MbUO
         MwNM4wesslwvYg6VreFx6zZ4Gv2EZx109tTKGz5dBFj31iNAsvFijXgZmJ9smsOkSnUM
         VPATXpUQZgUucp5mAr3amuOy9JwWBdNZ3i+G2fsNAGnn/Z+9dJenIAWspCXRZsTlMYvN
         pgE4W4oVKPm+SEFR1SQaJCgTdygk6cQczY9UKdeFwiCi3AWSAh74z7UTRW0iJWmIh8o6
         V9iA==
X-Gm-Message-State: AOJu0YyxA4+AauesW+p7XvDWKApmSsv5MI6tX1C/3KjUWa1GwPeyWxun
	+jEw/qPEeEQDVZLdjRNY4mNXkw==
X-Google-Smtp-Source: AGHT+IFEqqFStKE35Rn1Uzs2BNxr7z8+G2xrtlj143dFFgEyKX4c/6FESR/C9Qfrgr4+fEm9z2cjVA==
X-Received: by 2002:a05:600c:230a:b0:40c:2a50:99c3 with SMTP id 10-20020a05600c230a00b0040c2a5099c3mr631189wmo.242.1701988800639;
        Thu, 07 Dec 2023 14:40:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c468900b0040b42df75fcsm917091wmo.39.2023.12.07.14.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 14:40:00 -0800 (PST)
Message-ID: <58a265ee08706c7d5e0b9c5678dfbe44b63c96cb.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 2/3] cargo: Move
 CARGO_MANIFEST_PATH/CARGO_SRC_DIR to cargo_common
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Dec 2023 22:39:59 +0000
In-Reply-To: <20231207133913.443-2-alex.kiernan@gmail.com>
References: <20231207133913.443-1-alex.kiernan@gmail.com>
	 <20231207133913.443-2-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 22:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191979

On Thu, 2023-12-07 at 13:39 +0000, Alex Kiernan wrote:
> cargo_common_do_configure uses CARGO_MANIFEST_PATH (which depends on
> CARGO_SRC_DIR), but their definition was in cargo.bbclass.
>=20
> Match the other variables here and change to default values, rather
> than weak defaults.

FWIW "single value" class variables tend to work much better as ??=3D
(which I'd call default value) since than it doesn't matter if the
recipe setting comes before or after the inherit and the inherit
position in the recipe doesn't matter.

I'd call ?=3D a weak assignment or weak default.

Thanks for working on cleaning some of these things up. I got so far
with it originally and then ran out of time (and too frustrated with
the long build/test cycles!).

Cheers,

Richard

>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
>  meta/classes-recipe/cargo.bbclass        | 7 -------
>  meta/classes-recipe/cargo_common.bbclass | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
> index 96a74e2ef1ec..0829a58dd90f 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -30,13 +30,6 @@ B =3D "${WORKDIR}/build"
>  # where the issue occured
>  export RUST_BACKTRACE =3D "1"
> =20
> -# The directory of the Cargo.toml relative to the root directory, per de=
fault
> -# assume there's a Cargo.toml directly in the root directory
> -CARGO_SRC_DIR ??=3D ""
> -
> -# The actual path to the Cargo.toml
> -CARGO_MANIFEST_PATH ??=3D "${S}/${CARGO_SRC_DIR}/Cargo.toml"
> -
>  RUSTFLAGS ??=3D ""
>  BUILD_MODE =3D "${@['--release', ''][d.getVar('DEBUG_BUILD') =3D=3D '1']=
}"
>  # --frozen flag will prevent network access (which is required since onl=
y
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
> index bf298e96c745..c330c122a9d3 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -33,6 +33,13 @@ CARGO_DISABLE_BITBAKE_VENDORING ?=3D "0"
>  # Used by libstd-rs to point to the vendor dir included in rustc src
>  CARGO_VENDORING_DIRECTORY ?=3D "${CARGO_HOME}/bitbake"
> =20
> +# The directory of the Cargo.toml relative to the root directory, per de=
fault
> +# assume there's a Cargo.toml directly in the root directory
> +CARGO_SRC_DIR ?=3D ""
> +
> +# The actual path to the Cargo.toml
> +CARGO_MANIFEST_PATH ?=3D "${S}/${CARGO_SRC_DIR}/Cargo.toml"
> +
>  CARGO_RUST_TARGET_CCLD ?=3D "${RUST_TARGET_CCLD}"
>  cargo_common_do_configure () {
>  	mkdir -p ${CARGO_HOME}/bitbake
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191955): https://lists.openembedded.org/g/openembedde=
d-core/message/191955
> Mute This Topic: https://lists.openembedded.org/mt/103034028/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
chard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


