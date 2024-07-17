Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2671C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 06:29:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.9260.1721197788440351439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 23:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zjc8YYLU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4266f535e82so43799785e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 23:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721197787; x=1721802587; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ipHZ+VcByVD3aC1EaDYDjCKR4xS51usQFfV78rGJ3Ak=;
        b=Zjc8YYLUTJxKqQ6fEcfJQVW8B6vg9ZGZTzMxq1vxsOmctRa8uS2k66hXFYn/rOSWoZ
         holVKGFYm5RgM+NnvkoFoFwGZNvGT+3ltJcAf8AR8mf0SeEQvpU6WXevIfxBhoTfHAnO
         ApFRAQaZ6We0Ae5lOMiB1C5webMNqFxlHZ67A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197787; x=1721802587;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipHZ+VcByVD3aC1EaDYDjCKR4xS51usQFfV78rGJ3Ak=;
        b=dFnIQwgzgU/yNeWC/PdDmhPFfgS7J46VQ4VILclsW6dfErdd8yUT+zKeg3sbIEPK1P
         ZIdDRleA1Hs50zAdMk/OLMOnys7dsE5XKjbg9gSJmCLkGnEfbAMmLM6FA0WUfVVVPJzv
         a5PJ4qMqQkk+3rXgWqsnVEBbjmFBHw4OtbveMbZKmH9b+FlbWxGJPnjqYgd/Wencoa2c
         gAA+LlesD4Bxov09YTpjosSkPjmuUnBd8+bFNW0PM7MCYcO5bojJfjRO1QU4obi9VabM
         vQopzTfAHc5pLRbbE893F5lH23IJ3lJ0n6o7VjYtn3FK3SX8y2ywTrHaz/y7LHkpR30T
         lVwg==
X-Forwarded-Encrypted: i=1; AJvYcCUo/v2+n2jYgGS+AypvZ5tOtd2v7aoKU3PUDacCXC2RoBkcLAzf/jBOWi/HwGroBQGxRRfl7kinsW5az+bdEYG/Jyd/+uYvtmye/cAjv6tWUhoRjQT23iXg
X-Gm-Message-State: AOJu0YyEV/5/CLqMD0prTmVa6oX3J8BmQ6Ved4F+pbcT3XEsF/Ccud9o
	V7ExiKCLabPsGmc6WkFv0VDlVL/yVTK7JJxA/aUQ60OqwezHT7w0gffBaWllgtY=
X-Google-Smtp-Source: AGHT+IGMs/IO8a5BdBjpVZ8wDWM7v+kWh8jLSwhIWJva/QNDj+/WWQ03CFdmyiEPpQQrlD6PXCXByw==
X-Received: by 2002:a05:600c:470f:b0:426:63ff:f763 with SMTP id 5b1f17b1804b1-427c2d08a41mr5953565e9.36.1721197786591;
        Tue, 16 Jul 2024 23:29:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d6ba:b62e:2f63:27f1? ([2001:8b0:aba:5f3c:d6ba:b62e:2f63:27f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2d74c6sm190262105e9.45.2024.07.16.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:29:46 -0700 (PDT)
Message-ID: <7f395fd1db119b4d0b6777bdb17aa4572b45bb97.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] nativesdk-libtool: sanitize the script,
 remove buildpaths
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: denis@denix.org, openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Date: Wed, 17 Jul 2024 07:29:45 +0100
In-Reply-To: <20240716220940.3828246-1-denis@denix.org>
References: <20240716220940.3828246-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 06:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202138

On Tue, 2024-07-16 at 18:09 -0400, Denys Dmytriyenko via lists.openembedded=
.org wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> Copy the same sed command to sanitize libtool script from target recipe
> to nativesdk one. Otherwise fails with buildpaths QA error:
>=20
> ERROR: nativesdk-libtool-2.5.0-r0 do_package_qa: QA Issue: File /usr/loca=
l/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/libtool =
in package nativesdk-libtool contains reference to TMPDIR [buildpaths]
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> =C2=A0.../libtool/nativesdk-libtool_2.5.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb b/m=
eta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
> index ddb60e717c..69de7a8e40 100644
> --- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
> +++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
> @@ -13,6 +13,18 @@ do_install () {
> =C2=A0	autotools_do_install
> =C2=A0	install -d ${D}${bindir}/
> =C2=A0	install -m 0755 libtool ${D}${bindir}/
> +
> +	sed -e 's@--sysroot=3D${STAGING_DIR_HOST}@@g' \
> +	=C2=A0=C2=A0=C2=A0 -e "s@${DEBUG_PREFIX_MAP}@@g" \
> +	=C2=A0=C2=A0=C2=A0 -e 's@${STAGING_DIR_HOST}@@g' \
> +	=C2=A0=C2=A0=C2=A0 -e 's@${STAGING_DIR_NATIVE}@@g' \
> +	=C2=A0=C2=A0=C2=A0 -e 's@^\(sys_lib_search_path_spec=3D"\).*@\1${libdir=
} ${base_libdir}"@' \
> +	=C2=A0=C2=A0=C2=A0 -e 's@^\(compiler_lib_search_dirs=3D"\).*@\1${libdir=
} ${base_libdir}"@' \
> +	=C2=A0=C2=A0=C2=A0 -e 's@^\(compiler_lib_search_path=3D"\).*@\1${libdir=
} ${base_libdir}"@' \
> +	=C2=A0=C2=A0=C2=A0 -e 's@^\(predep_objects=3D"\).*@\1"@' \
> +	=C2=A0=C2=A0=C2=A0 -e 's@^\(postdep_objects=3D"\).*@\1"@' \
> +	=C2=A0=C2=A0=C2=A0 -e "s@${HOSTTOOLS_DIR}/@@g" \
> +	=C2=A0=C2=A0=C2=A0 -i ${D}${bindir}/libtool
> =C2=A0}
> =C2=A0
> =C2=A0SYSROOT_PREPROCESS_FUNCS +=3D "libtoolnativesdk_sysroot_preprocess"
>=20

Rather than duplicate code, particularly long commands like this, it
should be moved to a function and called from both locations.

Cheers,

Richard

