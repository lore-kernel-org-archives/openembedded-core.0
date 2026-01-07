Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CFBD0D16E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 19:40:58 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14914.1767814851108715445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 11:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aoiot4Ql;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7904a401d5cso27735847b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 11:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767814850; x=1768419650; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQSheg2eAouAqY9ePLYh/QWo999K40xpuDeaIaWo9To=;
        b=Aoiot4Ql0eAvmECOmoDNeFNg1IwbIMBPedEQIBvo6GDp2G4aUm/ol6+1nDY2/L4iSZ
         TPK9iZLewEuM0oFLbxJju9fpqGrMEC5werSDito/krrv0J/z7nvaAYfnIn/KqepoNHG6
         ABNlOCBXj+8njuyCPDyWNIVnle6HBXe6Yt3e21vZADGeRKkGKB+bmy8BPtWRExuCQf4h
         ahkPbEKf9hpCXlPVVMbMyHRDu4CnOny0c5q2TKQnuRIP1G8Pl1K9+7DrGvddYqgye8Y1
         QF4BG64NG45Jf98FhFWjkYeBQbkUT5x/NHM+ICfhiFkHBRe0DAaIaQBKcZfGTXCzminQ
         YpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767814850; x=1768419650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQSheg2eAouAqY9ePLYh/QWo999K40xpuDeaIaWo9To=;
        b=tZbF5yqYx4WqHl7Mmo2AORqur7hfcYAxgFN3TH4wpaGT7iCzPskorEk4GdbS0BdBtC
         /46D0BI6Qg/66tGEqDY1gKujMSZwoxLY9y55r52+gmuS/hIrMjdJZ/rh3sfr94Egdbo+
         ih20+oVw1jzmyHeUMbNXImFI0NZICvE1FCEO7ioq2A89pJcgIgwwU16io/3RQExecVDi
         gTZrtYkA6cp5fyo2cAo1XIGzRmXkUJ7i6xsZlh1QVgGYwpLwQVwRIkavS+1WEUpdO+Dr
         aQ4dXi4nZqezb1I5v4eSBm9MKG6veavynmNuzbb9nyohyNJChIugPegnLni6hZ/vNHQT
         RHOA==
X-Gm-Message-State: AOJu0YxUDutFLghU2baV6oQl+sOk4zL3STJfeACZZyKD7k+hgw2+z+Sw
	b53ynMR7C/UzsX5UNwmCfhzwc16EQSBxfHLCjcjfUY/7q9+pS6gZcpizMkb7a2Au4GM9WkjCt0+
	fQ/qLNxygVAa8MDxuc5gXsePz9YErJYk=
X-Gm-Gg: AY/fxX6vaZIc28hMB4pzRD2pSJulrojtunHyZU3AzZ1778oiaotv2B3EuOc9Nzbjgwf
	9EnsYdG+OdEB78Um+gzdnA2EDfNzPvssMdIIjHzeHFJq6QdywpA9dJpbQ3AoKOz/zDrDoHtpqBF
	sLZmTsarJBlEVr5ODTsYAhIBy1tcmmJtk75G1Dc4WnSrXVpBE0pnUDg0ewPQVFgmMhh07HNz2Sm
	0mXrZACKDzT8LjjQO+iyIDdrQ4qFIN/jO3Y5hN2kxC0AGvU7AhnnrQbsKnU4ZsCGEuPQZH91xvS
	Nx5cafxK6w==
X-Google-Smtp-Source: AGHT+IEAkEq+ULellMLRMLup9ydQ7AOJo2cNS8e6DRFiH76LG9h9+t+aefY4c1WoH9MZ55Xc2DU9nYMNG1pbcDoNjHM=
X-Received: by 2002:a05:690e:1c1a:b0:641:eeca:1733 with SMTP id
 956f58d0204a3-64716bdae18mr3018313d50.61.1767814850223; Wed, 07 Jan 2026
 11:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20260106112557.53709-1-stondo@gmail.com> <20260107181541.141957-1-stondo@gmail.com>
In-Reply-To: <20260107181541.141957-1-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 7 Jan 2026 12:40:39 -0700
X-Gm-Features: AQt7F2o-iXSQ8KGhQJxeZicQfIaDfjyyphIMv7H9WFwEJ7r-PX_f5RZ8H74350I
Message-ID: <CAJdd5GZqrqW--xw4S7GV77C5J_bvVBgBo47Xh79OTwaWcX1=7Q@mail.gmail.com>
Subject: Re: [PATCH v4] spdx30_tasks: Add concluded license support with SPDX_CONCLUDED_LICENSE
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, stefano.tondo.ext@siemens.com, 
	peter.marko@siemens.com, adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 19:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229029

