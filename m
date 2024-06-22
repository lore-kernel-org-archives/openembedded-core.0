Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5805CC27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 08:10:56 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.93491.1719043849964621167
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 01:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KS99ZHKb;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so37706181fa.2;
        Sat, 22 Jun 2024 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719043847; x=1719648647; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbj/InpxG5WG7BWFLCu/9rDM2Rn0hUdyP3qBsjXF2ZM=;
        b=KS99ZHKbHZYhWd2+JBSPdDu5Feoy2GAkEgrKmzrqViVfTWBp6xpU8VX119EPUfi3gg
         jCPYqOEKNpInwVCbiQtR6S6ndIrRnCxVO6AXZyTJx+A7HpMBrUuakmVi+kTxTqVNkVaD
         cAsE6t/Hk47W6L7OW4TUKdzJxuz4rGMvR+MZWoBTYbfuuytex+TnhhFj8Xa8tEz9gevj
         PHWDuApKdoI2UThE27t2chiuXmmi+zVltFML6tKyPquCLk3VvOaPPauWa4ug12KO6m9a
         TcJauivT2qhDvD0FhPDMbsCeWI3AzkYcq3hvbl7h+SrFElMWvetadNGUhYEaWoxQUmrq
         qEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719043847; x=1719648647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rbj/InpxG5WG7BWFLCu/9rDM2Rn0hUdyP3qBsjXF2ZM=;
        b=WKcFpN2runrqOtD4/Gzerq/qSeaV7zonL0Nk4UDeqTJIrZ3RCapdl/2UcDxV1kOLd+
         jUqK0rrcNp6xHNVy2D6O5o7fSzUkc1QwczMga3cwonFRqmBWgICqXulb9ciUCPQyE/Hd
         oq4uvqIONr0KXUCz+eoJFX57fJ7RM+N2VScZLqvhgdKRYwRykOBlgh1zzXmhwt5ADEGA
         Tqg96Ol51kNJoAPtRPRFarVGgNrYFXaNKLKh6MhC+jLirIzVGpYMZ3na0Lf1SDiQNxLB
         +S0RaEeVT9alL/cfhkgpwnvYQfcbE8ULIQarYl6+jX/WVjDW/Raq9UTl+QyM/QD2eMAt
         9NKw==
X-Gm-Message-State: AOJu0YyQdjrffIKTT7u8VfLnrTGrbPfyBEzymfDsOKeSmOz9E8rekMGs
	MGwyogUbWKFL5rjDNOq0uvXkhbW5GcsDL3N9flDf1ZBqZ0EFIMQnSoJTqA==
X-Google-Smtp-Source: AGHT+IEjotX0hhy0QH9/s1bsRWtzUrLcuMbVfkxgYEKk6BYZK6jJ6QFIZTsxN5AxhCn8hh42y5pdyw==
X-Received: by 2002:a05:6512:b1d:b0:52c:df9b:9fc6 with SMTP id 2adb3069b0e04-52cdf9b9fe3mr342613e87.32.1719043847003;
        Sat, 22 Jun 2024 01:10:47 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd810d633sm387139e87.165.2024.06.22.01.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 01:10:46 -0700 (PDT)
Date: Sat, 22 Jun 2024 10:16:59 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: "Marcus Folkesson via lists.openembedded.org" <marcus.folkesson=gmail.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>, kweihmann@outlook.com
Subject: Re: [OE-core] [PATCH v5 2/2] image-bootfiles.bbclass: new class,
 copy boot files to root filesystem
Message-ID: <ZnaIe0NiNTev-yVG@gmail.com>
References: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
 <17DA67D349FBA8A0.21660@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a2lwBgBF62lY3L9o"
Content-Disposition: inline
In-Reply-To: <17DA67D349FBA8A0.21660@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 08:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201037


--a2lwBgBF62lY3L9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 02:38:53PM +0200, Marcus Folkesson via lists.openem=
bedded.org wrote:
> image-bootfiles class copy files listed in IMAGE_BOOT_FILES
> to the IMAGE_BOOT_FILES_DIR directory of the root filesystem.
>=20
> This is useful when there is no explicit boot partition but all boot
> files should instead reside inside the root filesystem.
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Sorry, I forgot the Reviewed-by tag from v4:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

--a2lwBgBF62lY3L9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZ2iHYACgkQiIBOb1ld
UjLW4BAAyFq8Yd508s3mh6KS3ct0ssTMDO4FqLgOTxHM73Ff9dqZcYrEQl/LbIhq
zVVafj0voZxHJ/m2ud78NyrLi4q3waXwbOPKXQlqeAFigFNTFOsjH+uA6vtTHWdQ
VqD2Ar0qJ6FCxp3tU6wT5q5WuBYtbWQ4tzyVhZ9Vaqwy3bsfLrmcub9j5GkLriYb
fAvaK7yTREuVMoOgWAP0GktLnaPkTIbNY+yAxIuXFp7UBMno5hAq2jHBUH1WP+XN
Nxy29SOk3Ib6b1J30T+F23HztfPX/CIEoj8GAV49rj6yj2ldaFHbee5+mVHQnGAR
bN+C+hmsnF+B4lMhGVoeeKiOXdUcczJRWqkItPmukwR/OU9Pztr2MnTnVSkfVpfx
MH4f3pkXqZOYlPGnvRlb7AFcZmupiG5mtrVjYkh0KqTXBE/Of6ER+yvtAkNWVkq/
FQvghQSDcsOPoteIMDTylNjswRoQT/5PmaTS39TrE3Bw00Y/glBYQCy6JATwkUWI
45KIqpvNScfhVzv3088Lw9oey6JsSKUx5ypNGm6NNVziKnObvVV7nnTC+aXaE7E1
FudNffNPu+KsFvmKm/AbEjSpXSNdvaT0IR6A1N6OUdNXoDrsf0IcddVnrsMEK3dn
+HJm7mjvUbqKYo3qBvSSZYC+fHjeZTpNNrJuqfcUNP2mbSTYwsA=
=n7Xj
-----END PGP SIGNATURE-----

--a2lwBgBF62lY3L9o--

