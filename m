Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1AFC27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 08:40:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3500.1718268023533112170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 01:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B/7G0XTG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso11564985e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 01:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718268022; x=1718872822; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLdPD8OjG29eSMH8zcUsch+x32sbCZ4BHAyt2vuqVRM=;
        b=B/7G0XTGE6gcc8KZmLNvMYk3LXazMg1IXKUMXIf/ek2LUT+zO9l5w9V81UIFcR/f/W
         I5C03EAekxisBOf/no9Gp8kbmcdLJ3gCIa6N+OqYal2ftA35VsyvpanL7VGzKgSxKAge
         eyE5Bqll25CiPERW88vR4fYsOCYnr5G3l+hNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718268022; x=1718872822;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pLdPD8OjG29eSMH8zcUsch+x32sbCZ4BHAyt2vuqVRM=;
        b=ihrXJTYqIfoAAHK+khvT6Tp87lU/ZSg3tySuzGbCRlRfMNwoD+8e1DgoZUiFGrsuKn
         IIwyKaNDe814kUmdB/+797JlcX1yz8emGQOS3j5NSmKqbrI9j0FY6EfBZf09cx02uUYj
         PaczC6EzGX+Kj+8K9k1l5zJwuIXk9uqsSOXPUgoxUFlyiZCi6EYOWj00RCdzG5IuIolA
         cuRn+FLs5QMqCxfdLSiPLYd+XLhz8XcDydB/vOS3J7u16tQ0bjiTfRsSxhYn0wMMgV8M
         N1/iCnJ+O6O/Bqp5f6lbADkO+Zb1h0w0g8ZLShi2RcnikLhuHE4Kr/ozua8iUayaLxm1
         d2VA==
X-Forwarded-Encrypted: i=1; AJvYcCVq/EjiXl/uKluYK7EiQUJG/gbtFzAGhBlWgAdarch2xIQB74RnrfdpF461IgNJGnwL2gWXE5jI21GZfblu+clueSpfTtuMsK33QVIdmf/uZ3dm9uG7tUWi
X-Gm-Message-State: AOJu0YxWcArnswLiaD6b8MVfSzViY5vsD1F73+rxNHVwAd8Pc7AHM2DR
	IpGe9gfkWmbbdfzoV2mASVHvPpobjdC4YOrI5djkf8uSKXh9xtP/eI3wEZ1Kld27x2LiUfXh774
	p
X-Google-Smtp-Source: AGHT+IFaRvVsDqXL1nQzmey4SWHJS0W4k1qfSYvfY/L+SqIuCjzbffydonMB7deiYihPjkBnIGV5tQ==
X-Received: by 2002:a05:600c:5102:b0:421:7dc3:9a15 with SMTP id 5b1f17b1804b1-422b6fc45a6mr18908585e9.11.1718268021753;
        Thu, 13 Jun 2024 01:40:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fbe4:47b4:75ac:5e6d? ([2001:8b0:aba:5f3c:fbe4:47b4:75ac:5e6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42303e892a1sm210835e9.22.2024.06.13.01.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 01:40:21 -0700 (PDT)
Message-ID: <df18afb1f26ccd4f7abfa6299b334641b7fa7665.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] expect-native: fix build with gcc-14
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2024 09:40:20 +0100
In-Reply-To: <20240613061859.3777324-1-changqing.li@windriver.com>
References: <20240613061859.3777324-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 08:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200594

On Thu, 2024-06-13 at 14:18 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> * do_configure failed with gcc-14:
> error in build/config.log:
> conftest.c:56:3: error: return type defaults to 'int' [-Wimplicit-int]
> conftest.c:59:5: error: implicit declaration of function 'exit' [-Wimplic=
it-function-declaration]
>=20
> * this recipe set "BBCLASSEXTEND =3D "native nativesdk", causes "CFLAGS +=
=3D"
> setting not take effect, use append instead.
> snip of bitbake expect-native -e:
> =C2=A0=C2=A0 set /layers/oe-core/meta/conf/documentation.conf:110
> =C2=A0=C2=A0=C2=A0=C2=A0 [doc] "Flags passed to the C compiler for the ta=
rget system. This variable evaluates to the same as TARGET_CFLAGS."
> =C2=A0=C2=A0 append /layers/oe-core/meta/recipes-devtools/expect/expect_5=
.45.4.bb:87
> =C2=A0=C2=A0=C2=A0=C2=A0 "-Wno-error=3Dincompatible-pointer-types"
> =C2=A0=C2=A0 set /layers/oe-core/meta/classes-recipe/native.bbclass:44
> =C2=A0=C2=A0=C2=A0=C2=A0 "${BUILD_CFLAGS}"
> =C2=A0=C2=A0 override[pn-gtk4]::append[toolchain-clang] /layers/meta-clan=
g/conf/nonclangable.conf:336
> =C2=A0=C2=A0=C2=A0=C2=A0 " -Wno-error=3Dint-conversion"
> =C2=A0=C2=A0 override[pn-pidgin-sipe]::append[toolchain-clang] /layers/me=
ta-clang/conf/nonclangable.conf:340
> =C2=A0=C2=A0=C2=A0=C2=A0 " -Wno-error=3Dcast-function-type-strict"
> =C2=A0pre-expansion value:
> =C2=A0=C2=A0 "${BUILD_CFLAGS}"
> export CFLAGS=3D"-isystem/build/tmp-glibc/work/x86_64-linux/expect-native=
/5.45.4/recipe-sysroot-native/usr/include -O2 -pipe"
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/expect/expect_5.45.4.bb | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes=
-devtools/expect/expect_5.45.4.bb
> index 18904ebc10..5e7b352196 100644
> --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
> +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> @@ -84,4 +84,7 @@ BBCLASSEXTEND =3D "native nativesdk"
> =C2=A0
> =C2=A0# http://errors.yoctoproject.org/Errors/Details/766950/
> =C2=A0# expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tc=
l_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, in=
t)' [-Wincompatible-pointer-types]
> -CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> +CFLAGS:append =3D " -Wno-error=3Dincompatible-pointer-types"
> +
> +# Fix expect-native configure tests are failing with gcc-14
> +CFLAGS:append:class-native =3D " -Wno-error=3Dimplicit-int -Wno-error=3D=
implicit-function-declaration"
>=20

You have a valid problem here however I really don't like the "arms
race" of making everything an append as the base definitions are
problematic. It would be this recipe today but a quick search shows
many other recipes which will have similar problems.

I think I'd prefer to see if we can drop the assignments in
native/nativesdk bbclass and improve things that way even if it is a
bit more invasive.

I'm testing a patch on master-next to test this and see how bad the
fallout is.

Cheers,

Richard



