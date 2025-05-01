Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05772C3ABAA
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:03:43 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.1012.1746111820848126506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C44Iv1oi;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499659e669so1121575e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746111819; x=1746716619; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0HoZfiNsPTbqSE8ZcQ4IqZFnOfUQYg/yCamh1bOgRo=;
        b=C44Iv1oiAuDKn2cqkKglADfgUixKo1FnCmAyiHEJJevbK0zXERGejwDLoTAi22lg+7
         7Yn1geLFWjbT/IYjsqVKf6AXXCsQJkIrGfBzX7fM+Zeu6v/PGFRRRivkO+3IkZXNbsWh
         S5O4C5Z1sT08+YUop7E4RHQXVYH+HNnv9r9GdUyOkcBB3YqyDcksfrQqB9iKljCXJty/
         4U6+/cVR4xihYVyD6QDCk6aw+d2V1RpwTbVAzGg7cp/Q5TTFliRxK6PBrX3Ba/Dis09U
         OqPnDcZTIWilbGotW1k1ODVfOU6vBt4qSHDCN3B91vprtfC7n+A132gKaPlsXJ8OdoC0
         ppcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111819; x=1746716619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0HoZfiNsPTbqSE8ZcQ4IqZFnOfUQYg/yCamh1bOgRo=;
        b=GOm2YZBA7AtrSODgSvnIO++E4Kijjt2pfBMA05ToXRp20LxNC2A/0sUv1BPN9viG5k
         EEp32B8GyD8s1yMkwNtFkxKQjZTYw5lV03qjFt9i+1Dgjr26p/mgq1+MhIN3ugjHfD1H
         22/zxZ+x5uLD066tIPzdKyVFA7aeQhWh+YVEuQRJVWNpMS+D+yiSFaxwHY3gVfADoEda
         AIXveGX73mw54ffpV5lQXoFkjvSg2irzxbSf1VanPwsKHpg2bIHS96Pp9dLE26wZZcrJ
         FxMm/LYMQh4TezzfjIM8HIPcoOuCagGlz676O7luc5DeS5R/qXrCU6WKkZJmm0Pbdl/q
         XrzA==
X-Gm-Message-State: AOJu0YyWgZqU4YB2w/GTFU73IsPJriQlRJRzoCtPrmL/OzEVkDHz5OAc
	cVbBnrywfYleFUbEQrD3iORUf5VokY+ZgMP0EmaDcwLlRXnuHu5Bj4KB5B14+xQSb0zIkTx/K81
	qIhMPkvlAH5DMOO0hC2OV7wkEku0=
X-Gm-Gg: ASbGncuvjI3JRfScAqnw0dD1ppdvygJa/Gq+ii1b3+ozHFhdnfyPFDoGQ3viaWM9Ivg
	dNHICwAUw4GjGzyTuqfTIh+HaRx08BXRkyrqw33Pv3MuU/s1KTPVOwio9bGkMjniwwouHK58NqC
	XV6dnTPuC+u+zKNa+CrKStQV2+MePw4O1L7WWe
X-Google-Smtp-Source: AGHT+IEkqBHg092aDaIv019GZ5PJuPDHRWNSJBG2XAptLvPChTjJSYLUO5ef4IJF7u+kVGvP9LoeP2giigkQyCQx4Jc=
X-Received: by 2002:a05:651c:b24:b0:30d:e104:cb74 with SMTP id
 38308e7fff4ca-31fc40d23d4mr7495101fa.41.1746111818524; Thu, 01 May 2025
 08:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250428055717.2358310-1-hongxu.jia@windriver.com>
In-Reply-To: <20250428055717.2358310-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 1 May 2025 09:03:25 -0600
X-Gm-Features: ATxdqUEinW3PT_KbYkZDhWVBUuDXQIFG4DSfIMbxH9Oq23r2P0LXbNGvmls6e9I
Message-ID: <CAJdd5GbEKufqjBgR6q9DYBGBz1_a7pL8ds2cuDu-w7NqOo=0Dw@mail.gmail.com>
Subject: Re: [PATCH v3] spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215775

Mechanically, this change seems fine. However, I do question what you
are planning on putting into this field?

PURL is pretty well formalized, and AFAICT there isn't really a good
way to describe what we produce as a PURL. Can you provide some
context on what you are planning on putting in this field?

It might also be helpful to follow this discussion:
https://github.com/package-url/purl-spec/pull/372

On Sun, Apr 27, 2025 at 11:57=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> Define var-SPDX_PACKAGE_URL to provide software_packageUrl field [1][2]
> in SPDX 3.0 SBOM, support to override with package name
> SPDX_PACKAGE_URL:<pkgname>
>
> Currently, the format of purl is not defined in Yocto, set empty for now
> until we have a comprehensive plan for what Yocto purls look like.
> But users could customize their own purl by setting var-SPDX_PACKAGE_URL
>
> [1] https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Properties/pac=
kageUrl/
> [2] https://spdx.github.io/spdx-spec/v3.0.1/annexes/pkg-url-specification=
/
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 5 +++++
>  meta/lib/oe/spdx30_tasks.py          | 8 ++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 044517d9f72..c0a5436ad68 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -117,6 +117,11 @@ SPDX_PACKAGE_VERSION ??=3D "${PV}"
>  SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, software_packag=
eVersion \
>      in software_Package"
>
> +SPDX_PACKAGE_URL ??=3D ""
> +SPDX_PACKAGE_URL[doc] =3D "Provides a place for the SPDX data creator to=
 record \
> +the package URL string (in accordance with the Package URL specification=
) for \
> +a software Package."
> +
>  IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>  SDK_CLASSES +=3D "create-spdx-sdk-3.0"
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index ba965821f86..61d7ba45e3e 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -631,6 +631,14 @@ def create_spdx(d):
>              set_var_field("SUMMARY", spdx_package, "summary", package=3D=
package)
>              set_var_field("DESCRIPTION", spdx_package, "description", pa=
ckage=3Dpackage)
>
> +            if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SP=
DX_PACKAGE_URL"):
> +                set_var_field(
> +                    "SPDX_PACKAGE_URL",
> +                    spdx_package,
> +                    "software_packageUrl",
> +                    package=3Dpackage
> +                )
> +
>              pkg_objset.new_scoped_relationship(
>                  [oe.sbom30.get_element_link_id(build)],
>                  oe.spdx30.RelationshipType.hasOutput,
> --
> 2.34.1
>

