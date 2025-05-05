Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806E1C369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 07:19:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.44727.1746429549489922975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 00:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H9TeYfsm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3130156f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746429547; x=1747034347; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iaE1Ie5P2OlupUqUQbDbQtm6xeWs+3MPDPaAFnc82S4=;
        b=H9TeYfsmdZhyrVoV0bPYsEgZofXnJmyqrzR9YqcXKQknW+y38n2oEAl/+u78wECHwU
         kiB+50tSThwlmebFQK5dmOMUoWmm5asFsGYIq9YvTBayySKw89Tec4sH1L2GLrufB8Ii
         wc46hVTovg550aJowTGzTwogHhF5oVFCpw7SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429547; x=1747034347;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iaE1Ie5P2OlupUqUQbDbQtm6xeWs+3MPDPaAFnc82S4=;
        b=AwDjGkbDq6L1SvDXxNwZMsEJKrxl+sDL78hQd0gdRHkIKvUk+GO5b4UvUmyXn0BuFc
         CnwHYXC2Mtd8qLophrjoUd1AeKLwvvaU+h566JPU6DYRqC+lQI7FQz/DDQ6OBsXwozvI
         lQ+/dgancM8AyEZarSZB1hGoA6J+n65EbiGzijEfAR1gHiYdoIfD7d040od7ygbr+Ywy
         ye51HqLEmK6YrDG6vMfstPluvGSONqCOS/htegNO8uCeYRJ2Ztwi2ixZeccpfjQodxA4
         1JBMaFXcaX5KTdGKV4OJ2EqUjz5/i1tTpXGpbADD6bNg1wXM1vd3Vv9pmTq77GYPkCwC
         rm5g==
X-Forwarded-Encrypted: i=1; AJvYcCUPYEo0rII6iM84+rHSDNZYgDWwefFWF5sBIws6hhMBlj1xvmPixZ+zHExLLXp5Jk65tFhnEqpdCGJ1QCryxvte3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlO8QLumjIQHMW3Ll0KkSgUrhW4K+6Hcbn/xgyWjH9Igj6P6mt
	bc6jpYBG1Q4LNsGsIQjvhy1Pf9ex6rJNXGi2+ObD27FvEj/c840+yps8oqBmY6s=
X-Gm-Gg: ASbGncsmFE8+tF5eVyLKX9KRTKhPVADSD8XobLo76hL3K46QWkSzddMtQCYORIugAyr
	MtNmZddg1WXexreYzA2VdWUOZ+ql3nhUXmd3E5kJYrfARrJySuuyDJo6oRb+hG/8SEFzOqah/Km
	fvdSSDQocb71Hn2e8yz755RRHVg2ury1jBy2f1q9OaHX8v8xAfUJ3l00VCX0aPzpew7D4EkoHjO
	ce73a6v/scGJ09NxDHepBNwVkNTNmLY/9JSw5F0/XPQUy6xjyWq627Tf/n5RJ4ho8XVna/k0Cm6
	hEctd3GPHCaXagR4ub58y8Gwcu1diDLC434f1FDVL33oU6dRr4a2xhAo2IpJAI90lR6jXcpCQt+
	b/68cZF1BwJf54Pg49vHIYsRL+SXL9w==
