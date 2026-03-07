Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B3EF5510A
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 21:53:26 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18068.1772920398769318474
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 13:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vbn5Yqo/;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79801df3e21so93803167b3.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 13:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772920398; cv=none;
        d=google.com; s=arc-20240605;
        b=JlMqa93xTSjDcntUyNiLtswrTMW2crdxaui8H8QiaPbulDyy5gNfH+fCRct4K0X8rd
         6YAa6PP2KPPvVw8zsclKxCsFr08uB05HCRk8xerKdu1ycSjBRgF9EW7MR+5l17NKUZ0i
         4AmwMZGu2emqxE1Uz9vDV3g0tVsE37kJau25E9K05gveS8p/0sUAQ0/6rUfVt5oL3SYC
         +YJwaITr/LbG2u6YFks1PxzMOKA9JyI79qNbJoe7M1M2JTyr6eMVJmc75Qh5m4TsnaJu
         Uq44Cyx4O94MVUvi+YTBek8SL4mCkfr9iWxjVmB6w602voepQXQbpbI9TYfH3bvWt/UI
         1iaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NkqQd1cZETXPo0arLRShKiHff2fJXt6JplyqPMT6n/k=;
        fh=+56fr8oC44TsvrkKtM/RCoPNRtxwzn4I3GjUOOlVKC0=;
        b=A17ABM3EXJ4xq+6PCBfC3zNbTDBsUhemwIfIk5wRk6/3nhYRNJxFunEPrGQWPnSDY0
         QRpKZNtxWFgma90BjxjdzfVZgEAlLOBtE8ej8WRWzD3w7zb81k0/EAae/YwGSimEmmRL
         JdJ8EIWdSJhxoWuzWieKh1upfUsJzD2i4KF7/StuM7v6gvnNiRTCBFj9Sh6Rk+OAjB6p
         16PspDtT2NM7+XLXd4qVcK/HRXh1l3GApez82hhtLKUdGSLfgqmWo+1dJEyLjgwTg/Az
         gcgca3f0wS7xen63ls4Hn6Er9qZOA4jkToKZjDWdzLaagYDIgWAcnozZ3EUlkzgNjSso
         QuMg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772920398; x=1773525198; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkqQd1cZETXPo0arLRShKiHff2fJXt6JplyqPMT6n/k=;
        b=Vbn5Yqo/kKa+7EjdZK+XlIvRjtUJlHC7/gZ+dFm5YcdmoiYYmMQcrRIR4NFj8andBA
         zLluRAfBVvByZ0mkcfufsaJkkm3yiP2UCqg1A8tDhvCD79/YSRS2DoDIwuQu1zRoOCoy
         n6qAETiJh3kdmCkr3W4e+7E/Jb1DSk0halYhrrqQ+77ExsCl0Fdt2oUIuMSO+yKcju8R
         K37kJbn/TagGsiyk9LSxsaHzdjxXNQhKCRrV135zikqwhUyO3sWiFbOA0YMsMM8t+yFE
         kH5D1ujc7GoYhsa/5Pvyx7Fp9U6myp2627bD1JRpS4TLfZKLjE6KH8h6xHZB/spmJfDM
         yCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772920398; x=1773525198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NkqQd1cZETXPo0arLRShKiHff2fJXt6JplyqPMT6n/k=;
        b=WZvUiQB5m7nEAi4189ZvtJ/CY/PcogbUPlJhWuGoqMJM7nDRdEiNyacZoOymDPV9Hj
         TbAyTf13LyctrXDubGJKlyYl/4i5jQiCBMKOtGuASzQkaAmfnp3ZY2MUk2hNtR7Y2T1d
         Ou56IY7ATy7h6UVvk437nQzclF4UHJ5E/ugkof0HoxxDMDSlzavv/rTekSVGPnDnmIGC
         nagZ2bhovBulhhsbfotlIZ9F3phHgRmrARHOgglWNYEo1/zAen+zDSBhbrHzyr6IcwqR
         RJXHF7nPIdSZIs2eOkVOjjwzy61F/QGUNAC06CXANGYSMEx7wvKKojovkgsLXel+tv7M
         RUuA==
X-Gm-Message-State: AOJu0YxPqOvgGyACEESUDJnC9fTYWKSl1oOlIJwiJeBMevIQ5MV/NFGF
	lh3SRtFID/di6SV0Y6wGvDCf5aKqJtwwkuJoO7dcNrY1hVBsjrPLVw5LhejZD/9SE86qf9/y2lq
	G/Yat63Pm2GPSt5AKsxoDpldUGk8QJsk=
