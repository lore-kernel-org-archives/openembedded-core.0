Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE427D0D16D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 20:05:48 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15536.1767816347044075355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 12:05:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lzq5QL/l;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fc4425b6bso26257837b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767816346; x=1768421146; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/8V+TroqXWkHA+gNkLAX16A5uYNh61IzX8b32ODpvY=;
        b=Lzq5QL/lRJibwvGfEuQVXSjk4Hs81V6GvTWb895BvWiI0Ux8NZCPIKMKHj4m8AVfih
         FAyHacrnikHCerMZLjzLibX1vZbDjYKMijkH/YxkblVDK0+oa6G25NslMAucikYhCHjz
         e+rDIG3EanN0xQGJf+b8GhfqYXewu/Mn60SJOa6ZP3cbXr0vSHIs78CQcvgQp/eQlTUg
         +2Ze6aj66LoQ6ebhSYhNPa+yJTzpD7An9aX6Q/X+bMTVhVJYewJ6ZxWb+Xt7q8z7Dps2
         tMyzr+c7QA+WIQBx5KwuH2ZPXHs918wrqLFSh71yp/GPlfXrWLJINs4u8EEiuWhYJmpY
         ohMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767816346; x=1768421146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/8V+TroqXWkHA+gNkLAX16A5uYNh61IzX8b32ODpvY=;
        b=IZk/6wVAdx4casdJdlqwoBCJGLFlq0kZE13avyVRTcd6YVib315oKo3oNW/zgEwrG0
         1qCN3GWdZbSd1GqnkrW3begY+NgbdRFp3XSoIvqVwQTk5E8fzylgJjit6jQlTfiH20VC
         0fsv2BCwbY8jrtN0ks0V0D/uBR+zssqHzDYyVyOdKHBCiXMLO951boCwAofbjVTi8xUp
         c3xJLsOI449j6HsCgeCUiXjY5uO1QcZ8tPOYL/yZhL141M15OBxhXHmD87u4YGRZzgps
         ovSaF/zwKcJDmKc1wjkNNj9QDeOaQYI7mSSZ2YDipovHHGbCNmglYSlfS6xDce/z5xc5
         z0LQ==
X-Gm-Message-State: AOJu0YwNY6TxCJd+cHPufUcMLb+yK/khQ/F9oEcg/qBgiu2pIcjL5ZFb
	Ri4CgOsepW2glE02SH4QQUWhkV1XqyVhcf8rSfE+6XkcflIeXswcr9fwUjg8fp4H11FH2KiWEjT
	gi350n+jFGaLgP4nqQ+8YYQt7loii2zM=
X-Gm-Gg: AY/fxX4HUZKVOP47TXh8dzzSS52T3uk95ao1RRToi0Bx4auEvBT2jJ0lDmRBNlLkAq4
	vt4U4SEBGHoo+WTz+TlZKYMloM3aU0a0gtYld+25dVdTFOVdnuYM4khIY2rRTYpbOZZrfbrwPV3
	qseSXNi/3NX+uO2KKDaHBHqA+pVKNCzDRLT+A3d9ip3CyXbm82FuAHKENFt93xSNQx1RlyjQAh4
	E1Ws7Kc/LWPogTKwJ+zkQ89Cns3guBbTJroISFI9iKa0xazUm/hCnoTl5W1hI9mlwFLIby6yoNR
	D+DSpcDFyl/FrFDdGzf5
X-Google-Smtp-Source: AGHT+IFvU6jT+szYzZFsFsYcY1ILisQfdLKVEhdCSJZn6YS6zh5RL95szw5qK5QWXzn5MJuMWAWr57f0GgkX5gYBmcQ=
X-Received: by 2002:a05:690e:151a:b0:646:44cf:92e8 with SMTP id
 956f58d0204a3-64716cbfa6dmr2845963d50.79.1767816345968; Wed, 07 Jan 2026
 12:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20260107180951.140895-1-stondo@gmail.com> <20260107180951.140895-5-stondo@gmail.com>
