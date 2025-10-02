Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE03CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 23:33:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.880.1759443186799468002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 15:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=y1yO3l14;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: ukleinek@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42420c7de22so932907f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 15:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759443185; x=1760047985; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YiR/phiB1bDcHcqBQxpNLK/SytYu4DryPXj4Aa7xeI=;
        b=y1yO3l14/8n53QG2riGI5eC5Q3CAzTGQSS4aYcgATPc3WQg6FT3ea6WjqH2cZi69Nh
         e6oMysptCD1Q1O2zDkGaANAvX+roPHPIZOmn/FKm5tYBG4r7+RbU9JRBz5JKuttt7e+O
         6f59TJM9Sxg+AqL3WT+fQO058uqFQz3cpS9l3+Tx5w/kZIWWxOYxmS4Z5KjN0oQ0QXgc
         VeaissJT6Z5eIdfAAwckgh0nAi0nAahWHzua67xxHXkrLRbXETOsNtlHJdovc07HcnwK
         h+180vvlh51gKsAVYf3TBt6cGL5YJqjoEiDElMIt+fC+S24X88HtqO99G/HIfCGkHZJQ
         Pg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759443185; x=1760047985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YiR/phiB1bDcHcqBQxpNLK/SytYu4DryPXj4Aa7xeI=;
        b=Bkc5ojjM5bziHNaOm+FK0Tpku3xiIzKVbuM3kn9LxM2NxHa5ZIGG+qy4I9QesuZaCU
         l4GV6Hv+G9ZZUb9UVtaQx6QPa54FRX1nKa1AirpvALmCgFfwMVN8fpWXmZws1G/rGvFd
         ZA/sy1QTO7ZSfSa/HrHIxaslcPU9yfVKJD+2yrdqbWolAqKHCewKHio/jRkNppu8aqrV
         RFNHY2AUhi2umBuIM3NyiT4QagnfeWcBJa73hRvyab0tgoSlcJBfGGZFvjL8e1uikBh6
         RutpCfbcmiUihkjHzpbvpCVnn/QrcYcfPx9rZvs2q5YJDwnK8JE2EbKzSHQicNapW9vy
         qGNQ==
X-Gm-Message-State: AOJu0YwjPQXaEYodvaGFqg84ORkPkK0GPMemVwA2/VutiiyGFUY7j1O/
	4ez/iAEeu3IQFW9c5tYsQYLguaxCFvTo7lUMiFQ9AJptPDl2JWe16uzC5nKKWV8ReJY=
X-Gm-Gg: ASbGncsGd5BQMJDs1nfHr/Rif8mWcrcWYtSIfbiBL1wXn/llE9hn3fNw9u4KYsRLpv/
	G1zBySTQE4brRbCaX/YvybQLMPvZhpenPlTNmyxJ08GGGcSXT+zrSvWIBHx47/jQLvWHcE62hGl
	2fyLQJhzI2NsDOIru8z/DdbvwdgRGDw4zQwDQXTB7OBm1Okphy092UR6I8uZ1eGV4YwHWWMHmzv
	zi4kxIYyj0EF1cuH5CTH36dRbCFJnE6doEf5MP4xRoPMm2lmSqkecsC2rNnUhgCAsr6BC24c8m2
	xkrVsv+dJPL/pV5mM6qfkvE6iceatfPu1to6mWLrtXntqr7H0B1hvT7+PJVEtqHqgJiZtoT6AUV
	6uU7+C+/hp/zWKmtUY6ZAt/Fk2fbqgT+oYtU9gZRmYyVEj3eVnDov5VEmy9hi86hrv0YQL43Rcn
	xK5YUoeEJg
X-Google-Smtp-Source: AGHT+IEJJoE2jvV6r7YsC6LgviVFRqMod9LndOcqZUZEhnYaW+IbzEnK/kWKlagGQJPcjD64XaJPMQ==
X-Received: by 2002:a05:6000:288d:b0:3e5:190b:b04e with SMTP id ffacd0b85a97d-425671763d6mr379777f8f.37.1759443184810;
        Thu, 02 Oct 2025 15:13:04 -0700 (PDT)
