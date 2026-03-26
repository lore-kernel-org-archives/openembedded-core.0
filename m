Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED38110AB822
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 20:14:59 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58207.1774556095545402402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 13:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FwvyK4r5;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79853c0f5b9so15612537b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774556095; cv=none;
        d=google.com; s=arc-20240605;
        b=Zo5DK/IMI71sqYCOfODPnrn6ecKECP7ssJdCA8TXie/piGrpB15Iw8/ZdLlcqJNDvW
         bOtzfqu7y6Z5P2q7qpWHyKIJnO73jVCswEnWru+/8tBm+L+T8LdBAcYrgzwU1RWf1Uk/
         byKZIEyd60VG4W/XM3GFMb7cOHYRu5k1c0Tdxo6QSc8m5C2mEbR7g+AAbPCwtf40/PQK
         Utvpw05hgXMkHm4omy6XwTH29SVn5PC4ncHowmh7npK5+AOmPJsOHB3/uWm8juLfBQv/
         iOj9R8tKu5LGvtXzr5SDt3CYrJ/sxu7zDXTLqALHYCj1Iu8Psh7n0+b6NTzo8RuIAGLw
         w2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1X6BO93q3BCRkSHrAgfyysQG4YYGOKZMSkSnSRebdw=;
        fh=XL+ydw4zRzqZKs8yhWIx30/frJay1bXF2X1wuGsnf7M=;
        b=DC6ZCTEbXwxJZ5rzjiZz+8M58QdsMyDFO05YNHPwellWAq/c+SMgT7pUA/79VoTCTB
         bOqJnIiRePG0TBS5yXS6DsGAEfBwgYhfnV4dNxexCoFM/Jh1f8R3OkUx6Y1rogdVcNDx
         qVBQO2tz+jg3FwNT9r9vqc3gb6XeE+cOt4WrUHVxRYkE7rhf5KDKwAQEx1mN4f4zBK8F
         4mPZHz2zv+B3aHO/eWe+9SBAiIsFvs6uUYPEHWqDLOojplM4n6OIgHuki/2LVdrjBuSz
         Nhfitz0iH42bWfsjx72z2GH8doZtxovhOsdY6K4TNxDmzBOhA3iWKH+ublH7aT5zXc0M
         R62g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774556095; x=1775160895; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1X6BO93q3BCRkSHrAgfyysQG4YYGOKZMSkSnSRebdw=;
        b=FwvyK4r5XhyUSJSZZWLuzG9mSLho3N82wUH/nVkhlES3wObw1OfHOPI2JdGf4phmir
         Q/Z4Q9WRFtiRXtCQVd6sh/SjoodQ13E5VI1H1orU9gEMzwCAySXAlQ0MWFXwS5y5Fiob
         20L9D114jjfPDoYUfo68HGvQHXxrIpYPF/uvqUcAiV4Ebif79MFWcpHs+MldV/xJoJWr
         xWrJzXiBK75Fiep3Q6c8JQEsrK93rMuS/UEMHKhwbI4TANDJoNeaqDm0lkoBkNhpd9P3
         L6EMVu+4D4TRbOfU0YfuIYjxb2jI1qsnOk66WA42/gMIyrIMGjO54wr3to9xw7VHs0AR
         C2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774556095; x=1775160895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1X6BO93q3BCRkSHrAgfyysQG4YYGOKZMSkSnSRebdw=;
        b=p/WpjzH2tQGGUAwQ6jQSsbXPm8jtpoYL2S1lW5KDHRxQmEjIHmPeOfhGwZ3K3o8PHf
         JjhOqtAOElGk2X5Iz4L1TU6Y4x5xnT5vY7Ic8qU9a0efEBwozwk60kkGaYWJkQev1s/I
         MVsNYjV9uvzsSztuKTfFczyim5SzqqO322oObV27aq2cLWs0FxzjJ63QIyxTihJEbw6+
         oO9H678TB19uuXCTqYwRolfqkoqeaRTgy7bJPG1sQS4oBxZGNPAbNm1YaAP5q5bQn6Ud
         KgSMDmh7GxLWOcRzldSNZiJ2Xc4gJRb8+6CGD2cgpf0AWgks3+EUKxM+SgS1kyOiBlgW
         sN/Q==