X-Gm-Gg: ATEYQzyUlroh7jd5RkQJa39TVPXT5l2pAz43iwlPPWE4mSdlCnbiORJbuOi0MXiNnLR
	BzbAng0XOky5cPWcTYa/lsp9NEBe/TiRLI3w+DwSIbgCQixiMi1g+wHJ1JxbVKNwVFRkc9jeutd
	xDZqbNdMpyzq4zL6wPrjKWGfLX24PxBLAQrZnF3teCQPAzk8fkCCCuFG/tefe94KfInnqrKBad+
	/i5V1/1G0drhyh7O+1gwICseh9ztru590rwcY+m9oN/aYaHjoTnOpX/NqWLrXW3AVQM8tjS+biv
	r8KdqGX0ujcy2VWSKaHzEcWxsIom8zL/
X-Received: by 2002:a05:690c:d8b:b0:797:ef49:a4a0 with SMTP id
 00721157ae682-798dd788369mr63958427b3.46.1772920397740; Sat, 07 Mar 2026
 13:53:17 -0800 (PST)
MIME-Version: 1.0
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com> <20260304170541.180868-2-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260304170541.180868-2-stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 14:53:06 -0700
X-Gm-Features: AaiRm50ESjen8mhMcQavsy8QOroUvL82ScCOKOuTnT2mtzr7opsF9lNF1exB-a4
Message-ID: <CAJdd5GaL7UXxFVa3TXGhVENgJqfMcM4AkXxzoafj22pN7J-u2g@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] spdx30: Add configurable file filtering support
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 21:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232616

On Wed, Mar 4, 2026 at 10:05=E2=80=AFAM Stefano Tondo <stondo@gmail.com> wr=
ote:
>
> This commit adds file filtering capabilities to SPDX 3.0 SBOM generation
> to reduce SBOM size and focus on relevant files.
>
> New configuration variables (in spdx-common.bbclass):
>
>   SPDX_FILE_FILTER (default: "all"):
>     - "all": Include all files (current behavior)
>     - "essential": Include only LICENSE/README/NOTICE files
>     - "none": Skip all files

Having file "classes" like this seems unnecessary, and it also seems
unlikely that anyone will agree what goes in each class. A variable
with a list of regexes that is used to filter the files is fine, but
leave it up the end users to decide what should be included/excluded.
IOW, drop all these variables and just have
SPDX_FILE_PATTERNS/SPDX_FILE_EXCLUDE_PATTERNS variable(s), which
default to empty and do nothing if so.

>
>   SPDX_FILE_ESSENTIAL_PATTERNS (extensible):
>     - Space-separated patterns for essential files
>     - Default: LICENSE COPYING README NOTICE COPYRIGHT etc.
>     - Recipes can extend: SPDX_FILE_ESSENTIAL_PATTERNS +=3D "MANIFEST"
>
>   SPDX_FILE_EXCLUDE_PATTERNS (extensible):
>     - Patterns to exclude in 'essential' mode
>     - Default: .patch .diff test_ /tests/ .pyc .o etc.
>     - Recipes can extend: SPDX_FILE_EXCLUDE_PATTERNS +=3D ".tmp"
>
> Implementation (in spdx30_tasks.py):
>
>   - add_package_files(): Apply filtering during file walk
>   - get_package_sources_from_debug(): Skip debug source lookup for
>     filtered files instead of failing
>
> Impact:
>
>   - Essential mode reduces file components by ~96% (2,376 =E2=86=92 ~90 f=
iles)
>   - Filters out patches, test files, and build artifacts
>   - Configurable per-recipe via variable extension
>   - No impact when SPDX_FILE_FILTER=3D"all" (default)
>
> This is useful for creating compact SBOMs for compliance and distribution
> where only license-relevant files are needed.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/spdx-common.bbclass | 37 +++++++++++++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py      | 44 +++++++++++++++++++++++++++++---
>  2 files changed, 77 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index 3110230c9e..81c61e10dc 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -54,6 +54,43 @@ SPDX_CONCLUDED_LICENSE[doc] =3D "The license concluded=
 by manual or external \
>
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
> +SPDX_FILES_INCLUDED ??=3D "all"
> +SPDX_FILES_INCLUDED[doc] =3D "Controls which files are included in SPDX =
output. \
> +    Values: 'all' (include all files), 'essential' (only LICENSE/README/=
NOTICE files), \
> +    'none' (no files). The 'essential' mode reduces SBOM size by excludi=
ng patches, \
> +    tests, and build artifacts."
> +
> +SPDX_FILE_ESSENTIAL_PATTERNS ??=3D "LICENSE COPYING README NOTICE COPYRI=
GHT PATENTS ACKNOWLEDGEMENTS THIRD-PARTY-NOTICES"
> +SPDX_FILE_ESSENTIAL_PATTERNS[doc] =3D "Space-separated list of file name=
 patterns to \
