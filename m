Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CCBC61D97
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 22:42:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.7581.1700606557182825838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 14:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BgGVLA2X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32deb2809daso4053995f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 14:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700606555; x=1701211355; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOEL7CQOITF5YgAKE+/K/4hS5nAbIMs6oRbm8k0cs1g=;
        b=BgGVLA2XmDKB0sdyZlB6I2lQRydkfCd2r2Wg0RlGFXr82XRLsmqvv8OnjrM49NK0rE
         KuydXJvZGoERL30N5xN/xNExdCFLpeJT4qOBASkN8dfAhUnQvdEOhTHvl4UFwNU44PPW
         bhg12U5QhXmtUxiiVFeMH9+2joFnpRvTMJfSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606555; x=1701211355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EOEL7CQOITF5YgAKE+/K/4hS5nAbIMs6oRbm8k0cs1g=;
        b=ASMJFNKX85Nq/PbDNv/sb606hHnfE220atNRnPd76Xou2V9Pq3sGF98xzt45uT8np2
         +w+c48bCvXO26fPA4fmR3FygKsbHMjmJ987oRm/tkU0bMdDeQ8NWTNz3hHEtCV6Vvy5H
         l1Cm4HCU5xHqu7A5fxZAONmanbFiUXJ96FaHL1T/PprHa6eTJ+rb1kguM2GOSKkkRurz
         BmOCeaxcQt321ICBvun88YJu2VkWCP+XH/7MtoUdXR9zWj5Zw7VC8pNJKClMOonQyiYI
         wlp86n/y8Az/G7qqDaCGjwJVBhGC5TDTTP2IkYfkXwk/PPJfSmC6XZ9BkUdRix+awj27
         rS9Q==
X-Gm-Message-State: AOJu0YxBLG08qeRpw0q/uEmpZwNNMKpOBvZO0m6wQCE7Yvx46QTgPxHw
	iQGOliUn0SqjhZ+2L7EndkP+A4eZDb4Jo24CziY=
X-Google-Smtp-Source: AGHT+IFL9NKLZFp/vW1uN3iH9FgT5iPLwwXZzgORjNhXTf8UfCXpmoAwQyGLYzgy23OkG3sZ7nQJIQ==
X-Received: by 2002:a05:6000:11d1:b0:32d:8bf9:1990 with SMTP id i17-20020a05600011d100b0032d8bf91990mr256353wrx.37.1700606555520;
        Tue, 21 Nov 2023 14:42:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1718:e534:44cc:c75e? ([2001:8b0:aba:5f3c:1718:e534:44cc:c75e])
        by smtp.gmail.com with ESMTPSA id c3-20020a05600c0a4300b0040839fcb217sm116262wmq.8.2023.11.21.14.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 14:42:35 -0800 (PST)
Message-ID: <7946b5be5430d60cf12b4a342c6c9047e2b1b843.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] libxcrypt: fixed some build error for
 nativesdk with mingw
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wenlin.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2023 22:42:34 +0000
In-Reply-To: <20231121094154.3406211-1-wenlin.kang@windriver.com>
References: <20231121094154.3406211-1-wenlin.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 22:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190994

