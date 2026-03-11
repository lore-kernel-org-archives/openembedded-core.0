Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6B41125893
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:29:27 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6252.1773260964610292278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 13:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ceel8Fk9;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7982c3b7da9so3042297b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773260964; cv=none;
        d=google.com; s=arc-20240605;
        b=TZVWOUMeUcwiPbWnpoBq/FmZoadDUimiNdl6ZnKP3iPv8D56hzZKHr2olPLx6i4+Np
         4iTTjBmwcZ9eh76MWGVhNCW40k8nAUql4E0xO/Rh7tytlMSLZoOTEvaYWZp8PvaHaGXI
         4kuSQ5QdzUAeuZluIpZBpm0qQ8FQl5gSO46KZBpfm3fXwlGP2ezcgzfoQ7kXTIGucubr
         xHMvsFsyKv6wox3ofosJI3dhcYaSgFeLu3Gbp14huqj/Qj2RH6SDgilAdR+IU0Pk/wDp
         H9FfaPw2YsccQsEyWCivnHJoJOaRCmOQlC/osjHL297jsKXezMktcxb/0fnIKJCuL1zH
         dI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gxQrppV4G2D4FffCOMPkde6gq218kCZnFdKEStfh3Ko=;
        fh=O40SYvcy1jGEmbceIO96QTsgI2+wv8m09kxalw+zz44=;
        b=jO+b/cvIVzyZIH7IOSqS16A1Q8zBrTcnBxcbNc93UWv/KSGT9tzM3s+vssPf5MtDRA
         9lJwegTkKS+GJE5jrAOcSkOETTXBRjIyBGlyoSsut9hIPy0Zwx81fJpGW5SJ5zEpKDW+
         TEB0Z+V8wqQ9libMvorIzVLL7w8Rb4/6amZ+9qCtTyAm1LSYxbNQ7Ec4mAukeVfB9E0b
         67+Mi8alYyapI9qDQJgulM8cTRvLSRBdKm/rYOmIN8xYz4W7GEZkZL6U80CIFfNOXaNw
         XYbPu6r5Q8TwFDI6TtTgHaLioesBu8PDXjSvE0DM1ajhjB0oWDOz6L+ArnYkohlzyUNM
         4w6A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773260964; x=1773865764; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxQrppV4G2D4FffCOMPkde6gq218kCZnFdKEStfh3Ko=;
        b=Ceel8Fk9ftoAKhslv+qpihz1ljQcXTA4/TWPtcNIGNKKi5o1cZRQtHSsi8cSOq74Sn
         O6+MKI1BpyGoe57Yny+HU63HkLeiaVE5uc65q4bv+Rx9p4YnkLTej/9fQQrMhtfUb0c1
         unidftrvvUXtXJIgg5Fj43b0JJ2VT77uLMPkSHM3sR0N+xFU7zrdYCFdsd0Uipqs4s91
         zrExj9OWucmcKk64WzsVgxARa3Pyw16eHZVJoKPP3qEjZXXy2nHIWzgdeOiPl9BCAXOB
         e8E9cafEtxqV7EwCPLt/W8TABcp++Gr6iSPwxmqthIjQ5ydhTh5MoOz2sHeBbs9pE1Aq
         Ofqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260964; x=1773865764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gxQrppV4G2D4FffCOMPkde6gq218kCZnFdKEStfh3Ko=;
        b=aSkrrNOPw2CPdeE3zhhgkkkNGVXj4Z1nt8/efQmQ7bRbkWSJsnN6q+oMcHwybyUqZ2
         FaMIni+aZCUI9RbpNkVBwfFtepRD6RkFgmSevRerkbLTqbEoEoKlmeJ4gSOlXS/tDs95
         5qhRcfcmmCZif+tfwS5XuvLRah8BCg5icnpGIh5vVnIkRgesFMDFREfDMOEZiRBgpwaB
         8A3wWIRQFAe477NZolY6hgPbeeeKEOdntjeUUdb5zbson4RpHQepqSixK3eorshrFcVc
         v7tPYBW+YITlycytxA3YKPrnTWjIhsLzm5IuZlZSKg0UYdYPwLGkapvbYy57MFeBCZc/
         cudA==
X-Gm-Message-State: AOJu0YwR84i6KOEIXhADgpKtmqOq4dEXyiuuiTZOuqgj3zav2xYqJpVr
	HI+l6JG8O9S9qx7dIdBZbSkyhPEotDDTB1U2FdHRfjlmt7NfLyB78KXjDBlQvJnV7ySH0sSiMBU
	NyUhxgMqylteRTUpeQhsDWNZfS+FhQg0=
X-Gm-Gg: ATEYQzz5+b6BrtZ/7VtbtnZtel/sVLK+GL1FdZI6sRlrKpFKcR9JprD75WBDe5v0z0z
	/HMTDGj3aaeyjRoOYzFl6pQevGqlKrjAYtvQUi1UcwXxMPUPTQAPosHUHrFDxfz8HL89W0tEn6T
	hxOWP3o1jg7J5F/SJ99A0onP+IgMQLCW3knFU8O+IHevOK6U9najprrmatLDnuV62MBm8KMOUvl
	Xy0yx8pSSdZSSprjJSm7vNj9e50/imVnbNSBkxJhrMx7SuGAinSDMaOsnNPJzPJ7K8s/vTt5tiy
	F+ffiPJ7wuWtejgg8czA7w==
