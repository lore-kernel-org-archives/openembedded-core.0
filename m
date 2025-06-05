Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB46C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:15:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.10376.1749136503140347726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8xRWt47;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1173821e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749136501; x=1749741301; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtdW1jTZo2NiQEmlpwOFbk7I70GCoZ38iSKP2drWtNs=;
        b=W8xRWt47yQk/pYn616uCLVR9g9sXC03st3230n0WsvhiMQ4DIRkJmYaFA0Q9MQDQZ9
         kEdBB2O1YjL/iEc9Ttj9Np18nccmkafymJqEcbg2bh198puUvrelU5AiG5pjxC1KxPov
         aFctdRAHk1YcPV+9+NnzbBGVLlHW/MFxu4sn3V7yLdswX6m11k0YqqCXGxppobYc5pJ7
         nt/socUXRvAbfI1hENd76N/4vkRsS5JpvcY9xdXL5xEYtGBL3txbdEe6vAPrhdilBQ8r
         ypBO4BHWCJ0ZbQoYPVbqyGnEOdC+TIApqNlzK9eNaX+K0z1rRXiYRnQhIcad1ZQ6oTJe
         Bx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749136501; x=1749741301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtdW1jTZo2NiQEmlpwOFbk7I70GCoZ38iSKP2drWtNs=;
        b=IjKz4yJ2pot8U55t1UxiPnGd1sriuIzk6US4k/PPVj+sZyl7xujSsLT339jU8Tgwfk
         zVgUtpdyUZmN7Gx5R4+u/2N3ao3+4rAxQa19t7c9o0neKfm0p9zsUtRabf1a8Y2bebzP
         1ZPLzEAy/rwXGwAV3j0FvsgjHuW/TStYPy+qi3DhYHRXLWFVzkhgVQ/tdPHT1Dlttjdz
         lhmtjZilYdamWcsreKJGiLCMgoaOJ94UnXWzbRo9H11n6DzaG5ENLdYKAxK050pmiiyd
         lpMb2ARwDrUjrICNwyqhIao9r2apUGgddtcWvWZAoHzJhMJijmNJOSWVrXu+l8AXa6vc
         /kkg==
X-Gm-Message-State: AOJu0Yy+5p45TAsI7Q/FBjgxpJk07E0iUj+JTlu1CscZnj6CJyb3yvck
	5+F1O7fv91W7deHoSnzWK+4VwpaTMGZ0LGXvLzuYN3hdYFspNqZ0eGMMtSJ7uIuv/Tb60kJlMO3
	n7nNFjbbj2JgQrnjWwAKyUlbjC1+q8Y8=
X-Gm-Gg: ASbGncuAMdhKfzwV+X7SvBA6GjEVMI9uLSSELcgzvWvMhmR/CXJAz2UecktnTOb2ufy
	PS3OEPhNE3B/KVVZySOSaTA8YI3ntcUbD73W/osIrIgSVNeffnGUI9QJouaYk19GdcHtMB/O39y
	7BWdvQQQyLlBu3qzaKTD1reSYqNzOzUxMM9rSwK67uW0fIAUzneQtferjIkw==
X-Google-Smtp-Source: AGHT+IHHzeNDcNS1JRtLo78haitsQXfzQ1NdrEqSoKOCaCQfURNAK4cXNr8bV6lkPCHrEJl16Zr2Qa75U/1OOJBSifw=
X-Received: by 2002:a05:6512:318b:b0:553:2ca4:39e6 with SMTP id
 2adb3069b0e04-55357bd6ebemr2126392e87.50.1749136500792; Thu, 05 Jun 2025
 08:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250604112133.2581063-1-daniel.turull@ericsson.com> <20250604112133.2581063-3-daniel.turull@ericsson.com>
In-Reply-To: <20250604112133.2581063-3-daniel.turull@ericsson.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 5 Jun 2025 09:14:46 -0600
X-Gm-Features: AX0GCFsExgA8ozzfCk7hTzeN2Kd9K44X-rTyfpcX2AOL0ITjWX1kZINWVFbW3Tw
Message-ID: <CAJdd5Gb0BQWam4zCR2v+6GKiOXk7K3k3+65h4bHYffq43=2YdA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] spdx: add option to include only compiled sources
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>, Peter Marko <peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218031

On Wed, Jun 4, 2025 at 5:21=E2=80=AFAM <daniel.turull@ericsson.com> wrote:
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
> index 4caefc7673..daf43bce56 100644
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
> +    if len(compiled_sources) =3D=3D 0:

idiomatically, this would be:

   if not compiled_sources:
     return True

> +        return True
> +    # We remove the top directory, to match the format in compiled sourc=
es

This feels a little bit magic, can you explain why removing the top
directory is necessary and or correct to always perform?

> +    relative =3D filename[filename.find("/")+1:]

you use .find() a lot, but I think split() is more idiomatic:

  _, relative =3D filename.split("/", 1)

> +    basename =3D os.path.basename(filename)
> +    # We return always true if the file type is not in the list of compi=
led files

Why is this?

> +    if basename[basename.find("."):] not in types:

   if "." not in basename or basename.split(".", 1)[1] not in types:
      return True

> +        return True
> +    # Check that the file is in the list
> +    return relative in compiled_sources
> +
> +def get_compiled_sources(d):
> +    """
> +    Get list of compiled sources from debug information and normalize th=
e paths
> +    """
> +    import itertools
> +    source_info =3D oe.package.read_debugsources_file(d)
> +    if not source_info:
> +        bb.debug(1, "Do not have debugsources.list. Skipping")
> +        return [], []
> +
> +    # Sources are not split now in SPDX, so we aggregate them
> +    sources =3D list(set(itertools.chain.from_iterable(source_info.value=
s())))

sources should be a set, since you are using the "in" operator, which
is much for efficient for sets than lists (especially when they are
large)

> +    # Check extensions of files
> +    types =3D []
> +    for src in sources:
> +        basename =3D os.path.basename(src)
> +        # We check that the basename has an extension
> +        if basename.find(".") > 0:
> +            ext =3D basename[basename.find("."):]

Similarly:

  if "." in basename:
    stem, ext =3D basename.split(".", 1)

> +            if ext not in types and len(ext)>0:
> +                types.append(ext)

Making types a set would be more efficient, e.g.

   types =3D set()
   ...

   if ext:
      types.add(ext)

The "in" operator is much more efficient for sets than lists

> +    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)}=
 {str(types)}")
> +    return sources, types

