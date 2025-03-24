Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2E7C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 14:56:53 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.41478.1742828212556139198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 07:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QENcw+4v;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54963160818so5367653e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742828211; x=1743433011; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIDixT0asur/f10c6R/24XDOoAgvUV9lc4c7paxmzjM=;
        b=QENcw+4vyeT3kcp17UGr5CiFefAsz7V7yIcsB/Mem8y/6uG/xsGMG0qs1rv6hsKdSX
         TVyq/0vQJzGFfkTpLStoEg8ONPODWnwrHmvyLxKZU3k4XZv2HpMBh8r/v7OWSN/yUNFt
         gcuI2XumJf4azTYV6MczcHcgwjhVRQtpB1AnJr6o02KxtQBJUKb6OYbX0oYm6L2nwNNp
         fFHJHdy2FTw4pojdVWw760PXzHISVXMiLKRWxlD/y0nGpT2dimX1cj4HZZFFpscQtYy5
         JWRy+JOn3U5G78kU2O2Hi0Gr5NM12ruYKMtRWKp6K40vkhlXqYhTMJSOTnXJebusIH6F
         Y4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742828211; x=1743433011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIDixT0asur/f10c6R/24XDOoAgvUV9lc4c7paxmzjM=;
        b=SFQ2szPh+sbOR5GUPi8XAYnMDx1S4H67Io57Yw2COpbIl2c9UrcnRFhzYncAdH25dj
         2v8nlLGHouUVZSpvNuqretwzoNsMixlp3fW5qvAptmimiPsykMihb218sNGR+61h2Ofg
         +ONipd4SPO2rxKJ1lVRmvK4LB2T9/P1XXaaI6mu/xdHefcRhtlk8seFoIMXTuLf4kBL6
         scuJMY8YXXlI/QHqQ4oJPVLKFZTTgF711nSRY84diyDVLjQjGmsF1wQnNPRRRUg5hJ9D
         ZgNYo23QFH4dpFKAbpJNA68t5eEA6zVmAIr5eWKljSeRM0WTuxGw0FWyjTJHQQq0SIzs
         KoWg==
X-Gm-Message-State: AOJu0YyZubORHzrY1XTpzuMe2wjoJOQD72nUDg3Gf1pPZw8hSR6h+jDF
	9s/RtXal+ZwYJ6xgyurVKCb5sUaQXsidpn4SJu5TCc2GPS2S6QARskbzXT36DdxU3FhewTAbAZs
	MJd1GkfqOxhk6MtXaAQeRh/bqiL8vPA==
X-Gm-Gg: ASbGncvPf9bhjfDwAX6sk4C0PxqZVQwzXEEupW9Go9BbZ4HAXaphZSoq5mbLY7OXqHU
	eSyW6lcE7Ysa7pMNm2lHLybo3Ddur1HaOF4hsywNpKhYD3SFa4V841kGdkFnwQRKJDWzYqSYju9
	beQlAfAb9RwrfiRp+L5HxpN3zzyzcsQc1k5VczsQ==
X-Google-Smtp-Source: AGHT+IFzrq9Nsz3xFr0jivI/5ZpqEgOK/0Ey7hze/N/3VjSDyGFm3t3CMQISk46800C6eH+y/5EHedJR7B5tSdy36VA=
X-Received: by 2002:a05:6512:304f:b0:542:91a5:2478 with SMTP id
 2adb3069b0e04-54ad64ef057mr5022953e87.32.1742828210457; Mon, 24 Mar 2025
 07:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250324065407.1055382-1-hongxu.jia@windriver.com> <20250324065407.1055382-2-hongxu.jia@windriver.com>
In-Reply-To: <20250324065407.1055382-2-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 24 Mar 2025 08:56:35 -0600
X-Gm-Features: AQ5f1JoTtP-Bt6u5610bhmNtWQmI1LHB9MM0UWo_MbU0G35L3g3ge77MsrrQZ7M
Message-ID: <CAJdd5GaewsPN4GOwnjf0V9up4+JuR8b5wQiJb30SS2H8SFT35w@mail.gmail.com>
Subject: Re: [PATCH 2/2] spdx3: support to override the version of a package
 in SBOM 3
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 14:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213531

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Mon, Mar 24, 2025 at 12:54=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> By default, still use ${PV} as the the version of a package in SBOM 3
> $ bitbake acl
> $ jq . tmp/deploy/spdx/3.0.1/core2-64/packages/package-acl.spdx.json
> ...
>     {
>       "type": "software_Package",
>        ...
>       "name": "acl",
>       "software_packageVersion": "2.3.2"
>     },
> ...
>
> Support to override it by setting SPDX_PACKAGE_VERSION, such as
> set SPDX_PACKAGE_VERSION =3D "${EXTENDPKGV}" in local.conf to append
> PR to software_packageVersion in SBOM 3
> $ echo 'SPDX_PACKAGE_VERSION =3D "${EXTENDPKGV}"' >> conf/local.conf
> $ bitbake acl
> $ jq . tmp/deploy/spdx/3.0.1/core2-64/packages/package-acl.spdx.json
> ...
>     {
>       "type": "software_Package",
>        ...
>       "name": "acl",
>       "software_packageVersion": "2.3.2-r0"
>     },
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 3 +++
>  meta/lib/oe/spdx30_tasks.py          | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index b4a5156e709..044517d9f72 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -113,6 +113,9 @@ SPDX_ON_BEHALF_OF[doc] =3D "The base variable name to=
 describe the Agent on who's
>  SPDX_PACKAGE_SUPPLIER[doc] =3D "The base variable name to describe the A=
gent who \
>      is supplying artifacts produced by the build"
>
> +SPDX_PACKAGE_VERSION ??=3D "${PV}"
> +SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, software_packag=
eVersion \
> +    in software_Package"
>
>  IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>  SDK_CLASSES +=3D "create-spdx-sdk-3.0"
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 1629ed69cee..52329760b6a 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -606,7 +606,7 @@ def create_spdx(d):
>                      _id=3Dpkg_objset.new_spdxid("package", pkg_name),
>                      creationInfo=3Dpkg_objset.doc.creationInfo,
>                      name=3Dpkg_name,
> -                    software_packageVersion=3Dd.getVar("PV"),
> +                    software_packageVersion=3Dd.getVar("SPDX_PACKAGE_VER=
SION"),
>                  )
>              )
>              set_timestamp_now(d, spdx_package, "builtTime")
> --
> 2.34.1
>