Received: from localhost (lfbn-nic-1-153-96.w2-15.abo.wanadoo.fr. [2.15.235.96])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e72359e2bsm1518245e9.13.2025.10.02.15.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 15:13:03 -0700 (PDT)
Date: Fri, 3 Oct 2025 00:13:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] meta/lib/oe/recipeutils.py: Handle multi-repo recipes for upgrade check
Message-ID: <pwy7kngno6lgedlcc5fcxpgt5vwhmvxfh7qgabvx2zsbopc5gm@guulmzc3xtpf>
References: <20250923154701.1506704-2-u.kleine-koenig@baylibre.com>
 <ibynx6jvvawtrkybl66at6dqikjuexuuis5ymq5r4cylv6sxzy@zcnbtottsekq>
 <10ca15f7-f5b7-41a5-bdcf-f678e91aec37@gmail.com>
MIME-Version: 1.0
In-Reply-To: <10ca15f7-f5b7-41a5-bdcf-f678e91aec37@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akzcni3xab5p2las"
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 23:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224384

--akzcni3xab5p2las
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] meta/lib/oe/recipeutils.py: Handle multi-repo
 recipes for upgrade check
MIME-Version: 1.0

Hello Gyorgy,

On Thu, Oct 02, 2025 at 07:25:49PM +0200, Gyorgy Sarvari wrote:
> On 10/2/25 11:48, Uwe Kleine-K=F6nig via lists.openembedded.org wrote:
> > This patch was applied to oe-core/master as
> > ddf00d6aee955878c070327ee8d751fdb6099444 (and cherry-picked to poky as
> > 441313eecbd45cfcbf0368e4d1d54bd2e9e59c6b). Would you consider that a fix
> > enough to backport it to walnascar and scarthgap, too?
>=20
> It is most likely too late for Walnascar - there is only one more
> release planned, and it is already in QA phase.
> Scarthgap is however very much alive - you can rebase your patch on top
> of the latest Scarthgap branch, and send it with the appropriate subject[=
1]

That's fine for me. I care about Scarthgap and expected that I'm
not allowed to get anything into that in which isn't in Walnascar.

> > For walnascar it can be cleanly cherry picked. For scarthgap I
> > additionally need:
> >
> > -            revision =3D ud.method.latest_revision(ud, rd, 'default')
> > +            revision =3D ud.method.latest_revision(ud, rd, ud.names[0])
> >
> > I don't understand that completely yet, bisecting points at
> > 6dea2e6332835bd7b646a520e28ce840f0d98f24.

6dea2e6332835bd7b646a520e28ce840f0d98f24 looks very unsuspicious. I
understood where I did the bisection wrong. Once I understood the need
for the additional changed line I'll send a patch for Scarthgap (with
the correct marker in the Subject).

Thanks
Uwe

--akzcni3xab5p2las
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmje+NkACgkQj4D7WH0S
/k79xwgAhYVHQmoSw4/LpRZqpI5tSvY4AQADODI3uFn3bHthB/R4yoZlevGqsx7j
CqO9iVXjHR53+msFVBZ/AgppZw5FUL11c/iN4oILc4uzVtrsKQhVCZt5tdIejgEp
jVe3nCMgP/tvjRxvsheqTLLuwtf6s0So27gpXz0gaEKc/tdxl6S5LmgwGBcNrvrJ
JLsKzzvQWmB7AzHX7dVtn2+/ILTgLr6t1t2Y2qotn1irhy8tbM8r4L0T1wpW8UtJ
XEjjh2OJxFIfz3wyZv8eg/829wfSAp2piLvTKjr27mzodnPO1ua4913+viBt6h+I
VdNAcozvZUNuSOpRzI0uCwsINEvtsw==
=LZLV
-----END PGP SIGNATURE-----

--akzcni3xab5p2las--

