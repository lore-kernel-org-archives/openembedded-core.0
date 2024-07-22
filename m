Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E18C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 07:37:53 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.13139.1721633862339980968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 00:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iVbUhZpq;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso13852061fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721633860; x=1722238660; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=voZ9YLmrvi04UOzn9PKc14NiZ3MwcLt1t1jplLMho/M=;
        b=iVbUhZpqPnJQp0QHsDWdvqAWQ7yLIpYJF7qWooO3Ob4MEYqGPde7SqdyTC3ak6IugU
         0TCkrj91bmHiFlM4T9FC8QpIlR2DfmEleeynyanlZGlV10XzuSXCth/briF0FyWwspBd
         uXoRcoU357ZwImmQD8LbpcadLfeGMJA5zsWmhkJ/t8Jpg7AmARgStqxPmFdYi6DuS4Be
         503cKDA04x+A3yUt4jUEG9bt49cSDUn2vQMRQPJKzynN3YMYqv/kz1ovhHFy4TdQkHlE
         ru2PqtHY0pgE5S4F6qvzGK3Ib7h5IKzOIlDFJFvKLIMuLecw0PB3qY7rb4ax+MF0M1lf
         4b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721633860; x=1722238660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voZ9YLmrvi04UOzn9PKc14NiZ3MwcLt1t1jplLMho/M=;
        b=F8zs3gENDynSRBtNmD7t5RQgtVQHSfyfxmktIAQZRnjsGLeYGwe5qgLAUsPPdvfORR
         QEjxQYAQTmp1DvcT1Wz8D0hS9ELIsZKc9VVIwSV6NXcNL27mko4VvyLsVJcPnN6Hkfc9
         3SOjSk9uoZiEy0zehEyX47qTa2bLl+xb+0oV/UNV77Eg/tEJeNsoEvKRrhvqDkSOPCyq
         sitAxTvI0oh96F+hGO6hUO0+N3lyKE6jeP9xE/uYLWwVkyDzCFjw3ReYp1Iu9a8nh88t
         ajOtTtM5Pay4bcVAVZmUHDPLgxSeZ9Rzbm1JIT+etRMIOJQowtvL0x17APC5Y5xUyF23
         43yg==
X-Gm-Message-State: AOJu0Yz7nz3nkJCdHliQc062mrqxKbfEco3kvyJ/oAAD7pwFGuzV0dTS
	lydh0Yu/xwdJ35enqWxle4gaMpDBVKU3xuhesriPR1C4AeV0Za0o
X-Google-Smtp-Source: AGHT+IFb212TG7P64DbGx3OstjyPLQojlIV2VwmrWnlv21NDaKWZm5IutS2ZSP71ZaItCwIOMnaltA==
X-Received: by 2002:a2e:80c6:0:b0:2ef:1db2:c02c with SMTP id 38308e7fff4ca-2ef1db2c1bbmr36551061fa.10.1721633859900;
        Mon, 22 Jul 2024 00:37:39 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef290242b9sm5834801fa.139.2024.07.22.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 00:37:39 -0700 (PDT)
Date: Mon, 22 Jul 2024 09:37:37 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>, kweihmann@outlook.com
Subject: Re: [OE-core] [PATCH v6 0/2] image-bootfiles: new class
Message-ID: <Zp4MQU-Swj-Ia6eV@gmail.com>
References: <20240710085310.147425-1-marcus.folkesson@gmail.com>
 <ZpTzJ5Qkid1oy8AT@gmail.com>
 <2024071512261243271aac@mail.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H3YXvWZ0sMZNt2E2"
Content-Disposition: inline
In-Reply-To: <2024071512261243271aac@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 07:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202308


--H3YXvWZ0sMZNt2E2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 02:26:12PM +0200, Alexandre Belloni wrote:
> On 15/07/2024 12:00:07+0200, Marcus Folkesson wrote:
> >=20
> > I think this is ready to be merged unless someone has any objections.
> > It has been under review since June 19, v6 that I sent out just under a
> > week ago just adds Reviewed-by tags to the commit messages.
> >=20
>=20
> I didn't carry this in my branch yet so it has not been tested but I'll
> do this this week.

How did it go?

/Marcus

--H3YXvWZ0sMZNt2E2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmaeDD0ACgkQiIBOb1ld
UjIeoxAAjAGTiXN0V8tFws6pvzYe+BVIzjLgV7L/SsRKiU1o36Dd972439yJFm6q
4Q54kt7nEeVIiTQhHN1MbSo1TAMnMiZsY6MEoJG/CqDUELlAERpptfOZFsPkRKP9
awQqD7D4odQJ7rRsNSC0kKws3PzvUH/mHK4RiVhqkYgb4+cuLX0YQCYHAZKGJmlv
HLpckxT63T+ey0OAXK0zCg3TsMKsWxDUOK8q4K6N17uyox6t/B2x+YYmCAHiJWA5
LC89iezUKW/fNJDez0yZ59QcCBkpoZs9xUH1mDxj2dp4b837t0Bz6yPCilAUJlx1
pbnr2L4c/AzQIchzXUO5c3hfH48OW2W942GClDTwAvN+biQr/7EjvHWsoGyhPc/r
tVxO1tTKlw85CRfAcKwA5vjysvWgwsRmxfarE3UsMjY5zp24arLPsn/xN8chANKk
8qXNHbi9++11O6oKJAuj96Vohb/GuZEQvYDBhHaQyLh+vVdoSc5/gQ6WK/izf41j
G1myIu1jMwhQpwTiF7peSq87Spcro6kSTk/48wpRZncBVnw2EURldS463KfErXjs
NpbeB3Fy6P6vOCtEkbCmwowL+b/foRiP6NsT4r3EPGez+cBq2RB8gkJV18ci7Tjp
kPxIbiE60kb8F/sUqj/X86VvcCqEd22RuglexmWH5OUvWqakpBU=
=hNL3
-----END PGP SIGNATURE-----

--H3YXvWZ0sMZNt2E2--

