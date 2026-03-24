Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69344F54AC9
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 14:46:48 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21263.1774363602569714846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lOrFleWC;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so3812479d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 07:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774363602; cv=none;
        d=google.com; s=arc-20240605;
        b=f4SybMxK17iOGflvIEl3fmndy9h780EtGBxJKHiH4wbK3XT8uf5hXgYBBPWEHsDBlB
         PdYVUDhwGRsi/fajNAU0LGkSLPnzUGjLeHyhGrJF23x/0zK5QyEzb4a5U4Yd/+lpqDtO
         lo2H4IK+XtCHch9qrosvLJ852la5QMuwCmd8r9Z9R3dacaytXszHVWrPYYBSfgQOFRq5
         bz75ywbKVfY0TtUXTS/t+q0h9Q1ifH26cL3f0cfJ+iyLzDTCmmRdxljiaU0v8VOI8VeP
         zInXnjOmYWdbvjj3tWdT+BAJIemMrQHcdlD4PDCH5EBTiAOszdDK+gw3ftKEhuntbqZh
         gjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ubFZknx+ZywnicgA3qLmEqGT2xRb9bc4FT9b/ziVfc8=;
        fh=dHhAhIOv58OMnEv7hJ+DzO9vWG5EJ2HFGfdZOTbvDGU=;
        b=exAQYRGJSJhy66+cKDjkxPPRcPThIdDr0gNmGRRs+33gSHL45y8aiR2ydWtxxqZ6I4
         IyjqHvL7m9Ll5k0M8MqJoIcybCszNOZQqx1RNhhGNYDNQ9e/+1uuSkW2jScCsdocmxlN
         u5mKo5iWLL+Wl94pxvK+PDLs9W89U40gjpKadk5khS9tNMOr0JAJWetK+LSbJ4GQnco9
         lkrx4ocDQv8sVoQtUacD906InKObI5pkuhTkCn+cUEYluMzuoneFNkLs95qupBDTrlLv
         BT1Tcy43TOUD/Yh60V7iI2Hu++oV1DMWIFLeISRgYgCJH6XqVdnIvYuHJ45Gq31ZVF9L
         2jWw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774363602; x=1774968402; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubFZknx+ZywnicgA3qLmEqGT2xRb9bc4FT9b/ziVfc8=;
        b=lOrFleWCtamqwC2aVAA/AQ4zDpuVkE5uQc3m7B0iujou5rrQn66b0gDjEPowC+n7cg
         RhyVe27WVxCi5DKr2eGwg5LIfXqzcVzzzQLc9jt3Ghit8IJfV2SHl9hD6lZhupMVe/6E
         fYnDdcq40evm9CYZEW8NIfECUn9KNpJRv/etgaLe6pwAXExVfGGvr6yC3hAvm8vOpDXV
         WhOXVGyGHjZlV3yZExEeG2TZR6NPsFvsSEJRPeuDtjErqYeLgzPFVRn7VGN67mS4FCiG
         utr1PX7pLyS+AJ2UfadMaUnTtIN1t2f8aQG93ivKugEmHwuQyMZhBHTnA6Y45I3yTJkb
         XLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363602; x=1774968402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubFZknx+ZywnicgA3qLmEqGT2xRb9bc4FT9b/ziVfc8=;
        b=eMf92pP42MeuQF8mPsEF74lGJZ7ql0Wd47Q8LryjCEZZVbX1F5mzjGk9HxmhzQfPt3
         VbzUvrnWnK5x9aWH1mkCtJVDLw/kvKGaI8ycUkL12E7A6/EuPZycfVKpK0fgJljnlSO2
         p0+VYTeJMqT5FIZrgZDbjTiBKzfCL7SlGsnAOkdtnlb+VFvycYpCA18s4+G5k4hrVN7q
         BIN4gSsuR96cIBMEQKyocN+/Veub9PDMIRSxLN0zVGcXuFhjf0xmIN6o2unbvn/N09t0
         k/7PhMBNVtih1IUT9wpGSHQ6xYH+TsLQWWKzUuo89h4+qvlxsROYPp7pw4Beo03vR05u
         cCIw==
