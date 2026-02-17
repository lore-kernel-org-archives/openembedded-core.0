Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769AAE9A026
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:53:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15979.1771345503719519923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 08:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BHXtG+7/;
 spf=pass (domain: baylibre.com, ip: 209.85.221.53, mailfrom: ukleinek@baylibre.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so3360314f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771345502; x=1771950302; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bC8FfHr98IMtz84ld4A3NzB3AepCVYFQr71JpqFHyyE=;
        b=BHXtG+7/sc/p3kT3pz8+CyDY4krO1YP5QBZMWKVsrDmyfJorkK6Ul3fiqcC/TatDKW
         hx9hMEfOL5C6IGjxNemVCL6MFuR2Pb3cfFQcY9hmMdhhTXfT0sYyYrZ4DiVUAnPOqLU2
         YXOHnFiLvfwe4Lhnm6x1xCihbb3Nyiov8jZHh9JbU9Pe9slyG3jUlJ6xkXci46W+t2Gz
         lF3z50a1AbAlVX1M48FQA+mK+mkJMxIVJuDjrYc6folLukaGPW3zgpJcLteKmNa0sXN3
         iSN2uJhuE6Jye9mzgqaaIifsOaCXcmyJPGzqSynJ9OWj5jD5xZS5nbRnTO9c81ZnQX8J
         6LVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345502; x=1771950302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8FfHr98IMtz84ld4A3NzB3AepCVYFQr71JpqFHyyE=;
        b=KEcgs5Ov69dswriG40MOhsqodaDKtktLfsl4PujmrdNQWJPRuZxQGmKvIwJOv88nkC
         /QsS/0BiXinLkTTesreo6HIUzsD2KppO0PZyHTWuH1FEQpn31nS/2t7cvbyAXWytciO7
         XZT/ddsubB800jIVGwPr176luyuD8CnlP8wQuIGqDl62E7PWDMSWmX/+lC4FDuCUcj2B
         9As8zFhheNwBElZ6zLQ/ALWFh6PHjvl8lYQQLbRed/tqtjHT/+XhLOvBVd7VZQBOMFw8
         ZzE96rrEfp5RVTQ5/1S4m2hxsss5CFnuqtsdsjEFexLD9dbgH3fK51DhbvN693xo6J6U
         o8bQ==
X-Gm-Message-State: AOJu0Yxh0Rul1FOTs0R+isecWaRLwxnNmZcnBNc7OMcjpdxE87jTG4Ly
	uOPC+FuxMRcF01H2r7g1vvD4VuGW888FH6AgvvpT6Ec9duakioMf2Xzbf/yIqNbYr50=
X-Gm-Gg: AZuq6aJQF96K+Pn86zZU+I06xe7ryAJq5mF0Eh1bNJPJCCNLz96mlz2vQL8Odsees9b
	cYLoW84ITQTU7azcUFpkRU3SsRP1dj+oglfP+JhB0ZdUHY8+7caYMpuH6FsITEY/QuCEq42o7Xl
	qmrXivb6vOO3pgJ1+UAiYwoqL+USAHxU/yaWIEeesi/6WP0KF5q18x+/w+oizYGizVWxzTNELE+
	5eSk+4LWqeCtbRabBuhDRO2fl4XhqYX1TkAMxSsAps1GBgzeVji+6WQHoXnU91StKS7kqphh/lU
	iu4pbK2me82wQTmsnt7sak5/7wjhaJZZF/R/RHfB/D1jt7+Hym4Fm4zuGJDf8Zc9Slw+X52Glxh
	8z2bZk9MWybjsIsGC+x4xXTJ03qmJSkdxx7xz2NN8JKiS7J5sQ/uPACnMmYo5QENfJxQkB6cq9l
	t7o14jv6uAWPZ9+a+LhEUzJWAFMmeQzmbeLwnmCO4xl3huxEMmkQfgd6TrHgH9X04+DSUZhGLaR
	zcSGb1hvz/5pHI=
X-Received: by 2002:a5d:5f54:0:b0:437:70d3:44e7 with SMTP id ffacd0b85a97d-4379790e686mr23886126f8f.30.1771345501842;
        Tue, 17 Feb 2026 08:25:01 -0800 (PST)
Received: from localhost (p200300f65f20eb045c5036ebbb5a6d08.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:5c50:36eb:bb5a:6d08])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796a6ba57sm28820164f8f.15.2026.02.17.08.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:25:01 -0800 (PST)
Date: Tue, 17 Feb 2026 17:25:00 +0100
From: =?UTF-8?B?IlV3ZSBLbGVpbmUtS8O2bmln?= <ukleinek@baylibre.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Joe MacDonald <joe.macdonald@siemens.com>, Yi Zhao <yi.zhao@windriver.com>
Subject: Re: [OE-core] [PATCH] busybox: Enable SELinux support if DISTRO_FEATURES contains 'selinux'
Message-ID: <aZSVSu358ldYjmlb@monoceros>
References: <20260216164527.864396-1-u.kleine-koenig@baylibre.com>
 <DGH4E8RFJGEA.R2SUJPB21TR0@smile.fr>
MIME-Version: 1.0
In-Reply-To: <DGH4E8RFJGEA.R2SUJPB21TR0@smile.fr>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u2vv6dn65d24jymd"
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 17:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231267

--u2vv6dn65d24jymd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] busybox: Enable SELinux support if
 DISTRO_FEATURES contains 'selinux'
MIME-Version: 1.0

Hello Yoann,

On Tue, Feb 17, 2026 at 10:13:24AM +0100, Yoann Congal wrote:
> On Mon Feb 16, 2026 at 5:45 PM CET, "Uwe Kleine-K=F6nig via lists.openemb=
edded.org wrote:
> > this targets oe-core master, but it would be great if it could be
> > backported to scarthgap which is what I'm currently using.
>=20
> Thank you for the patch. However, this is a new feature and would change
> behavior for users of BusyBox and SELinux. Therefore, I cannot take this
> patch for Scarthgap.

That's what I expected, thanks for the confirmation.

In my current usecase this mostly for debugging, so I can cope and I'm
happy if this change makes it into the development branch.

Best regards
Uwe

--u2vv6dn65d24jymd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmUllkACgkQj4D7WH0S
/k5KAgf+Igqi1umbMJcGqqtvG7bWGHMS79hHaPyB0PfGbYkS/ufbb6nUWE82Ppkn
Ehkdq1ZqVbn0jb0ObkP04D0c19MOoPOXn1N1+vXajuHNFTEQPqFi+Q2s4ouIwCHh
kcYTe4Gkd5xE4kWEWeLSsSu8cRGqJp5h0HbLSP+74nsDPfDYkLCFxxr03uoG0m/l
CytTAJPwU5lNMg5epya9k8BgNczxgZoAB/DgU6YwYWARh8MZc73SBQIHl30YfdJT
luWOyef5V71vIxToJ93zUBLjgPJ16G1gUMr1YaBvIO3wXJ1Ly0N39Eb+XWm75B/O
yUV1yT3AI+xv94LG9wMbVtX3AONTqQ==
=ab8O
-----END PGP SIGNATURE-----

--u2vv6dn65d24jymd--

