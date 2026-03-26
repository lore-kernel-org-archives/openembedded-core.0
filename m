Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1528610AB81F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 20:11:40 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58144.1774555892014432042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 13:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CMLdXzpT;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64937edbc9eso1456979d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774555891; cv=none;
        d=google.com; s=arc-20240605;
        b=EHZcwKm0w0RCfMszJbNv+qYXldtxkLhStQyPaOHbj/b9FmsfAB1GzGzNqTsb1+IVu9
         YNdzsUqUij5xRf5DSwJeoopPnlKOg1cqGDbAnBOsIVQkLqxm9gzk/iyISXpHqVW0ryNe
         Os6BmPvZe42OnnqSqdrofblVnNrKeswa4edgfiCS6TuKlNhQxpvGHJTSZEm5usl0iuLp
         hiWcUVNQgnKmvsyP09ynccg2Y2O6iZwpO5w4GgbURwailyEJ3sRCHkHJZ15+VjHKjOsk
         7CXxtQ1U/j73ucZVUFvyOag6vEkiAErJCHCik7AcdyYoJFkzNviHv9TB8oeMhkCIcGv7
         l/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=30oOJd806MDi1eoVPVdUANEFWe6Je+CZXElVJNoqhHU=;
        fh=XL+ydw4zRzqZKs8yhWIx30/frJay1bXF2X1wuGsnf7M=;
        b=PxWKnMft9DuribxzeiK5G6dFu5yng6sTAlV212RuOGxvtG3l7aqD77+MxLYAB9JrR4
         cOfg7oa8MhRciXGehvQ1ysjdzt4HNJlucIIMQVjSdrZkVlxuSrSdLPRPZV68qkw4a/HM
         ZNwaGX3fFCaZYl52pwwMsgfPm+gTNg0X7qSbY4p+RILxC6lcGKTRFDV6Me81fQV1kUnz
         Rztf4rAaG01AGSq4kZ7NzCIsr6CHpssIGk/HYSeYd7SEbaAK+Jpo9vRBTQ8N0ztb0HyI
         cMJVyzANyNWDnpJxFLQI+E3yGOCxiO73yD5rbSYkkWv4mrLRozTsru/Ph8TXe/utSwPF
         Qkog==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774555891; x=1775160691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30oOJd806MDi1eoVPVdUANEFWe6Je+CZXElVJNoqhHU=;
        b=CMLdXzpT3JycDnwVsr9ZojqLgSgK16yvkDx9QO/r/5aLQnTXKAs9OAFSJVaf/BNo8m
         fpFRs7uhzufbK1OLo0Xpm+L5yeyWVGsHab7aTTBgjASxYCsngnXgTh0Q3fg0Z3jqjtY1
         I9g2niQymZp+iwMx8ytdvPA3mFwB9MqQXv4zGGFrEy4F7/KnqWPr3kTaAZ/SOwBj5Zrl
         p9svJatSHFyjK3QkafotroWBxLnbbPMms2+iHB2YMsdrIb/eFrm1q581wEpLfjwfWI93
         5zyEJV3gphvS2Bzps1DIdBmdw3xzm0TX9n5d8p3iQC9RBVRZK2j7n6Jpkekpm45h4Rdg
         Mi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774555891; x=1775160691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=30oOJd806MDi1eoVPVdUANEFWe6Je+CZXElVJNoqhHU=;
        b=Oqu71TtEzlRjJLUNjeG9f1125ay+/hS/0CMncyb6/mc7EMvW8ii86t+OD/BZCcShwR
         OUfVQwSP8y2hz2tHUKjRmXrjL7fcFT7LoOrqDyzfb991ouk7Wcs2O8ZPT7SuEYSLE8iv
         FXwNmaj3ZZwcHOJfBzk184VWemNHBZimUMqYm8wXuQzfjN8BJaddVaFGEaH4qEwppg0f
         gIAtdx3Xsru0V4c1IjUySYp7Qb5ST1b2GTZ6lyzondcyFUUnY2DW+/OoC9tiFIKD2i7P
         Qi0ZOHoP/A2AXghEZTAudCNHUrmzMcU1Ux4+BViH+hTLuA+keFu5XqEwjUhWEzPCJ0+Q
         5seA==
X-Gm-Message-State: AOJu0YwL3IZ/N55uM6S1b/ACjYibPt5hlx+d6u/6Vdn4G8vpRsqMmN3S
	y74uqi3W6K8tpniWCDwkxkfgbpQr3cSnHeoiCoeDeX5jPgO2gyP+yzeUiMYnfAWTBk6js8QlA4B
	lB1WhZ1T0Yce20Ihowrdc7uzv+lHAiQE=
