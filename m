Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABE0103E2EF
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 22:51:33 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9390.1773269488330442833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 15:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJBNy6r+;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79901821bb0so4465977b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 15:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773269487; cv=none;
        d=google.com; s=arc-20240605;
        b=NIgi9yx2oN5LHYghHV3iiJ3nhEG2YvEfD97rD3uLSHQ7bMmZ6Cb6rM0G9sCnLXyGjf
         dM0czypn8d42tXGahazJx0cSigi0VRgrQHgjzzSNQQKwDssIMd2RY8hPPWHtI8EflaLS
         KLqLS7F3x+82rHyvB/y5HH+WwiXZDUtERJnTo+DgwQyNiz2x99CQNxEtmz9hjtWZBSdE
         L+/UMJiSSDjaQk1KLXecqeZi+juS14VlAiQbFrNT4wvr4EVc3bg/8/3n2VNIT+nZIE4p
         lflwjErUKRAbVnBaZViMimythLMbXDpu6AsWZ8P8MSaS0zZ2bAbVnTW2cpq3CFglD76q
         5idg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SBRULxo5RraR+ZrqINQ6EJi9I5n4c0ob26/bI1/szUY=;
        fh=O40SYvcy1jGEmbceIO96QTsgI2+wv8m09kxalw+zz44=;
        b=ORnCPjdRpEVQom+lxpThT0Hfu4QVge6WQIP+zx1OMKYzLODasrkveqJwqZhqwitS3q
         8CWy1YvFCrsMXyYBqy05Qam5CFJ3xouPkL5v4BZrrjfdw3+dkZqq/Xmb9YO10+145Mai
         09yoPdMt2EEjTV8k8IwrrGzrOxcsIHOu6nltq2hJF9hH7cNVMcvWmB1xlzqD0nAx2m9/
         JwAfRFWol8joCjv0VMTrDLDIgVa2FSY7iP243g5TUSgIzw/krdiuBa+G/6ntwjGMCEbE
         pDz5+crBPotlpl3c0KSeYvzzcpwNW8u3g76knUkURf58MdssuMvRIXaUPdr0y2sC/G8z
         9DlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773269487; x=1773874287; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBRULxo5RraR+ZrqINQ6EJi9I5n4c0ob26/bI1/szUY=;
        b=lJBNy6r+LYZ73UgV11+OSuRiGAGxJxhgqbTDcM/rbajLHRPdstg5su4f7ED2ThAnKC
         BBri6McEAZGZZ2JRcsbexNy1xfQxQCQzCfjF/PT3705eeof5xC4s6j4ZNugmqORV0NDb
         AFm2Mx3LjT89FrsmI469NdcN/8B/U9zGyD9nwnEJI4sTPzSUAELM2m7GnOdkjM+XSAIb
         d9PaQg1Y+jxonZ7Lu2B1kACO8VsPep4jhFLIHUkshprj4hN2iql8HQyePDh7TCU5LjqA
         qGWnXkoU7MHY6PaeZM7T0mK2nhcrH4553RwzEb0y5WSgTlajDKjmlcCrwkEauGBfpww3
         2TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773269487; x=1773874287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBRULxo5RraR+ZrqINQ6EJi9I5n4c0ob26/bI1/szUY=;
        b=hzszmvkp3XXHxd2sB7nctsec3gX/7lKAjBaUC6VKV6AkQTt3HekwZESeTu3DpRFPRq
         UQ+quTLYVrBQJdXhNbrJ6BraAT4XnBNKlJfPd4oTuzJPh8JNaUVokYA/y0WBqsratxhL
         DjTjmDJdapXSvJoD4yKrJhpAbxUgZ+CX5+/HxL3oNp/8nBtSGJXqmJi61286IdbHdtlE
         O8AP+FOsWEx0+Iq6RrG8K+9ET88w79dCfvxkT2Jbdl8FcMpGRJrV6mMDkX7fI828vmaZ
         wrID5hNBHmxRwM9sI8T9n0TwJigTYzaNjh0wtVxH7bYplvilQQhc04C1vVbALS1RjlWx
         jhzw==
X-Gm-Message-State: AOJu0YwmFHdvlyOAeNxuw7hYkNvzIBvsCGF3xy1ZvzTccHTEdgoDHUkz
	9xA/tvbaxlcgcV4WJOHitiA3joZPjwbfs0a7MSu9Y58o//X2QZBUV5MywNA0zTBLm+g/x/c0mCT
	ABN9Pc3EQY4+SrnIr/Im463rKLVNAVek=
X-Gm-Gg: ATEYQzyzLvWgqaycwK+nnvbr52jOFghvk2SdYQRgy81hKtoS6yCdb0HUYbsJSFhVg0n
	MXY2wTLndtRw50yJVLFrHKBvzBCOI/1KZ1whrPrwzqCskNetlggRO9DQXHrm8Zg4QnlVl8hmmFq
	89CWtf+sPPCnFLtV5FywXVFN8M471eIrQgmsiJtKMqrPSUW0dqXrcCWaLdPOgsm98C8047Mh+3w
	LFBYqy7NZgmJW2gllggKy86heHf8UyOJnoEAr9xSV7U02pIg6Z3CwlZ0z0aOwST0KS86nQ8KKzf
	xV54GpPBplwPEDGUZGstO9HOmr2L7Zcv
