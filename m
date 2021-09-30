Return-Path: <matt@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ADCC433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 06:25:06 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web11.8841.1632983105015426358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 23:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: matt@codeconstruct.com.au)
Received: from [192.168.12.102] (unknown [159.196.94.94])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B02EA20164;
	Thu, 30 Sep 2021 14:25:00 +0800 (AWST)
Message-ID: 
 <8373a9f92863ab3f56849944e126b5f6e5e2ea7d.camel@codeconstruct.com.au>
Subject: Re: [OE-core] [PATCH] openssh: openssh-dev shouldn't depend on
 openssh
From: Matt Johnston <matt@codeconstruct.com.au>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Sep 2021 14:24:59 +0800
In-Reply-To: <9dee0330-85f3-78d1-c54a-71ae2bd66355@kernel.crashing.org>
References: <20210929031804.178714-1-matt@codeconstruct.com.au>
	 <74dc59a8af928f90c54f3d175c1de1aa1012183e.camel@linuxfoundation.org>
	 <7efc4f9ee2b26ddcae0832ff84a1105c6c62aa16.camel@codeconstruct.com.au>
	 <9dee0330-85f3-78d1-c54a-71ae2bd66355@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 06:25:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156481

On Wed, 2021-09-29 at 09:40 -0500, Mark Hatle wrote:
>=20
> If your root filesystem does NOT have openssh in it, then we need to an=
swer the
> question why was the -dev version added?
>=20
> You mention above it's "any built package", but that should not be the =
case.  It
> should be for any package installed into the corresponding root filesys=
tem.

In this case "openssh" isn't installed in the root filesystem, only=C2=A0
"openssh-sftp-server".=C2=A0

> This should NOT install -dev packages for things not located in
> core-image-minimal.  If it does, then there is another problem, that wa=
s not the
> intended design.  The intention when the do_populate_sdk was written wa=
s
> construct the rootfs, parse what was install and add -dev packages + th=
eir
> dependencies.

populate_sdk resolves the globs for installed packages with=C2=A0
"oe-pkgdata-util glob /tmp/installedpkgs *-dev"
which falls back to using the PN ("openssh") to find a match for openssh-
sftp-server.
That behaviour is useful for libraries like=20
libboost-thread1.77.0 -> boost-dev, so I guess it's best left as-is.

Cheers,
Matt
>=20


