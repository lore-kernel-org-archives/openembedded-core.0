Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA9D103E2EE
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 22:49:33 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9197.1773269371106527009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 15:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQNfsXgt;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79881805788so4803107b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 15:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773269370; cv=none;
        d=google.com; s=arc-20240605;
        b=GC9wLn6/dxrbPNBA2nHFOxEDHnEPu5xAw9A5vmDtNdzOp5TlYsMNFgfgnTBpX+BwUw
         9vaJ8r9GTm6WCY7znl/q/KnpvQOk2YqVMgjx3VgeuAXZw1UHalmpy61ZI2qOFRvJfPD7
         iY7B4mqG7QPsbfJdBK9Wc3tJaoA8HFu8pD4dHwQB0k40F5aar+6to3FIBa7Nw+79Ga74
         AB5M0zmnzqOwU0hH3FFNmu0mKqHQ3XyMN3JeZlm+aWnM6ojz6e9cCEGU9gsV2m4pmHmY
         q6xW6J0yQ2i8pRUEao95aOqj1cAhj9OuAlsGEaNr/O5UZVhXdlZyKJ0yrZnX2uxpwjzf
         QTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/IEaWeBsdgbF4OXhch4TD9lmLLyAY8fyWPmqoxvckY=;
        fh=O40SYvcy1jGEmbceIO96QTsgI2+wv8m09kxalw+zz44=;
        b=FI0sTBn4quAv3IcciX4H7qmp/ERn4KbRXtrTUmIuMtnu7GvEo1dRwwPK493DRrZCiN
         RzW2/TMlO0RsWJrxj3ivQmqO7giqSRvSbsAK9QwCK5bRqvNEFa7FJgd5rWApzRUV8Sp7
         OcIqYGAvEX0pYHMtiP5pRLXQ0hVwDZTuy25zVkr5HpqVv2CWVFzh8OmDMLzwxbHFaG6Y
         KtJlGAEjJVKUcwnw2MQKUw1OXd7o9fqe252PNxaBGK0oxsa7W+FCunysgEv20Zi93M0Y
         qPL5N+yt+8qED8AkGodWlFkMWKl9fkweWRQxTi4w2asQiC6aC+/+91nfZ0gHxdowf5eY
         DIFQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773269370; x=1773874170; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/IEaWeBsdgbF4OXhch4TD9lmLLyAY8fyWPmqoxvckY=;
        b=KQNfsXgt0Vo7sEosFggZZvaqH4iwjk85B5ZwJN4DGM1EG95j3mp/UQlwdM+HCm1hiI
         vM34HTWoMYu/U/NGNY8zeTQGvnmMlOvMIQ20GEOFiRNiQoVHSg0z1VZz9bW+CZH5wwRs
         lIBz8K4XnbbkYyfa8qW64kAquHuhLsg5qwhk9x8dHmdr2JeyFtX4GjNdNowKt8xawe59
         gO2G3JD2GPzvNojWiwnXiXoL4YZ9iDkAZbN/z3jD3oqdVyun0agiBW+aFBlcCLWUxRav
         MF8MPtXZhp06f6va7PyLsCdovEB8BNnArec3WotQM7x1adpPoKYIFof1DBvG3ddXzaAq
         8YyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773269370; x=1773874170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/IEaWeBsdgbF4OXhch4TD9lmLLyAY8fyWPmqoxvckY=;
        b=D1j6A8sed1CZCBE5VkEKLI84/HdWKdHqt2qwaPy1uCuzy/RmwrHp19U8hGlZAPmuRs
         csl4rDW/i0w/owudmuZO2ezbVoA8JWP18vRF8F/GwaM2dc9zUGc+jVxwIna4UYviXbnc
         y/MsQ5wldvmAbDbYi7Sr+OYiRT69kKaELUjT5xLbW76VztgITGm3wRsvbOy5cwXFaChN
         bvyRopO0CoyDf8KrkcqerpV9MxunXVQ3PpBKJm6DN5aOQal75O0pOeRYNBWKwLNWcAVC
         W0dTwdeox60hI9zLmFIBIaaP7WYirpEmle15CTKwsr6wYWUKJm4LCG6BllkPAr9rGVti
         KzLw==
X-Gm-Message-State: AOJu0Yw5j0hKV6mXOkeeLpupDs0dYDNO4suh31zrazW0fXtWbvl8v1bK
	XNRfvg3fy7RgBQm2jjfJ7ouOnGNIos15ds8EOFnXnlXI+bmBIETcTL271txjRE5ZGGbBjpbJoME
	qzKBax6XXiOB94r4NVh4Kei3VoC3SJIq6Pw==
X-Gm-Gg: ATEYQzwJ9q7683Zvp3zwjXSuY0vHjb0XaGh+2G6SR0OQlhV/V5Y5u1URRCIrJhCHEmd
	ARMWfLzKER+75TfU7yxrhGOndimCipo2EXW19d+QjlcsfUHpDFs7pAFOgJH202gbItBl2BbQnBW
	mJVMlMZfwGbNgAxx2eYmbQyk8AwuY50+6JhNrF1hrIbNEWzD/36avOMKiPVU8z4kWH2kQgkwmcO
	xUt+B0UsdzPlgKsj0yT4i3ABFvOimCz8QRTHiF+ioCY39Yqq7AsA6NNKBkeRTu/s05n1Im4Q7HK
	Bq/bCNhT622VATciHx8kIA==
X-Received: by 2002:a05:690c:c530:b0:797:f005:2dc0 with SMTP id
 00721157ae682-79917fd4dd7mr41131367b3.50.1773269370105; Wed, 11 Mar 2026
 15:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com> <20260309132854.128375-5-stondo@gmail.com>
In-Reply-To: <20260309132854.128375-5-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 16:49:19 -0600
X-Gm-Features: AaiRm53dsflvIJuclPxS81-ozBv3gJotG9UVv4k_QPB7bZrDVBQDz-tJzlqCVXU
Message-ID: <CAJdd5GZFMezpUxapZLYTw+gGhfMh9Kw1HyA62c-48iYwExszBw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 22:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232916

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

Everything else looks OK except for this else block. I'm not sure that
we can reasonably say that the recipe PURL applies to all download
sources, just because they are part of the recipe. _Most_ of the time
this is probably true, but I'm not sure it's the case all the time,
which makes it feel a little dangerous (for example, crates, which I
know you had handled before).

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

