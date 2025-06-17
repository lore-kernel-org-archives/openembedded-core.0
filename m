Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AE9C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 15:10:02 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.21683.1750172999601807516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 08:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CWgrWH3T;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32adebb15c5so49672411fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750172998; x=1750777798; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbVkAJvAhmdCF7d18bEOv2YmtiPFGQDWBtSqbFumR0E=;
        b=CWgrWH3T1zkAfR92SQDgfaL+H9VH40FS6Rn/gXwiK6j4Inkt3aeYl0AoswIdDAaf3V
         AdwN3VQ8cVfLQdajwjlQK2VOHO6BnrA83UmMsCiicO0mj6NNsovzb8oWeYI2qOlF4UZa
         XLsuCOWHxCwyKTCH6+1SY88hqcguaV7zb0N02Ilb559Y1GpnO08T5kHXTVnG5ZZwxTK7
         r7leXbC6B1uuwKzIu9qXeI58jq4yM9Xs+f5UeFlSYyDLwISrls7Oyg6OrQi3wBhdGp3p
         B3xha0S/Ec/EtzTa5aXYI/bGQve+7miawaIOrjKv/zAmS4AegRRIdV7J4Msg/zzGxQaj
         OURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750172998; x=1750777798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbVkAJvAhmdCF7d18bEOv2YmtiPFGQDWBtSqbFumR0E=;
        b=IPxaJDF/nRRA+wmDgw3vl+4Y52Mwp7soa+Y5DgokJzYvxIlrU09VLi6QgTHE5RKEOQ
         iBcOSEMBHVAP+Gvo1ZnbTii2vqit34cCDnmx4FUymN+PVpUacwQ8Bd2NkmensLdVL0dX
         UdJ49APGURMIcRgOCFhpCcFf6c11oqaGNuoT7cvvK07fyEI0DkA+8hbUQCc96mm/cxE/
         0pE+nTIHh8epMx3DKvFXViy5wEvDRTkvQ4oVqK+SzjroY46dWiwlu1Plf7wYbf8q0Z3f
         TLUNnCW0qIPRcs7gs8pRIT44NabJSJk91mYxGD+k1q2qEYqHtTQEhSKNTd1/FAH2RPsB
         87bw==
X-Gm-Message-State: AOJu0YzC7JwceqRUYHveyp9ShpUnOsN5C9qb7hKDQkM+rgQwBL1jYe+g
	0n/1WCkG5QkSxI/8bVVXaEQC3FL98EGP1DdmsMj/UeRLtI7NPgbBntm5V8EBxoL0qtrbFYx07yA
	5iuKat8lbUMO+UdMa9VI1boKZ3RdMI3k=
X-Gm-Gg: ASbGnctIdSX6uf0wxIZ40dtKPW6EPE9fFhrAlz14AD+/cK/q6YDMZUFpYkeqm4bxvxX
	r21rAZzii9mkUtwQ2WsJMOCiMZ8atP1rWc0TpkK2fMrdlxW8Z92leptSJlt1dE5cz7qc8i7Aet4
	U+5bXtVUSGSaXpFJhoB+zFcKTfS2W9gwxl1/uhiSFEo3RYI8mRO+2L+C8Olg==
X-Google-Smtp-Source: AGHT+IFQIgasFaHCBFMj9D1k7H2NKHHgoXhGNe05l7LbpCKbkoBoHTL8hU245mSIe8RQ9SdxcwIJIA43M7XCAdy1Lxg=
X-Received: by 2002:a2e:b893:0:b0:32b:3c11:5177 with SMTP id
 38308e7fff4ca-32b4a4acd07mr40220561fa.21.1750172997247; Tue, 17 Jun 2025
 08:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250610152443.2162164-1-daniel.turull@ericsson.com> <20250610152443.2162164-3-daniel.turull@ericsson.com>
In-Reply-To: <20250610152443.2162164-3-daniel.turull@ericsson.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 17 Jun 2025 09:09:42 -0600
X-Gm-Features: AX0GCFsvZmefINcHawOy5Jq81IiK5WX_1wt7WSxuF8OHx-hVKv-9YWZffrkJO74
Message-ID: <CAJdd5GYwfN2saXv_mLWgycQBXtE_vaZyCwT+0M4N8i-GM9Q+iA@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] spdx: add option to include only compiled sources
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>, Peter Marko <peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 15:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218882

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Jun 10, 2025 at 9:25=E2=80=AFAM <daniel.turull@ericsson.com> wrote:
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
> source code files that are used during compilation.
>
> It uses debugsource information generated during do_package.
>
> This enables an external tool to use the SPDX information to disregard
> vulnerabilities that are not compiled.
>
> As example, when used with the default config with linux-yocto, the spdx =
size is
> reduced from 156MB to 61MB.
>
> Tested with bitbake world on oe-core.
>
> CC: Quentin Schulz <quentin.schulz@cherry.de>
> CC: Joshua Watt <JPEWhacker@gmail.com>
> CC: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass |  9 ++++++
>  meta/classes/spdx-common.bbclass     |  3 ++
>  meta/lib/oe/spdx30_tasks.py          | 10 +++++++
>  meta/lib/oe/spdx_common.py           | 41 ++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index 7e8f8b9ff5..6fc60a1d97 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -137,6 +137,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_=
spdxid, get_types, *, archiv
>      spdx_files =3D []
>
>      file_counter =3D 1
> +
> +    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES")=
 =3D=3D "1"