On Tue, 2023-11-21 at 01:41 -0800, wenlin.kang@windriver.com via
lists.openembedded.org wrote:
> From: Wenlin Kang <wenlin.kang@windriver.com>
>=20
> Steps to reproduce
>   1) add layer meta-mingw
>   2) add line in local.conf
>      SDKMACHINE =3D "x86_64-mingw32"
>   3) bitbake nativesdk-libxcrypt
>=20
> Fixed:
> 1. pedantic error
>   | ../git/lib/crypt.c:316:24: error: ISO C does not allow extra ';' outs=
ide of a function [-Werror=3Dpedantic]
>   |   316 | SYMVER_crypt_gensalt_rn;
>   |       |
>=20
> 2. conversion error
>   | ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_by=
tes':
>   | ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'si=
ze_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-W=
error=3Dconversion]
>   |   140 |           ssize_t nread =3D read (fd, buf, buflen);
>=20
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>  ...dom-bytes.c-fixed-conversion-error-w.patch | 47 +++++++++++++++++++
>  meta/recipes-core/libxcrypt/libxcrypt.inc     |  6 ++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-get-r=
andom-bytes.c-fixed-conversion-error-w.patch
>=20
> diff --git a/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-b=
ytes.c-fixed-conversion-error-w.patch b/meta/recipes-core/libxcrypt/files/0=
001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
> new file mode 100644
> index 0000000000..3846f76674
> --- /dev/null
> +++ b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-=
fixed-conversion-error-w.patch
> @@ -0,0 +1,47 @@
> +From ff99091eb8a6b9e6edc567f6d2552183fbaacec3 Mon Sep 17 00:00:00 2001
> +From: Wenlin Kang <wenlin.kang@windriver.com>
> +Date: Mon, 6 Nov 2023 14:43:28 +0800
> +Subject: [PATCH] lib/util-get-random-bytes.c: fixed conversion error wit=
h
> + mingw
> +
> +With x86_64-w64-mingw32-gcc. get below error:
> +| ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_byt=
es':
> +| ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'siz=
e_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-We=
rror=3Dconversion]
> +|   140 |           ssize_t nread =3D read (fd, buf, buflen);
> +|       |                                          ^~~~~~
> +
> +In util-get-random-bytes.c, has get_random_bytes(void *buf, size_t bufle=
n),
> +but in mingw-w64-mingw-w64/mingw-w64-headers/crt/io.h, read() has "unsig=
ned int"
> +read(int _FileHandle,void *_DstBuf,unsigned int _MaxCharCount), and has:
> + #ifdef _WIN64
> +   __MINGW_EXTENSION typedef unsigned __int64 size_t;
> + #else
> +   typedef unsigned int size_t;
> + #endif /* _WIN64 */
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + lib/util-get-random-bytes.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/lib/util-get-random-bytes.c b/lib/util-get-random-bytes.c
> +index 79816db..68cd378 100644
> +--- a/lib/util-get-random-bytes.c
> ++++ b/lib/util-get-random-bytes.c
> +@@ -137,7 +137,11 @@ get_random_bytes(void *buf, size_t buflen)
> +         dev_urandom_doesnt_work =3D true;
> +       else
> +         {
> ++#ifdef _WIN64
> ++          ssize_t nread =3D read (fd, buf, (unsigned int)buflen);
> ++#else
> +           ssize_t nread =3D read (fd, buf, buflen);
> ++#endif
> +           if (nread < 0 || (size_t)nread < buflen)
> +             dev_urandom_doesnt_work =3D true;
> +=20
> +--=20
> +2.25.1
> +
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-cor=
e/libxcrypt/libxcrypt.inc
> index ba93d91aef..b93d56b4dc 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -13,7 +13,9 @@ SRC_URI =3D "git://github.com/besser82/libxcrypt.git;br=
anch=3D${SRCBRANCH};protocol=3D
>  SRCREV =3D "f531a36aa916a22ef2ce7d270ba381e264250cbf"
>  SRCBRANCH ?=3D "master"
> =20
> -SRC_URI +=3D "file://fix_cflags_handling.patch"
> +SRC_URI +=3D "file://fix_cflags_handling.patch \
> +            file://0001-lib-util-get-random-bytes.c-fixed-conversion-err=
or-w.patch \
> +	    "
> =20
>  PROVIDES =3D "virtual/crypt"
> =20
> @@ -26,4 +28,6 @@ CPPFLAGS:append:class-nativesdk =3D " -Wno-error"
>  API =3D "--disable-obsolete-api"
>  EXTRA_OECONF +=3D "${API}"
> =20
> +CFLAGS:append:class-nativesdk =3D " -Wno-pedantic"
> +
>  BBCLASSEXTEND =3D "native nativesdk"

Should this go to meta-mingw instead of OE-Core? Shouldn't something be
submitted upstream? This certainly isn't the kind of patch we want to
carry.

Cheers,

Richard