X-Gm-Message-State: AOJu0Yx3B08pkrA5RRqMOoZ96R5N+UrYk8iFRFwJBjS9d+SsU6rOXqlT
	hB2JbpKHz3xlUsdKHMqOBQVsan6WfKYChr5Um+PBYKNWFCzWg7kdTHs5plTI3Tp1HIZmOenWx/e
	YXJBq+q9I8ygSABZjXqvKVyCKyR5w4bv/mw==
X-Gm-Gg: ATEYQzxugUfStN7G0ovW0iwz0mawNwUv2TDoDkHhEprw6jFq4tDNuUm8AyqYbyZsSyt
	sYnsZZoEEHDmbq108NCzixMF+F1CwSAcBi4IVsoiUtzkjAMOTyH3GiFtpPMnJpwscHwoA7wCpoA
	T2kTTAN81gErD2/aO36W62YcyBs975/AwIKip/2gPNQrvWXtE3/D8BrITppJJr29frc2dUZGbTF
	fD48ZHHgi3sY96JqvuLhRydGU3r70SMdPvhQhkU4B6SCcJClueSM52Yy6mhsmbNXBh92nO1oMPi
	af/ND4Nu8f+0e9YsAXo1Ew==
X-Received: by 2002:a05:690c:6b07:b0:79a:6751:1489 with SMTP id
 00721157ae682-79acf65f532mr101315147b3.38.1774556094582; Thu, 26 Mar 2026
 13:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260324132958.2316491-1-stondo@gmail.com> <20260324171246.686862-5-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260324171246.686862-5-stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 26 Mar 2026 14:14:43 -0600
X-Gm-Features: AQROBzDX0ZSrNUkmP_dYeHwK1po-IXf9s3mxmN-BkiVKUxbz26YGFtj8W3mHCCA
Message-ID: <CAJdd5GZMSYMoDZHar=HphcwHvqeG-iHrmiH4OBnBRuYkCcb7Og@mail.gmail.com>
Subject: Re: [PATCH v16 4/5] spdx30: Add Git version and PURL to source downloads
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	stefano.tondo.ext@siemens.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 20:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234050