X-Received: by 2002:a05:690c:6d84:b0:799:1af1:6c7c with SMTP id
 00721157ae682-7991af17120mr31433737b3.49.1773269487405; Wed, 11 Mar 2026
 15:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com> <20260309132854.128375-5-stondo@gmail.com>
In-Reply-To: <20260309132854.128375-5-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 16:51:16 -0600
X-Gm-Features: AaiRm52CGr9W91GuH-C5NM2hpuAX_RTbhzR4UvBF2lJzgbQjZzMX8bwOGh3ClnM
Message-ID: <CAJdd5Gak6jwAxiUVmWoCCKApN_TZY0Y=WKR2BXWBE3aCFDpbKQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 4/7] spdx30: Enrich source downloads with
 version and PURL
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 22:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232917

On Mon, Mar 9, 2026 at 7:29=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add version extraction, PURL generation, and external references
> to source download packages in SPDX 3.0 SBOMs:
>
> - Extract version from SRCREV for Git sources (full SHA-1)
> - Generate PURLs for Git sources on github.com by default
> - Support custom mappings via SPDX_GIT_PURL_MAPPINGS variable
>   (format: "domain:purl_type", split(':', 1) for parsing)
> - Use ecosystem PURLs from SPDX_PACKAGE_URLS for non-Git
> - Add VCS external references for Git downloads
> - Add distribution external references for tarball downloads
> - Parse Git URLs using urllib.parse
> - Extract logic into _generate_git_purl() and
>   _enrich_source_package() helpers
>
> The SPDX_GIT_PURL_MAPPINGS variable allows configuring PURL
> generation for self-hosted Git services (e.g., GitLab).
> github.com is always mapped to pkg:github by default.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |   7 ++
>  meta/lib/oe/spdx30_tasks.py          | 122 +++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index def2dacbc3..9e912b34e1 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -152,6 +152,13 @@ SPDX_PACKAGE_URLS[doc] =3D "A space separated list o=
f Package URLs (purls) for \
>      Override this variable to replace the default, otherwise append or p=
repend \
>      to add additional purls."
>
> +SPDX_GIT_PURL_MAPPINGS ??=3D ""
> +SPDX_GIT_PURL_MAPPINGS[doc] =3D "A space separated list of domain:purl_t=
ype \
> +    mappings to configure PURL generation for Git source downloads. \
> +    For example, "gitlab.example.com:pkg:gitlab" maps repositories hoste=
d \
> +    on gitlab.example.com to the pkg:gitlab PURL type. \
> +    github.com is always mapped to pkg:github by default."
> +
>  IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>  SDK_CLASSES +=3D "create-spdx-sdk-3.0"
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index c3a23d7889..1f6c84628d 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -13,6 +13,7 @@ import oe.spdx30
>  import oe.spdx_common
>  import oe.sdk
>  import os
> +import urllib.parse
>
>  from contextlib import contextmanager
>  from datetime import datetime, timezone
> @@ -377,6 +378,125 @@ def collect_dep_sources(dep_objsets, dest):
>              index_sources_by_hash(e.to, dest)
>
>
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
> +    """Enrich a source download package with version, PURL, and external=
 refs.
> +
> +    Extracts version from SRCREV for Git sources, generates PURLs for
> +    known hosting services, and adds external references for VCS,
> +    distribution URLs, and homepage.
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
> +    else:
> +        # For non-Git sources, use recipe PV as version
> +        pv =3D d.getVar('PV')
> +        if pv and pv not in {'git', 'AUTOINC', 'INVALID', '${PV}'}:
> +            version =3D pv
> +
> +        # Use ecosystem PURL from SPDX_PACKAGE_URLS if available
> +        package_urls =3D (d.getVar('SPDX_PACKAGE_URLS') or '').split()
> +        for url in package_urls:
> +            if not url.startswith('pkg:yocto'):
> +                purl =3D url
> +                break
> +
> +    if version:
> +        dl.software_packageVersion =3D version

Oh, and this version; I'm not sure you can say the version of the
recipe is the version of all downloaded files

> +
> +    if purl:
> +        dl.software_packageUrl =3D purl
> +
> +    # Add external references
> +    download_location =3D getattr(dl, 'software_downloadLocation', None)
> +    if download_location and isinstance(download_location, str):
> +        dl.externalRef =3D dl.externalRef or []
> +
> +        if download_location.startswith('git+'):
> +            # VCS reference for Git repositories
> +            git_url =3D download_location[4:]
> +            if '@' in git_url:
> +                git_url =3D git_url.split('@')[0]
> +
> +            dl.externalRef.append(
> +                oe.spdx30.ExternalRef(
> +                    externalRefType=3Doe.spdx30.ExternalRefType.vcs,
> +                    locator=3D[git_url],
> +                )
> +            )
> +        elif download_location.startswith(('http://', 'https://', 'ftp:/=
/')):
> +            # Distribution reference for tarball/archive downloads
> +            dl.externalRef.append(
> +                oe.spdx30.ExternalRef(
> +                    externalRefType=3Doe.spdx30.ExternalRefType.altDownl=
oadLocation,
> +                    locator=3D[download_location],
> +                )
> +            )
> +
> +
>  def add_download_files(d, objset):
>      inputs =3D set()
>
> @@ -440,6 +560,8 @@ def add_download_files(d, objset):
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

