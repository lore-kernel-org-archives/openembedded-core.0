Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9B1C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 10:56:27 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.9550.1738752977765527405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 02:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d2yDIoa1;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e42ba364f1so14792786d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738752977; x=1739357777; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WUt/ohU7FesczeKnSAfjdHvkpN60Tab3iWdIH/gaIw=;
        b=d2yDIoa1/dyNNEm/q/BxEWp0BkcJ1ZryhHTiFPYyLWzLeIg6MH5lNoJ3Y+A5o+MzuN
         9GpXYrXWbUhxXCIOZG1TEyMqBhG8Fx5ehDe7u+2eO9Uja2Y0ZBxqnVwSsbjoWyp4hxxy
         VYL51Tb6UIELBUSvk54g6DdXQKUmXBuUsR7BZ2ivD/Pui1dx9b7cY7a4+B893iV54cCt
         vNu8mRBqc7WAmbLRMCMhWYEBYIhLdF4xMBDxKj0zG1hFDt4DfCHI0BwuHmIz0JGpjGbF
         +BC2ITQ3BJ1PzYE+np+QJfUJw0KdO1Pm16zL++9qHC4CjkvPBVt31u519IdWygqQCJ+6
         bjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738752977; x=1739357777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WUt/ohU7FesczeKnSAfjdHvkpN60Tab3iWdIH/gaIw=;
        b=E0kogIyNFDsm59mkigO8IhQW/sb/RCWP4UjI2s/SLXEt9CEyopiF10i+OuIfMZsm7t
         cXJkCm4Jxi5o4ZJ2sNLyNcqiyIx+OAF9B6dS6pw2Yq6yyJQEGqn/jrfS0Jf3BnrU/PQC
         QTOw+k0Nl+p6DScM2u5cE0YiCOQxYWozgYDsCBBcsHmYzrOUCOXI0S3K1XM2F5e6eMYL
         BfX/iA/iUw7X3yFsUshd+695T6AbmrqBPXMKlD0RGDmgHlvGTI51qiS5ScJxWTkSbcsP
         3YPY5VAmN5eZUkQ1js2idJ25Qz6I5Y+yKTkG92HuLUDMXWLOUXkeWKEeOcEwTldg4+rX
         4zwg==
X-Gm-Message-State: AOJu0YzVTgVy9p6EHaHysD31ZaAOaM6Dj6hLY2aVJajMu/vB+fZWTd0k
	HQsJAcDHRm0OZKZ1Ihxmtf1FNyeJdRSVjsnFygpX8Kb+fRwM2xstXvmHPx2884D4B6vblXgrFAG
	olwIc5/G84EmfkVH8fx1RQNoVN3Q=
X-Gm-Gg: ASbGncuKVLCShiuHkxNsE2lgPt+9P88t+hN5YQLLF2fZk7wGzq/xDlzk9cDZ9lMCBoB
	yIkUUkEYtqetUl7YdnZtU6TXhBrpr0DMld2lSn4WC0U2vajxm4MFzW7Vw5LB7cY2ZeVAcCmH+Il
	ILvsYRiMizQ+TY2BTZL8BuZ5MVNDFTd5Y=
X-Google-Smtp-Source: AGHT+IHTfeJu4O4G4BqJ7EBrLwqxgARU1c53aE4bmdNBG1xMGdx0wSitEJcRiihaHVjfavXVpVfKsQnP5IJSmt7e9rU=
X-Received: by 2002:a05:6214:f6c:b0:6d8:8256:41d4 with SMTP id
 6a1803df08f44-6e42fbacae6mr39131436d6.19.1738752976839; Wed, 05 Feb 2025
 02:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20250205043637.2649428-1-zboszor@gmail.com>
In-Reply-To: <20250205043637.2649428-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Feb 2025 11:56:05 +0100
X-Gm-Features: AWEUYZkLQq2Fa2TdaRuquDor2JXjIbAALQ4pW56sREwuxav9ktOIM8JobEFhMBk
Message-ID: <CANNYZj-t=1kCNq4UNLEnqG65n7dFBZBbNVPQYsrAXGoeb=4VMg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 1/3] rpm-sequoia: New recipe for version 1.7.0
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 10:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210841

On Wed, 5 Feb 2025 at 05:36, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com> wrote:
> Also ship a crypto policy file which is used to validate
> signing keys.
>  .../rpm-sequoia/rpm-sequoia.config            |  51 ++
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia/rpm-sequoia.config
> @@ -0,0 +1,51 @@
> +[hash_algorithms]
> +md5.collision_resistance =3D "never"
> +md5.second_preimage_resistance =3D "never"
> +sha1.collision_resistance =3D "always"
> +sha1.second_preimage_resistance =3D "always"
> +ripemd160.collision_resistance =3D "never"
> +ripemd160.second_preimage_resistance =3D "never"
> +sha224.collision_resistance =3D "always"
> +sha224.second_preimage_resistance =3D "always"
> +sha256.collision_resistance =3D "always"
> +sha256.second_preimage_resistance =3D "always"
> +sha384.collision_resistance =3D "always"
> +sha384.second_preimage_resistance =3D "always"
> +sha512.collision_resistance =3D "always"
> +sha512.second_preimage_resistance =3D "always"
> +default_disposition =3D "never"
> +
> +[symmetric_algorithms]
> +idea =3D "never"
> +tripledes =3D "never"
> +cast5 =3D "never"
> +blowfish =3D "never"
> +aes128 =3D "always"
> +aes192 =3D "never"
> +aes256 =3D "always"
> +twofish =3D "never"
> +camellia128 =3D "always"
> +camellia192 =3D "never"
> +camellia256 =3D "always"
> +default_disposition =3D "never"
> +
> +[asymmetric_algorithms]
> +rsa1024 =3D "never"
> +rsa2048 =3D "always"
> +rsa3072 =3D "always"
> +rsa4096 =3D "always"
> +dsa1024 =3D "always"
> +dsa2048 =3D "always"
> +dsa3072 =3D "always"
> +dsa4096 =3D "always"
> +nistp256 =3D "always"
> +nistp384 =3D "always"
> +nistp521 =3D "always"
> +cv25519 =3D "always"
> +elgamal1024 =3D "never"
> +elgamal2048 =3D "never"
> +elgamal3072 =3D "never"
> +elgamal4096 =3D "never"
> +brainpoolp256 =3D "never"
> +brainpoolp512 =3D "never"
> +default_disposition =3D "never"

You need to very clearly explain how this was created (or where it was
copied from), and how it should be kept up to date. Either in the file
itself, or in the recipe that includes it. Otherwise it's a 'magic
file' that no one knows how to maintain. Hardcoded lists of crypto
algorithms are notoriously prone to becoming outdated, insecure, or
both.

Alex