X-Gm-Message-State: AOJu0YzBXpx3joG+4PLZOJHWmPT2EDVgBtuCslS51XeW7MUmC8chJV05
	WVwbuSFlUPWMRu2MaNk/P3Sez8GkwQoWbO2wTepuvkx3rxHuP0h/Y6wOY6ynoLfCKnqm15UsJXR
	Ywxkx5lVpTSj8LaT8ggSbeUzlWJe4PFg=
X-Gm-Gg: ATEYQzz670uTeSzYpFP4ar8hbEJsQP98cXFVbDgzzbcJAsKhqaoVKM+tQZoGzA9+IY0
	gzVL2Q8yVpfRt6n1EUna9CWD6Mi4yqAFGNgjK7ZeGeyjK9oVsHMEyXAUmmaeB1sEgWfRsUdesB4
	Uh6ow2XSimlWDqHZ2InufDo/yf9hkgNhDjy1HxSjNANXd18w4vFXbUabKPvk54hEqKW3PUeOPL7
	T3Nf/lrMKY5i+qwFSdowt9Y+DY2z6HxQxSFiR4VHr4+bChJCs8VkKUhlhJCBbK93lT3qdlEReep
	2J9K3Q02F5MugFd6VWTsIg==
X-Received: by 2002:a53:b451:0:b0:64c:905:6f2c with SMTP id
 956f58d0204a3-64eaa6c16fdmr12610910d50.20.1774363601306; Tue, 24 Mar 2026
 07:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
 <20260324132958.2316491-1-stondo@gmail.com> <20260324132958.2316491-4-stondo@gmail.com>
In-Reply-To: <20260324132958.2316491-4-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 24 Mar 2026 08:46:29 -0600
X-Gm-Features: AaiRm519FlIGyY3E36Ta__qpJhatlZ4hbgmdkDuACZWUGJuw3JLwC7-ITqVRm0g
Message-ID: <CAJdd5Gbzd3UqpOntmzJdWw2jq--pMiUP7PFD_1EA2+ubStBQaQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v14 3/4] spdx30: Enrich source downloads with
 version and PURL
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	stefano.tondo.ext@siemens.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com, 
	Tim Orling <ticotimo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 14:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233804

On Tue, Mar 24, 2026 at 7:30=E2=80=AFAM <stondo@gmail.com> wrote:
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
> For non-Git sources, version is not set from PV since the recipe
> version does not necessarily reflect the version of individual
> downloaded files. Ecosystem PURLs (which include version) from
> SPDX_PACKAGE_URLS are still used when available.
>
> The SPDX_GIT_PURL_MAPPINGS variable allows configuring PURL
> generation for self-hosted Git services (e.g., GitLab).
> github.com is always mapped to pkg:github by default.
>
> Add ecosystem-specific SPDX_PACKAGE_URLS to recipe classes:
> - cargo_common.bbclass: pkg:cargo
> - cpan.bbclass: pkg:cpan (with prefix stripping)
> - go-mod.bbclass: pkg:golang
> - npm.bbclass: pkg:npm (with prefix stripping)
> - pypi.bbclass: pkg:pypi (with normalization)

The ecosystem PURL changes and git download PURLs are good, and we
should make them, but see comments below about adding purls to all
download locations.

