Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7DFCFA76B
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 11:19:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.19694.1728040780959342838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 04:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZQpLufqY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so19541125e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728040779; x=1728645579; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3hfg9Fgzky9Ff1wKoMahnhpOD+aIiF0dHoRX1vtClM=;
        b=ZQpLufqYjl0gPNyehxPrRuiNTa8PcJyEvIcSADW8qriHVlvGa9WZBBLWSw3jYWgh+C
         4pTlWiW/rBCW7pPRWb+3Ts6ag21J2jZkK6lR7evcQbsI08z6xSNSQHuYs3fh7aNnZVtC
         0YKSh6Raas3jclzULsGuU7q745GM/7ZWr61B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728040779; x=1728645579;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3hfg9Fgzky9Ff1wKoMahnhpOD+aIiF0dHoRX1vtClM=;
        b=l4Af2y6jldxdJDGkLUKY4Y7r4eJ/oENyeImG8zRRBqBWVpf4ufS8nZl5M3DbgxwTjY
         VS8drVcqrz25eGhMU6cz0bIHNog6hZ+wJAzB5v7Z9abGevAOaIvZC7VPryS/peaWOcpI
         NzrwDBDFjWrVTsaIUJHfNMJAKnDD8p49cuXnSjVqTl5ZNKcx2g4ghX61ewP3eAmJAfnf
         2T8P632QzTyN/oG+bvyHJra56qjXRsywqkBTVD8UttInVByxFE28CcOG3QIXrN4WNKwZ
         9j52pnCNScli5oEI9RebOuki2Chy/kHlCEkyKwFHmEoSjbV1yvr7BSuk/f6k9Adt+bED
         YfGg==
X-Forwarded-Encrypted: i=1; AJvYcCXapX3BsaaCUtX7hDpXBNFkzTkIydM1EyFFyQfRKEVMAoC7cVJB9Q+SDcq32p7DOlOPgSj9gQIBsMrjscS1otvC5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzhTjLo/67bm405dr5TDKj6fBQhDrX/nLGLZ4egRNqSZWiOTsTD
	3nquyjNWH+OtCPW0UknTojlDUowBr/NIH8z9OuhcGpxmH8bup5RtUm4MOjaapxE=
X-Google-Smtp-Source: AGHT+IHrhMTIjbLY01N/87HSlFfy1BNFp+GMBYfiJB0jV4GD0NArBdfTIDkT3mgW+uD8+yGJVz+I7Q==
X-Received: by 2002:a05:600c:46c6:b0:42c:b905:2bf9 with SMTP id 5b1f17b1804b1-42f85ab7cbbmr19163675e9.16.1728040779132;
        Fri, 04 Oct 2024 04:19:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:25ac:3f31:db63:541d? ([2001:8b0:aba:5f3c:25ac:3f31:db63:541d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4aa8dsm13189355e9.43.2024.10.04.04.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 04:19:38 -0700 (PDT)
Message-ID: <c8b8242480e395790b8a7c921835834027da5fe0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: add man user and group to fallback
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Oct 2024 12:19:38 +0100
In-Reply-To: <GV0P278MB0241E4086F65AC9938075ACB88722@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
References: <1728037005-31667-1-git-send-email-diego.santacruz@spinetix.com>
	 <5cb8922b31b537468a104e48c3f21a88af41514b.camel@linuxfoundation.org>
	 <GV0P278MB0241E4086F65AC9938075ACB88722@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 11:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205230

On Fri, 2024-10-04 at 10:59 +0000, Diego Santa Cruz wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: 04 October 2024 12:28
> > To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] pseudo: add man user and group to fallba=
ck
> >=20
> > On Fri, 2024-10-04 at 12:16 +0200, Diego Santa Cruz via lists.openembed=
ded.org
> > wrote:
> > > When installing packages with man pages the man user and group are
> > > expected to exist. These are included in base-passwd and installed as
> > > part of the rootfs. However, when populating the SDK the rootfs may n=
ot
> > > have been built and thus the user and group cannot be resolved and th=
e
> > > installation fails with the following error.
> > >=20
> > > =C2=A0 chown: invalid user: =E2=80=98man:man=E2=80=99
> > >=20
> > > Adding the man user and group to the pseudo fallback passwd DB solves
> > > the problem.
> > >=20
> > > Note that PSEUDO_PASSWD cannot be made task specific as to include th=
e
> > > SDK sysroot path in the populate_sdk and populate_sdk_ext tasks, as
> > > PSEUDO_PASSWD is embedded in FAKEROOTENV, and FAKEROOTENV is cached
> > > globally for all the tasks of a recipe. Adding the path of the SDK
> > > sysroot to all tasks of image recipes would be a bit risky, so it is
> > > best avoided.
> > >=20
> > > Signed-off-by: Diego Santa Cruz <diego.santacruz@spinetix.com>
> > > ---
> > > =C2=A0meta/recipes-devtools/pseudo/files/fallback-group=C2=A0 | 1 +
> > > =C2=A0meta/recipes-devtools/pseudo/files/fallback-passwd | 1 +
> > > =C2=A02 files changed, 2 insertions(+)
> >=20
> > We don't preserve user/group ownership in the SDK so setting this
> > ownership doesn't make sense in the first place.
> >=20
> > Which release is this with?
>=20
> This is with kirkstone, not master, I was maybe too eager to assume
> the problem still existed in master, but after looking things up I
> think it does.
>=20
> The problem is that, before mickledore, manpages.bbclass has a
> postinst script which does a "chown man:man", while running under
> pseudo. So pseudo attempts to resolve the man user and group, but the
> path that it uses to look up the passwd and group files points to the
> target image, not the SDK image. In our builds we build both the
> target image and SDK in the same bitbake invocation so the do_rootfs
> and do_populate_sdk tasks race against each other and we have random
> failures, which occur when the postinst script runs before the
> do_rootfs has populated the passwd and group files of the target
> image.
>=20
> Granted the chown is not useful for the SDK in the end, but the
> postinst is common between the target image and the SDK, I do not
> know if it can easily be made conditional on target only.
>=20
> But I now see that this was changed in mickledore in
> https://git.yoctoproject.org/poky/commit/?id=3Dd42904ba0cf0eac28ef79b0e60=
15150d376d134d
> This "chown man:man" is still run but in an intercept script
> (scripts/postinst-intercepts/update_mandb), but as I understand this
> still runs under pseudo, so presumable the problem is still present
> in master.
>=20
> I doubt the fix you mention affects this because that affects PATH,
> not the path used by pseudo to look up the passwd and group files.
> That is PSEUDO_PASSWD, which is still set to
> "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}" in image.bbclass.
>=20
> If you think it necessary I can maybe do a build with master to see
> if I can reproduce the problem.

This change may make it clearer:

https://git.yoctoproject.org/poky/commit/?id=3Db5dbdfe90497867a70fcdd69a3e3=
47952dff7d3a

We intercept chgrp/chown calls so those won't happen on master. There
was at least one bug in the way they were working which that change
fixed.

There may be elements of this which could be backported to kirkstone.

Cheers,

Richard



