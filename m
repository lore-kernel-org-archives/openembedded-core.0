Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AF2C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 15:59:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.52053.1690214351772359828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 08:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gdOJf8VJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so44371105e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690214350; x=1690819150;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pfxYCA9fq7tr+fZBxiTMY9FOBaaDIGdCHgMUo0oUmsw=;
        b=gdOJf8VJvNfELI+8x+qDuxIz+OvCXvmahOpg1nF+HLi9NTYM/Hc0MQVouwmjt7wkle
         3CciNe7l9Bl7O2omw6jXzs/Gn8cHfPragPgqWdgzNBxPgyNvVKaUCxeDnfJw/eUgoT2A
         rnsLruAIaIn4sw2Cl/3cGXLouvhLEpgs666DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690214350; x=1690819150;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfxYCA9fq7tr+fZBxiTMY9FOBaaDIGdCHgMUo0oUmsw=;
        b=TyNxDYqR7PU2A14F2J2G2oWOCtTIefqg2WoYlPtata+C3IeLQ7UDz2sOeviAHIJKzV
         tzPjXL5lmxpmg+h/OjZdysD7PHwlGzapiQnPx9WacPjpA57k/a4xsMSly7FIlvgxYKuZ
         lLWLt57k0UratM0oJEwlLKzgly6TkXEzPrgFMbzD7s56bzGwR7CB7b3aQBOy0HyV5eAY
         q19CDxpXA06sPjGX7E+btPbq04KpNcEYC1pW90nCjj8BJUx/CgjIfZMXcIHWaw7hHXAN
         03ohVI/uhr52Ik6hdeAJeXXPV/7GSHIaC4m6bIwQ/PUaQv9n26CncNVPzelKZsdZLnSr
         kWRA==
X-Gm-Message-State: ABy/qLZaRxiy/t0+gpAYJcvCMToItu/F09wsqgCdsg0dZrH5IB8PuPdO
	x8JIsRjl6poakGrARpphVuOXHw==
X-Google-Smtp-Source: APBJJlFVDrDxNzf98wMmCAdZKPrCVzFhG4ykDN/yPfv6LDWU2t1mxNpzCkPfMMDJNhm9BwTtHa34LA==
X-Received: by 2002:a7b:c4d8:0:b0:3fb:d1db:545b with SMTP id g24-20020a7bc4d8000000b003fbd1db545bmr8135625wmk.20.1690214350177;
        Mon, 24 Jul 2023 08:59:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:10d:c2a3:d51c:55a1? ([2001:8b0:aba:5f3c:10d:c2a3:d51c:55a1])
        by smtp.gmail.com with ESMTPSA id d11-20020a1c730b000000b003fc00892c13sm10537831wmb.35.2023.07.24.08.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 08:59:09 -0700 (PDT)
Message-ID: <0a32f2ba6a3d55a160423da13ffc3e3f30a1e02a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zoltan Boszormenyi <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>
Date: Mon, 24 Jul 2023 16:59:09 +0100
In-Reply-To: <20230724123529.288581-1-zboszor@gmail.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 15:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184796

On Mon, 2023-07-24 at 14:35 +0200, Zoltan Boszormenyi wrote:
> Some BSP architecture builds (e.g. genericx86-64 or anything from
> meta-intel) don't have their /usr/lib/rpm/platform/<arch>-linux
> directories. This causes rpmbuild fail on the target machine.
>=20
> Use ${SDK_ARCH}-linux as the base arch which likely exists in
> /usr/lib/rpm/platform and clone it as ${MACHINE_ARCH}-linux.
>=20
> Also, fix %_lib and %_libdir in the new cloned platform directory
> to use ${baselib} and ${libdir} so the RPM package contents will
> be correct for library packages.
>=20
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.18.1.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.18.1.bb
> index 95a9e92f96..21f0127561 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> @@ -131,7 +131,20 @@ do_install:append:class-nativesdk() {
>  # Rpm's make install creates var/tmp which clashes with base-files packa=
ging
>  do_install:append:class-target() {
>      rm -rf ${D}/var
> +
> +    if [ -d "${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux" ]; then
> +        if [ ! -d ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux ]=
; then
> +            cp -r ${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux ${D}$=
{prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux
> +        fi
> +    fi


SDK_ARCH should not be referenced outside of nativesdk recipes. This
reference is almost certainly incorrect as it would make the target
recipe dependent on the value of SDKMACHINE.

Cheers,

Richard


