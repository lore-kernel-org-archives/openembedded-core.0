Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD9BC47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 17:50:20 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.18496.1704909015091492239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 09:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Juk5TQG7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e67e37661so5555335e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 09:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704909013; x=1705513813; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=He2hMekjgB/gyjRYreFy6UVh0AcnMjNUH67JlElplqY=;
        b=Juk5TQG7LBUxBBAX4IAEpQgO191ApBBGEQcV3iNOSa71cO9GmlkMheybha8yODNk6l
         7PV65KBydanpA5VqoidZphzCWpHnuwm9SZhelshWo4bSLVOlFWteQvac9KH2Cv8TTan9
         vZLkAOWJu1SYLPv2jWretaroXoe9FlmwhqCEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704909013; x=1705513813;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=He2hMekjgB/gyjRYreFy6UVh0AcnMjNUH67JlElplqY=;
        b=GCJ3ye5lubaaaF8M/deZKEHTqr0fsVHu68+UWo+3M/mqhTsthEiWEmoDev7MmpMVSg
         +HI3WY73ijDD48lIWL8pDjOqOkZJlIeyi+yHwr21hGuVnToXVY3dNFO6c5SycfWkonhb
         svNKLiaLVxoNDQOSSpz9lmkIKnlaMX7JRYQcW+Mtyp8TLYFVkobOulcyiBbqDYr/7rW5
         KmHtwuIQBFqQMwS2Jq0qq9/9kl1oOrnTgWVUrSMQvv2ucHIDfV+FAZPnimbzuz/ERYow
         CMl8KDJbP/C25DWBvHAUBs5w/s0uvnGZ/plTMXZWIzPYZy4sjfNFnyjdMAdoA19/D+rk
         mj/w==
X-Gm-Message-State: AOJu0YzhcTZ2mpLP9t4D4pyB/JrZllO9xOOYUTxIcFLY8toKlrGmvgh1
	XEZWtp6BguRH6v8Iqww8CpP8JZ1xHslwug==
X-Google-Smtp-Source: AGHT+IEFZJU2srCYTIlOs9bJIcT5ZJHNaRXza1LMN0Wnst6ceI/+fozvuoNvPHPtt/d8YW9JwwOoWw==
X-Received: by 2002:a19:ac06:0:b0:50e:7dcc:2999 with SMTP id g6-20020a19ac06000000b0050e7dcc2999mr655138lfc.61.1704909013162;
        Wed, 10 Jan 2024 09:50:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd40:945a:4f08:4810? ([2001:8b0:aba:5f3c:bd40:945a:4f08:4810])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb0f000000b003374d8306cesm5390899wrr.86.2024.01.10.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 09:50:12 -0800 (PST)
Message-ID: <88273782b8cce2458c155e9754afe0bc281fcb6b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] shadow: link executables statically for
 -native variant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 10 Jan 2024 17:50:11 +0000
In-Reply-To: <20240110120948.4140846-2-alex@linutronix.de>
References: <20240110120948.4140846-1-alex@linutronix.de>
	 <20240110120948.4140846-2-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 17:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193517

On Wed, 2024-01-10 at 13:09 +0100, Alexander Kanavin wrote:
> shadow 4.14.x adds a number of libraries it dynamically links with
> (md, bsd, attr). This causes troubles in setscene tasks where
> shadow executables are used (such as useradd), as pulling in
> the needed dynamic libraries needs unpleasant special-casing.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
> index c024746d4ff..67346aa5cb1 100644
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
> +               ${B}/*/Makefile
> +}
> +
>  NSCDOPT =3D ""
>  NSCDOPT:class-native =3D "--without-nscd"
>  NSCDOPT:class-nativesdk =3D "--without-nscd"

Something isn't quite right:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8749
https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3837
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4219
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6301/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/1155/ste=
ps/13/logs/stdio

:(

I'm going to stop that build.

Cheers,

Richard