X-Google-Smtp-Source: AGHT+IF9YrNCkTuBGWhvSUN0iWP5uWSwOBTAa5cVMAA7pXN4glblLiQwO7PuI0hNltTqKJ1NPpJUpg==
X-Received: by 2002:a5d:64e7:0:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-3a09fdd7c7cmr5059321f8f.56.1746429547403;
        Mon, 05 May 2025 00:19:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4146:97bc:575c:a2f9? ([2001:8b0:aba:5f3c:4146:97bc:575c:a2f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0d2csm9307442f8f.2.2025.05.05.00.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:19:06 -0700 (PDT)
Message-ID: <9009f5670b6b8062258097aecbd1f7656b0b9381.camel@linuxfoundation.org>
Subject: Re: [PATCH 08/20] kernel-fit-image.bbclass: add a new FIT image
 implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "marex@denx.de" <marex@denx.de>, "l.anderweit@phytec.de"	
 <l.anderweit@phytec.de>, "ross.burton@arm.com" <ross.burton@arm.com>, 
 "bruce.ashfield@gmail.com"	 <bruce.ashfield@gmail.com>,
 "rogerio.borin@toradex.com"	 <rogerio.borin@toradex.com>,
 "sean.anderson@seco.com" <sean.anderson@seco.com>, 
 "m.felsch@pengutronix.de"	 <m.felsch@pengutronix.de>, "ejo@pengutronix.de"
 <ejo@pengutronix.de>
Date: Mon, 05 May 2025 08:19:05 +0100
In-Reply-To: <3f9eebe18f951e6325c1c2acad1dcde0ceb5312f.camel@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
			 <20250504130507.717954-8-adrian.freihofer@siemens.com>
		 <764880c5403b06cc31af471249e7131cc78ee9a3.camel@linuxfoundation.org>
	 <3f9eebe18f951e6325c1c2acad1dcde0ceb5312f.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 07:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215990

On Sun, 2025-05-04 at 21:39 +0000, Freihofer, Adrian wrote:
> On Sun, 2025-05-04 at 18:21 +0100, Richard Purdie wrote:
> > On Sun, 2025-05-04 at 15:04 +0200, AdrianF wrote:
> > > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> > >=20
> > > This new recipe and the new kernel-fit-image.bbclass are intended
> > > to
> > > become the successor of the kernel-fitimage.bbclass.
> > >=20
> > > This recipe is an alternative implementation of what the
> > > kernel-fitimage.bbclass provides. Instead of injecting the FIT
> > > image
> > > related build steps into the kernel recipe, the new recipe takes
> > > the
> > > kernel artifacts from the kernel recipe and creates the FIT image
> > > as a
> > > independent task.
> > >=20
> > > This solves some basic problems:
> > > * sstate does not work well when a fitImage contains an initramfs.
> > > The
> > > =C2=A0 kernel is rebuilt from scratch if the build runs from an empty
> > > TMPDIR.
> > > * A fitImage kernel is not available as a package, but all other
> > > kernel
> > > =C2=A0 image types are.
> > > * The task dependencies in the kernel are very complex and
> > > difficult to
> > > =C2=A0 debug if something goes wrong. As a separate, downstream recip=
e,
> > > this
> > > =C2=A0 is now much easier.
> > >=20
> > > The long storry about this issue is here:
> > > [YOCTO #12912]
> > >=20
> > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > Since the autobuilder is quiet, I put this in for testing. Two
> > failures
> > so far, both due to world builds:
> >=20
> Thank you!
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/1521
> >=20
> > I suspect this should have an EXCLUDE_FROM_WORLD so it doesn't get
> > pulled in unless configured?
>=20
> bitbake linux-yocto-fitimage
> works with the default build configuration. So my guess is that also
> bitbake world should work.
>=20
> The failing build configuration seems to use this multiconfig fragment:
> https://web.git.yoctoproject.org/poky/tree/meta/conf/fragments/yocto-auto=
builder/multilib-x86-lib32.conf
> which brings us to
> =C2=A0 bitbake lib32-linux-yocto-fitimage
> which looks like something which cannot work to me.
>=20
> It is unclear what the correct exclusion should be. Ideally,
> linux-yocto-fitimage should build with the default configuration but
> not when using `multilib-x86-lib32.conf`.

I hadn't looked into the failure in detail but this explains why some
world builds were ok and some were not. It sounds like we want to
exclude it from multilib extensions. There is a variable listing these,
much as I dislike doing so:

conf/multilib.conf:NON_MULTILIB_RECIPES =3D "grub grub-efi make-mod-scripts=
 ovmf u-boot gcc-source llvm-project-source"

There is also a second issue on ubuntu 20.04 systems using buildtools:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1591
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1478

Some of the failures are network/server problems but:

fitimage.FitImagePyTests.test_fitimage_py_generate_keys_one: FAILED (0.20s)
2025-05-04 20:11:24,809 - oe-selftest - INFO - RESULTS - fitimage.FitImageP=
yTests.test_fitimage_py_generate_keys_two: FAILED (0.11s)

look related to this series. It looks like we're calling openssl
without the right environment variables set.

Those 20.04 systems have buildtools installed on them.

Cheers,

Richard

