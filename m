Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4E5C4707B
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 10:10:40 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.8497.1704967836035424284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 02:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YlKnUo8w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd33336b32so68009081fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 02:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704967834; x=1705572634; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e6Y6rpFdNhTfMDe6RTj+VW6Ygp/8jJH8l3pagSb06eg=;
        b=YlKnUo8wfxukILZrFiFxlFCzfIUvRDOCYnDbmurti8DB2QrVSwoVn6MgRNC35l9CVO
         az4HrnnnJHRZujAMxMKIHsIy/RRrBAbqgVkys+sOO8igDkBQloob/TzFpHIvgOYMw7yd
         XcgstrwphUlM0MzmD4L10wymNctytg+x3ig2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704967834; x=1705572634;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6Y6rpFdNhTfMDe6RTj+VW6Ygp/8jJH8l3pagSb06eg=;
        b=miCawTzbSKlWV99SzacF/xPqrBvyMLJr/VdWjSDxr7dWyXhvAAjMiA1wB0Qi82RkD+
         37luGGzE5GNRYCoq2dK2a0YuzpIzkuIKsGmxAEX4AoWkAVj2LFsRdhCYmapwjNtUE7ze
         s3Eu8NeZIyQeLQIz45zF2+ChfKPIP1Vwv3wmkPQUtneEIfqFPTbu33rHrcQHyFe5snmN
         LjSX13yPTD8bEfljgK5b+ZIFc6PJbqOueYmRnWSj1oYTcqQHEPO6Vej13AuMQ8k+9y2p
         VhVADCaQt57i6bVdR41wxOGHG6DU2vvTYmZxHOWOJ5Y1YH5GxyLEIsqyklqjG6E3NO2R
         jhIA==
X-Gm-Message-State: AOJu0YzIIgY2rEqIo5d0IP7KKYlVZI3hTkvQHtAU/0Ev8x/PvwGWqUme
	Y7sfzwZGlWtKWcFh6gA9YEfd09thQvmzXw==
X-Google-Smtp-Source: AGHT+IEK1rYP0RIJJfcIzzdanvW0HOK8Q29277EmLeYr7CUEuGElEK0S8IQSrv0Gx8KISDMsMPMfhQ==
X-Received: by 2002:a2e:3516:0:b0:2cc:ea5b:ba6b with SMTP id z22-20020a2e3516000000b002ccea5bba6bmr270859ljz.26.1704967833898;
        Thu, 11 Jan 2024 02:10:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4356:b19b:2f4b:a082? ([2001:8b0:aba:5f3c:4356:b19b:2f4b:a082])
        by smtp.gmail.com with ESMTPSA id j27-20020adfb31b000000b00336e32338f3sm805840wrd.70.2024.01.11.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:10:33 -0800 (PST)
Message-ID: <2ef29e5b69f7e46c24be48828a650de28cbfd5ab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] shadow: link executables statically for
 -native variant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 11 Jan 2024 10:10:32 +0000
In-Reply-To: <20240110200329.2173442-2-alex@linutronix.de>
References: <20240110200329.2173442-1-alex@linutronix.de>
	 <20240110200329.2173442-2-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 10:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193536

On Wed, 2024-01-10 at 21:03 +0100, Alexander Kanavin wrote:
> shadow 4.14.x adds a number of libraries it dynamically links with
> (md, bsd, attr). This causes troubles in setscene tasks where
> shadow executables are used (such as useradd), as pulling in
> the needed dynamic libraries needs unpleasant special-casing.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>=20
> ---
> v2: patch only Makefiles that produce executables and libshadow.a
> (that executables all statically link with), do not patch libsubid/Makefi=
le,
> as patching in .a linking can clash with producing dynamic libraries.
> libsubid is used only in getsubids executable, which is not used in
> setscene user management (or anywhere else from what I can see).
> ---
>  meta/conf/distro/include/no-static-libs.inc | 5 +++++
>  meta/recipes-extended/shadow/shadow.inc     | 9 +++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/dist=
ro/include/no-static-libs.inc
> index 75359928a14..8898d53d756 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -21,6 +21,11 @@ DISABLE_STATIC:pn-libusb1-native =3D ""
>  # needed by rust
>  DISABLE_STATIC:pn-musl =3D ""
> =20
> +# needed by shadow-native to build static executables, particularly user=
add
> +DISABLE_STATIC:pn-attr-native =3D ""
> +DISABLE_STATIC:pn-libbsd-native =3D ""
> +DISABLE_STATIC:pn-libmd-native =3D ""
> +
>  EXTRA_OECONF:append =3D "${DISABLE_STATIC}"
> =20
>  EXTRA_OECMAKE:append:pn-libical =3D " -DSHARED_ONLY=3DTrue"
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
> index c024746d4ff..e16d3f010d2 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -47,6 +47,15 @@ EXTRA_OECONF +=3D "--without-libcrack \
> =20
>  CFLAGS:append:libc-musl =3D " -DLIBBSD_OVERLAY"
> =20
> +# Force static linking of utilities so we can use from the sysroot/sstat=
e for useradd
> +# without worrying about the dependency libraries being available
> +do_compile:prepend:class-native () {
> +	sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LI=
BDIR}/libmd.a#g' \
> +	       -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_=
LIBDIR}/libmd.a#g' \
> +	       -e 's#\(LIBATTR.*\)-lattr#\1 ${STAGING_LIBDIR}/libattr.a#g' \
> +               ${B}/lib/Makefile ${B}/src/Makefile
> +}
> +
>  NSCDOPT =3D ""
>  NSCDOPT:class-native =3D "--without-nscd"
>  NSCDOPT:class-nativesdk =3D "--without-nscd"

There is still something not right:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6440

:(

Cheers,

Richard


