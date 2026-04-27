Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D90FF8868
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 14:26:56 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46565.1777300015084044757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 07:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BjxxxF52;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ba545100a13so1116446066b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777300013; x=1777904813; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eh5x9n+9pc23nnL4WyzjicGQMTWpaAJw+O2tFuvIHM4=;
        b=BjxxxF52n+z9jPc6eDCPvysyiVebfk0dRZJruEvApCsXO4Z7V+nDRmoMHk82CuhGZp
         O0l7KmF/+Fx4YUWSsTDLGWw4gcif9+LYvfRN9/vAFb2pjBDpwdCohRk9DoiE1kMUqt6h
         lR7PR7eEDlp5Fng7NJxoHAdfFiilZvrPmYFHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777300013; x=1777904813;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eh5x9n+9pc23nnL4WyzjicGQMTWpaAJw+O2tFuvIHM4=;
        b=Go0HUp20wY2YHOwnTmaw2NtvjyaLFHHu9SHQQqr+QFxbPwa5O86zPWBhIzphAgKsKE
         a9T1pdCVJD7JgrWx6t1T79DVthltWLiuqkvpFOPG3kYjEd360sx6/NW6hB6gikoobrG3
         ijqQwJucmyfrtQpEaORDAC6rE+YW8/4SVKf8kZnbTISPVx30lopw/b6WcKLxnC5iZOXm
         BYYzKCYBlR2Sc9Ut2t6S+vbXcyaJeMK4cx+OwE9CXgKpk26XpbZocyrIsrfIj2I0DC8j
         vrqYP2FJt5pb3OKPK1ZDohaSYFw6Tt4E0TPkhGc5dg9/0GEb+hhQuY46MKKshd8DrEHS
         gkXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Hj0ndW2ayi/5AkjOoFDRJ7XEwxxwjZIRMlhwAxtzNe1gabmdF1W0yXxZSC3S8mQ5PwHZx8/hrFuP04ESHb+odpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy20T0HGPat7yT9Z89Z20m7uOP6dsJ9bmTQJBPDMbnlaEuCrOh5
	8Rzk+IfYIBmL0oKTfE4eoQc0bEtHEgI3DWTg7J/HBS/1pvA99lSIMhUmwD4TmTKz7Dk=
X-Gm-Gg: AeBDievLDf5LfmewgA7O07MGUvyDYxVtG6sPxg49MNSbwImAV/nDAnsXR6Hs/IXuGEl
	T63a3cPmWWjMpVXzEJ1D3TbzDhh3eWo5TS3qLMJWX4cD/qTJG0zCabz579YFDnRs6dqwPAfGC1O
	TZupgFVdutqZl/qGqlbTwNebw221Lvj0n4g4cCb5dP8byauGEpXKEqEo/gR9f2zC2Q69dAHXFaz
	VH64juTmJi+2ezhu3Ra7IHD1SKDkC6NN1czoZ/hRVLXaquk0FCmxZcluvs+SNngmdWqEJZl0BWK
	MkeU+MuitAmEP5l3/JdQ9ACpzmhWcl/vfNnj7THbeSe6DFRvjo6xI7OOxMk8kFv4CzaR4HeHZlX
	1hrOvJ7W3eanxC35G+zeIqkqsZqGrpmAXTJb6nEDbijUy31YvRoYZK4gGLmab+ILanQRx2U+9Gz
	7TXuHRH6hRq2ipUTfe8VbNZZRIBHESaBKiXkrhDMP5UsVT2pHhbCnkANeknBdpST+2t6t0Uaw3Z
	yBUKznhF5N9sttFzLlrwIrUCbcxycZ3sIK/dg==
X-Received: by 2002:a17:906:7312:b0:ba5:8976:552a with SMTP id a640c23a62f3a-ba589766925mr2080882666b.15.1777300013215;
        Mon, 27 Apr 2026 07:26:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b? ([2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451211010sm1173800366b.1.2026.04.27.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:26:52 -0700 (PDT)
Message-ID: <1d912b5e73c5ef463eaa1c7e0dfcf8607767efad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] base/bitbake.conf: Rework DISTRO_FEATURES
 and MACHINE_FEATURES default handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2026 15:26:51 +0100
In-Reply-To: <822efc1b-68ff-4d95-adbf-15576b653a55@gmail.com>
References: <20260423133340.1954703-1-richard.purdie@linuxfoundation.org>
	 <20260423133340.1954703-2-richard.purdie@linuxfoundation.org>
	 <822efc1b-68ff-4d95-adbf-15576b653a55@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236017

On Sun, 2026-04-26 at 09:28 +0200, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> I found via git bisect that this breaks my builds.
>=20
> It breaks two things:
>=20
> 1.
>=20
> With DISTRO_FEATURES containing seccomp (e.g. when using
> meta-virtualization and/or meta-security), this libseccomp-native
> is not found by gnutls-native anymore. Sure enough, the libseccomp
> recipe does not have BBCLASSEXTEND =3D "native nativesdk" like
> gnutls has. So this change has at least some good points to
> point out pre-existing issues.
>=20
> 2.
>=20
> A circular dependency occurs:
>=20
> ERROR: Task=20
> virtual:native:/mnt2/zozo/yocto-6.0-arm/conf/../layers/openembedded-
> core/meta/recipes-core/util-linux/util-
> linux_2.41.3.bb:do_create_recipe_spdx=20
> has circular dependency on=20
> /mnt2/zozo/yocto-6.0-arm/conf/../layers/openembedded-
> core/meta/recipes-core/systemd/systemd-systemctl-
> native_259.5.bb:do_create_recipe_spdx
> ERROR: Command execution failed: Exited with 1
>=20
> Adding INHERIT +=3D "nospdx" does not fix this and none of
> the layers have any bbappend that would explain this.
>=20
> Using the preceding commit fixes the build even without adding
> the necessary BBCLASSEXTEND incantation to libseccomp.

I tried to reproduce this by including meta-virtualization, using a
systemd based DISTRO (poky-altcfg), setting seccomp in my
DISTRO_FEATURES and building both util-linux-native and systemd-
systemctl-native (and then world). I wasn't able to reproduce.

How do I reproduce it?

Cheers,

Richard

