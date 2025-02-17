Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47050C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 22:02:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.5803.1739829750553917708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 14:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VJSBj8Fq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso28836275e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 14:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739829749; x=1740434549; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=syOLKw50Cz3yHosFuswt9hN/SdLckBnqMG3cG0gr4CA=;
        b=VJSBj8Fqx+YajyF4PaC9uhHYJEu0w5i4GbHyKEVQVd13tZNZffScFAtz49MlDfuFmr
         fKKyErUEDSKGJBAnxLU8Q6/bPXSQ3+4RmJ/h+1Gh39Ahw5czDIbRi5nAy2lM7Dmv6PtD
         AOGZf0bMhhlS4GbRv8WSYiQhgZVSjbWei6HPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739829749; x=1740434549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=syOLKw50Cz3yHosFuswt9hN/SdLckBnqMG3cG0gr4CA=;
        b=VSs0/FWHkY5gyPy/PrAypJR58NnO7CMUfDpW8ryNWCzjoCuDp9z1XZS9Le+i4M0rTk
         CzEHdUw5HGE4F25CVIPbCQlmNbp3U+cwx4tJde7AId+lO+gjZUi232N+3Ke+778ITmCC
         uPNyTy05dhovgOJLt0dyjAfhACnaRggs7dEDDTHjT8APtKwaLX0SUUsAe11fqpnU30qf
         ag/LvWZUll2M2h63yyURBIlsxGHE58U0chNe4c3H4mGkGiM/R3U1Z7DBA03AOT6JZfmx
         ip16TmCBceKW2MnIQrWiU8s3e+hxr9Q14uCC80QFpsIrn+Vbob5ifNg8djnop08sad8B
         6yig==
X-Forwarded-Encrypted: i=1; AJvYcCWpGNcOpxcF6DOiFAxEp/3KB4aSITbIUnYwkGMFix6hczgT6wqTblotkG1lQ1YnQxEQf7nRiO7TmKgjECDIKLFc7g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyv0BDb3DruSA7blgh215SyzTSbzqdseah0BlvTO6rtYBUIL+7v
	/zWc0MOvgGrl/aAZSTF3lz+vqTboi6js7zw3/1x70st8kuTwESNUvXKEO3an7Mw=
X-Gm-Gg: ASbGncsiKJ7iMlcuEKUYt7v8NHlCBE1J+FqF/N99cZ3ROzbplWLKbKluntnf3lJsfqO
	l5orQSQBF2IiYs8N8ZzvUgwthPRzMEr6HOPD3YcabSNLJkrWtTGZ/Sk3qNmwGzwUB13FtzZmT63
	nBGqVy6B2lSD9aMDl+qyo32sPRssQY4P7Hv6u2e7pCeQi9yFLFCj0IZcnJOAMXKwniIAMJJXgZ+
	lB8MGFMsPhs785YXLDG46o3vr1JcJkuq9ND8TR3c0AR1a1M75jC4TBSJ8DLYiE86uZQWKTsh8CH
	lhtWAf4yAXw37Zfv4ysP+Syb5zUy4MLEqSZVgX+U5cekYuxRP5IAPEo/YDsmONH4AbdRm38Dl8h
	DidcA
X-Google-Smtp-Source: AGHT+IFtMP65M4SSVGYTC/QkW6NcPhsF4RZfE8M9/0i2S78MFGO3LOsgM3yekVERxArNdCGvkFt92w==
X-Received: by 2002:a05:600c:1989:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-439873a1338mr32297855e9.6.1739829748947;
        Mon, 17 Feb 2025 14:02:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f127:df56:488b:353b? ([2001:8b0:aba:5f3c:f127:df56:488b:353b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258cccd3sm13243821f8f.23.2025.02.17.14.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 14:02:27 -0800 (PST)
Message-ID: <ad3e4563833e3c899f0e10ee4c1eed6115554f12.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] kernel.bbclass: Handle possible
 multiconfig.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel.Mueller@karlstorz.com, openembedded-core@lists.openembedded.org
Cc: Sebastian Zenker <sebastian.zenker@gmx.de>
Date: Mon, 17 Feb 2025 22:02:24 +0000
In-Reply-To: <20250206142603.3870360-3-daniel.mueller@karlstorz.com>
References: <20250206142603.3870360-2-daniel.mueller@karlstorz.com>
	 <20250206142603.3870360-3-daniel.mueller@karlstorz.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 22:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211554

On Thu, 2025-02-06 at 15:22 +0100, Mueller, Daniel via lists.openembedded.o=
rg wrote:
> From: Sebastian Zenker <sebastian.zenker@gmx.de>
>=20
> When specifying the dependencies of do_bundle_initramfs the current
> multiconfig might not be the default. This fixes the dependencies between
> the multiconfigs if the current differs to default.
>=20
> Signed-off-by: Mueller, Daniel <daniel.mueller@karlstorz.com>
> ---
> =C2=A0meta/classes-recipe/kernel.bbclass | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 617727a989..9276ddb62a 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -146,7 +146,10 @@ set -e
> =C2=A0=C2=A0=C2=A0=C2=A0 # standalone for use by wic and other tools.
> =C2=A0=C2=A0=C2=A0=C2=A0 if image:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if d.getVar('INITRAMFS_M=
ULTICONFIG'):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.app=
endVarFlag('do_bundle_initramfs', 'mcdepends', ' mc::${INITRAMFS_MULTICONFI=
G}:${INITRAMFS_IMAGE}:do_image_complete')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mc =
=3D d.getVar('BB_CURRENT_MC')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if mc=
 =3D=3D 'default':
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mc =3D ''
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.app=
endVarFlag('do_bundle_initramfs', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_=
MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_i=
mage_complete')
> =C2=A0=C2=A0=C2=A0=C2=A0 if image and bb.utils.to_boolean(d.getVar('INITR=
AMFS_IMAGE_BUNDLE')):

The "default" value in multiconfig was recently removed entirely so
this patch is not needed for master. This does raise questions of how
it was tested.

Cheers,

Richard

