Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055BD10AB83D
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 14:55:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74408.1774623292123811086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 07:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z1NuO6+O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48538c5956bso21302095e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 07:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774623290; x=1775228090; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9q01gcYWu0TaxeJWAAhVXKyn/VOy8lykdDME5G8wH4=;
        b=Z1NuO6+O8Cuv0LJhbQVDnnBKTjLOfXWJFFc3mCUanC+CShbydR0V7A5nzbyCnsTzeZ
         vB7yv8ILnj7M/ZJF/gYJ/NkLmgcj6irRO7LGmA99IpzPYA5VvqfeRkq0Vh2siTcl/Mxz
         KWvz/1ivJXOkFYAquWqKopsQ1OHc2CtkB+7bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774623290; x=1775228090;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9q01gcYWu0TaxeJWAAhVXKyn/VOy8lykdDME5G8wH4=;
        b=jvLG5E8UoWR2EdoGEaZSvqQu8pFtiNwDTWz+i8Vt477V5UFAMzMgFf7FK+YkEdqc4C
         8EYX4GmV9LphsB6TiaBBn8pUh11c7FH8IXtz3oDl+B/Pv+ezcXTgdr9ByKtqtYFERRvc
         v/hhwXBceCVpcUpsY+Jp+jdrnFihbSUPSRS1PK1FIZhyQ7eOsoCLL0hSymn5sTqYG2q4
         PB3GNiexXf5xf5CR7HKPpMxeoqWglfNIzqNJ30sGnSAeroieDI09G8fFj5OSwpRB/xhY
         BB9hLEsKRAQlJU+00BCOQWGOo4Do0q9C71HTFOMw0csApDeBPovqajrKDqCyjHT+wTEE
         iomw==
X-Forwarded-Encrypted: i=1; AJvYcCWhytGmgxSl90EbGx5DFfX5jHVgucnr7ddo+E6iEO9owYejdTPcJMTf78W/WZi7+icRKIHJp15rJnJ7EIlFttS5QA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMgUcGh8uikLooFdNnZB2UXXiDVbNsBcPa8FUx1JCKb0APtJUi
	5KdzdaoebrpywjG6dYsqScUuHuEJb8HmLGCOZ9mzLPEy1fma7WByXcTJEjmtHQ/BoSk=
X-Gm-Gg: ATEYQzwW0j1qmqEbLyrWW22ANLlXIVqhAZzB8lrWcBj8/arCuPMWiBl+hXb5xf9kIk+
	HPzEI0UKO9utoubio4HSa5iFtGObzzKc0ohMmeRlhzn245X9kwL0UgQhnxT9n1d1uqDb1yWa5P7
	XOi3NRGl+Yd1VUxn8klzsnhf5+YmeGATMP6Vh/ukR6nNfnWSfVrsZZc8mbxJdk0VaWw6oeAOLUQ
	e0C2OQ61QkwIE+gPGWWypQtzMvb7GeSJB4WnHOtgKycLlcwA+/VRpWOBbVQxsRhsTSWKkBwguT1
	qVrWGMYy+dBqU0A/j5o3WQUo6i5HTk/XtHjQanQbihV3LnDCXJn1hgthQZZLmPST0VBf8AgXFh0
	T7Mw8fFrkC8T6gBgtmIi5wtiZpINdqbdNRsU6qsF5PjEMItFOeDqUXAArpAFaMc/9iPMAzuYQpC
	VgNxcnNgOq3rNXE5wuLF2hB0Kye7X2vR2QZk4sGOxeFoxirtphZsruP+73Ma/ZjLqlpTv9nY9J+
	WvXJPwRmZ85XzXX
X-Received: by 2002:a05:600d:17:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-4872911c031mr30600505e9.12.1774623290373;
        Fri, 27 Mar 2026 07:54:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027? ([2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271718a9sm20162825e9.27.2026.03.27.07.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:54:49 -0700 (PDT)
Message-ID: <d3fe353d964e4dfce0bc4c47f104fc8a9fa2a863.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] uki.bbclass: fix UKI_DEVICETREE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2026 14:54:48 +0000
In-Reply-To: <20260325104830.23519-1-mikko.rapeli@linaro.org>
References: <20260325104830.23519-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 14:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234090

On Wed, 2026-03-25 at 12:48 +0200, Mikko Rapeli via lists.openembedded.org =
wrote:
> UKI_DEVICETREE needs to be empty when KERNEL_DEVICETREE
> is not set. Fixes genericarm64 uki image builds:
>=20
> ERROR: ERROR: cannot find /home/builder/src/core/build/tmp/deploy/images/=
genericarm64/${KERNEL_DEVICETREE}.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/classes-recipe/uki.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index 326697a06660..a6a88240f798 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -80,7 +80,7 @@ UKI_CONFIG_FILE ?=3D "${UNPACKDIR}/uki.conf"
> =C2=A0UKI_FILENAME ?=3D "uki.efi"
> =C2=A0UKI_KERNEL_FILENAME ?=3D "${KERNEL_IMAGETYPE}"
> =C2=A0UKI_CMDLINE ?=3D "rootwait root=3DLABEL=3Droot"
> -UKI_DEVICETREE ?=3D "${KERNEL_DEVICETREE}"
> +UKI_DEVICETREE ?=3D "${@ d.getVar('KERNEL_DEVICETREE') or ''}"
> =C2=A0# secure boot keys and cert, needs sbsign-tools-native (meta-secure=
-core)
> =C2=A0#UKI_SB_KEY ?=3D ""
> =C2=A0#UKI_SB_CERT ?=3D ""

Is there a reason not to do:

KERNEL_DEVICETREE ??=3D ""

instead?

Inline python isn't great...

Cheers,

Richard

