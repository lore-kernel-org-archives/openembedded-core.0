Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A5AC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:59:32 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.85.1742489971457225533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gIXea6c5;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso9441621fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742489969; x=1743094769; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZUgYR6UI0A20zTGIeMG6zqhoB/myBoc9FlEgXxVuvA=;
        b=gIXea6c5z+XTdKF2I9zdSnBUdM4toGyk7nAT43PW8Tcwdw8CF0AQlqX+myzddPXWQD
         YUIqWR3saZhtco0wNTGqj5sHrN9yee4dpuDRCL50QN41+RMBxNyCUQFAVxfVpx86uvFo
         Ekdee8NqymfKbOr4JDwTLv6rp0ycmANzNQLiUx9EuNe3u9dH3i/IMyHmgNEZpA7/zFem
         NQUsxtHxExS9xP6fsDHArQogE9sI5XS75j3Me0CjuTV5K3ENW/dekTmugO41h29loa0A
         SJakvR+M1I4jaBsaKUTs9A62NSoiI87mqsRhqx00oTWwChREbcAAJbDFAzOZXhSIZyU6
         2XAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742489969; x=1743094769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZUgYR6UI0A20zTGIeMG6zqhoB/myBoc9FlEgXxVuvA=;
        b=vkvtEReHEdLU+IKjvkjoT8oDBoVJ6SyBEMSreJCdoMLm0jdud77NuS8qT6JjqeXiO9
         aWG2dH1j0Oa1YTLs5+IHjuf5vQoHfX3Dc77JvO5P//7MzMjIVzuMbIHsqryIdMHNLVn2
         /+xENCcoL5RKew9q5acPAN0KKEyseZvkF5kelHbDRkqZ6+SfiCGieCDb3IJChquIYXtH
         WUrdR9YU9YCHxHMc63MwVjtDLR0pEvLvCNcsck49vK++vsQpnOJG73B9CLyDc/Dc5YpJ
         dEABykOE3gHqifsfYRUS2dk4xVTZzkgPgL6gRITkfcpVYHtqJCAv94jMPqZmbKyxy/RL
         OJCw==
X-Gm-Message-State: AOJu0Ywf1SXWrtG6nVYXiHeEtzVXav6caucASspL4VO3WG0f9DUfsD4i
	0VPeSBFCpdl0Uc8yGNvj2gI5MAvES5sRcaS7Zy5vEtVycpzwhdrl8CJh9O07wEXnyC4ifqiXFxn
	ISgVNj6YwFFskOLRxv/sD2nXMHeM=
X-Gm-Gg: ASbGnctSgSqxS4a17u9O5Kk/wrpoNhrIVpxENOFRPDsn2rUTsjlsqHm9sGv3CpHPaTN
	ozcfy3tpzsBlQqrydD2BoPnDQe2oVLXUcKMf9BkgNx7wdtd7uheyXnSh1cRfYVGeeVmjivZEwdl
	1ijtByzvWXBP/S9xRC/HKto1a5SOEc
X-Google-Smtp-Source: AGHT+IH5uSoxEkWVCkokza4H6Gj73hSrPf6IKWGTfHUz21YpXSVN0VLTnVft+5pAElzvzN2b/HoqBNBEfB6MqLuVJYA=
X-Received: by 2002:a05:651c:1a0c:b0:30c:7a7:e841 with SMTP id
 38308e7fff4ca-30d72b0ef6fmr19137011fa.34.1742489969318; Thu, 20 Mar 2025
 09:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250320165517.129442-1-martin.jansa@gmail.com> <182E912DEB60EF95.20788@lists.openembedded.org>
In-Reply-To: <182E912DEB60EF95.20788@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Mar 2025 17:59:17 +0100
X-Gm-Features: AQ5f1JrK0nCXJR-BwFncjtUO8TQpeCcjHF-LncHQxZwHOdLHELp3lcM-pCz5U48
Message-ID: <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jean-Pierre Geslin <jarsoper@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213419

This 2nd one was supposed to be sent only as RFC, but I forgot to
update subject sorry.

And this version also has a typo "=3D ?=3D", will send v2 if we want to do
something like this (reverting the
https://git.openembedded.org/openembedded-core/commit/?id=3D16745b20452de60=
ae2474433cc1a2fb1ed9f6a64
is imho better as it doesn't respect the original author from
https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.602=
32-4-brgl@bgdev.pl/
and with CARGO_BUILD_FLAGS_PACKAGECONFIG it's imho more confusing than
useful as the default)

On Thu, Mar 20, 2025 at 5:55=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> * some recipes might be using PACKAGECONFIG_CONFARGS as:
>   RUSTFLAGS:append =3D " ${PACKAGECONFIG_CONFARGS}"
>
>   and then it's difficult to prevent the same args being used
>   here for cargo call as well add intermedate variable
>   CARGO_BUILD_FLAGS_PACKAGECONFIG
>   which could be set to empty in the recipe to avoid that.
>
> * alternatively we can just revert:
>   https://git.openembedded.org/openembedded-core/commit/?id=3D16745b20452=
de60ae2474433cc1a2fb1ed9f6a64
>   and let each recipe decide how it wants to use PACKAGECONFIG_CONFARGS
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/classes-recipe/cargo.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
> index 2dd28e95d3..63e550f5d0 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -43,12 +43,14 @@ CARGO_BUILD_FLAGS =3D "-v --frozen --target ${RUST_HO=
ST_SYS} ${BUILD_MODE} --manif
>  # change if CARGO_BUILD_FLAGS changes.
>  BUILD_DIR =3D "${@['release', 'debug'][d.getVar('DEBUG_BUILD') =3D=3D '1=
']}"
>  CARGO_TARGET_SUBDIR =3D "${RUST_HOST_SYS}/${BUILD_DIR}"
> +CARGO_BUILD_FLAGS_PACKAGECONFIG =3D ?=3D "${PACKAGECONFIG_CONFARGS}"
> +CARGO_BUILD_FLAGS:append =3D " ${CARGO_BUILD_FLAGS_PACKAGECONFIG}"
>  oe_cargo_build () {
>         export RUSTFLAGS=3D"${RUSTFLAGS}"
>         bbnote "Using rust targets from ${RUST_TARGET_PATH}"
>         bbnote "cargo =3D $(which ${CARGO})"
> -       bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFA=
RGS} $@"
> -       "${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "=
$@"
> +       bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
> +       "${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
>  }
>
>  do_compile[progress] =3D "outof:\s+(\d+)/(\d+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213418): https://lists.openembedded.org/g/openembedde=
d-core/message/213418
> Mute This Topic: https://lists.openembedded.org/mt/111812382/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