In-Reply-To: <20260107180951.140895-5-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 7 Jan 2026 13:05:34 -0700
X-Gm-Features: AQt7F2rQ9ik9jsxM4xjZPp1-uArxCQYkjYjPIpOizfcAGQWluOfKlkoHkFiMulc
Message-ID: <CAJdd5GZQKSY1FTf-qBvycW-Uwpe2V7Jp=gDR=4hPRVSizxRZ6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spdx30: Add SBOM metadata component and
 supplier support
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, stefano.tondo.ext@siemens.com, 
	peter.marko@siemens.com, adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 20:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229030

On Wed, Jan 7, 2026 at 11:10=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> This commit adds support for including image/product metadata and
> supplier information in SPDX 3.0 SBOMs to meet compliance requirements.
>
> New configuration variables (in spdx-common.bbclass):
>
>   SBOM_COMPONENT_NAME (optional):
>     - Name of the product/image being documented
>     - Creates a software_Package element with metadata
>     - Typically set to IMAGE_BASENAME or product name
>
>   SBOM_COMPONENT_VERSION (optional):
>     - Version of the product/image
>     - Falls back to DISTRO_VERSION if not set
>
>   SBOM_COMPONENT_SUMMARY (optional):
>     - Description of the product/image
>     - Falls back to IMAGE_SUMMARY if not set
>
>   SBOM_SUPPLIER_NAME (optional):
>     - Name of the organization supplying the SBOM
>     - Creates an Organization element
>
>   SBOM_SUPPLIER_URL (optional):
>     - URL of the supplier organization
>     - Added as externalIdentifier
>
> Implementation (in sbom30.py):
>
>   - create_sbom(): Add metadata component and supplier after SBOM
>     creation but before collection expansion
>   - Create relationships:
>     * SBOM --describes--> metadata component
>     * SBOM --availableFrom--> supplier Organization
>
> SPDX 3.0 elements created:
>
>   - software_Package (primaryPurpose: operatingSystem) for product
>   - Organization with optional URL externalIdentifier
>   - Appropriate relationships per SPDX 3.0 spec
>
> Usage example in local.conf:
>
>   SBOM_COMPONENT_NAME =3D ""
>   SBOM_COMPONENT_VERSION =3D "1.0.0"
>   SBOM_COMPONENT_SUMMARY =3D "Production image for Device X"
>   SBOM_SUPPLIER_NAME =3D "Acme Corporation"
>   SBOM_SUPPLIER_URL =3D "https://acme.com"
>
> This enables profile-specific SBOM workflows and compliance validation
> tools that require product and supplier metadata.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oe/sbom30.py       | 52 +++++++++++++++++++++++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py | 10 +++----
>  2 files changed, 57 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 227ac51877..197361db4f 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -1045,6 +1045,58 @@ def create_sbom(d, name, root_elements, add_object=
sets=3D[]):
>          )
>      )

create_sbom() is a generic function that is used for more than just
images. As such, using the SBOM_COMPONENT_VERSION, DISTRO_VERSION,
IMAGE_SUMMARY, etc. is not appropriate.

You should be able to do the same thing by using the `objset` and
`sbom` object returned from the function instead.

>
> +    # Add SBOM metadata component (image/product information)
> +    sbom_component_name =3D d.getVar("SBOM_COMPONENT_NAME")
> +    if sbom_component_name:
> +        sbom_component_version =3D d.getVar("SBOM_COMPONENT_VERSION") or=
 d.getVar("DISTRO_VERSION") or "unknown"
> +        sbom_component_summary =3D d.getVar("SBOM_COMPONENT_SUMMARY") or=
 d.getVar("IMAGE_SUMMARY") or f"{name} image"
> +
> +        metadata_component =3D objset.add(
> +            oe.spdx30.software_Package(
> +                _id=3Dobjset.new_spdxid("metadata", "component"),
> +                creationInfo=3Dobjset.doc.creationInfo,
> +                name=3Dsbom_component_name,
> +                software_packageVersion=3Dsbom_component_version,
> +                summary=3Dsbom_component_summary,
> +                software_primaryPurpose=3Doe.spdx30.software_SoftwarePur=
pose.operatingSystem,
> +            )
> +        )

