Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3603CDE000
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 07:41:12 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1825.1782286865585037534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 00:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=g36e//rB;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=aWgrfRwC;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A030CEC02F6;
	Wed, 24 Jun 2026 03:41:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 24 Jun 2026 03:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1782286864; x=1782373264; bh=yiw+Jr15kh
	tB0NQOv7ZnpPCT94tltqE2SVLJ+J6f4h4=; b=g36e//rBWTavWm7WsGJlF+Dcon
	bfnVOFtuiHYuycjwCAvrbQ+wQzUU+G48Lgyy0RGfNWcSX61ML4/ZXlpVM1ip7eRn
	E0kMwNydRMqGK1rC7JIgTgXh1R4rZ/AxIXlqbRFJ2RDk6jUOC5JzRAE+3XsX97DX
	BZQn4EB/rynTyIJ49n3y7ZvluSpGWMUWTilDAnJaBtVj5zPDMLnEy6N7edQMAJM1
	NmxdveuUZwqDSsGkyVVUIveB0PtOsFaEgdhUaI6xJKukvxNzxWSwmqZUxI62wJhQ
	CYGEb0sdihNNd1mNHEqOoKGsm8cX3SWhqkIuPLM+wLg8lFFGlPuHCprYkpnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782286864; x=1782373264; bh=yiw+Jr15khtB0NQOv7ZnpPCT94tltqE2SVL
	J+J6f4h4=; b=aWgrfRwCgZRfD17lEoHF5DfeKqYfg1FTGsFUdqUJCuQvE2CT8zH
	iJtL0eY4BlpMYOEVXFD7PUSL7nrwO+Kl9aIJPWBtfYDvPlyFj2IifhXIQtV4tuzg
	wCAS5nfrHle8DGEvVWDns9VrfRgaA4W/R8nB0scQcx4TjY2x7LNPCxtoKwItDAT9
	OhiF5ehgE7pyV8nmSsKwZ+bTvQWi+t7mPxMA3cTHY6i/YjN7tx9b1dmM1FDwkkhY
	IgmIGpNsu6l9Zj13K1NCQzj+AqDZ8BsfHvkA2pryqWn/1txprVTVYC+pvLHRuxOX
	N1ipTreuKsmKcbhjRtMMfBqoEPm8IqUebTQ==
X-ME-Sender: <xms:EIo7asOysTbF5PWSBFBBU7v2o9IEq6GbIgRw48LEJbPMGQ8yuiN4qw>
    <xme:EIo7ap8PNzkwQ5kjA2bZc4cu6ZpAIczcnAc-8YKuz9ViwU_kWgLR-rdfkiQvzRjNX
    _wRgl_6OZlnICadHAW6aQhslE8VKmf4jFl4kbnXFFmn-EgTz9xoiVg>
X-ME-Received: <xmr:EIo7aoSO-IqclGxRw99yjpBBzw-H1j1luZHiZeIVJ_lav00bbbv90BLC_VdiVUxILKirA2YKLzT9V1oPyg76ggNU_g_Hm2ykAP6TOa2SfZ4p>
X-ME-Proxy-Cause: dmFkZTFIsbQoMil53Efdxh83BazaSSoXFOSCxmkoLPeQiTurg9/RhrGp+L3uYPbr9UqyOu
    +e+RIcgDGKvm31thKtbswxvbFsc3FOnWVHhz0fzprQHQUZfjLCKuEVrR1/qxg3Vo/9/3Kt
    izwZiQR4hcyUUaK0pr+gFo7i0UsSV0QUWcj65d+qXTLwVJ0+srASO31Y+pWOQ1l25qvME4
    Vct6k0n57tajEnOJOxd3NMb8cRXZZA3remQiLEozBvxF7WvGe+67KIjTVq1LCatb8G18Yu
    0raSEl2QXgA7Kqjz97cquIEftIQpNH/aRuw++Kd9OKTvsr/fqRUS0BBUZr5ljTvz0aokUX
    IlnYzdLv7zmSctbg3K7aYtC0gI1wL4pk0Y2pT48jqLhUWlsI4jveBI5RVfMNLgb6ANGn9E
    ho/hLKsSbBr93eK8VjtrSvhXAoFbHq7hsX9TyfAMPwDDe/jBFrich3cdHHYkMy1MJT7moD
    DyyKe0NvLzXzmSWiwg3ECySSTeGJxOLiDCXC8Ieox1RnpejqYqR5kCx5w5Bqv9CTZ+PHK+
    5/yhQTWJWlsLbtZjmXnd8NeSzQ6TcKN0+7fNEl29823Ft8xhluIN9gacGNh2Oj3t7EnTLT
    iWssp7Q3SvxpP4M1tRHz2cjQ9Id7wGb8dQMHCSX5ls9UYxmPrZdaIPHqmuxQ
