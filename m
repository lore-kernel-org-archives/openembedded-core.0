Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39911C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 14:17:50 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.11374.1675433865899669844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 06:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KMXyCjbk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id bg26so4004245wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 06:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2uThNN1veRVxQRjYlf4JqSH5GR47NPglPmDKWCzRjwE=;
        b=KMXyCjbkkeNFKceD0gmSg6bb+4o/S6G0VNmpOTscbHLOaO/YYBrPSBxRPwbM+Tb5Za
         86cms9iq9vKjdOdHA8G2dpNlTjyIn4xY3e1Z0kjAMppM7H7rwkLHbgp3Iaay1OpChCY5
         Bsojrx4ZBbS2k3zHDoG7d8EgqHcXodhyTzVTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2uThNN1veRVxQRjYlf4JqSH5GR47NPglPmDKWCzRjwE=;
        b=z0oIwJjYL2jd8f4zDw0l8OCMIZnOCXGRNqZ6Zi+eoq8FnkHFfMwxBCmL0KEgTwiyFP
         hrpziBFPiN1JKSDXUCyrwxwn4ZHUhzTS9g5qLicmTHsaG8QB2kXFlYrTriUyByZXevUA
         uBVXEwdLbmVzVyegJf0JXqnloRkG1PyXWgrxIR8F/uT5t4/ODmZJurnbMhsaKy4qo+e+
         sTNebPgS3gwmzguS5qSSqCyEizgnuI3F/7LPJXrVEgkikdgmzUyjeHYQlPRXAhdVkEMz
         bXMoCYo9UKmDBaaT0hweqydORz5Aunm0PXWQbbCEoo+E2O0D6yZDqfYNjcQGPkADJ/Kz
         roCg==
X-Gm-Message-State: AO0yUKXX86Oal78PVHr9EDFZK4pk5BYugSb46f1Y3sFI4qEcu9ZVisby
	niHLNaD34Nz313IOyWVPzkGGkA==
X-Google-Smtp-Source: AK7set9ANIkrgcuilL62D/dimWkC9gWBnY1Qm8dIPMp8Zi8Wpt52Fx90PbE6eIhz2+jAPfAn6/t7Iw==
X-Received: by 2002:a05:600c:1e1f:b0:3dc:40a0:3853 with SMTP id ay31-20020a05600c1e1f00b003dc40a03853mr4612187wmb.11.1675433863943;
        Fri, 03 Feb 2023 06:17:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a52f:3f73:91fb:2c5a? ([2001:8b0:aba:5f3c:a52f:3f73:91fb:2c5a])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b003dc36981727sm9025041wmq.14.2023.02.03.06.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 06:17:43 -0800 (PST)
Message-ID: <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] barebox: add initial support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Date: Fri, 03 Feb 2023 14:17:42 +0000
In-Reply-To: <20230203135011.2061939-1-m.felsch@pengutronix.de>
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 14:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176717

On Fri, 2023-02-03 at 14:50 +0100, Marco Felsch wrote:
> This adds the support for the barebox bootloader to oe-core. The recipe
> is based on the recipe found in meta-ptx [1] with a few minor adaptions.
>=20
> This basic support includes the bootloader and the target tools to
> interact with the bootloader. The host tools support is not part of
> this commit. This will be added later on as separate recipe.
>=20
> [1] https://github.com/pengutronix/meta-ptx/tree/master/recipes-bsp/bareb=
ox
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  meta/conf/documentation.conf                  |   7 +
>  meta/recipes-bsp/barebox/barebox.inc          | 123 ++++++++++++++++++
>  meta/recipes-bsp/barebox/barebox_2023.01.0.bb |   5 +
>  ...IMAGE_COMPRESSION-per-default-to-lz4.patch |  40 ++++++
>  4 files changed, 175 insertions(+)
>  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>  create mode 100644 meta/recipes-bsp/barebox/barebox_2023.01.0.bb
>  create mode 100644 meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COM=
PRESSION-per-default-to-lz4.patch

In order to add something to OE-Core, we need to see it being used by a
reasonable portion of the ecosystem. Is there enough usage of barebox
on common boards that justifies this?

I noticed there is no maintainers entry being added so this will throw
QA errors on the autobuilder.

Also, I'm not sure adding doc varflags for individual recipe variables
to documentation.conf makes sense. We should probably have them in the
recipe or just put entries into the manual?

Cheers,

Richard

