Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28537F54AC4
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 14:23:18 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20935.1774362192062176889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 07:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EhvO0KrL;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64eaf8aa893so3856192d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 07:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774362191; cv=none;
        d=google.com; s=arc-20240605;
        b=YhfEaFGd14UaeeBjq0TIhExNJM8dUNRiaRgyaClrFgjpHLniLUopeptq7uu5Pr1bZ2
         9RZtssPOrZg3qAeYM0CkBgV/rukc6jsihczQFI/iXq68Ri9sxpWQXyJg0QZmcqfa8w6E
         RD53DgOt3iDYn3/ctdDn7gB1PGsCL88UbrXG8cvI1Hx0dMEWQMgjzk5WpXnaoFCVIrsx
         aw/1zVebSlFEyynU7kI47pSO6R4UDOug9bR66Acu1+WfufWNzKR1uwGR3/i4Xgnp4qSo
         WZ+Ibi2w+c1hKIulu9eZvMQPbkPyi4j/J9iCFBZWo51byZyH1hQavkgfWQ8q65UFcfI/
         DNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVBChgFjt1qMWW5wyYvljc2k4MmHUJqYJZ2niNVSaPE=;
        fh=DXi/jZN+Y0f6AuF67U0rstiU79zA7VkJWDisO6OBcA4=;
        b=hwEpXkaPOySgxDn6tH4xEgsLkJx09tDsnPUTC7ljGC0nfCkDwiGi9anJwhX7e319aE
         8HTKRdcrZqoFAum9xvAi0bYWwGNlMemx9E79siG1KQLI3EilY2ugtjpCSdjkbrGeWhRN
         fshf8G+DtobNzCqWolxQX37BSsaYaWCeYNEMhnSbl8WUdHbRLGVJpY7n0A8W19cL0cXG
         9HdrclHAXsZVUFKxR1BBo18QGEsZRQlRq44yygtjdr0uQ4/4dUI4mLUroyil7PJEtTRY
         DIGURgLEPk4JguoGxT5xtVETToruuUM3JgTCTp4E2W1m57TYPBw98AeOIz5GdoTiyY5g
         Batw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774362191; x=1774966991; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVBChgFjt1qMWW5wyYvljc2k4MmHUJqYJZ2niNVSaPE=;
        b=EhvO0KrLBJrWpk8dML7gO7epEOQfdECw91ybFPhrqZ5xb2zk28vW7yL8G0nB2DNWHE
         RbGuL5JFruFHz8ksaSpbQcw6UMUrli2SGrhaVahQmdswsLExCMnQh0f6HHPD4r701Y32
         EA6+rXGorIubYJ95LTc40eJCEzC2ZDVkWXDdXp0ifL4LQNvqGINMBiUsmOv7pDP32w9d
         t/l8IxStJfcTV8GTDnr4j1wE407ohNpLiETUo2Eop+W7DLq0Z3Vzhwy3nNhV2AKvGUYF
         +AwnZPaTlel5a6GKOHJ3JD+GqkLLh/KhH201zGBo1nzC0M4wZWfMqOrS1gaSP4WUOiul
         uImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362191; x=1774966991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gVBChgFjt1qMWW5wyYvljc2k4MmHUJqYJZ2niNVSaPE=;
        b=TbUF5TH54wPkBg2QCtx+bgNJh/GnTJHgsGbtRd6va3ct1ClLoSxOFS255X8ZB7Zenp
         b6McN/Gc33jnTh/rROB0rs5yzoQvolRdlVqiAhu6XTQhVlDODouSkwQpcXs30GisZ9DS
         D5IWnDTGOArNZ3rNLkKm4GZkEDrN2iTzVtJcpgGeb7sf3titpKl32o1itmk5dU9ADnEP
         qk3T1a+9XMt0nQP8I0ptkins/Ri43u9X0xkMBkuqwq/cygn6XZQsxKJ3NsNvF7txzzze
         uFAtSYlQRVrcHK3arjmKuyAQpjA3+FF3RW3cPP53WnH5T9fUZKv80brmnedrdZ4rdMV+
         b5AQ==
X-Gm-Message-State: AOJu0YzeB7vifPDpC5WKFPxZvDK5xlZmyUMd6XfZUUckVVkMxa/iAiqM
	dtN9F+xfOo7hFu/HRar/HfQ3najSXn6XMQftEh46iO5T8QLtSEunrQ16zlXLHDCH3nJqCRkNQ/m
	L/sdf6dtX9N15WxnzAns6LSevWGieL8U=
X-Gm-Gg: ATEYQzzJFf/GUdKI2iJmgLRyTEtPl6pekPISMowrtngJCv3JsAW3RBLDVsCm451N7dn
	54Qh+1nD5/3Mbq/09I4ae4gPU5Q1rSs/wBWZOaPvnQaXTK7+3gbZZtO6ghjO+aL3Ig8uGz7zEY7
	WrYEN102y1ZOAtg1y0b8XBdk5t/TMFVzgKHfs+Tkr8GuiB7LK6x5VHbB6C8J0bNGqk6JKiAAeRh
	/w3o/sRbIJMWv+5YYgHegrf4QuN9A6CtMD2qqGe+BNIk1wEd4m3xc+6UzA+P3YFKwILI8UAvZjB
	2kXXVCSm+P7i5ttEY9gXfA==
X-Received: by 2002:a53:c04e:0:20b0:64a:de2a:e6e9 with SMTP id
 956f58d0204a3-64eaa6c2317mr13169588d50.24.1774362190944; Tue, 24 Mar 2026
 07:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
 <20260324132958.2316491-1-stondo@gmail.com> <20260324132958.2316491-2-stondo@gmail.com>
In-Reply-To: <20260324132958.2316491-2-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 24 Mar 2026 08:22:58 -0600
X-Gm-Features: AQROBzDlbp5nSxLny_00LiYV-1KuZjwZdPbVp--MtuX3aVO_CUFCM9osgZnUge0
Message-ID: <CAJdd5GY-Eax=Sbf6dDNSUOQy=0gvxONB07sjzzTvtBWLLu8bUQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v14 1/4] spdx30: Add configurable file exclusion
 pattern support
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	stefano.tondo.ext@siemens.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 14:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233802

On Tue, Mar 24, 2026 at 7:30=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
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

LGTM, Thanks.

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