It might be best to split apart this patch so that adding the
ecosystem PURLs are a separate patch, and also the change to add the
git purls to download items is also a separate patch, and third patch
for adding the PURLs to all non-git downloads (or drop that one if you
are OK and don't want to argue for it).


>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes-recipe/cargo_common.bbclass |   3 +
>  meta/classes-recipe/cpan.bbclass         |  11 ++
>  meta/classes-recipe/go-mod.bbclass       |   6 +
>  meta/classes-recipe/npm.bbclass          |   7 +
>  meta/classes-recipe/pypi.bbclass         |   6 +-
>  meta/classes/create-spdx-3.0.bbclass     |   7 +
>  meta/lib/oe/spdx30_tasks.py              | 175 +++++++++++++++++------
>  7 files changed, 172 insertions(+), 43 deletions(-)
>
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
> index bc44ad7918..0d3edfe4a7 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -240,3 +240,6 @@ EXPORT_FUNCTIONS do_configure
>  # https://github.com/rust-lang/libc/issues/3223
>  # https://github.com/rust-lang/libc/pull/3175
>  INSANE_SKIP:append =3D " 32bit-time"
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS =3D+ "pkg:cargo/${BPN}@${PV} "
> diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.=
bbclass
> index bb76a5b326..dbf44da9d2 100644
> --- a/meta/classes-recipe/cpan.bbclass
> +++ b/meta/classes-recipe/cpan.bbclass
> @@ -68,4 +68,15 @@ cpan_do_install () {
>         done
>  }
>
> +# Generate ecosystem-specific Package URL for SPDX
> +def cpan_spdx_name(d):
> +    bpn =3D d.getVar('BPN')
> +    if bpn.startswith('perl-'):
> +        return bpn[5:]
> +    elif bpn.startswith('libperl-'):
> +        return bpn[8:]
> +    return bpn
> +
> +SPDX_PACKAGE_URLS =3D+ "pkg:cpan/${@cpan_spdx_name(d)}@${PV} "
> +
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-=
mod.bbclass
> index a15dda8f0e..5b3cb2d8b9 100644
> --- a/meta/classes-recipe/go-mod.bbclass
> +++ b/meta/classes-recipe/go-mod.bbclass
> @@ -32,3 +32,9 @@ do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
>  # Make go install unpack the module zip files in the module cache direct=
ory
>  # before the license directory is polulated with license files.
>  addtask do_compile before do_populate_lic
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS =3D+ "pkg:golang/${GO_IMPORT}@${PV} "
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS =3D+ "pkg:golang/${GO_IMPORT}@${PV} "

These lines are duplicated

> diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bb=
class
> index 344e8b4bec..7bb791d543 100644
> --- a/meta/classes-recipe/npm.bbclass
> +++ b/meta/classes-recipe/npm.bbclass
> @@ -354,4 +354,11 @@ FILES:${PN} +=3D " \
>      ${nonarch_libdir} \
>  "
>
> +# Generate ecosystem-specific Package URL for SPDX
> +def npm_spdx_name(d):
> +    bpn =3D d.getVar('BPN')
> +    return bpn[5:] if bpn.startswith('node-') else bpn
> +
> +SPDX_PACKAGE_URLS =3D+ "pkg:npm/${@npm_spdx_name(d)}@${PV} "
> +
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
> index 9d46c035f6..e2d054af6d 100644
> --- a/meta/classes-recipe/pypi.bbclass
> +++ b/meta/classes-recipe/pypi.bbclass
> @@ -43,7 +43,8 @@ SECTION =3D "devel/python"
>  SRC_URI:prepend =3D "${PYPI_SRC_URI} "
>  S =3D "${UNPACKDIR}/${PYPI_PACKAGE}-${PV}"
>
> -UPSTREAM_CHECK_PYPI_PACKAGE ?=3D "${PYPI_PACKAGE}"
> +# Replace any '_' characters in the pypi URI with '-'s to follow the PyP=
i website naming conventions
> +UPSTREAM_CHECK_PYPI_PACKAGE ?=3D "${@pypi_normalize(d)}"

I don't think we want to change this line? Or if we do it needs to be
a separate patch with rationalization.

>
>  # Use the simple repository API rather than the potentially unstable pro=
ject URL
>  # More information on the pypi API specification is avaialble here:
> @@ -54,3 +55,6 @@ UPSTREAM_CHECK_URI ?=3D "https://pypi.org/simple/${@pyp=
i_normalize(d)}/"
>  UPSTREAM_CHECK_REGEX ?=3D "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[=
\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
>
>  CVE_PRODUCT ?=3D "python:${PYPI_PACKAGE}"
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS =3D+ "pkg:pypi/${@pypi_normalize(d)}@${PV} "

Hmm, this is supposed to be the actual name on PyPi, which is the same
as the UPSTREAM_CHECK_PYPI_PACKAGE definition... which is tricky. It
would be nice if users could set one variable that was the name as
known to PyPi to populate both UPSTREAM_CHECK_PYPI_PACKAGE and
SPDX_PACKAGE_URLS

CC Tim for his thoughts.



> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 9a6606dce6..265dc525bc 100644
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
> +    For example, "gitlab.example.com:pkg:gitlab" maps repositories hoste=
d \
> +    on gitlab.example.com to the pkg:gitlab PURL type. \
> +    github.com is always mapped to pkg:github by default."
> +
>  IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>  SDK_CLASSES +=3D "create-spdx-sdk-3.0"
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 62a00069df..6f0bdba975 100644
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
> @@ -384,6 +385,120 @@ def collect_dep_sources(dep_objsets, dest):
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
> +        # Use ecosystem PURL from SPDX_PACKAGE_URLS if available
> +        package_urls =3D (d.getVar('SPDX_PACKAGE_URLS') or '').split()
> +        for url in package_urls:
> +            if not url.startswith('pkg:yocto'):
> +                purl =3D url
> +                break

