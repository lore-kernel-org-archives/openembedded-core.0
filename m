Return-Path: <matt@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F86C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 03:11:14 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web10.23952.1658718672857577140
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 20:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=RnNWeMZh;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158,
 mailfrom: matt@codeconstruct.com.au)
Received: from [192.168.12.102] (unknown [159.196.94.94])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E1FD52001E;
	Mon, 25 Jul 2022 11:11:08 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1658718670;
	bh=GvY53NkZNoGaVW3bGCakwnnszwRJKMfs7V1einXzo0w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RnNWeMZhsjR2Nz7F5DbgM1L1ypBgoNHl4U2XvJjm/6DqEyddTgWOH6wllEtHZ2Ogu
	 Lzt8mlB1YObaVK/OBc51uHfFVTK4tNbd+6X18/jycdJBU/TPyAXuYLarbIt39u6eJV
	 C46kWyvDfal1jbSvpS6IE0Luu8Jmt94O9/pygLiBZ+JHNPuqQlLt3mSLr7k0iZrMUd
	 CzFpz0Y8e7Odc4HFyidXQdDKD04XjEPkmNP5Oi26W86lw1xsCh+NgBc2v8DSGqvXkr
	 D+roxcRnDTcTlJ8b5kfS4/TKGr0An/IrUy35JB5Bqbam9JtNZjXvLiMrAEJzbNHVgh
	 G+o5+60Q4o/AA==
Message-ID: 
 <f8a73d8f5126aab9d1b9b2c145ac6be0edbf0967.camel@codeconstruct.com.au>
Subject: Re: [OE-core][PATCH] dropbear: Enable x11 forwarding
From: Matt Johnston <matt@codeconstruct.com.au>
To: Ross Burton <ross.burton@arm.com>, "daniel@qtec.com" <daniel@qtec.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "dagmcr@gmail.com"
	 <dagmcr@gmail.com>, "yi.zhao@windriver.com" <yi.zhao@windriver.com>
Date: Mon, 25 Jul 2022 11:11:07 +0800
In-Reply-To: <8B7B30C0-321F-4AB4-9105-894148FC9D9C@arm.com>
References: <20220720194416.89631-1-daniel@qtec.com>
	 <8B7B30C0-321F-4AB4-9105-894148FC9D9C@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 03:11:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168466

On Thu, 2022-07-21 at 09:12 +0000, Ross Burton wrote:
> > On 20 Jul 2022, at 20:44, Daniel Gomez via lists.openembedded.org
> > <daniel=3Dqtec.com@lists.openembedded.org> wrote:
> > +              =20
> > file://0008-default_options-Enable-x11-forwarding.patch', '', d)}=E2=80=
=9D
>=20
> This should be a PACKAGECONFIG instead of a forced on/off based on
> DISTRO_FEATURES.
>=20
> Upstreaming a configure option to expose this as =E2=80=94enable-x-forwar=
ding would
> be great, but for now you can easily sed this file as needed based on the
> value of PACKAGECONFIG.

The upstream method for Dropbear configuration is #define entries in a
localoptions.h file.  default_options.h should be left untouched.  Adding i=
t
to CFLAGS for configure would also work, as=C2=A0

./configure CFLAGS=3D"-Os -Wall -DDROPBEAR_X11FWD=3D1"

Cheers,
Matt
(Dropbear upstream)


