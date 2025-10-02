Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CA3CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 11:56:56 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.4658.1759399039145051877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 02:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=cdS1TdDM;
 spf=pass (domain: baylibre.com, ip: 209.85.218.43, mailfrom: ukleinek@baylibre.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3c2db014easo168949666b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759399037; x=1760003837; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o12xShts5o+3ysyRBJmbVmbe40IxbLga2wMvDqzwtQw=;
        b=cdS1TdDMxVdhqLjv8mPydVrWESNtjw620J9IUBRdHJ6D+4gHmYeTZjdVQoZ3znr5v5
         nmyKxFDBfGfx8Vwu7yNOmCS8iNsvhZoNS6V4i+V7HXlFAdmXHRWuwd1nC8MM68KWI6UV
         07uOiW/jn0S61jy8dBiVpoVMcjOFG68AsUfPNhDIDFcY7K42ecurusT0s1Pv1VMedA9F
         QbJA92digpNSgk/5tnxUTic8Te8x/SFAU2X3/V0RcGAOAH+0VAlpQDIT20cxPwqyuPov
         usBhY0C3VBgeL3EM9jZK8ta65N3JJkE/hR+73Kzd0mzsS+F7F7wEp3IgMQ6AYcNGeBpI
         rgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399037; x=1760003837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o12xShts5o+3ysyRBJmbVmbe40IxbLga2wMvDqzwtQw=;
        b=PzXT/mfYPbbZUmV2NRWvfW66t/mOpFm58sdlY0ttIOtTFfJUfcDkeahQECQuEPT6G1
         SjdYmPyFVHt85aMl5S031YPS3teatsUYjNRpaBY7i6mdKIgpaCzr53+QrFSbH351trLD
         8TVh1ZMJshFPP3lqMveoAgpVMpq/7DLYjhHie5CfxcTYOVTzeVTXAi/vISWfHmoVcDuO
         IEBmT7LVLUduCjZL6bwOBq2+vWkbX3UWtSw9krhmoH1wJnoXLJmSIZZL9slY3rsmu2B8
         l11YzljF0q/0UIuEoS0/EFrXppxOZl+B/hUcr7pIleIBNRLofyRA7UB2aRM3Ri/EaxT6
         VoxA==
X-Gm-Message-State: AOJu0Yy+QYzi+503k8CwxvSx6SC+ITwlVjiRwpaoOCT3iCT6qO63SZV7
	5HuAkbkXxtKiJNzsJ9Bbgq2vyjTU/L3uENSW3CxAuH6erPVkH8kH6dIYzNH5snpDy1szYS0K/dB
	zAYPkFmY=
X-Gm-Gg: ASbGncszoXIUoWhnLV5mYgkj1+83+0NgABOjDVyA+8xNFxj/FnN2KuBtcsfyHLxBpV/
	iqsTNlO6jWrH3nYuQdL6G3EpEJKFBruoZZ/PUG+fOkzEZTzyGRRzBZyxq33hjMwx8lQCOVBnsmz
	48gXzWCohNFRsrl/AEww3Pmv5mXe1VFffERVYmngEZVFlWld4MOR0G2C7epwAYTFF4J/+KppHeI
	XUR6mtZX/pqzm9dWhi1UlOP48vR6gHrO5AUP5vj/vhUd56JFLElPOlaye8oHTbke09z94RhE9p5
	fA064+7NrIVBMlhWEPzpHVSBUKMampy7ewXg9fdxuQ4G/Zm1jMjgkd4DkWrZGHmHzjNZ3yv+dyS
	uUgc5R8oBVnQgn6eH+8ksc3neAg0zCZ8wDMFW2DsqWB16iPPq5zL4K12bWDej9lmDasGhuBHtYM
	0=
X-Google-Smtp-Source: AGHT+IEiZc4OKdltZtnspbKSY1d8fB4zue9wu6+EjlMwrGlVmNKpeeEwyjx86f2h/QI1pxWp6nak6A==
X-Received: by 2002:a05:600c:c093:b0:45b:4a98:91cf with SMTP id 5b1f17b1804b1-46e61faa217mr34779375e9.15.1759398539497;
        Thu, 02 Oct 2025 02:48:59 -0700 (PDT)
Received: from localhost (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e5b576badsm56999605e9.0.2025.10.02.02.48.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:48:58 -0700 (PDT)
Date: Thu, 2 Oct 2025 11:48:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta/lib/oe/recipeutils.py: Handle multi-repo recipes for upgrade check
Message-ID: <ibynx6jvvawtrkybl66at6dqikjuexuuis5ymq5r4cylv6sxzy@zcnbtottsekq>
References: <20250923154701.1506704-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20250923154701.1506704-2-u.kleine-koenig@baylibre.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z75zsonhv2hxoptj"
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 11:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224356

--z75zsonhv2hxoptj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] meta/lib/oe/recipeutils.py: Handle multi-repo recipes
 for upgrade check
MIME-Version: 1.0

Hello,

On Tue, Sep 23, 2025 at 05:47:02PM +0200, Uwe Kleine-K=F6nig wrote:
> For a recipe that uses more than one git repo there isn't a single
> SRCREV variable. For example for linux-yocto there is SRCREV_machine and
> SRCREV_meta and rd.getVar("SRCREV") yields "INVALID".
>=20
> Luckily bb.fetch2 already handles all the details and exposes the
> currently used revision in ud. So just use that.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> note this is my first OpenEmbedded-Core patch, so please apply some
> extra caution before applying this patch.
>=20
> Note that for testing with linux-yocto I also set
>=20
> 	UPSTREAM_CHECK_COMMITS =3D "1"
>=20
> for that recipe. (I'm not sure this is completely right to do in
> general, but that's a separate discussion. Without it `devtool
> check-upgrade-status linux-yocto` suggested to go to 6.16.y instead of
> 6.12.$latest.)

This patch was applied to oe-core/master as
ddf00d6aee955878c070327ee8d751fdb6099444 (and cherry-picked to poky as
441313eecbd45cfcbf0368e4d1d54bd2e9e59c6b). Would you consider that a fix
enough to backport it to walnascar and scarthgap, too?

For walnascar it can be cleanly cherry picked. For scarthgap I
additionally need:

-            revision =3D ud.method.latest_revision(ud, rd, 'default')
+            revision =3D ud.method.latest_revision(ud, rd, ud.names[0])

I don't understand that completely yet, bisecting points at
6dea2e6332835bd7b646a520e28ce840f0d98f24.

Best regards
Uwe

--z75zsonhv2hxoptj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjeSoQACgkQj4D7WH0S
/k7yLQf/ct9KrbNJsHePbjMjz9RYKtObJOM3ZcC77lwbgPxaBSH8bl11brzfwC9Q
//ClfFeMvJr4GGnd59hnxHn3vYQ9hltm4OY/hvL6cGFZzL9op/pxdzY+pXYvbp2q
JOxywWNNfiMTCNn28lL7im3hLUZcPvm+ZtQxq4fi8uR3SyAd5ClMd6qiunxoFcAw
coNojEypZvvk31YY4D71mPm4agXaXB9/72xi0S19JaTOsfkoKxf7gvf2ypWF8P+f
nLT8ugPexEzt3UU76wQDDlAoVUFpiYZr49olkUMtyKjcTFqYoTmnQMt/nwORweGo
UiKsBdzc31D7RxqsjFTT73o3rbKaEg==
=q3nl
-----END PGP SIGNATURE-----

--z75zsonhv2hxoptj--