X-Gm-Gg: ATEYQzxxBRoiF5+bL3QkvHDtGOHgJF8OBAU/lWJCP3Vt6a6TcgdB2H0hT4I4caAx0cg
	C6j0Jt7kzS4JnRUWA4QwX2vtgDwTnCiyIc0I1bgK+ORczr5OR9ZQ/jswmWbxFqcfNfeYERDXIT+
	7GloIeWu5Em0kb/xGogQvh12aJoOsrFumTglPgQZOnALPM8YjmTYhjJf1CqK4JnwL9D3aLAHmfL
	XCumDJ02cuYt5OFAPc+kBJhNEex4t+f1G9q8kys185oQfSm0btx88tZB2Kwmpq2dB3CjU1YoJhl
	CDgJjgFgp7fd2P9Xnmo3mA==
X-Received: by 2002:a05:690c:dd6:b0:79a:dedc:59ea with SMTP id
 00721157ae682-79adedc7344mr65553337b3.42.1774555891007; Thu, 26 Mar 2026
 13:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260324132958.2316491-1-stondo@gmail.com> <20260324171502.689012-2-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260324171502.689012-2-stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 26 Mar 2026 14:11:19 -0600
X-Gm-Features: AQROBzAnYJZKimemtIA7f7yZycN7oCYEx088Fo0Of8-g7z1HEmhnT7iqF56tMd0
Message-ID: <CAJdd5GYq9mObajkL6CNXY8zB+y0q7qgSnGej4Sr+9pyKE4npJA@mail.gmail.com>
Subject: Re: [PATCH v16 1/5] spdx30: Add configurable file exclusion pattern support
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
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 20:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234047

