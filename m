Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005E1E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 11:29:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11955.1734953336966382322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 03:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cP45evKw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361a50e337so27809035e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 03:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734953335; x=1735558135; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zo605Pu6jR3TPHE2GefSoQRmljp1kGiwA7VBMhr2uXQ=;
        b=cP45evKwFIphw3RwGXgHdeF/I8t7Q/4YNZpsVbJTI/GgpWcA4xRsTrEC3+W5B659Wn
         V0rx4Dg12k8Wz6RQ3np11ccx509OIpBHXkSWcBIHT8dwOvu8BP+UTG9UvikaucTKIH+0
         sr1MLhgU8mOYGPGWJhZjM66jz1UgljgPWQYF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734953335; x=1735558135;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zo605Pu6jR3TPHE2GefSoQRmljp1kGiwA7VBMhr2uXQ=;
        b=gNDrPg5oJcu8qSRrixunXZh5zfHQbV9Vq6Vlxw4euQJvMcD0SmB5K7Isyd/z8z611l
         a80vh5oK7sa5EA5wsmY22c0//Qe9kqjgUtbIK31RAZTyqP1F9LELG0GCl2Jqq2sGnusI
         QcoeuohgU1R60uGIzDaZz43zmJ9YNUV9b6QSIT0hlcnWpzeO8D0U0favntyOwvmkx3vK
         Sovpfkhq30erPCzoJoa06xzYHQJ5tYhiQSK4j/y6n8AOfr1WwLj21Qdh09XkdkYgcLDq
         2zZShtA1W5R4oA2vT+wCiV3ISTfkEEaPxe0fum59PWgmfh7fStrhlMetdk/FhtPV6ZPa
         D4eg==
X-Forwarded-Encrypted: i=1; AJvYcCWsFY9AeI0RKU0nKo3+Fzy3jwDFqR0y2vhCM5zpGeoZJpmsX1B6dN9bz92l+/EQTdLw0DWYHnFoRlDCZ/U4whAFBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YznitqBDiTe9e2nQifWiwKnzRkQD7ouuZ//mot8edwnpHcFt/uu
	aIhW+3UW+r3D6/oolyyOGhNOJiBN6SVhLKVCH92k+gzb2NJa6kiogFZp0UDWszs=
X-Gm-Gg: ASbGncuJMBo4VqmTT/ZREp58bnUKorlTmyK48lCab0pWV+6FDT7Dw9/wQS2h79PQrGj
	jWClQduSmWOPOddK0QiyfeTwWlP1R18cpGiATi80epvZthhv8pI9yXCHqZ49Nu6Bgd0ExTNQwyE
	w2BAguaYMqgBcDeWJna2h0Ije9ZMNzQ41bBomAmJIMCFR+s7WoYF+bjUUTeqT1e6K1m+yzlVMwp
	P0a1GYicsLFJd7vV71/SVTBJFtNRIJJoXmFkx7OSaaiyO+GUuLV6r8DNeCWCCOPdH54nfT7Pyq1
	DQhuesdFcNGsU5axaCz8GkK0iKyeDh6X4j9U1usNgpDDfQ==
X-Google-Smtp-Source: AGHT+IE6q8Z4nBHUbQD9FNpF+03x5NbWe2JkruG53u9JawDgmhtyhwGuSC732KYJW+Bba1g90GYnFA==
X-Received: by 2002:a05:600c:154a:b0:434:a7f1:6545 with SMTP id 5b1f17b1804b1-43668b7851emr103352735e9.27.1734953335171;
        Mon, 23 Dec 2024 03:28:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ed5:9162:4947:2803? ([2001:8b0:aba:5f3c:6ed5:9162:4947:2803])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b00cf6sm169536715e9.10.2024.12.23.03.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:28:54 -0800 (PST)
Message-ID: <2bd2615ee9d8ba12c0dcc0888057140debfbce4a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 5/5] mesa: Fix missing GLES3 headers in SDK
 sysroot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tom.hochstein@oss.nxp.com, openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2024 11:28:52 +0000
In-Reply-To: <20241222162234.2411262-5-tom.hochstein@oss.nxp.com>
References: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
	 <20241222162234.2411262-5-tom.hochstein@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 11:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209040

On Sun, 2024-12-22 at 10:22 -0600, Tom Hochstein via lists.openembedded.org=
 wrote:
> Building weston with core-image-weston SDK fails:
> ```
> ../libweston/renderer-gl/gl-shader-config-color-transformation.c:29:10: f=
atal error: GLES3/gl3.h: No such file or directory
> =C2=A0=C2=A0 29 | #include <GLES3/gl3.h>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~
> ```
>=20
> Both GLES2 and GLES3 implementations are contained in libGLESv2.so.2,
> which is packaged in libgles2-mesa. However, the headers are split
> between libgles2-mesa-dev and libgles3-mesa-dev, which is why the
> GLES3 headers end up missing in the SDK sysroot.
>=20
> Add a dependency so the GLES3 headers are properly associated with
> the GLES3 implementation.
>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
> =C2=A0meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 9fdf496e8b..84490158f1 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -233,6 +233,10 @@ DEV_PKG_DEPENDENCY =3D ""
> =C2=A0# development package of libgles3.
> =C2=A0RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
> =C2=A0
> +# GLES2 and GLES3 implementations are packaged in a single library in li=
bgles2-mesa.
> +# Add a dependency so the GLES3 dev package is associated with its imple=
mentation.
> +RDEPENDS:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
> +
> =C2=A0RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG',=
 'opencl', 'libclc spirv-tools', '', d)}"

This doesn't quite make sense to me. The line above that RDEPENDS is
adding a dependency in the opposite direction and will effectively make
one package uninstallable without the other.

The question is does the libgles2-mesa-dev package need the libgles3-
mesa-dev package?=C2=A0If not, this is not the right way to solve the
problem you're seeing.

Cheers,

Richard