It's not clear why this is needed over the root elements? You can
effectively do the same thing by setting the "suppliedBy" property on
all the root elements of the SBoM. If some of them are missing
supplier information, we can add properties to set those the same as
the SPDX_PACKAGE_SUPPLIER. (e.g. SPDX_IMAGE_SUPPLIER,
SPDX_SDK_SUPPLIER, etc.)

This seems like it's adding things in the wrong place as-is.

> +
> +        # Link SBOM to metadata component
> +        objset.new_relationship(
> +            [sbom],
> +            oe.spdx30.RelationshipType.describes,
> +            [metadata_component],
> +        )
> +
> +    # Add supplier information if provided
> +    sbom_supplier_name =3D d.getVar("SBOM_SUPPLIER_NAME")
> +    if sbom_supplier_name:
> +        sbom_supplier_url =3D d.getVar("SBOM_SUPPLIER_URL")
> +
> +        supplier =3D objset.add(
> +            oe.spdx30.Organization(
> +                _id=3Dobjset.new_spdxid("supplier", sbom_supplier_name.r=
eplace(" ", "-").lower()),
> +                creationInfo=3Dobjset.doc.creationInfo,
> +                name=3Dsbom_supplier_name,
> +            )
> +        )
> +
> +        if sbom_supplier_url:
> +            supplier.externalIdentifier =3D [
> +                oe.spdx30.ExternalIdentifier(
> +                    externalIdentifierType=3Doe.spdx30.ExternalIdentifie=
rType.urlScheme,
> +                    identifier=3Dsbom_supplier_url,
> +                )
> +            ]

Use objset.new_agent() so that this follows all the other rules for
agents; this will allow user to de-duplicate and add all the other
metadata using variables

> +
> +        # Link supplier to SBOM (SBOM is available from supplier)
> +        objset.new_relationship(
> +            [sbom],
> +            oe.spdx30.RelationshipType.availableFrom,
> +            [supplier],

FYI, there is a _much_ better way to do this planned in SPDX 3.1
(which is why I've not added it yet):
https://spdx.github.io/spdx-spec/v3.1-dev/model/Core/Classes/SupportRelatio=
nship/

In the meantime, isn't the "suppliedBy" property sufficient?

> +        )
> +
>      missing_spdxids =3D objset.expand_collection(add_objectsets=3Dadd_ob=
jectsets)
>      if missing_spdxids:
>          bb.warn(
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index c86b088b61..757503cd6b 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -179,17 +179,17 @@ def add_package_files(
>                  continue
>
>              filename =3D str(filepath.relative_to(topdir))
> -
> +
>              # Apply file filtering if enabled
>              if spdx_file_filter =3D=3D "essential":
>                  file_upper =3D file.upper()
>                  filename_lower =3D filename.lower()
> -
> +
>                  # Skip if matches exclude patterns
>                  skip_file =3D any(pattern in filename_lower for pattern =
in exclude_patterns)
>                  if skip_file:
>                      continue
> -
> +
>                  # Keep only essential files (license/readme/etc)
>                  is_essential =3D any(pattern in file_upper for pattern i=
n essential_patterns)
>                  if not is_essential:
> @@ -198,7 +198,7 @@ def add_package_files(
>                  # Skip all files
>                  continue
>              # else: spdx_file_filter =3D=3D "all" or any other value - i=
nclude all files
> -
> +
>              file_purposes =3D get_purposes(filepath)
>
>              # Check if file is compiled
> @@ -245,7 +245,7 @@ def get_package_sources_from_debug(
>      d, package, package_files, sources, source_hash_cache
>  ):
>      spdx_file_filter =3D (d.getVar("SPDX_FILE_FILTER") or "all").lower()
> -
> +
>      def file_path_match(file_path, pkg_file):
>          if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
>              return True
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229024): https://lists.openembedded.org/g/openembedde=
d-core/message/229024
> Mute This Topic: https://lists.openembedded.org/mt/117138943/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