X-Received: by 2002:a05:690c:62c7:b0:798:6c28:dd57 with SMTP id
 00721157ae682-79917edf36dmr38449517b3.28.1773260963669; Wed, 11 Mar 2026
 13:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com> <20260309132854.128375-2-stondo@gmail.com>
In-Reply-To: <20260309132854.128375-2-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 14:29:12 -0600
X-Gm-Features: AaiRm536Zc6MB4iZx8gxquZq8s31tKkHZ9TANwYT38rBajeUouTjRDhk5uQP--I
Message-ID: <CAJdd5GZ3C54-d0ECeXx4xuvpDCXU9qw_weQpX7A0p9=uwkpALQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 1/7] spdx30: Add configurable file exclusion
 pattern support
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 20:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232907

On Mon, Mar 9, 2026 at 7:29=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add SPDX_FILE_EXCLUDE_PATTERNS variable that allows filtering files from
> SPDX output by pattern matching. The variable accepts a space-separated
> list of patterns; files whose paths contain any pattern are excluded.

"PATTERN" implies regex to me; can we do that (comments below to show
how)? It's a lot more flexible with anchoring, case sensitivity, etc.

 e.g.:

SPDX_FILE_EXCLUDE_PATTERNS =3D "(?i)\\.patch$ (?i)\\.diff$"

>
> When empty (the default), no filtering is applied and all files are
> included, preserving existing behavior.
>
> This enables users to reduce SBOM size by excluding files that are not
> relevant for compliance (e.g., test files, object files, patches).
>
> When file exclusion is active, debug source lookups that reference
> filtered files are gracefully skipped instead of causing fatal errors.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/spdx-common.bbclass |  6 ++++++
>  meta/lib/oe/spdx30_tasks.py      | 28 ++++++++++++++++++++++++----
>  2 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index 3110230c9e..f54459d3b4 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -54,6 +54,12 @@ SPDX_CONCLUDED_LICENSE[doc] =3D "The license concluded=
 by manual or external \
>
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
> +SPDX_FILE_EXCLUDE_PATTERNS ??=3D ""
> +SPDX_FILE_EXCLUDE_PATTERNS[doc] =3D "Space-separated list of patterns to=
 exclude \
> +    from SPDX file output. Files whose paths contain any of these patter=
ns will \
> +    be filtered out. Defaults to empty (no filtering). Example: \
> +    SPDX_FILE_EXCLUDE_PATTERNS =3D '.patch .diff /test/ .pyc .o'"
> +
>  python () {
>      from oe.cve_check import extend_cve_status
>      extend_cve_status(d)
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 99f2892dfb..5ced792d71 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -161,6 +161,9 @@ def add_package_files(
>          compiled_sources, types =3D oe.spdx_common.get_compiled_sources(=
d)
>          bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
>
> +    # File exclusion filtering
> +    exclude_patterns =3D (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").=
split()

exclude_patterns =3D (re.compile(p) for p in
(d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split())
excluded_files =3D set()

> +
>      for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
>          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
>          if subdir =3D=3D str(topdir):
> @@ -174,6 +177,13 @@ def add_package_files(
>                  continue
>
>              filename =3D str(filepath.relative_to(topdir))
> +
> +            # Apply file exclusion filtering
> +            if exclude_patterns:
> +                filename_lower =3D filename.lower()
> +                if any(pattern in filename_lower for pattern in exclude_=
patterns):
> +                    continue

if any(p.search(filename) for p in exclude_patterns):
    excluded_files.add(filename)
    continue

> +
>              file_purposes =3D get_purposes(filepath)
>
>              # Check if file is compiled
> @@ -219,6 +229,8 @@ def add_package_files(
>  def get_package_sources_from_debug(
>      d, package, package_files, sources, source_hash_cache
>  ):
> +    exclude_patterns =3D (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").=
split()
> +
>      def file_path_match(file_path, pkg_file):
>          if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
>              return True
> @@ -251,10 +263,18 @@ def get_package_sources_from_debug(
>              continue
>
>          if not any(file_path_match(file_path, pkg_file) for pkg_file in =
package_files):
> -            bb.fatal(
> -                "No package file found for %s in %s; SPDX found: %s"
> -                % (str(file_path), package, " ".join(p.name for p in pac=
kage_files))
> -            )
> +            # When file exclusion patterns are active, some files may be=
 filtered out
> +            if exclude_patterns:
> +                bb.debug(
> +                    1,
> +                    f"Skipping debug source lookup for {file_path} in {p=
ackage} (file exclusion active)",
> +                )
> +                continue

Instead of assuming this, have add_package_files also return the list
of excluded files (see above), then pass that into this function for
cross checking (the other callers of add_package_files can just ignore
the excluded files e.g.:

  spdx_files, _ =3D add_package_files(....)

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