X-ME-Proxy: <xmx:EIo7ajlUry55RNcezYhcXy6IbILojSTvdqUuXzYBCy-Oy7UbcesfNQ>
    <xmx:EIo7agRIHyZk9Nns_2QB8RF_pk1wwA57AcqMdXolI-bb8cAtatu-mA>
    <xmx:EIo7apOPS4BL8v6AuTUFdCMB9F3Tfu-nWKQBBv_OeYq0JnGVWmi-ug>
    <xmx:EIo7ahVHmeCEFk41yt8-KbIc_qEaLXi0MoX6iRH9wJSuZ5a0mczK1w>
    <xmx:EIo7alMPe_syITvvY0QSHjY5RGScFIYnjQI0orcDhu_4sVfCVZ2xdXNW>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 03:41:03 -0400 (EDT)
Message-ID: <f9be9a387e024dc86312a45e2a4b029e5cbf2ec2.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: warn on .cargo/config.toml
 outside the build tree
From: Paul Barker <paul@pbarker.dev>
To: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Wed, 24 Jun 2026 08:41:00 +0100
In-Reply-To: <20260624064224.2998388-1-Hemanth.KumarMD@windriver.com>
References: <20260624064224.2998388-1-Hemanth.KumarMD@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QAOnoK14aemdjA0fSD+/"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239476


--=-QAOnoK14aemdjA0fSD+/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-23 at 23:42 -0700, Hemanth Kumar M D via
lists.openembedded.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>=20
> Cargo walks from CWD up to the filesystem root merging every
> .cargo/config.toml it finds. Any such file above TOPDIR is silently
> picked up and can override Yocto's linker, registry or compiler
> settings, leading to build failures.
>=20
> Until cargo provides a proper fix upstream, add a warning so users
> get a clear diagnostic instead of a build error.
>=20
> Upstream meta-issue: https://github.com/rust-lang/cargo/issues/9769
>=20
> [YOCTO #15637]
>=20
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  meta/classes-global/sanity.bbclass | 33 ++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index bdfa7f059d..c67c7b8f03 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -854,6 +854,38 @@ def sanity_check_locale(d):
>      except locale.Error:
>          raise_sanity_error("Your system needs to support the en_US.UTF-8=
 locale.", d)
> =20
> +def check_cargo_config(d):
> +    # Cargo merges .cargo/config.toml from every directory between CWD a=
nd
> +    # the filesystem root. Warn for anything found in ancestor directori=
es
> +    # above TOPDIR that Cargo would pick up silently.
> +    import os
> +
> +    topdir =3D d.getVar('TOPDIR')

TMPDIR and each package's WORKDIR are under TOPDIR by default, but this
can be overridden. Perhaps we should be checking ancestors of
BASE_WORKDIR instead.

> +    ancestor =3D os.path.dirname(topdir)
> +    found =3D []
> +    last_ancestor =3D None
> +    while True:
> +        for name in ('config.toml', 'config'):
> +            cfg =3D os.path.join(ancestor, '.cargo', name)
> +            if os.path.exists(cfg):
> +                found.append(cfg)
> +                last_ancestor =3D ancestor
> +                break

This `break` should be dropped so that we tell the user about all
offending Cargo config files.

The rest of this patch LGTM, thanks!

Best regards,

--=20
Paul Barker


--=-QAOnoK14aemdjA0fSD+/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajuKDREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnSuAQD+sZvpBmoPwwK1UoYfzW2mp6rO/iMEjzuh
pfCHMSICDAD+IzqdL/2EJ4dUwwnKtP6Q4JRcFCr+J7Vn0eQKxM1VIgI=
=k1ZZ
-----END PGP SIGNATURE-----

--=-QAOnoK14aemdjA0fSD+/--

