Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBBDC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:35:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.22107.1702560938829793035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CtUq3f1h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33646dbedc9so649975f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702560937; x=1703165737; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rR2Pzsln0BtN+ZQrMYNCY+Qy5i8jr1iaUJxoCo9818c=;
        b=CtUq3f1hzCkG37ujdMXzoixQm/c3ZGpEzI8Euy5EG4fKVFHdSEUkkO7RA2bgJtGfvb
         hKfIFFcczEsbFV4irQP2MxFLcHXqlKutiGtMIf9utKtKIw3lSCi/FJIbndpfjQh1xbnQ
         mI7aHSpe2SWgG5PNFW0YBUqYg1lG0x9I54f+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560937; x=1703165737;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rR2Pzsln0BtN+ZQrMYNCY+Qy5i8jr1iaUJxoCo9818c=;
        b=O00ilRDQDg9RI3sB/4qMIQTy7noGjE4NFlMGf1AIz+yOXotJVjKBuFalnmflZnLDQz
         6is1pzWIneEVyX7pdKcPj75QLuaQlf+mXPuQps+MglrI2fUkoFfMrZ8p/xND+xuQw5Cf
         e6DOb0XvaeQw4dmAtPpzBZDRznw5i4zlKfERmaua8QzMT1A3xku0pMP4GM8aAeEwjkYf
         oeCq4x5Khqz7+KTJzBzINazXZ4sZjTyOxcYNE6xB9jHflfnDft+75wLtQg19RLXfSfwG
         RKT2JSjjhPV+Xy+EjnnLQ35Al0zLQd9kkR8ehFyWCSyUcbrVACkhNgMANggh0kjuMGkD
         oRBQ==
X-Gm-Message-State: AOJu0YzA0hizNhsJZffAx0C/D2bPBM6rWN/sprUeE1nyVuYel2c55Qan
	j7rmReLc1D7JXIuxUtnaMCJz8A==
X-Google-Smtp-Source: AGHT+IEddR9bXJN5n4h6Cp88eKyH1vLrluYm306s0iVSqpmDpjVezX41/wcmB3K93jnhVx06rzpJhg==
X-Received: by 2002:a05:600c:4a9f:b0:40c:5583:c6bb with SMTP id b31-20020a05600c4a9f00b0040c5583c6bbmr2282873wmp.174.1702560937173;
        Thu, 14 Dec 2023 05:35:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d69cf000000b0033641783aeesm3852067wrw.7.2023.12.14.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:35:36 -0800 (PST)
Message-ID: <9e88162576e34bce6d698bc8ef84ce2da6e2ba1c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/9] nativesdk: ensure features don't get
 backfilled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Dec 2023 13:35:36 +0000
In-Reply-To: <812D443A-B8A1-47A9-88A7-80877EE659E7@arm.com>
References: <20231212140820.2900963-1-ross.burton@arm.com>
	 <20231212140820.2900963-2-ross.burton@arm.com>
	 <20231214074932cba7c5f3@mail.local>
	 <812D443A-B8A1-47A9-88A7-80877EE659E7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192370

On Thu, 2023-12-14 at 13:31 +0000, Ross Burton wrote:
> On 14 Dec 2023, at 07:49, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > Not obvious but this is the cause of:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/8697
>=20
> That was a fun rabbithole to dig.
>=20
> The error from the log is:
>=20
> ERROR: /home/pokybuild/yocto-worker/buildtools/build/meta/recipes-
> devtools/python/python3_3.11.5.bb: pgo cannot be enabled as there is
> no qemu-usermode support for this architecture/machine
>=20
> Which was intentional fallout: MACHINE_FEATURES don=E2=80=99t describe th=
e
> SDK so that this ever worked was more luck than judgement.  Also the
> python3 recipe will write the qemu-calling wrapper script using the
> architecture only for target builds, so we=E2=80=99ve not had PGO natives=
dk
> python since the 3.7.2 upgrade in 2019[1] which changed this from all
> builds to target only.
>=20
> Maybe we should allow machine-sdk configurations to extend
> SDK_MACHINE_FEATURES and then nativesdk can use that?  This might
> allow the MACHINE_FEATURES to =E2=80=9Cwork=E2=80=9D without being based =
on the
> target machine.

Sadly I suspect we're going to have to go down this route eventually in
some form.

> Alternatively, I can remove the pgo from the buildtools build, as it
> doesn=E2=80=99t actually do anything right now anyway.

It was a decent win at one point so that would seem sad.

Cheers,

Richard