The git purls (before the else:) are fine to keep; they are definitely
correct. However, I don't think that we want to add the _recipe_ purl
to all download files at this time. It's very easy for that to be
incorrect or misleading (e.g. local files). We already have the PURL
on the recipe, so copying those same purls to the download files seems
of little value.

There might perhaps be some space to determine the "primary source" of
the recipe (e.g. when it's a tarball et. al.) and add a PURL to that,
or some mechanism to allow recipe writers set the PURL for a specific
SRC_URI, but as-written I don't think we can do this.

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
> @@ -447,10 +562,14 @@ def add_download_files(d, objset):
>                  )
>              )
>
> +            _enrich_source_package(d, dl, fd, file_name, primary_purpose=
)
> +
>              if fd.method.supports_checksum(fd):
>                  # TODO Need something better than hard coding this
>                  for checksum_id in ["sha256", "sha1"]:
> -                    expected_checksum =3D getattr(fd, "%s_expected" % ch=
ecksum_id, None)
> +                    expected_checksum =3D getattr(
> +                        fd, "%s_expected" % checksum_id, None
> +                    )
>                      if expected_checksum is None:
>                          continue
>
> @@ -506,7 +625,6 @@ def get_is_native(d):
>
>  def create_recipe_spdx(d):
>      deploydir =3D Path(d.getVar("SPDXRECIPEDEPLOY"))
> -    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
>      pn =3D d.getVar("PN")
>
>      license_data =3D oe.spdx_common.load_spdx_license_data(d)
> @@ -541,20 +659,6 @@ def create_recipe_spdx(d):
>
>      set_purls(recipe, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
>
> -    # TODO: This doesn't work before do_unpack because the license text =
has to
> -    # be available for recipes with NO_GENERIC_LICENSE
> -    # recipe_spdx_license =3D add_license_expression(
> -    #    d,
> -    #    recipe_objset,
> -    #    d.getVar("LICENSE"),
> -    #    license_data,
> -    # )
> -    # recipe_objset.new_relationship(
> -    #    [recipe],
> -    #    oe.spdx30.RelationshipType.hasDeclaredLicense,
> -    #    [oe.sbom30.get_element_link_id(recipe_spdx_license)],
> -    # )
> -

Please don't remove my comments

>      if val :=3D d.getVar("HOMEPAGE"):
>          recipe.software_homePage =3D val
>
> @@ -588,7 +692,6 @@ def create_recipe_spdx(d):
>              sorted(oe.sbom30.get_element_link_id(dep) for dep in dep_rec=
ipes),
>          )
>
> -    # Add CVEs
>      cve_by_status =3D {}
>      if include_vex !=3D "none":
>          patched_cves =3D oe.cve_check.get_patched_cves(d)
> @@ -598,8 +701,6 @@ def create_recipe_spdx(d):
>              description =3D patched_cve.get("justification", None)
>              resources =3D patched_cve.get("resource", [])
>
> -            # If this CVE is fixed upstream, skip it unless all CVEs are
> -            # specified.
>              if include_vex !=3D "all" and detail in (
>                  "fixed-version",
>                  "cpe-stable-backport",
> @@ -692,7 +793,6 @@ def create_recipe_spdx(d):
>
>
>  def load_recipe_spdx(d):
> -
>      return oe.sbom30.find_root_obj_in_jsonld(
>          d,
>          "static",
> @@ -717,10 +817,8 @@ def create_spdx(d):
>
>      pn =3D d.getVar("PN")
>      deploydir =3D Path(d.getVar("SPDXDEPLOY"))
> -    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))

This is removed because it's unused? In the future, please use
separate patches for that sort of thing

>      spdx_workdir =3D Path(d.getVar("SPDXWORK"))
>      include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
> -    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
>      is_native =3D get_is_native(d)
>
>      recipe, recipe_objset =3D load_recipe_spdx(d)
> @@ -783,7 +881,6 @@ def create_spdx(d):
>      dep_objsets, dep_builds =3D collect_dep_objsets(
>          d, direct_deps, "builds", "build-", oe.spdx30.build_Build
>      )
> -