On Tue, Mar 24, 2026 at 11:15=E2=80=AFAM Stefano Tondo <stondo@gmail.com> w=
rote:
>
> Add SPDX_FILE_EXCLUDE_PATTERNS variable that allows filtering files from
> SPDX output by regex matching. The variable accepts a space-separated
> list of Python regular expressions; files whose paths match any pattern
> (via re.search) are excluded.
>
> When empty (the default), no filtering is applied and all files are
> included, preserving existing behavior.
>
> This enables users to reduce SBOM size by excluding files that are not
> relevant for compliance (e.g., test files, object files, patches).
>
> Excluded files are tracked in a set returned from add_package_files()
> and passed to get_package_sources_from_debug(), which uses the set for
> precise cross-checking rather than re-evaluating patterns.

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/spdx-common.bbclass |  7 +++
>  meta/lib/oe/spdx30_tasks.py      | 80 +++++++++++++++++++++-----------
>  2 files changed, 60 insertions(+), 27 deletions(-)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index 83f05579b6..40701730a6 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -82,6 +82,13 @@ SPDX_MULTILIB_SSTATE_ARCHS[doc] =3D "The list of sstat=
e architectures to consider
>      when collecting SPDX dependencies. This includes multilib architectu=
res when \
>      multilib is enabled. Defaults to SSTATE_ARCHS."
>
> +SPDX_FILE_EXCLUDE_PATTERNS ??=3D ""
> +SPDX_FILE_EXCLUDE_PATTERNS[doc] =3D "Space-separated list of Python regu=
lar \
> +    expressions to exclude files from SPDX output. Files whose paths mat=
ch \
> +    any pattern (via re.search) will be filtered out. Defaults to empty =
\
> +    (no filtering). Example: \
> +    SPDX_FILE_EXCLUDE_PATTERNS =3D '\\.patch$ \\.diff$ /test/ \\.pyc$ \\=
.o$'"
> +
>  python () {
>      from oe.cve_check import extend_cve_status
>      extend_cve_status(d)
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 353d783fa2..68ed821a8c 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -13,6 +13,7 @@ import oe.spdx30
>  import oe.spdx_common
>  import oe.sdk
>  import os
> +import re
>
>  from contextlib import contextmanager
>  from datetime import datetime, timezone
> @@ -157,17 +158,27 @@ def add_package_files(
>      file_counter =3D 1
>      if not os.path.exists(topdir):
>          bb.note(f"Skip {topdir}")
> -        return spdx_files
> +        return spdx_files, set()
>
>      check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES")=
 =3D=3D "1"
>      if check_compiled_sources:
>          compiled_sources, types =3D oe.spdx_common.get_compiled_sources(=
d)
>          bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
>
> +    exclude_patterns =3D [
> +        re.compile(pattern)
> +        for pattern in (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").sp=
lit()
> +    ]
> +    excluded_files =3D set()
> +
>      for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
> -        dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
> +        dirs[:] =3D [directory for directory in dirs if directory not in=
 ignore_dirs]
>          if subdir =3D=3D str(topdir):
> -            dirs[:] =3D [d for d in dirs if d not in ignore_top_level_di=
rs]
> +            dirs[:] =3D [
> +                directory
> +                for directory in dirs
> +                if directory not in ignore_top_level_dirs
> +            ]
>
>          dirs.sort()
>          files.sort()
> @@ -177,14 +188,19 @@ def add_package_files(
>                  continue
>
>              filename =3D str(filepath.relative_to(topdir))
> +
> +            if exclude_patterns and any(
> +                pattern.search(filename) for pattern in exclude_patterns
> +            ):
> +                excluded_files.add(filename)
> +                continue
> +
>              file_purposes =3D get_purposes(filepath)
>
> -            # Check if file is compiled
> -            if check_compiled_sources:
> -                if not oe.spdx_common.is_compiled_source(
> -                    filename, compiled_sources, types
> -                ):
> -                    continue
> +            if check_compiled_sources and not oe.spdx_common.is_compiled=
_source(
> +                filename, compiled_sources, types
> +            ):
> +                continue
>
>              spdx_file =3D objset.new_file(
>                  get_spdxid(file_counter),
> @@ -218,12 +234,15 @@ def add_package_files(
>
>      bb.debug(1, "Added %d files to %s" % (len(spdx_files), objset.doc._i=
d))
>
> -    return spdx_files
> +    return spdx_files, excluded_files
>
>
>  def get_package_sources_from_debug(
> -    d, package, package_files, sources, source_hash_cache
> +    d, package, package_files, sources, source_hash_cache, excluded_file=
s=3DNone
>  ):
> +    if excluded_files is None:
> +        excluded_files =3D set()
> +
>      def file_path_match(file_path, pkg_file):
>          if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
>              return True
> @@ -256,6 +275,12 @@ def get_package_sources_from_debug(
>              continue
>
>          if not any(file_path_match(file_path, pkg_file) for pkg_file in =
package_files):
> +            if file_path.lstrip("/") in excluded_files:
> +                bb.debug(
> +                    1,
> +                    f"Skipping debug source lookup for excluded file {fi=
le_path} in {package}",
> +                )
> +                continue
>              bb.fatal(
>                  "No package file found for %s in %s; SPDX found: %s"
>                  % (str(file_path), package, " ".join(p.name for p in pac=
kage_files))
> @@ -737,7 +762,7 @@ def create_spdx(d):
>          bb.debug(1, "Adding source files to SPDX")
>          oe.spdx_common.get_patched_src(d)
>
> -        files =3D add_package_files(
> +        files, _ =3D add_package_files(
>              d,
>              build_objset,
>              spdx_workdir,
> @@ -909,7 +934,7 @@ def create_spdx(d):
>                  )
>
>              bb.debug(1, "Adding package files to SPDX for package %s" % =
pkg_name)
> -            package_files =3D add_package_files(
> +            package_files, excluded_files =3D add_package_files(
>                  d,
>                  pkg_objset,
>                  pkgdest / package,
> @@ -932,7 +957,8 @@ def create_spdx(d):
>
>              if include_sources:
>                  debug_sources =3D get_package_sources_from_debug(
> -                    d, package, package_files, dep_sources, source_hash_=
cache
> +                    d, package, package_files, dep_sources, source_hash_=
cache,
> +                    excluded_files=3Dexcluded_files,
>                  )
>                  debug_source_ids |=3D set(
>                      oe.sbom30.get_element_link_id(d) for d in debug_sour=
ces
> @@ -944,7 +970,7 @@ def create_spdx(d):
>
>      if include_sources:
>          bb.debug(1, "Adding sysroot files to SPDX")
> -        sysroot_files =3D add_package_files(
> +        sysroot_files, _ =3D add_package_files(
>              d,
>              build_objset,
>              d.expand("${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"),
> @@ -1326,18 +1352,18 @@ def create_image_spdx(d):
>              image_filename =3D image["filename"]
>              image_path =3D image_deploy_dir / image_filename
>              if os.path.isdir(image_path):
> -                a =3D add_package_files(
> -                    d,
> -                    objset,
> -                    image_path,
> -                    lambda file_counter: objset.new_spdxid(
> -                        "imagefile", str(file_counter)
> -                    ),
> -                    lambda filepath: [],
> -                    license_data=3DNone,
> -                    ignore_dirs=3D[],
> -                    ignore_top_level_dirs=3D[],
> -                    archive=3DNone,
> +                a, _ =3D add_package_files(
> +                        d,
> +                        objset,
> +                        image_path,
> +                        lambda file_counter: objset.new_spdxid(
> +                            "imagefile", str(file_counter)
> +                        ),
> +                        lambda filepath: [],
> +                        license_data=3DNone,
> +                        ignore_dirs=3D[],
> +                        ignore_top_level_dirs=3D[],
> +                        archive=3DNone,
>                  )
>                  artifacts.extend(a)
>              else:
> --
> 2.53.0
>

