Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B2BC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:16:08 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.16797.1748441761599853771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SB4kkjb0;
 spf=pass (domain: konsulko.com, ip: 209.85.161.47, mailfrom: trini@konsulko.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60402c94319so2167645eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748441761; x=1749046561; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx1mXt+XqRWt0+9KEeib3CO8zriPo5puFO8SL+51168=;
        b=SB4kkjb0MJap1k4VB/XdIUPz671N6zKGlOOQ8pWd5IgBntZgDWLo3NnwTBE9gQ7qZC
         3IMybzRrgcYLxcAlu2ZvOEnNeqOvbpzDJgtVmEpSPIQhj0ETBMnUlt39xo3YSQVizwq8
         3TFCgza6EK0W11a8TGoLjzk7Z2LoFz7cptrFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441761; x=1749046561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vx1mXt+XqRWt0+9KEeib3CO8zriPo5puFO8SL+51168=;
        b=HaZIvArLGKyJI1enTVc+V8s+qQhcxjpDiaUg2Vegk8q3CgDFL5TdIHpp4cWdNy4pS+
         4Z3dAsMX4vC8AyD2Uvn9g9vzS4xt4I/purRc9OMJzzrrQ8MOr9J0/pUBhNgT9EkUPCWC
         DIyZKZCK/GEHbpG6z7h1i9l4zTd8k3m5qy5gguRjuIJKAHvmPcvE+nk/xWj04BykV0wV
         /TiWpCagOKlo9rVOxLDb8532uYL92c1xBCalzqimoIgNQ2Pnvs3/bsZUaG807u5eGXOH
         GGxjA69jvRFDo6zn+G2mZaKDgWbnpkOyIMvCWUu0CCvk3w5iDSsLdVjtAs4ojXK6Oxdw
         JQbg==
X-Gm-Message-State: AOJu0YxLKeOArkXSR09Kitj6cT9gK6jFmqnu2lv4bw7V+9voEAke/HRf
	DGBTAhTFpbmAWCfNO18UYYQ8p4NIDitOy6ahYTUWjoGNxr13rHzSKrwzhPljmpxiKVmRzZ4jQ9d
	Khq8zjD0=
X-Gm-Gg: ASbGncve2f95bThJNSdkV1OyCMG7/eXrZ07LZUDnqHxw5taOBSTEdMee2eISQEiDbgl
	8h8GXMW9KFnCq/nuwu98tv88i1V0xTcXaZBxtP4wJl1MLkFnwjZxHn9cWpvC14bXffba+Vjsq4h
	FVZvsUvT1qg565GCQ76hk9kYqnCeuJzHtBXS+kjUzh8Z1dOVc+nU1JbEcai/elEDalREC47UIBF
	pyvjOm++VAokaSSU5o9u8ryLwFZK7p2kuCDa/+VZX2THphjMOtrNwU1qnQ/t600iqcZumYxQSDq
	AqQzR1pEJIbDJVSfsOxsfEPyUEgH2ZKqzIYiNCD6MyJpXVLZkrVjZySx0Aygpc2LicwLe8P8ZPu
	uRIjZqqm6ecwO
X-Google-Smtp-Source: AGHT+IEenTmbgZ8O/ICh255fPLISbGZnbLjXfke6IhRKwJBxS5cNttZj9gBF5y9FCsER206S3cwZ7Q==
X-Received: by 2002:a05:6820:1843:b0:60b:a939:7e12 with SMTP id 006d021491bc7-60bd9b9454dmr1385740eaf.7.1748441760738;
        Wed, 28 May 2025 07:16:00 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net. [189.203.100.42])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60bd9d24a92sm192743eaf.39.2025.05.28.07.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:15:59 -0700 (PDT)
Date: Wed, 28 May 2025 08:15:57 -0600
From: Tom Rini <trini@konsulko.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH v4 2/4] qemuarm64.conf: allow overriding QB_OPT_APPEND
Message-ID: <20250528141557.GT100073@bill-the-cat>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
 <20250526083548.413834-2-mikko.rapeli@linaro.org>
 <20250528005247.GQ100073@bill-the-cat>
 <aDbDJL1_WqIy8ttT@nuoska>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1UcTqe3ZlBa7wnIN"
Content-Disposition: inline
In-Reply-To: <aDbDJL1_WqIy8ttT@nuoska>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217349


--1UcTqe3ZlBa7wnIN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:02:44AM +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, May 27, 2025 at 06:52:47PM -0600, Tom Rini wrote:
> > On Mon, May 26, 2025 at 11:35:45AM +0300, Mikko Rapeli wrote:
> >=20
> > > It enables qemu USB support which causes a reset
> > > loop currently with u-boot.
> > >=20
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  meta/conf/machine/qemuarm64.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > This too feel like something that should be brought up on the U-Boot
> > side.
>=20
> We saw these issues in 2023 on qemu but thought they were specific to our
> Trusted Substrate config with tf-a, OP-TEE and u-boot. Some public info is
> in: https://linaro.atlassian.net/browse/LEDGE-435
>=20
> I know USB support is really tricky with timings etc so I don't expect
> it to work well with bootloaders. Hence did not dig deeper.
>=20
> Now that I saw this reset loop with KVM I will note the details down
> with reproduction steps and send to u-boot list.
>=20
> But I think overriding QB_OPT_APPEND is handy, wether it has USB setup
> or something else. Other layers in yocto ecosystem use qemuarm64 as basis
> machine with testing and may want to change this.

I would say there are two parts to this. On the U-Boot side, USB is
expected to work and we have active custodians dealing with it. Please
work with Ilias and others to get a reproduceable set of steps with
vanilla QEMU and report them to the U-Boot list with appropriate CC. On
the OE side, it's all complicated enough that I would defer to Richard.

--=20
Tom

--1UcTqe3ZlBa7wnIN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmg3Gp0ACgkQFHw5/5Y0
tywCxAv/SydfJEReJzo/XGL3XoA+Zj/kdcsX05yufmOFxQE5sYdW4ruoCNrXmSGv
p7pN7c6g9+dvlIJ8hnUzNmEdsD8KyHQ2kVYNqQU4l7D9iwF56Bg2mMGuzuHjx78u
/E6Mb/1LrGhtTBYKtNqkQzDCenXkUjcxkEVH7dVUKxHUVvi2OL3loincg2ZZXEsx
mysAiD8pyXyl+glRAe0RA2qj14dW9cO8N3pZcnmmEJNbukrKFS8t4sXUitcxB7RR
tzgh6LyeUuNZhdt8bVoqFJRY7kUWUpH0tTTxRgkGLob91ugz3D0FqXRUtnQAZ9Wj
1w2daTYb7rr+ZN8j5PDnWHOxW7Dw/Y7tHpfhjByUywiD0p1b21ubNvwJum3bG31X
7YdsF8ezYetXbDs+nTiaUeNfiKYRvDRHrQLg1dTZQMEgTZeOAtO1C7LHoFIus1ox
6omB9BFEV346mHICAarAeaBJNtYDPLzYbAkT4sHhmxNS1nun3xdliaeQwVPKR6MF
2iSh4F/P
=GJ00
-----END PGP SIGNATURE-----

--1UcTqe3ZlBa7wnIN--