> +    if check_compiled_sources:
> +        compiled_sources, types =3D oe.spdx_common.get_compiled_sources(=
d)
> +        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
>      for subdir, dirs, files in os.walk(topdir):
>          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
>          if subdir =3D=3D str(topdir):
> @@ -147,6 +152,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_=
spdxid, get_types, *, archiv
>              filename =3D str(filepath.relative_to(topdir))
>
>              if not filepath.is_symlink() and filepath.is_file():
> +                # Check if file is compiled
> +                if check_compiled_sources:
> +                     if not oe.spdx_common.is_compiled_source(filename, =
compiled_sources, types):
> +                          continue
>                  spdx_file =3D oe.spdx.SPDXFile()
>                  spdx_file.SPDXID =3D get_spdxid(file_counter)
>                  for t in get_types(filepath):
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index 713a7fc651..ca0416d1c7 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??=3D "1.0"
>  SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
>
>  SPDX_INCLUDE_SOURCES ??=3D "0"
> +SPDX_INCLUDE_COMPILED_SOURCES ??=3D "0"
>
>  SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
>  SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
> @@ -40,6 +41,8 @@ SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>  python () {
>      from oe.cve_check import extend_cve_status
>      extend_cve_status(d)
> +    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =3D=3D "1":
> +        d.setVar("SPDX_INCLUDE_SOURCES", "1")
>  }
>
>  def create_spdx_source_deps(d):
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 61d7ba45e3..beeafc2bb7 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -156,6 +156,11 @@ def add_package_files(
>          bb.note(f"Skip {topdir}")
>          return spdx_files
>
> +    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES")=
 =3D=3D "1"
> +    if check_compiled_sources:
> +        compiled_sources, types =3D oe.spdx_common.get_compiled_sources(=
d)
> +        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
> +
>      for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
>          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
>          if subdir =3D=3D str(topdir):
> @@ -171,6 +176,11 @@ def add_package_files(
>              filename =3D str(filepath.relative_to(topdir))
>              file_purposes =3D get_purposes(filepath)
>
> +            # Check if file is compiled
> +            if check_compiled_sources:
> +                if not oe.spdx_common.is_compiled_source(filename, compi=
led_sources, types):
> +                    continue
> +
>              spdx_file =3D objset.new_file(
>                  get_spdxid(file_counter),
>                  filename,
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 4caefc7673..c2dec65563 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -242,3 +242,44 @@ def fetch_data_to_uri(fd, name):
>          uri =3D uri + "@" + fd.revision
>
>      return uri
> +
> +def is_compiled_source (filename, compiled_sources, types):
> +    """
> +    Check if the file is a compiled file
> +    """
> +    import os
> +    # If we don't have compiled source, we assume all are compiled.
> +    if not compiled_sources:
> +        return True
> +
> +    # We return always true if the file type is not in the list of compi=
led files.
> +    # Some files in the source directory are not compiled, for example, =
Makefiles,
> +    # but also python .py file. We need to include them in the SPDX.
> +    basename =3D os.path.basename(filename)
> +    ext =3D basename.partition(".")[2]
> +    if ext not in types:
> +        return True
> +    # Check that the file is in the list
> +    return filename in compiled_sources
> +
> +def get_compiled_sources(d):
> +    """
> +    Get list of compiled sources from debug information and normalize th=
e paths
> +    """
> +    import itertools
> +    source_info =3D oe.package.read_debugsources_info(d)
> +    if not source_info:
> +        bb.debug(1, "Do not have debugsources.list. Skipping")
> +        return [], []
> +
> +    # Sources are not split now in SPDX, so we aggregate them
> +    sources =3D set(itertools.chain.from_iterable(source_info.values()))
> +    # Check extensions of files
> +    types =3D set()
> +    for src in sources:
> +        basename =3D os.path.basename(src)
> +        ext =3D basename.partition(".")[2]
> +        if ext not in types and ext:
> +            types.add(ext)
> +    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)}=
 {str(types)}")
> +    return sources, types