> +    include when SPDX_FILES_INCLUDED=3D'essential'. Recipes can extend t=
his to add their \
> +    own essential files (e.g., 'SPDX_FILE_ESSENTIAL_PATTERNS +=3D \"MANI=
FEST\"')."
> +
> +SPDX_FILE_EXCLUDE_PATTERNS ??=3D ".patch .diff test_ _test. /test/ /test=
s/ .pyc .pyo .o .a .la"
> +SPDX_FILE_EXCLUDE_PATTERNS[doc] =3D "Space-separated list of patterns to=
 exclude when \
> +    SPDX_FILES_INCLUDED=3D'essential'. Files matching these patterns are=
 filtered out. \
> +    Recipes can extend this to exclude additional file types."
> +
> +SBOM_COMPONENT_NAME ??=3D ""
> +SBOM_COMPONENT_NAME[doc] =3D "Name of the SBOM metadata component. If se=
t, creates a \
> +    software_Package element in the SBOM with image/product information.=
 Typically \
> +    set to IMAGE_BASENAME or product name."

I'm not sure why this change is in this patch? Same for the other
following variables.

> +
> +SBOM_COMPONENT_VERSION ??=3D "${DISTRO_VERSION}"
> +SBOM_COMPONENT_VERSION[doc] =3D "Version of the SBOM metadata component.=
 Used when \
> +    SBOM_COMPONENT_NAME is set. Defaults to DISTRO_VERSION."
> +
> +SBOM_COMPONENT_SUMMARY ??=3D ""
> +SBOM_COMPONENT_SUMMARY[doc] =3D "Description of the SBOM metadata compon=
ent. Used when \
> +    SBOM_COMPONENT_NAME is set. Typically set to IMAGE_SUMMARY or produc=
t description."
> +
> +SBOM_SUPPLIER_NAME ??=3D ""
> +SBOM_SUPPLIER_NAME[doc] =3D "Name of the organization supplying the SBOM=
. If set, \
> +    creates an Organization element in the SBOM with supplier informatio=
n."
> +
> +SBOM_SUPPLIER_URL ??=3D ""
> +SBOM_SUPPLIER_URL[doc] =3D "URL of the organization supplying the SBOM. =
Used when \
> +    SBOM_SUPPLIER_NAME is set. Adds an external identifier with the orga=
nization URL."
> +
>  python () {
>      from oe.cve_check import extend_cve_status
>      extend_cve_status(d)
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 99f2892dfb..bd703b5bec 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -161,6 +161,11 @@ def add_package_files(
>          compiled_sources, types =3D oe.spdx_common.get_compiled_sources(=
d)
>          bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
>
> +    # File filtering configuration
> +    spdx_file_filter =3D (d.getVar("SPDX_FILE_FILTER") or "all").lower()
> +    essential_patterns =3D (d.getVar("SPDX_FILE_ESSENTIAL_PATTERNS") or =
"").split()
> +    exclude_patterns =3D (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").=
split()
> +
>      for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
>          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
>          if subdir =3D=3D str(topdir):
> @@ -174,6 +179,26 @@ def add_package_files(
>                  continue
>
>              filename =3D str(filepath.relative_to(topdir))
> +
> +            # Apply file filtering if enabled
> +            if spdx_file_filter =3D=3D "essential":
> +                file_upper =3D file.upper()
> +                filename_lower =3D filename.lower()
> +
> +                # Skip if matches exclude patterns
> +                skip_file =3D any(pattern in filename_lower for pattern =
in exclude_patterns)
> +                if skip_file:
> +                    continue
> +
> +                # Keep only essential files (license/readme/etc)
> +                is_essential =3D any(pattern in file_upper for pattern i=
n essential_patterns)
> +                if not is_essential:
> +                    continue
> +            elif spdx_file_filter =3D=3D "none":
> +                # Skip all files
> +                continue
> +            # else: spdx_file_filter =3D=3D "all" or any other value - i=
nclude all files
> +
>              file_purposes =3D get_purposes(filepath)
>
>              # Check if file is compiled
> @@ -219,6 +244,8 @@ def add_package_files(
>  def get_package_sources_from_debug(
>      d, package, package_files, sources, source_hash_cache
>  ):
> +    spdx_file_filter =3D (d.getVar("SPDX_FILE_FILTER") or "all").lower()
> +
>      def file_path_match(file_path, pkg_file):
>          if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
>              return True
> @@ -251,10 +278,19 @@ def get_package_sources_from_debug(
>              continue
>
>          if not any(file_path_match(file_path, pkg_file) for pkg_file in =
package_files):
> -            bb.fatal(
> -                "No package file found for %s in %s; SPDX found: %s"
> -                % (str(file_path), package, " ".join(p.name for p in pac=
kage_files))
> -            )
> +            # When file filtering is active, some files may be filtered =
out
> +            # Skip debug source lookup instead of failing
> +            if spdx_file_filter in ("none", "essential"):
> +                bb.debug(
> +                    1,
> +                    f"Skipping debug source lookup for {file_path} in {p=
ackage} (filtered by SPDX_FILE_FILTER=3D{spdx_file_filter})",
> +                )
> +                continue
> +            else:
> +                bb.fatal(
> +                    "No package file found for %s in %s; SPDX found: %s"
> +                    % (str(file_path), package, " ".join(p.name for p in=
 package_files))
> +                )
>              continue
>
>          for debugsrc in file_data["debugsrc"]:
> --
> 2.53.0
>