I don't particularly mind formatting changes, as long as it makes them
PEP8 compliant, but I do find vertical space helps read the code so
please don't remove it. It also just adds unnnecessary (off-topic)
changes to the code review that we have to look at that.

>      if dep_builds:
>          build_objset.new_scoped_relationship(
>              [build],
> @@ -919,9 +1016,7 @@ def create_spdx(d):
>
>              # Add concluded license relationship if manually set
>              # Only add when license analysis has been explicitly perform=
ed
> -            concluded_license_str =3D d.getVar(
> -                "SPDX_CONCLUDED_LICENSE:%s" % package
> -            ) or d.getVar("SPDX_CONCLUDED_LICENSE")
> +            concluded_license_str =3D d.getVar("SPDX_CONCLUDED_LICENSE:%=
s" % package) or d.getVar("SPDX_CONCLUDED_LICENSE")
>              if concluded_license_str:
>                  concluded_spdx_license =3D add_license_expression(
>                      d, build_objset, concluded_license_str, license_data
> @@ -1011,13 +1106,12 @@ def create_spdx(d):
>                  status =3D "enabled" if feature in enabled else "disable=
d"
>                  build.build_parameter.append(
>                      oe.spdx30.DictionaryEntry(
> -                        key=3Df"PACKAGECONFIG:{feature}", value=3Dstatus
> +                        key=3Df"PACKAGECONFIG:{feature}",
> +                        value=3Dstatus
>                      )
>                  )
>
> -            bb.note(
> -                f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {=
len(disabled)} disabled"
> -            )
> +            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)} enable=
d, {len(disabled)} disabled")
>
>      oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "builds", deployd=
ir)
>
> @@ -1025,9 +1119,7 @@ def create_spdx(d):
>  def create_package_spdx(d):
>      deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
>      deploydir =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
> -
>      direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spd=
x")
> -
>      providers =3D oe.spdx_common.collect_package_providers(d, direct_dep=
s)
>      pkg_arch =3D d.getVar("SSTATE_PKGARCH")
>
> @@ -1205,15 +1297,15 @@ def write_bitbake_spdx(d):
>  def collect_build_package_inputs(d, objset, build, packages, files_by_ha=
sh=3DNone):
>      import oe.sbom30
>
> -    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spd=
x")
> -
> +    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_pac=
kage_spdx")

Why did you change this?

>      providers =3D oe.spdx_common.collect_package_providers(d, direct_dep=
s)
>
>      build_deps =3D set()
> +    missing_providers =3D set()
>
>      for name in sorted(packages.keys()):
>          if name not in providers:
> -            bb.note(f"Unable to find SPDX provider for '{name}'")
> +            missing_providers.add(name)
>              continue
>
>          pkg_name, pkg_hashfn =3D providers[name]
> @@ -1232,6 +1324,11 @@ def collect_build_package_inputs(d, objset, build,=
 packages, files_by_hash=3DNone)
>              for h, f in pkg_objset.by_sha256_hash.items():
>                  files_by_hash.setdefault(h, set()).update(f)
>
> +    if missing_providers:
> +        bb.fatal(
> +            f"Unable to find SPDX provider(s) for: {', '.join(sorted(mis=
sing_providers))}"
> +        )
> +

This is a good change, but off-topic, and should be its own patch

>      if build_deps:
>          objset.new_scoped_relationship(
>              [build],
> @@ -1390,6 +1487,7 @@ def create_image_spdx(d):
>
>                  set_timestamp_now(d, a, "builtTime")
>
> +
>          if artifacts:
>              objset.new_scoped_relationship(
>                  [image_build],
> @@ -1583,10 +1681,3 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_di=
r, toolchain_outputname):
>      oe.sbom30.write_jsonld_doc(
>          d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
>      )
> -    sbom_name =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
> -
> -    recipe, recipe_objset =3D load_recipe_spdx(d)
> -
> -    objset, sbom =3D oe.sbom30.create_sbom(d, sbom_name, [recipe], [reci=
pe_objset])
> -
> -    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spd=
x.json"))

Why is this removed?

> --
> 2.53.0
>

