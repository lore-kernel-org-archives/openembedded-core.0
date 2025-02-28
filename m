Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E075C19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 10:20:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.12642.1740738030651362415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 02:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cKtzAxgS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390dd35c78dso1563363f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 02:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740738029; x=1741342829; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XJYgnnTx5gyKnqXwoV49fh0yBurqBJKdTaz0eko0Ku4=;
        b=cKtzAxgSrj22XJsWQTKbwuYH1a+lOPffJxdPYQkhJjg7eEvGFMhS/neQh+uLaim+Nq
         wBn2BjAAE9hpdJQfVB9U7gN5BW4VHqoAtltwbZJXApwMwdbU+/86obguC5d4ge5Tn9tv
         rCYpprs7GR+le2Qa/VRVB51GjzojDn8eMa9ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738029; x=1741342829;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJYgnnTx5gyKnqXwoV49fh0yBurqBJKdTaz0eko0Ku4=;
        b=dHvpZzIuWR3A6IEaOFuithNxvj522D9IvhsjkfvsZYwncZAAAe5LW5SElEYvbADzK1
         a6blbSm4GQg3jOQGiztOxkTPwJm8WA6AinYdFr8H+eXL0PjcYyPMGNi99eE8R0FPutP5
         GxzOOOxAdexLd4vCYCk8l6YTF5gwBeaUBs3VjutP+rsdTgl7EUlISj7lUyMZz41bCnNn
         wBtvRhaZYn0ikSD8t8T1DdLr7QWIzYrD98h/ayFsyxtg5dGR5IY7LcAlWiQTyATFjSO6
         /7E6kQ7W/zixFN6EV3l9yf9WNldW4XFk4B5enVTdgiOueRggQ+meg6wj6Cc9bwieMerB
         crvw==
X-Forwarded-Encrypted: i=1; AJvYcCVeW6xs5kMWMBIM6qQAvVOwUbnqPpeiyWObeM/htnEATgmjkiN5WI+FrfWO8aK5O+Nbn4UvxqUGJkzZmiPaRsiOsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywmwaw9BF9ycGcFRUMtqNpw3ow0HLLhTtJwkGRlYO7kCovOlGN9
	IZP5qCEb51B42cwZeO3v01ok2C5yLPscE/+5YzZbOzSdkR1saS9VxdXMHV5tHhU=
X-Gm-Gg: ASbGncthaPjTGDId6efniF9E8GhgsgL53G4Z9WKPfJRDPJUydnjkYh0974Tij+STVHB
	igi6HNkWd7a1i7CA4m9YXuRxICOA+ZJg/+aXsLClcamC5z0C4rMxCS9EloTaw8Ujzs4F4i5z0NU
	uZtPLY/qofTsQ4ebgyZ8bCC5c21bzt+wZiKElpk8QoJl90RkhwnQdojGuD04dFPoqrnYYSeG13N
	y9mbYPQKCzankMdVDP+T/8JvAe5X0Axv6SBEsDS7tqrisRwciTwIT1PkGCL3Ku5PRqZ1IHHyV1h
	p0BHthwLEuRqtyUhopVbjX+GsxmTfuPVPY2SqTdUhMPppKO60pFJDTKpI0WhuVWQBwjf0B+cahl
	VrochHZmXBock3VU=
X-Google-Smtp-Source: AGHT+IHjr8fQ44ll8i6g3hzXN51oKhWnP43wR5NCMx2gW3//5Zpn/sgDsshsIdyF2nUmOtIsQJdTHw==
X-Received: by 2002:a5d:5f94:0:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-390e164b4bcmr5611705f8f.6.1740738029056;
        Fri, 28 Feb 2025 02:20:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ddc:363e:e14c:9394? ([2001:8b0:aba:5f3c:6ddc:363e:e14c:9394])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73717171sm50528265e9.18.2025.02.28.02.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:20:28 -0800 (PST)
Message-ID: <48f11c6288db844ec985daf20f34e92974519e82.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Sommer <joerg.sommer@navimatix.de>, Changqing Li
	 <changqing.li@windriver.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2025 10:20:26 +0000
In-Reply-To: <vzy63llcnvkkp3tdkfj3eowkphcww7bi6ha4jfljw7pfskezw7@r27s535jwhl7>
References: <20250220035724.1460062-1-changqing.li@windriver.com>
	 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
	 <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
	 <sozxs6figgef2mhn3bkcr2z7vy3u3idrrq4gkgzmxbibiiih4t@aoqiqffittgi>
	 <d20d233c-08c0-490b-927a-fbfc6d4d2383@windriver.com>
	 <vzy63llcnvkkp3tdkfj3eowkphcww7bi6ha4jfljw7pfskezw7@r27s535jwhl7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 10:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212055

On Fri, 2025-02-28 at 06:42 +0100, J=C3=B6rg Sommer wrote:
> Changqing Li schrieb am Fr 28. Feb, 10:56 (+0800):
>=20
> But you can't remove ldconfig if you need it. Why do you remove it?
>=20
> If you want the ldconfig feature of python3-ctype, you have to enable
> ldconfig. Or at least install the package.
>=20
> Or should we downgrade the dependency to a recommendation?
>=20
> > ctypes.util.find_library need ldconfig or ld or gcc to work. No matter =
what
> > the DISTRO_FEATURES is, we should make a package at least work once it =
is
> > installed.
>=20
> In our image python3-ctype works without ldconfig.
>=20
> > > Quotinghttps://docs.yoctoproject.org/ref-manual/features.html:
> > >=20
> > > > ldconfig: Include support for ldconfig and ld.so.conf on the target=
.
> > >=20
> > >=20
> > > @Mathieu: I think you should revert the commit 0df1318e5c, because it=
 pulls
> > > in ldconfig even it is unselected in DISTRO_FEATURES. It leaves no wa=
y to
> > > build without ldconfig (what was the intend of my commit).
> >=20
> > when ldconfig is disabled in DISTRO_FEATURES, if we don't want ldconfig=
 be
> > pulled in, how about just not install the package that depend on ldconf=
ig,
> > eg: python3-ctypes.
>=20
> In our case python3-ctypes is a dependency of django.
>=20
> > if revert my commit, and ldconfig is disabled in DISTRO_FEATURES, and
> > python3-ctype is installed, ctypes.util.find_library will not work.
>=20
> But then you need ldconfig. Either install it with IMAGE_INSTALL or inclu=
de
> it in DISTRO_FEATURES. I see this the same way like other DISTRO_FEATURES
> for example pam: if you want to use pam with e.g. systemd you have to
> include it in DISTRO_FEATURES.

DISTRO_FEATURES are high level policy controls, not "this should be
included or excluded" controls. For example "pam" controls whether the
access control modules are configured/used, not whether libpam is or is
not included.

For ldconfig, as I remember, the distro config was about whether to
include "ldconfig" calls after installing libraries and whether to use
the ld cache.

Packages being installed or not is an image level decision, not distro
level.

In this case, perhaps we should drop the RDEPENDS to a RRECOMMENDS?

Cheers,

Richard





