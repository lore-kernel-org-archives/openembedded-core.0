Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF48C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:18:18 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.16984.1748441892365121444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nnv/q3X+;
 spf=pass (domain: konsulko.com, ip: 209.85.210.51, mailfrom: trini@konsulko.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72bd5f25ea6so1061852a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748441891; x=1749046691; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D6xzMSY/SiD0kWQ634Gn59Bf0FyGJEfEDdz5COwyku8=;
        b=nnv/q3X+vCvzS5/5jvR96kpIEbTtDQQ6pfWJlWvIlFXK4eQIgu3llnVbI7myusMExa
         5EK9t4bId2FWvAV7OH7VdBM0rLV9FNHxTkW6DAoZmwTyQ1+rf5aexniENMh4FQW75HGX
         oMiGUPBEiZhG0IutLp7QA4WK7DnsiJYgA6oZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441891; x=1749046691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6xzMSY/SiD0kWQ634Gn59Bf0FyGJEfEDdz5COwyku8=;
        b=XgJfNT/RxXz+yV6MqDbE0uS79PZJS6ZLVKz9O2DoqgsKmDvwoxmVyF/tvUJv1Clr/Q
         0Kn1ua/R6Fof5ENajEmKa26oUi+bV3VBegqlCOFooHXFcDzpLJydvu5Di4myl7H5a3YZ
         fYmd4drfOGFhON98OYT+IY5gNw99jgT/BornBrpGFtNdneK6F+q4L0xDJ+pf98gINY3u
         fWnP330/SO88e8y/ACJ5y72pj55eUi8947tM6G7i6feAiMRcWZVUvyW62lr/LawBgjbr
         NSvKLIvAqsAOOZFmLsqBN37LZvcOBpHK0zFu4iVD4fgygcAg2xKkELKmEeBJO9jPrJFI
         EBmQ==
X-Gm-Message-State: AOJu0YyE9bPpNgI4nAQPVeTllR/1SwlGQrX98Rli1vREZiB/eZVVHaNz
	2AT//mXylkCHBcDRrd5sXb13hId3En7MSm6FGDbrhITDZAou4eX6bOrVuWv9RQqZgSHXi46873V
	FerNI1gA=
X-Gm-Gg: ASbGncuJY6ABz7ww6jHFHEhCIaRAYm5dMv2SqtgGMuTQG2scXoyXYrm3JsjbBEdWZ/8
	TNvWOBY8rvLzhx3pLC+sQAAHI721mftNMsvmdIe+lpoaPUodbcOqOuUMLDigqq7+b7sk1qXtZcq
	1W6WLfqpdVLNx4vwWUCcH8jnRyBn2fa7X1p/ZO2AEdWDkc0389vepYcLJdV0LBrB5bRC/R+GDv8
	lSyrg/dt+HpxLBLXXRBTCqQrIZuvDqU8GdW25s8J3J3x+DEYRuWJwbNaPC8pNKu/THXH1sLzSgU
	EjWBn9bG8TlLQn3a/LE8Y7o75N+EuFR5LdZVYuRcQY6f/MEoAw7m9OZ48kfzul404H5uYoGeS1Y
	t9FblOBNeOhSM
X-Google-Smtp-Source: AGHT+IF/dyRD6IByM1TS14YtEwckfYkI/NKcaecKWcJeJ7UiopNNaBlQRthPzZsi7e1c/CPsHpmSPA==
X-Received: by 2002:a05:6830:f90:b0:72c:3289:ab9e with SMTP id 46e09a7af769-7355d12e5a7mr11451865a34.27.1748441891517;
        Wed, 28 May 2025 07:18:11 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net. [189.203.100.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735a1cc03cbsm190079a34.43.2025.05.28.07.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:18:10 -0700 (PDT)
Date: Wed, 28 May 2025 08:18:08 -0600
From: Tom Rini <trini@konsulko.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH v4 1/4] u-boot: disable CONFIG_BLOBLIST on genericarm64
 and qemuarm64
Message-ID: <20250528141808.GU100073@bill-the-cat>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
 <20250528005133.GP100073@bill-the-cat>
 <aDav-wwUJUIGGFVI@nuoska>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zV4kwB51pKy931YP"
Content-Disposition: inline
In-Reply-To: <aDav-wwUJUIGGFVI@nuoska>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217351


--zV4kwB51pKy931YP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 09:40:59AM +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, May 27, 2025 at 06:51:33PM -0600, Tom Rini wrote:
> > On Mon, May 26, 2025 at 11:35:44AM +0300, Mikko Rapeli wrote:
> >=20
> > > Booting u-boot on qemu with kvm is currently hanging on aarch64
> > > build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
> > > disabled as a workaround.
> > >=20
> > > To reproduce, build on kvm enabled host where "kvm-ok"
> > > succeeds. For example genericarm64 machine and core-image-base
> > > should then boot with:
> > >=20
> > > $ runqemu slirp nographic novga snapshot kvm
> > >=20
> > > On qemuarm64, default kvm setup will boot directly to kernel
> > > and is not affected by this. If build enables u-boot as bios
> > > then the same issue happens.
> > >=20
> > > Without this config workaround, the boot hangs without
> > > any messages in qemu output but ctrl-a-c to qemu console
> > > can shutdown the emulated machine.
> > >=20
> > > This seems to have regressed after u-boot 2025.04 update.
> > > KVM boot can be detected from speed, for example genericarm64
> > > boots in 550 ms with KVM and without in over 5 seconds.
> > >=20
> > > Fixes: [YOCTO #15872]
> > >=20
> > > Upstream u-boot discussion:
> > > https://lists.denx.de/pipermail/u-boot/2025-May/590101.html
> > >=20
> > > Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >=20
> > I think it's a tad early to disable this. On the U-Boot side, it's being
> > looked in to. In fact, you're saying v2025.04 is working (current
> > release) and v2025.07-rcX is failing. At this point in the U-Boot cycle
> > I think we'll figure out the problem and fix it. If we can't figure out
> > how to keep all the use cases working for v2025.07 then disabling
> > BLOBLIST here in OE can be thought on, I would expect. Thanks.
>=20
> 2025.04 is affected by this. My wording for this is not accurate enough, =
sorry.

Do you have a known good version where it does work? I assume it's
v2025.01 that does work, and an OE-specific revert of commit
53d5a221632e ("emulation: Use bloblist to hold tables") with appropriate
status tags about it being discussed upstream would make the most sense.

--=20
Tom

--zV4kwB51pKy931YP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmg3GyAACgkQFHw5/5Y0
tyxQXQv+N1HGyDNI2VoFgAgjVNUOdniuboM0FiHVAFKx8EAssGlocWFI0o9BKB0C
vnY+QBKot9IZug2KjDuO80GzMCIvuiv/v1PoMEWfdphz9vuS305kuxvqITRtnVhh
bFy0og9dXZkaZcD2LD7nB0WXizjc+vAtyox/UyhCI7fuwOda02T57AKQktYYWcxa
oh+jlimvRi0zo2cezS2UpA/IVnglUCqGEnEMp8FU1gOsfRUW0PEjQ9nMHf8ukBqO
2AHVDTCj6hV0+68G6jyy+slPjpZN1y+GiODlkbdpwfISNP+7T52CG59QCSc3ff28
OCWDZREpauAwBWSWrdMK0EERes6PRjl3fT6PXFrOa+PdcMrCCFym90WwBU1Ly0+W
2U8s7FZy2Mm75On7p0wtwsLPOr9dyJb7bC6gY2WXVZeSLfC9r34msQTyCeZp1PRZ
6yTE+tEXTSRLeVVchr+gUYgZe4/TdFgQlxkneWVyF/1iF85KHTSgRwZ+zJZZAFHd
TOpjJZo4
=BKUq
-----END PGP SIGNATURE-----

--zV4kwB51pKy931YP--