On Tue, Mar 24, 2026 at 11:14=E2=80=AFAM Stefano Tondo <stondo@gmail.com> w=
rote:
>
> Enrich Git source download packages in the SPDX 3.0 output with:
> - software_packageVersion set to the full SHA-1 commit hash
> - software_packageUrl set to a PURL for known Git hosting services
> - VCS external reference pointing to the repository URL
>
> The PURL generation recognizes github.com by default and supports
> additional hosting services via the SPDX_GIT_PURL_MAPPINGS variable
> (format: 'domain:purl_type', e.g. 'gitlab.example.com:pkg:gitlab').
>
> Only Git source downloads are enriched. Non-Git downloads are left
> unchanged since their ecosystem PURLs are already set on the recipe
> package by SPDX_PACKAGE_URLS from the previous patch.
>

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |   7 ++
>  meta/lib/oe/spdx30_tasks.py          | 102 +++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 9a6606dce6..432adb14cd 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -156,6 +156,13 @@ SPDX_RECIPE_SBOM_NAME ?=3D "${PN}-recipe-sbom"
>  SPDX_RECIPE_SBOM_NAME[doc] =3D "The name of output recipe SBoM when usin=
g \
>      create_recipe_sbom"
>
> +SPDX_GIT_PURL_MAPPINGS ??=3D ""
> +SPDX_GIT_PURL_MAPPINGS[doc] =3D "A space separated list of domain:purl_t=
ype \
> +    mappings to configure PURL generation for Git source downloads. \
> +    For example, 'gitlab.example.com:pkg:gitlab' maps repositories hoste=
d \
> +    on gitlab.example.com to the pkg:gitlab PURL type. \
> +    github.com is always mapped to pkg:github by default."
> +
>  IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>  SDK_CLASSES +=3D "create-spdx-sdk-3.0"
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 51e10befba..cd9672c18e 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -14,6 +14,7 @@ import oe.spdx_common
>  import oe.sdk
>  import os
>  import re
> +import urllib.parse
>
>  from contextlib import contextmanager
>  from datetime import datetime, timezone
> @@ -384,6 +385,105 @@ def collect_dep_sources(dep_objsets, dest):
>              index_sources_by_hash(e.to, dest)
>
>
> +
> +def _generate_git_purl(d, download_location, srcrev):
> +    """Generate a Package URL for a Git source from its download locatio=
n.
> +
> +    Parses the Git URL to identify the hosting service and generates the
> +    appropriate PURL type. Supports github.com by default and custom
> +    mappings via SPDX_GIT_PURL_MAPPINGS.
> +
> +    Returns the PURL string or None if no mapping matches.
> +    """
> +    if not download_location or not download_location.startswith('git+')=
:
> +        return None
> +
> +    git_url =3D download_location[4:]  # Remove 'git+' prefix
> +
> +    # Default handler: github.com
> +    git_purl_handlers =3D {
> +        'github.com': 'pkg:github',
> +    }
> +
> +    # Custom PURL mappings from SPDX_GIT_PURL_MAPPINGS
> +    # Format: "domain1:purl_type1 domain2:purl_type2"
> +    custom_mappings =3D d.getVar('SPDX_GIT_PURL_MAPPINGS')
> +    if custom_mappings:
> +        for mapping in custom_mappings.split():
> +            parts =3D mapping.split(':', 1)
> +            if len(parts) =3D=3D 2:
> +                git_purl_handlers[parts[0]] =3D parts[1]
> +                bb.debug(2, f"Added custom Git PURL mapping: {parts[0]} =
-> {parts[1]}")
> +            else:
> +                bb.warn(f"Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping=
} (expected format: domain:purl_type)")
> +
> +    try:
> +        parsed =3D urllib.parse.urlparse(git_url)
> +    except Exception:
> +        return None
> +
> +    hostname =3D parsed.hostname
> +    if not hostname:
> +        return None
> +
> +    for domain, purl_type in git_purl_handlers.items():
> +        if hostname =3D=3D domain:
> +            path =3D parsed.path.strip('/')
> +            path_parts =3D path.split('/')
> +            if len(path_parts) >=3D 2:
> +                owner =3D path_parts[0]
> +                repo =3D path_parts[1].replace('.git', '')
> +                return f"{purl_type}/{owner}/{repo}@{srcrev}"
> +            break
> +
> +    return None
> +
> +
> +def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
> +    """Enrich a Git source download package with version, PURL, and exte=
rnal refs.
> +
> +    For Git sources, extracts the full SHA-1 from SRCREV as the version,
> +    generates PURLs for known hosting services, and adds VCS external
> +    references.
> +    """
> +    version =3D None
> +    purl =3D None
> +
> +    if fd.type =3D=3D "git":
> +        # Use full SHA-1 from fd.revision
> +        srcrev =3D getattr(fd, 'revision', None)
> +        if srcrev and srcrev not in {'${AUTOREV}', 'AUTOINC', 'INVALID'}=
:
> +            version =3D srcrev
> +
> +        # Generate PURL for Git hosting services
> +        download_location =3D getattr(dl, 'software_downloadLocation', N=
one)
> +        if version and download_location:
> +            purl =3D _generate_git_purl(d, download_location, version)
> +
> +    if version:
> +        dl.software_packageVersion =3D version
> +
> +    if purl:
> +        dl.software_packageUrl =3D purl
> +
> +    # Add VCS external reference for Git repositories
> +    download_location =3D getattr(dl, 'software_downloadLocation', None)
> +    if download_location and isinstance(download_location, str):
> +        if download_location.startswith('git+'):
> +            git_url =3D download_location[4:]
> +            if '@' in git_url:
> +                git_url =3D git_url.split('@')[0]
> +
> +            dl.externalRef =3D dl.externalRef or []
> +            dl.externalRef.append(
> +                oe.spdx30.ExternalRef(
> +                    externalRefType=3Doe.spdx30.ExternalRefType.vcs,
> +                    locator=3D[git_url],
> +                )
> +            )
> +
> +
> +
>  def add_download_files(d, objset):
>      inputs =3D set()
>
> @@ -447,6 +547,8 @@ def add_download_files(d, objset):
>                  )
>              )
>
> +            _enrich_source_package(d, dl, fd, file_name, primary_purpose=
)
> +
>              if fd.method.supports_checksum(fd):
>                  # TODO Need something better than hard coding this
>                  for checksum_id in ["sha256", "sha1"]:
> --
> 2.53.0
>

