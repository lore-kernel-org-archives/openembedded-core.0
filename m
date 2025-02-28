Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6D6C19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 10:50:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.13072.1740739843498133076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 02:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dYexxkrN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390e702d481so801942f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740739842; x=1741344642; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ekHDAzrNw8Yaxdolx1Xce26IE9dL+kwFKHB2owAqmvk=;
        b=dYexxkrNvBYkjw1of3S3O0qQA3q7rA4H+CUU7UrT2lKUoCy0bZNT7FwsIX0fccXrXP
         PM0t5ynuqOzAxGvHtkYNleCuhL8ySa097xqzNzLFCQROsq/h8wA/bfeo5VbP9ze1/VCr
         7HhkybVj77TEmHYjlJSOqY+b0LDMM+xndDyFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739842; x=1741344642;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekHDAzrNw8Yaxdolx1Xce26IE9dL+kwFKHB2owAqmvk=;
        b=LzV2cw2H8Bzl/8cUA58LvTNEhDA/dRzFTykoigczK3qaHknaDmMV8Z/1Ixb0WPmwiB
         nAhJ9QQF0Zy6s8Gs6xZ3LVcU5pgAIaUAN6YeyVkbJz7lKXDtfiLzg/DzXXD5hsC8yufC
         KB97ZKYj3yRaI6GLQJRiM7jfG0yHoN5YU6TTsudeDsBN03+tlxc7LDZQY03qtOTTH/nk
         k5sy9MssxLjKkpZ9/U6ZIBOqVQ16d5+iXkCvLqGuMIq4XUkt2PFqSaKeWSFQOKXfErKm
         pfmf55BNxWbccHeA5LdyWqRjSCfkcFqFmNI6VkGiILXBUqIWTqvTc1b+CpEm2SaOlIJr
         1T/w==
X-Forwarded-Encrypted: i=1; AJvYcCUshZ/VJo0fTln3YEDRmvPImOxGj/cEwSDv0cAjZ8gisRjEQPZi/B8aaRgijoACYgWqXLmORodSAlAsIAQ7OpkoxQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyf1E7eCn9apqeclOAna6oM5FIAktiXHKYHIP8Xqhk5FzcGnzFC
	3ZCBqPD2gYEJP7HnCUX0p3GMJGFDBv6PNuC89rg5YSMpDfhASMAZpO1AxKTzDbo=
X-Gm-Gg: ASbGncsSErxXSuPKnby6BMXiDVb1HJEnylOBBl40sb23pRfl0wRLYNgvXS3hJ1btdH5
	UZk7n7AJOTTDHFDVcgDNNMqy8m0cYtXhbwEjouHI4N6Wx03wcJESRqdhXzXR0KMwHTwxs+xB9ak
	Eolp2Q+Rl2NgPVce0TLzdUYzun38w1Io69N/WqTtelLmoUZ2hBRThvnXfda1Hxfj72pib5gBW4J
	KG9+PYcOTeSJUdxXrlZ6hJrHLHP70XJ1LsWDbjm3EUeAkZEGmxQ4sbQAvuUAKQMHys+R0cgZXd3
	+X9GsPSXAN3QpjVxmA48Br7pk9vPuucpW3/K9TzgKsaJ6Cwylkc0qK652caRjAoQjN5r3ZM+I/i
	+ovasw8b1S0iejoQ=
X-Google-Smtp-Source: AGHT+IGJbyCBXQN2fE1JKZRZqSocbKAD54wmxuEBbD31z6ulxHyjTaSTO8MwuNwRuyQd+FrI3lhOYA==
X-Received: by 2002:a5d:5985:0:b0:390:eb32:3fc1 with SMTP id ffacd0b85a97d-390ec7d1e4bmr2175103f8f.27.1740739841883;
        Fri, 28 Feb 2025 02:50:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ddc:363e:e14c:9394? ([2001:8b0:aba:5f3c:6ddc:363e:e14c:9394])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795962sm5018837f8f.13.2025.02.28.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:50:41 -0800 (PST)
Message-ID: <6f23591757291b5bdeea36d6bf630c121e188db3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Sommer <joerg.sommer@navimatix.de>, Changqing Li
	 <changqing.li@windriver.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2025 10:50:40 +0000
In-Reply-To: <m4tm2mjs6iachotge62hejkid5f3s3lrent32i4gwhruzpahqr@42nnjjo6ag2k>
References: <20250220035724.1460062-1-changqing.li@windriver.com>
	 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
	 <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
	 <sozxs6figgef2mhn3bkcr2z7vy3u3idrrq4gkgzmxbibiiih4t@aoqiqffittgi>
	 <d20d233c-08c0-490b-927a-fbfc6d4d2383@windriver.com>
	 <vzy63llcnvkkp3tdkfj3eowkphcww7bi6ha4jfljw7pfskezw7@r27s535jwhl7>
	 <48f11c6288db844ec985daf20f34e92974519e82.camel@linuxfoundation.org>
	 <m4tm2mjs6iachotge62hejkid5f3s3lrent32i4gwhruzpahqr@42nnjjo6ag2k>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 10:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212058

On Fri, 2025-02-28 at 11:35 +0100, J=C3=B6rg Sommer wrote:
> Richard Purdie schrieb am Fr 28. Feb, 10:20 (+0000):
> > DISTRO_FEATURES are high level policy controls, not "this should be
> > included or excluded" controls. For example "pam" controls whether the
> > access control modules are configured/used, not whether libpam is or is
> > not included.
>=20
> But it controls if other packages (e.g. systemd) enable pam support or no=
t.
> The same goes with ldconfig: Should ldconfig support in the packages be
> enabled (which would pull-in ldconfig as dependency).
>=20
> > For ldconfig, as I remember, the distro config was about whether to
> > include "ldconfig" calls after installing libraries and whether to use =
the
> > ld cache.
>=20
> If the feature is only about enabling code in the postinst script, than w=
e
> should find a better description of the feature

I think the description needs improving and I think we'd take patches
to do that.

> > ldconfig: Include support for ldconfig and ld.so.conf on the target.
>=20
> https://docs.yoctoproject.org/ref-manual/features.html
>=20
> > Packages being installed or not is an image level decision, not distro
> > level.
>=20
> Yes, that's also my understanding. But enabling some features (e.g. x11
> support) leads to recipes set DEPENDS on libs and this leads to the
> installation of some packages. So DISTRO_FEATURES influence indirectly wh=
at
> gets into the image.

The key word is indirectly. Where things have a hard dependency on
something, they do include that dependency and it isn't conditional on
a distro feature.

In this case, the usage is tangential to what the DISTRO_FEATURE was
designed for (ld cache). I do agree ldconfig is optional so RRECOMMENDS
seems better than a hard RDEPENDS though.

> > In this case, perhaps we should drop the RDEPENDS to a RRECOMMENDS?
>=20
> This would be helpful to remove ldconfig, if django is installed.
>=20
> But the main question is still open: Why should I want ldconfig and remov=
e
> it from DISTRO_FEATURES? What is this use case?

It is being used to control whether the ld cache is being used or not.
That has to be done at a distro wide policy level.=C2=A0Whether ldconfig
makes it into the image or not is an indirect effect.

We can control the inclusion of ldconfig for ctypes at a package/image
level, it isn't a distro config level issue.

Cheers,

Richard