On Wed, Jan 7, 2026 at 11:15=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add hasConcludedLicense relationship to SBOM packages with support for
> manual license conclusion override via SPDX_CONCLUDED_LICENSE variable.
>
> The concluded license represents the license determination after manual
> or external license analysis. This should be set manually in recipes or
> layers when:
>
> 1. Manual license review identifies differences from the declared LICENSE
> 2. External license scanning tools detect additional license information
> 3. Legal review concludes a different license applies
>
> The hasConcludedLicense relationship is ONLY added to the SBOM when
> SPDX_CONCLUDED_LICENSE is explicitly set. When unset or empty, no
> concluded license is included in the SBOM, correctly indicating that
> no license analysis was performed (per SPDX semantics).
>
> When differences from the declared LICENSE are found, users should:
>
> 1. Preferably: Correct the LICENSE field in the recipe and contribute
>    the fix upstream to OpenEmbedded
> 2. Alternatively: Set SPDX_CONCLUDED_LICENSE locally in your layer when
>    upstream contribution is not immediately possible or when the license
>    conclusion is environment-specific
>
> The implementation checks both package-specific overrides
> (SPDX_CONCLUDED_LICENSE:${PN}) and the global variable, allowing
> per-package license conclusions when needed.
>
> The concluded license expression is automatically de-duplicated by
> add_license_expression() to avoid redundant license objects in the SBOM.
>
> The variable is initialized in spdx-common.bbclass with comprehensive
> documentation explaining its purpose, usage guidelines, and examples.
>
> Example usage in recipe or layer:
>   SPDX_CONCLUDED_LICENSE =3D "MIT & Apache-2.0"
>   SPDX_CONCLUDED_LICENSE:${PN} =3D "MIT & Apache-2.0"
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> ---
>  meta/classes/spdx-common.bbclass | 16 ++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py      | 18 ++++++++++++++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index ca0416d1c7..3110230c9e 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -36,6 +36,22 @@ SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licen=
ses.json"
>
>  SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
>
> +SPDX_CONCLUDED_LICENSE ??=3D ""
> +SPDX_CONCLUDED_LICENSE[doc] =3D "The license concluded by manual or exte=
rnal \
> +    license analysis. This should only be set when explicit license anal=
ysis \
> +    (manual review or external scanning tools) has been performed and a =
license \
> +    conclusion has been reached. When unset or empty, no concluded licen=
se is \
> +    included in the SBOM, indicating that no license analysis was perfor=
med. \
> +    When differences from the declared LICENSE are found, the preferred =
approach \
> +    is to correct the LICENSE field in the recipe and contribute the fix=
 upstream \
> +    to OpenEmbedded. Use this variable locally only when upstream contri=
bution is \
> +    not immediately possible or when the license conclusion is environme=
nt-specific. \
> +    Supports package-specific overrides via SPDX_CONCLUDED_LICENSE:${PN}=
. \
> +    This allows tracking license analysis results in SBOM while maintain=
ing recipe \
> +    LICENSE field for build compatibility. \
> +    Example: SPDX_CONCLUDED_LICENSE =3D 'MIT & Apache-2.0' or \
> +    SPDX_CONCLUDED_LICENSE:${PN} =3D 'MIT & Apache-2.0'"
> +
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
>  python () {
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 286a08ed9b..a99b017c26 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -636,7 +636,7 @@ def create_spdx(d):
>              set_var_field(
>                  "HOMEPAGE", spdx_package, "software_homePage", package=
=3Dpackage
>              )
> -
> +
>              # Add summary with fallback to DESCRIPTION
>              summary =3D None
>              if package:
> @@ -651,7 +651,7 @@ def create_spdx(d):
>                  summary =3D f"Package {package or d.getVar('PN')}"
>              if summary:
>                  spdx_package.summary =3D summary
> -
> +
>              set_var_field("DESCRIPTION", spdx_package, "description", pa=
ckage=3Dpackage)
>
>              if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SP=
DX_PACKAGE_URL"):
> @@ -713,6 +713,20 @@ def create_spdx(d):
>                  [oe.sbom30.get_element_link_id(package_spdx_license)],
>              )
>
> +            # Add concluded license relationship if manually set
> +            # Only add when license analysis has been explicitly perform=
ed
> +            concluded_license_str =3D d.getVar("SPDX_CONCLUDED_LICENSE:%=
s" % package) or d.getVar("SPDX_CONCLUDED_LICENSE")
> +            if concluded_license_str:
> +                concluded_spdx_license =3D add_license_expression(
> +                    d, build_objset, concluded_license_str, license_data
> +                )
> +
> +                pkg_objset.new_relationship(
> +                    [spdx_package],
> +                    oe.spdx30.RelationshipType.hasConcludedLicense,
> +                    [oe.sbom30.get_element_link_id(concluded_spdx_licens=
e)],
> +                )
> +
>              # NOTE: CVE Elements live in the recipe collection
>              all_cves =3D set()
>              for status, cves in cve_by_status.items():
> --
> 2.52.0
>

