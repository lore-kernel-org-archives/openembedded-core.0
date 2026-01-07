Return-Path: <haokexin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695F9CFD626
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 12:53:55 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5024.1767790434018793307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 04:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6qFvtnU;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: haokexin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c07bc2ad13so134471185a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 04:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767790433; x=1768395233; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Zul4h9r9C1w4hnfwKaVtlbF17v8rwHhFPBRvphUtI=;
        b=A6qFvtnUXIb602rkwOLdkM10U+nAFa+tBsE9xY7rAIbyAk3y+GqiFtdIfdrRPBjLr8
         v0DuOLrrmSsdNUU1h9YJCetTVl/bdq58x4hbB+K62Hvs5W5VYJzuc/29SKl67Lz4+ayf
         FI6Vj+SBWOtozpqFCtFBFjq9UH9nCcifNbElVu66OVhxYhjD2mefiXCJSIUnQP0GfUUh
         ZUUEz1wToHMOz4xSrFjmyaGz4G/WoeuJjWgixPBkwjmI3HkB6B0AFMB1TDHZ7+gK3B3R
         hq7DvuZlqs05/DUmJjoHFOxj6TNBVEVfWdWtClaa7LmtN8tWtGIh+Qtx8mB1VVXgXh+I
         GH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790433; x=1768395233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7Zul4h9r9C1w4hnfwKaVtlbF17v8rwHhFPBRvphUtI=;
        b=qmbd/YG8KvwFNBCksNPMOcVVDFNiOYq3WMGjNvdisNddu8+HWRM1CbpdZpv42yOfOX
         u5LKB2G55fxPLjN5F+EmHclwfyZEd+Y9IvOnon52H/OBfMiAULKL9Wl9hAR/8ShuNKrQ
         RfkMeNuCyy/whJU8yNrBhsBRnfuHJM+ZsR3KWEuwD/5DaBXvMhg6FgLBr7krg9m8ZkHk
         T8tjVZkt2WLzdVDTryX69lasu4zofcVBTCJdEmdpDIuRVetn1dpeCuJElpjyfPKX+VZa
         KhQCo0X4jzM1FJ48hTxvP/S0SjB2bbK4YVT11AU15uDgDGkgi6Q7RSUmeOcwd+XCm/gu
         rItw==
X-Forwarded-Encrypted: i=1; AJvYcCXy4pIwIY6PxBm1vDX6D4HyY+b/VtthttRepsjuiAbFKrBFTGb9bX/QC++RKec+BmJhIjvheS6ARKBuysFNkAqlZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEJURsy/bAJYyoxNGNEkGJanPiIKDo/ToNUzxkPxvzupjSaIFA
	raXOi6OKoYlu8U1nSUsbFb7QuE0i1YiVrVcCBX3eLL+nKFAwDt442TEd
X-Gm-Gg: AY/fxX5quncGK2+0SMKHL9TKM3buwEKK9ezhkllqUTSLS17iWhi9reeYsvFPfSgRFEl
	YqecDGzuYJyFHiggjt9EYaFo2fB+RSJSDvRGViEw19jGi+13ujp+OHgY+7vgeNCGNe47cLgEVxq
	ZR0vTpkPlL9Eyyi2QlOu/m9dRrc0P5wr55VcSlHYEMjBMwSAq42pWbpjykEPWE5wYMpIdTqaPWH
	tqyl5SNjGLmWKqgWtaejdawK3E3xMzijHQcShdkqdFysQ+fVoiJUw59/8eotIehSGnNN626izmG
	JxR1P2KnB28H0gPxs69ioqfCGfqb2AY7JDcFNphkJEMQi9IxesN/kJ2N478uhod+SxySp0e/eyG
	qWVOuJ6AZ5imW19tVgai8czxx+V/3mMjdGAiu4ivwTlyjKrG05XIVqZ1E057WV5R/V2u9zdXY7a
	PXrqhWmxg=
X-Google-Smtp-Source: AGHT+IHKRf5D7k125JQxlWpl65/B49CIv1tViJqu7KMZdChb/g1zc8SUq9m0mwMF0ze66tGsICic+w==
X-Received: by 2002:a05:620a:711c:b0:8b2:767c:31cb with SMTP id af79cd13be357-8c38940c007mr235690785a.87.1767790432707;
        Wed, 07 Jan 2026 04:53:52 -0800 (PST)
Received: from pek-khao-d3 ([128.224.253.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cdcesm365567285a.26.2026.01.07.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:53:52 -0800 (PST)
Date: Wed, 7 Jan 2026 20:53:47 +0800
From: Kevin Hao <haokexin@gmail.com>
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
Message-ID: <aV5XW4Rf4tvtJU_O@pek-khao-d3>
References: <20260106152352.932717-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X2RgQ6ZuOG6Jf9NV"
Content-Disposition: inline
In-Reply-To: <20260106152352.932717-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228999


--X2RgQ6ZuOG6Jf9NV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2026 at 10:23:45AM -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Hi all,
>=20
> I'm still tweaking my pull request scripts for the split repositories,
> so apologies if something doesn't look quite right.
>=20
> I'm unable to push to openembedded-contrib right now, so this is a
> patch only send.
>=20
> We are getting closer to removing 6.16 (and then 6.12) from oe-core
> master. These updates should address some config warnings, and
> otherwise improve stability.
>=20
> We need to get the reference platforms update to 6.18, so I've cc'
> kevin@windriver to see if he has any plans or comments on that.

The v6.18 kernel triggers an RTNL assertion call trace on my BBB board.
Although this does not block the boot process, I would like to investigate
further to identify the root cause, which may take several days.  However,
since it does not affect normal booting, I can update the default kernel to
v6.18 for the reference board first and debug this issue concurrently, if y=
ou prefer.

Thanks,
Kevin

--X2RgQ6ZuOG6Jf9NV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmleV1sACgkQk1jtMN6u
sXGm2ggAhb5dEJvpvqt7Vl37v1q5G31hN1OzoDbiO+/55I5e6w6DUQK7STSZon9f
uhRIMWVSJwgaZHfqnWV3ibPck8vJckDfFwMpzM+tKMpi4YVrKd9tn2WK7kou6Mt1
HQi3+t7VluNzAjF4IDYqWkKEN6mE7w3PX8EBGY3ohmfWaw1YkvI/pKn0XecRAXsd
n6NKZUOnlyVvIGqGdikkTHUaxS5PJrv9PD1lIeMQe9SeulpgSethaxc4WTPwPK6d
U9Aydajj1dKrNoTrDMVR1l1KDq80r1dtS543yimUwoud4qAvqOcMjM6UfAV+PN46
Z6X9PyD+z0Un5RfrQZq/EuHim7Blwg==
=i0TN
-----END PGP SIGNATURE-----

--X2RgQ6ZuOG6Jf9NV--

