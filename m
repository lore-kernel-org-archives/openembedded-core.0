Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D2010F995B
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 16:14:33 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.110406.1775664868971146329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 09:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B+yp3BY6;
 spf=pass (domain: konsulko.com, ip: 209.85.167.182, mailfrom: trini@konsulko.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-46fb6d65c89so10906b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1775664868; x=1776269668; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2X1BmZlrW0zFvuUzH9wKFStxNfwWqM3FLAjpNLqjBw=;
        b=B+yp3BY6+xshcRp4ps12E6Jx4hVqZupKEk4y0Uc0gq6f8lylOO1mA6qJLYpF0/CPoP
         OgNrTf2YVATgAMrvNnmTEUJVpd3bQiJEoGRW+7g7CNgb5YOfD3sEQvfTrPBTQEP3x6ek
         00hLtLovbRZ4xla92Q7Ixjy8Y4Mf/PRqLitC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775664868; x=1776269668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2X1BmZlrW0zFvuUzH9wKFStxNfwWqM3FLAjpNLqjBw=;
        b=jBaG6HEMV4X7uONddG6itmWkgpI6mSGbmpzHFSRKyGdWh8RFsOLyUuKM/HKhyfg3Kr
         NV/LrVf0zey3SylzM4GUW7os/UWXXKAySiyYg5s/bWggIgvIlcXTXJwe+E4KJutvUmHK
         cuYosXfdj5lYKYHxpNkcapfWDmK1quot8yfmR34nBJhMKWvMI8vf/lArWdLtlzc4vOd6
         iqQ9gUM/okppXkdPkOwp+OxgKjCXTwmQR6X6IRKKATDoa0iePumVt3NKVtUj8w8HXyZs
         HYTDu+dtYxGtWo8ArzUriSOyzksOlnIWtDGVE89SN+zlb2KZqT9EpRji9C/rKZwPdL3G
         cNag==
X-Forwarded-Encrypted: i=1; AJvYcCWHS0yIi2skhEI48nw9G7mOj79WGIDDeXsPGC9Af7SNumsYJAnpsCq2CQePK+uM38MoKRBnAZwWKoptTdALdz4BDw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy8Xt1GX4vHEH6nsV5+1/mA7j8El8wvvbkRdXWohsDlY1wLzcsN
	kAQeZfBjcakaV+wCKbxN4GNxO/kc+nsfXv80I0SUmTD1TWxrgN9vEcAXDbRcVUvQObE=
X-Gm-Gg: AeBDieuTFh9LHJZCp67RC5s5OwziFQxHPi+/ABi4aFvpgllmKzUnU91iNK7FXOcwIoY
	i3smBU9Ic7UDg0vXwts/inNZ8HhVhuQ25FlFHg5AkxEWGPz147qiykkfEFEsWR1MrNjEE0XCO5W
	CqVkqtV8bzvIz7wHazCH2k9UL4peos4p6cv3iqwh0x4ysHcmh/3Zc+Oymb82bUNQQZNCPVxPC5f
	JO0jf3qZGQlHyGdZXMjo/YrKhsKmnAKjXedJ4miJ55I/z5eohiAjSpScuxkTvPvatB1xoIAXuT+
	UwvM5cmUaBc9a9Is1z/8G2TVF+77JUGSsrt5gfNjifBYtHtYg0ralILXTF31aFQrHqSzkb7zpxq
	cZt93NFrGbaMVAgdkjShfpvcWZEvouQxFh4Ct3wmgDNFACQbM1jx+i4CELhoMegMc1Q8Ukx7dO7
	q6BvyUm6/rNFxJMGsReftaI8VJq+C2V+hY8QNRefEDJyKPN4v7VbGxZJubRYAbbgTYNa1IcReeZ
	5bCGCEOWMiuSuvEi44UWPzkXRiEJ9C9CG87k3Tye1OB5gfr
X-Received: by 2002:a05:6808:5294:b0:467:32c1:acf1 with SMTP id 5614622812f47-47723a76870mr95748b6e.39.1775664868088;
        Wed, 08 Apr 2026 09:14:28 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-235.totalplay.net. [189.203.97.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4757665c7c5sm2411083b6e.1.2026.04.08.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:14:27 -0700 (PDT)
Date: Wed, 8 Apr 2026 10:14:25 -0600
From: Tom Rini <trini@konsulko.com>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: Franz Schnyder <fra.schnyder@gmail.com>,
	openembedded-core@lists.openembedded.org, u-boot@lists.denx.de,
	simon.glass@canonical.com, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: EXTERNAL - Host GnuTLS now needs pkcs11 support
Message-ID: <20260408161425.GC41863@bill-the-cat>
References: <f5ov7deig7xaovxmtx3nhewki6mudgebahghknhxodlfa3lrdh@ary63d3fodkz>
 <adX6wVUWvNrzYfuV@mt.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XbF3t9EVcNoRe6zu"
Content-Disposition: inline
In-Reply-To: <adX6wVUWvNrzYfuV@mt.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 16:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234855


--XbF3t9EVcNoRe6zu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 08:50:41AM +0200, Wojciech Dubowik wrote:
> On Tue, Apr 07, 2026 at 06:15:13PM +0200, Franz Schnyder wrote:
> Hello Franz,
> > Hello Wojciech,
> >=20
> > with commit 0c716a157be ("tools: mkeficapsule: Add support for pkcs11"),
> > mkeficapsule now references to pkcs11 related symbols.
> >=20
> > This breaks our OE builds because it causes link failures for=20
> > configurations that build mkeficapsule when the host gnutls is=20
> > built without pkcs11 support:
> > ```
> > undefined reference to `gnutls_pkcs11_obj_list_import_url4'
> > undefined reference to `gnutls_x509_crt_import_pkcs11'
> > undefined reference to `gnutls_pkcs11_init'
> > undefined reference to `gnutls_pkcs11_add_provider'
> > undefined reference to `gnutls_pkcs11_deinit'
> > ```
> > On the OE side, enabling support in gnutls via p11-kit fixes the failur=
es.
> > However, I wonder what the cleanest solution would be. Should this new=
=20
> > host requirement for pkcs11 be handled in the U-Boot OE recipe,=A0 or is
> > there a better way to approach this correctly?
> >=20
> > Any ideas?
> I could add disable compile flag in mkeficapsule if there are no objectio=
ns. Sth
> like this in pkcs11 places:
>=20
> +#ifndef DISABLE_PKCS11
>                 ret =3D gnutls_privkey_import_pkcs11_url(pkey, ctx->key_f=
ile);
> [...]
> +#else
> +               fprintf(stdout, "Pkcs11 support is disabled\n");
> +               return -1;
> +#endif
>=20
> This way OE or possibly openwrt don't need to patch.

We should do this as a Kconfig symbol (which shouldn't be enabled by
default), and make sure that tools-only_defconfig does enable it and let
distros disable it as desired.

--=20
Tom

--XbF3t9EVcNoRe6zu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCadZ+3QAKCRAr4qD1Cr/k
CslWAP9IJYebAgzpwavtZYuCdtH/izsjMJzrHw4g+kjUT4a6vwEAo46Pm8cFArzL
s3tRpu+hFqK/WCIk0pjofDcw/E39ngw=
=rR2Q
-----END PGP SIGNATURE-----

--XbF3t9EVcNoRe6zu--

