Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4B4CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 22:16:22 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.1672.1758233775014384760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 15:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vl/wklRQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso588666f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 15:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758233773; x=1758838573; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnizpW6wTpNXNPde3BeubjIreQiLw2JkegDO3w4erx8=;
        b=Vl/wklRQPe2o160Q/bAedo/0acmKm4aBbWiXxk6hlfFotSBU1IdSITG/093PI7Quxh
         tRBM5IAN/65HpJG5gqQ5sk41eWfaSpPkNmo4G4J6NHQ27cZjh+pVhhw2/BvthZ93FOFt
         q2qZkibnz68HvVnPpDWpA0UFM2Tk0rKe9JbWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758233773; x=1758838573;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GnizpW6wTpNXNPde3BeubjIreQiLw2JkegDO3w4erx8=;
        b=tQNFFi40FxOoANMb9GPROLmESxtWW6kIxt+A52N/RBIqUSEiRHjkWr/w85Ldk9lHR/
         ian2sDsGWII3OVas0QNEDT/V0A9uXbMHvmuhHuda8ezSmQ7qDlc4m2xaGiQpMOh8S1ZE
         A9ndAo93RhikazCz+bN/QQnz6j7Aq6kQtOY/N5NPqg9keGAfBbnFBKODkWl1Vcphaluk
         z7whhaiVrgEdOXlVJiX7uzR0KZtyYogg9jn/Q7NbCrvzd6ZthqqupbNDJ9eZfbSMgvSu
         /VSE3p0terriLzVKpVXcNwRVtGzllpDGau/TNfNFwnSIxvGmSIGfDPaOLwYmap5Y6yp7
         5aMA==
X-Forwarded-Encrypted: i=1; AJvYcCUsSPkioAtRwYaX/DciviRUoYxgabeRi4XlXxuf5BsYPXdx9CuSiUyq8aM968iR/VVltr2eDdcM8OIpUgfMZdiQqg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7ggKlDwnP8RrLmgHOXFBGJHdzWKRJJILAiW8AF1SCKIfth8MN
	jJZhIpWRV34D1q623rD7Bc9GhWVwK+rnAUg7vpZmndbD9jQFkSLbW0/ucOsSvpJCJ2E=
X-Gm-Gg: ASbGncuzQ2fc6gNG7pd8xWNmheCD75RjQmeNroG0YqxVezCA4YQANievsaBinJuSOcO
	rpQHgKGRItUlYHu9PJTI91WNtaugCShqkdarQYyCisJMTqfo7JKRBWaCBLhYRrWWorsZxO9kBY/
	hS2kyo2Wq00D+bATVdmIhp/kEb9I8pqjhT49XLf0AvlZD3GNEv7Gxdy4JmlThz96f1i/r0bn1Qo
	VJ/DyouafIYCyaNEcbnkpeIzO5E7gaOMZkEZml4VgGS/lDSSjSLrOyvZtYiV2XuyKiJb+ZkOaHb
	P6OwN4me9CwR2cHPtVyfVknEUVXy7LUgiVAgzXofEiAReJ6z3NMsUGLqqiIeXdoPvGsvGynain0
	4QmLjizXGbkejE0Zjw6ehp76LjaDyUt5yzpCiszxilmqtUrG9nfd4atotMJ2cU2bPQhpneebZXL
	lT1Kyb/hMYQZifhc125BM34LgRC9vNLg==
X-Google-Smtp-Source: AGHT+IHE0Ps4+NkVuTO1hwpxVFpdglDdxSgIsjPLfPm7EfYLumP8OK3jojbUncsJRiFCTe5cEJy8/Q==
X-Received: by 2002:a05:6000:178e:b0:3e8:760e:bd with SMTP id ffacd0b85a97d-3ee86d6cd7cmr641249f8f.60.1758233773208;
        Thu, 18 Sep 2025 15:16:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ff46:817f:51e0:4b54? ([2001:8b0:aba:5f3c:ff46:817f:51e0:4b54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-461eefee9f3sm93322425e9.1.2025.09.18.15.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 15:16:12 -0700 (PDT)
Message-ID: <50952460f2bf31d8f1632d20f696a4e06985386b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] cve-update: log timestamps and add force
 update for future time
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, Niko Mauno
	 <niko.mauno@vaisala.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Sep 2025 23:16:11 +0100
In-Reply-To: <PA4PR10MB5707144A5B4B39EEDF739AEFFD16A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20250826185922.20154-1-peter.marko@siemens.com>
	 <a9a5777d-d622-4e89-9888-3989f884e816@vaisala.com>
	 <PA4PR10MB5707144A5B4B39EEDF739AEFFD16A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 22:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223702

On Thu, 2025-09-18 at 12:55 +0000, Marko, Peter wrote:
>=20
>=20
> > -----Original Message-----
> > From: Niko Mauno <niko.mauno@vaisala.com>
> > Sent: Thursday, September 18, 2025 14:48
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] cve-update: log timestamps and add force =
update
> > for future time
> >=20
> > On 26.8.2025 21.59, Peter Marko via lists.openembedded.org wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >=20
> > > CVE update is currently not working properly on autobuilder.
> > > This improves logging for problem analysis.
> > >=20
> > > Future time is something which could be reason for current autobuilde=
r
> > > problems since the DB was not updated for more than 3 months by now.
> > >=20
> >=20
> > CVE check mechanism, which relies on a CVE database that can silently f=
ail to
> > update for several months, seems troubling to say the least.
> >=20
> > Looking at the do_fetch() method in both recipes they seem to use the
> > os.path.getmtime() method to resolve the last modified time of the data=
base. The
> > value is however based on database file modification time. This seems i=
nherently
> > fragile, and I would be curious if there would be a less problem-prone =
approach
> > that could be used to resolve the last modified date, such as resorting=
 to the most
> > recent CVE last modified date. Seems it can be extracted from the datab=
ase file
> > by issuing:
> >=20
> > =C2=A0=C2=A0 select MODIFIED from NVD order by MODIFIED desc limit 1;
> >=20
> > I'm not sure if all things considered it is completely appropriate to u=
tilize the NVD
> > MODIFIED value in this fashion, but it would feel at least less hazardo=
us than
> > referencing the modification time of the database file itself.
> >=20
>=20
> I was considering multiple options, also using a text file with timestamp=
 instead of the getmtime.
> Your proposal looks nicer.
> But I decided to first look at the AB logs before implementing something.
>=20
> Unfortunately, my patch to expose the logs was not merged yet :-(
> https://lists.yoctoproject.org/g/yocto-patches/message/2083

Basically I'm worried that this is something to debug a one off issue
but we'll be left with files building up on the shared storage. We've
multiple other debugging experiments like this from previous such
situations. People add them but never remove things.

I don't know how to handle it but I'm worried about things like this
being left indefinitely and not scaling.

Cheers,

Richard


