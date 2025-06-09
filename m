Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A51C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:50:04 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.55553.1749462599081860597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GHUmw2Q0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3486326f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749462597; x=1750067397; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZkTFtYdTKRbKxJXtOt8iJ59UwCL0weMjUZpIvkJDbg=;
        b=GHUmw2Q0zVhugmA0Szbcq7ZR9860vjQWKRNLQ5rGPysCymkw1tqdZ/MuVk/CgoIKhB
         Bn9V0Bv2ZTSSrFRgEVNNUQoEgpyRRDGBVX4zbZZu4IKLqNawwoAPwcv5I3DVPj7QfugZ
         YAKlxVI5yeDEUGZXgL+t1LfD9zALtoS28QfPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749462597; x=1750067397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZkTFtYdTKRbKxJXtOt8iJ59UwCL0weMjUZpIvkJDbg=;
        b=bcj6PcbB7MlBDw3WfKGwQJHI5NVRoKKp4RjFycA4RpXD8mW9Q6BsxeN3RutSA7IBx4
         zW6ty3+m7V8Dt9oAGQYKXnXeR3nf/7oVWGjinMlOBq25zeHY32AgMNtu34VVlcragq/g
         ht5iz/u1rRS23l6e3NmsikBVlyPH90I45urRswpuxqXeRUngJ6xB70jXiyyNCzydKvTu
         UdOHGw3o75rWM6xLgZXkc2nCZR5Isy1y18qkEIpyP6dLxYZefC+NKtyn2wfH0NPN7rKJ
         a7xsl+CuQoAVIcwI9TI2IrVXQ38sXW3ly7kD8kKZfi0D+9l0SUuk2OsZxbY9hBCvjfk9
         hTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6PxOIT5NH95Si+zFeqSs/80xJ9q7VEIb5cQ2ZXs/oPAG6qWpSc8UuXmgc+JP2Wp82wjfnJMpSPnjCv5FJ1DuXhA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwmMou7XYpyfO9fCBUpw2DJ5LfrJJ6zZH5DFEiKJKOX04gQVPAE
	h/wOhVH9YC6s9aUTgb++E5ym5UgG08/Yy6bzjZMLSxNDimxma+/kPst+wuujXTboMNI=
X-Gm-Gg: ASbGnctWER2/wX7b+GiwY6YYBP2OxJfb/75hCht8Jf9XlUM2EcfSzAkFxW/3ProI2Dq
	RdOQLENGRLkPx+Ppsl25pG92W/dg9qfoXINmWr/gbUGOFMvFtrDtpICmdBxzu1/YzRzEzJDHv4x
	WZu5NewpZIBYJQ0NCHDUnIuB3sV+DKjCXdJA3VtRn7AEVMOv9MLXWY3Q3EwbiUBE8+xrdzJDj0G
	UHN1LCfq4MvbHlbt8Ymid1Xb1oBUEtaiz650FwZ9dwHGulonjnIXpjnQF79LxP+lxqFZk5H7C64
	f5ZPGkdulUVX4diiZQcrPTgm35IPK5JqR1gZfiJa2r428Z+m6afG0opMiBvWWWTDowtJpxExZJY
	vQubWiSCIi/x0pa1w/NHAAv3aIxJ6SMKSxNQKPX6Gxkrcww0gVzTzEAYi+OTGmA==
X-Google-Smtp-Source: AGHT+IFaHnA0uqkKR+dtw3IZ+S0jf8TfSSxArF7biyf0Kug3iUusSyXx2zPhyRGHJkrUZJsf+Hhvxg==
X-Received: by 2002:a05:6000:40de:b0:3a4:f52d:8b11 with SMTP id ffacd0b85a97d-3a531ca7f9dmr9598645f8f.20.1749462596938;
        Mon, 09 Jun 2025 02:49:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f? ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c6a33sm102741035e9.28.2025.06.09.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:49:56 -0700 (PDT)
Message-ID: <f26b3589c67f2e35798abaae7dbc8dffb86731c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] libtheora: upgrade 1.1.1 -> 1.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 09 Jun 2025 10:49:54 +0100
In-Reply-To: <20250607123925.452937-1-skandigraun@gmail.com>
References: <20250607123925.452937-1-skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218248

On Sat, 2025-06-07 at 14:39 +0200, Gyorgy Sarvari via lists.openembedded.or=
g wrote:
> Drop no-docs.patch, and use "--disable-doc" configuration instead.
> Drop autoreconf.patch, because it is included in the release.
>=20
> Add 0001-add-missing-files.patch to mitigate a release issue, which
> caused some files to be missing from the tarball.
>=20
> Major changes:
> =C2=A0 - New 'ptalarbvorm' encoder
> =C2=A0 - New th_encode_ctl option for copying configuration from an exist=
ing
> =C2=A0=C2=A0=C2=A0 setup header, useful for splicing streams.
> =C2=A0 - Added support for RISC OS.
> =C2=A0 - Improved ARM support.
> =C2=A0 - Various speed, bug fixes and code quality improvements.
>=20
> See CHANGES file for full changelog.
>=20
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>=20
> Changes in v2:
> - Add a patch to mitigate a release bug: https://gitlab.xiph.org/xiph/the=
ora/-/issues/2338
> =C2=A0 Some 32-bit arm related files are missing from the tarball, causin=
g the
> =C2=A0 build to fail on this arch (when assembly optimization is also ena=
bled, which is the default).
> - Remove no-docs.patch, and instead add "--disable-doc" configuration
> =C2=A0 option, which is a new option that was introduced in this release.
>=20
> Link to v1: https://lore.kernel.org/openembedded-core/20250606114337.6112=
99-1-skandigraun@gmail.com

This looks much better than v1 but there was still:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/1650

Cheers,

Richard

