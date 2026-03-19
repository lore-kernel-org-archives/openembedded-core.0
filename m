Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D58108E1DA
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:26:06 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7883.1773915959243045836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y8pHpBLG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b44c0bcdbso433723f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773915957; x=1774520757; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SDEOUsGiWydhWgPEpiK1vjwYNPP/v7FHIPzNOGMPnkE=;
        b=Y8pHpBLGzhOqmIGMfkoTcaPrP5HIS9PO2wRVEzYbcGD+AZ6iOFCcg3S4jJZz0f/XNI
         BJ8bO4trrahXyEhdTCNIsltMTdoVSJlF+jhex+oZbNYUgs2NGgjZrNEZo+L30duq305S
         7OnL+RuApg0tO48NiFQLHGT9myARLaxf1r4Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915957; x=1774520757;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDEOUsGiWydhWgPEpiK1vjwYNPP/v7FHIPzNOGMPnkE=;
        b=dVCxgfVjzXJPtoLX//uCdrpnSxEixovgH1Pe2B6bJD2n+5I2QMdrVTMbQZstfT1332
         Sc6+ZRS/lQKsfuS7YiACJPKA5fQ+y14LilZcCEwjcRhwm9nhUZ8kSgnM2XCLn1yHxEcz
         TsJ94JfsMnSwO5IflGEmrcHS6FOqoDT6siXgRh9F039VfM+OY26srOfqSqqOWeX+C1JA
         Gr7RtEOiifBkQIesvBUDmsTHwLAa4TlgRGvWgmzL4ZA48HtSWr6GHTXAHSyZf6K28kkD
         E4QU3bChFbAnSVWr8KOwHJgoGfJ8BWti0sMaUXg9By4/sutk/6veAC+FXYyGlNu2OIU1
         m/bg==
X-Forwarded-Encrypted: i=1; AJvYcCVTrzezrYnX/1O5dYWT3k8K9a2o+hWXnnUqftPb57abQ5lIyValAx96EbfA9voVl9gICWx5lAYy5WYZY4b+xNDNcw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJgSIb676Clt1ELbZcNq/pqn5M8qRhm+E07mYPWaM8NApJtTDm
	Sc9ThN723M8vhdMpFZgeA+53dUPndkh0Ms268N/wHRlw7zYGXE9FqWVsPGMe2qWo/X4=
X-Gm-Gg: ATEYQzzuNkuIzlhSTQRr7e06IYBQDXBS8zq8zliAXp/AaF18uNjh462P2ohyVQw4Tuv
	HJfYfW1IO2wkL39La1Qpxaz94sfxtt6Tsp5PXA3l2lY3850NBeYKEERUaRsaaGf+0btw8BiHVW2
	kXzK5A6mSjQgNv/etdie926j12gqTrmvdgMG/Ek+3uRGxyDVEzfa23wEebabRWU7B7TtIzZze/f
	dJY6CT1SXls3GhVb6PLx8Z1qdx6GXN4RSoEPYJajRyNAUK0R2NlYxhjFpOk8R9uAUVgw7dihdgx
	Qgw9uvgJoB012Jo4LWv1S85XO/kIGYSE6QrgPEBsmA8VcnV6utzhALLz+ry6daX8p3CnxK4hEOp
	RAOqhqYqrMIB9plf2TphnguQGt1gKAqNhqK2xqiJk3mN7SOhpGp0wGdTxNB3HR6av/tvsNi7mtl
	2ULYO0LI3B5YFTJrawgRCIE+bZi0nUb20iuoNJDx6A9GaxYX5CjBQEiTlYAtyAFDxSr8gb12KbD
	5XAcDO/+k4XdXA=
X-Received: by 2002:a05:6000:26c9:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-43b527a0927mr11584138f8f.6.1773915957333;
        Thu, 19 Mar 2026 03:25:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ff93:3918:cd96:9fb9? ([2001:8b0:aba:5f3c:ff93:3918:cd96:9fb9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892244sm16578487f8f.22.2026.03.19.03.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 03:25:56 -0700 (PDT)
Message-ID: <b737115c14c6b0a35e227699d6b7437057535fca.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v9 3/7] spdx30: Add ecosystem-specific PURL
 generation via bbclasses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: stondo@gmail.com, openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, Stefano Tondo <stefano.tondo.ext@siemens.com>
Date: Thu, 19 Mar 2026 10:25:56 +0000
In-Reply-To: <20260312153845.164369-4-stondo@gmail.com>
References: <20260309132854.128375-1-stondo@gmail.com>
	 <20260312153845.164369-1-stondo@gmail.com>
	 <20260312153845.164369-4-stondo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233511

On Thu, 2026-03-12 at 16:38 +0100, Stefano Tondo via lists.openembedded.org=
 wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>=20
> Have each ecosystem bbclass set its own Package URL by prepending to
> SPDX_PACKAGE_URLS, rather than detecting inherited classes from the
> SPDX code. This follows the principle that each class should know how
> to describe itself.
>=20
> The following bbclasses now generate ecosystem PURLs:
> =C2=A0 - pypi.bbclass:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pk=
g:pypi/<normalized-name>@PV
> =C2=A0 - npm.bbclass:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pkg:npm/<name>@PV
> =C2=A0 - cargo_common.bbclass: pkg:cargo/<name>@PV
> =C2=A0 - go-mod.bbclass:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkg:golang/<=
GO_IMPORT>@PV
> =C2=A0 - cpan.bbclass:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pk=
g:cpan/<name>@PV
>=20
> Additional ecosystems (nuget, maven, dotnet) can follow the same
> pattern in their respective layers.
>=20
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
> =C2=A0meta/classes-recipe/cargo_common.bbclass |=C2=A0 3 +++
> =C2=A0meta/classes-recipe/cpan.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 11 +++++++++++
> =C2=A0meta/classes-recipe/go-mod.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 +++
> =C2=A0meta/classes-recipe/npm.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
> =C2=A0meta/classes-recipe/pypi.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A05 files changed, 27 insertions(+)
>=20
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
> index bc44ad7918..e884b344ef 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -240,3 +240,6 @@ EXPORT_FUNCTIONS do_configure
> =C2=A0# https://github.com/rust-lang/libc/issues/3223
> =C2=A0# https://github.com/rust-lang/libc/pull/3175
> =C2=A0INSANE_SKIP:append =3D " 32bit-time"
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS:prepend =3D "pkg:cargo/${BPN}@${PV} "

Rather than using :prepend, can we just use the =3D+/+=3D operators here?

I understand that does introduce ordering constraints but those should
already be handled with spdx being on by default.

Cheers,

Richard


