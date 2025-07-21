Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20A4C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:48:43 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.41330.1753105714251693115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CuOpCz1x;
 spf=pass (domain: konsulko.com, ip: 209.85.167.175, mailfrom: trini@konsulko.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-41b7d124016so2094963b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1753105713; x=1753710513; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSuN1paFwSBm7DO7wfCpWcJAcol2bxP3pOkCc634d9g=;
        b=CuOpCz1xSVXpLmkAGrSGVL3pAimKZxCN+tDN2bz365EsD8KYL9YqEmhwNuK45seWT5
         TsEgAlEQUDC2iPMeDJG94nsL6dI5PnJmuriscuCzK5mNj3ziWbHQx9vDj6czXvJ+dNWL
         cBYUC5kMpnVV8G58D2LCObQYWPDCcOSt2qXrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105713; x=1753710513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSuN1paFwSBm7DO7wfCpWcJAcol2bxP3pOkCc634d9g=;
        b=DprvfoznE+8xX8WD5l/NukcswrV6/1UmJJT1mVVUA1cHTg4xYf181F2yobSLrJPOYr
         VEMR13PeD4q+FMdrgGGgIOR0ogPYSrzLWs/0gT8c5ISTOtp0hFQ4S7ProWWm0CBpkOsp
         oZlL4grjutC+ia0WiowvUC3A69IOjuP6QCppYzsqCgKy5F5JjV0Bm/Yf/OyFW0dG8iIL
         a/cCpYsOEXXmyLdCoizo/bOv7HLEnleOA94FTMYkPkC9BnNC3X+6zdzjNg9/uw2xuVRI
         qhuPZrmZHbYn23RBQfogFmFSBxQq9FuSDYOuqgfb1TROyjOTmVN503eAI/TomJ4Gb22a
         PNmg==
X-Forwarded-Encrypted: i=1; AJvYcCWEAvVcviGYTbhF5RxRF186mTez8Edz6TgWKmOhpBkPBaOqKsuEImN/ElJY1BiTjTXffm5tBSyFFG/DikxKMxVIyw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlBLBonXyLOstNCWdZI0Cqq+rCXeAW1qNSI9n6IWS/DAnTmYQ3
	3WgfxBluXJe1KuuPLis8z+mUx3d07qFuDXBGekRzYK8m9fGh33pPuu8y3ii78OkVmWXz9h8M7XA
	3FFGRJQs=
X-Gm-Gg: ASbGncsuNnacXU7NHq7tN+Vn9KyKAgbaXG/46J9thBcZHSabzHJ4q20cbLOaWt/36i6
	2kpmCa6Op/ovmH/WUO7QU7Za0qRjz3ue+Q3PjWDw4AkeBtS2TiQjyAlyL6P/MUwVl/E2TfUrR+D
	5YX5jLpSjjTSq2HiOCw+B3w/2Jm8j1oWGKSunkoLakS2iBt7yPEp1lnLeXhWu336MRDPmxl2dbs
	TMGPUXQ83zkPWEbn5kJnt4/Cy+OemqvQwDNTVhjAYnkE2u/os22x40FeGhb3W8lxt8FAjBhTyYh
	MMNaiLhyQyZzmArvmX/Xhac3h26Zb+kr84led4y/ex4NOaRypIXPRHub3a/jnWbrBQicxLHU6tO
	WcRw7mh4d5amQ9fjhA1OHbNelQL0fGy8MfuFeZaoLLSZs6CtCDR0v5JV9EjbQk8uoFfU=
X-Google-Smtp-Source: AGHT+IFVxlFzs+j44+ZZ2oADEh4Pkaameqo3hZifY5EWU58nxmpqfpEew1DBz6EMyuP9QTdLA+t0cQ==
X-Received: by 2002:a05:6808:f92:b0:403:56f4:8780 with SMTP id 5614622812f47-41e4500b9d6mr12771159b6e.9.1753105713337;
        Mon, 21 Jul 2025 06:48:33 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41fce0d366asm2177947b6e.0.2025.07.21.06.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:48:32 -0700 (PDT)
Date: Mon, 21 Jul 2025 07:48:30 -0600
From: Tom Rini <trini@konsulko.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] u-boot: upgrade 2025.04 -> 2025.07
Message-ID: <20250721134830.GC193579@bill-the-cat>
References: <20250718090123.420399-1-mikko.rapeli@linaro.org>
 <DBFTMMJ8WHKL.362BOXS9ZHA6Z@bootlin.com>
 <CAOMZO5CaSgkYjTVk2WcQCoWvRNNGkXRV2bp9BdAU=mkQR8Rg+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uqc0ZnNC8UuOkgeU"
Content-Disposition: inline
In-Reply-To: <CAOMZO5CaSgkYjTVk2WcQCoWvRNNGkXRV2bp9BdAU=mkQR8Rg+w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220697


--uqc0ZnNC8UuOkgeU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 09:34:10AM -0300, Fabio Estevam wrote:
> Adding Tom.
>=20
> On Sat, Jul 19, 2025 at 3:34=E2=80=AFAM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
> >
> > On Fri Jul 18, 2025 at 11:01 AM CEST, Mikko Rapeli via lists.openembedd=
ed.org wrote:
> > > From: Fabio Estevam <festevam@gmail.com>
> > >
> > > Upgrade to U-Boot 2025.07. Added patches for build race conditions.
> > > Removed qemu KVM USB workaround since issue is fixed upstream.

Here's the problem. Yes, the "KVM USB workaround" was fixed upstream.
But it's not in v2025.07. You need to cherry-pick:

fcc60481ae75 qemu: arm: Enable virtualizable IO accessors
dc512700ad46 arm: io.h: Fix io accessors for KVM
b56c0632ad62 nxp: Prepare macros for KVM changes

--=20
Tom

--uqc0ZnNC8UuOkgeU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmh+RSoACgkQFHw5/5Y0
tyxD8QwAqRhfqXJyF5Uab0TA2J2jelozn5wpsI/tdnwkqaF0V2RMFnUfrNIFz/rR
DY8cd+OFgiaO12zU5SRi+gcYl3k5vT+pEjfqLbgNfXVlMkRLSG84QYQ+HCROULRK
6KsxgkXC8ORNUr9MyVTEAoSIMH+sO8n2AEh33UyKHtlJvFHluuDn4do8OvoA9s8j
8frCU4XfQ3xPsIj4dskTm/2SpAbTSdrsKYwhNHy787JpL0fHN83pu9Z2EFaa+Lxd
zb9URiUePi1kfoJeFSk1hY2ZmVoCFcSqHB9VKcjN9TsSVBzjiK0d4eXG6Ho3tPoK
Au1fqFjJ4V21VxpJYAyRnD9Nl196nbtIPmoar8m27VZcRKc1y/izOtaSQU0Z8hU6
ETnGF0m9725EzcwuL5s9a3UlFYgMs2Jqqm/BbzvoG2yj1qXf4HEoaBNiAj7dMxib
hBJcZxoEhJSwTeQqxOZb6TNQIYoa9m+Cu7VlB/Fi729YrRtvqOis+kK6vBPVwWwc
/fr2Pohi
=agxZ
-----END PGP SIGNATURE-----

--uqc0ZnNC8UuOkgeU--

