Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4550FCEFD17
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 22:04:08 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1547.1767737047014065984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 14:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VOvIliz+;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6468f0d5b1cso1278318d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 14:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767737046; x=1768341846; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3c3XKhitV3/3tm7hk1ZwddOn1O6CrYWSkH7vbWWltA=;
        b=VOvIliz+Wwc1N8E1BOj2R4JouGjabSDkxaACPr24V7Q8q2hppT/yd46ZkELePNIxd/
         jWgPC0roKi1hmAZCEdTQ1H/ftTQ7SHtxHfrgWByp3BIhTaagamfLD5kEc6mUb+C0F07V
         M1oC+UMaMCn91X5A/rU5IlfPtN0/YUvQTc+2c/gU98b/YKX1jb3fYtbJYIniJ+TLeOuO
         a04kg4WWnXq01hb14QIZUxFH+lWGOHCxtCbUoVDVtELSXVlc3hzy8DFJGjD8m7Jv9l1d
         Fv2kn0OO501UM0+epCQCxM2u7AcaKfzWmi/iWNWtYkyDgGOEBfIfhucPa26Lyt7ftL4E
         f6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767737046; x=1768341846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O3c3XKhitV3/3tm7hk1ZwddOn1O6CrYWSkH7vbWWltA=;
        b=Vsu9OepSKZptl33io55DXzGYMk3oH5R5WB65dHXf8HX2/FLfYHQY+66Jo7IWkuvs0S
         rVFBdBKX4OmQGkwMQhcbUMC1KYKQ9sS+Dg94eVCp7iGdfha6HENQAIDoeva8baw66D5Y
         2EJYEnNth3243RhXO+jjCKzy9QZsh5J5HmGoOYhGm3z8SV3yqZboU2vYUkogHo6ibGBr
         9RqrxJLOYdA5z3uLVy09w4UBWsTfANl9W3YOH9xFaTz6GlZaa8BtMYNFco+GJzUgUCOn
         FLWr00jdF40fducXb6plf6w6jLpQO3IxES5LS9usehmbYDVznCCIcstTThZQSV6CFLby
         oW6A==
X-Gm-Message-State: AOJu0YzBu1mFH8s3ipbZYSVOWhCSWsgFURBTXoR+Fu1MMxaWzeP8wbXq
	GzYLhC3GtAidfP6wPZxxaLuwZR1ypbm7QAOSVu32bN6LhRJKwf9K+bQdXK/SHWzef975Zw5TY0l
	Q+mR4IfymXwQXFM2IXki1Y3MAC/bx1bo=
X-Gm-Gg: AY/fxX5CqtY7DXyNShhtxr42Dbp9ZrCXFPRSFuOLowTuOloB/Sw5VTI3vm/W1eRGt2Y
	nqX/X8jgKZKtZwKxuVo5Q8596LJBiwnSYCxxhHrco9aGF5fTKvfkbC1bC74bd+DMoHdEn+wsvW1
	ioddVuZ5Tkc+v82XRpVjUDmW29JH1y+fDx5fecQaJbwKNQWNSofvOmbAgJOGpRPveHztmWQiHQ1
	MlDCdA4Md8TpuiNpm20aprm60fcqBFCapVZmN+sDXl0lqyb1OxCb/cz2TncWSYrJOHEqsE1l8pD
	aLgf82fGsQ==
X-Google-Smtp-Source: AGHT+IGFv1pAA1b8CdQZpzS24/fSs1oKdTP9Wxjde9q0aBuSiOScYshEqKy0rSIJ9SSiH7LBM54AwGHyCaiYIrX3j4k=
X-Received: by 2002:a05:690e:1c1b:b0:636:d63e:5c1f with SMTP id
 956f58d0204a3-64716c44eefmr460000d50.49.1767737046087; Tue, 06 Jan 2026
 14:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20260106112557.53709-1-stondo@gmail.com>
In-Reply-To: <20260106112557.53709-1-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 6 Jan 2026 15:03:52 -0700
X-Gm-Features: AQt7F2r-SW_3hjNWoyT3Lh4gAcU6ttyqn3InQvN3OrObBrGSjghIKluJa0eWmIo
Message-ID: <CAJdd5GY7LkzmDp=eFnPW2Qu_TJ61C_xBzkN=KZ_-o+KwghVrQg@mail.gmail.com>
Subject: Re: [PATCH v2] spdx30_tasks: Add concluded license support with SPDX_CONCLUDED_LICENSE
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, stefano.tondo.ext@siemens.com, 
	peter.marko@siemens.com, adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 22:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228934

On Tue, Jan 6, 2026 at 4:26=E2=80=AFAM <stondo@gmail.com> wrote:
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
> This variable allows tracking license analysis results in the SBOM while
> maintaining the recipe LICENSE field for build system compatibility.
>
> The variable is initialized in spdx-common.bbclass with comprehensive
> documentation explaining its purpose, usage guidelines, and examples.
>
> Example usage in recipe or layer:
>   SPDX_CONCLUDED_LICENSE =3D "MIT & Apache-2.0"
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/spdx-common.bbclass | 14 ++++++++++++++
>  meta/lib/oe/spdx30_tasks.py      | 18 ++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index ca0416d1c7..504e6fba45 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -36,6 +36,20 @@ SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licen=
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
> +    This allows tracking license analysis results in SBOM while maintain=
ing recipe \
> +    LICENSE field for build compatibility. \
> +    Example: SPDX_CONCLUDED_LICENSE =3D 'MIT & Apache-2.0'"
> +
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
>  python () {
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 286a08ed9b..885b9c5549 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -712,6 +712,24 @@ def create_spdx(d):
>                  oe.spdx30.RelationshipType.hasDeclaredLicense,
>                  [oe.sbom30.get_element_link_id(package_spdx_license)],
>              )
> +
> +            # Add concluded license relationship if manually set
> +            # Only add when license analysis has been explicitly perform=
ed
> +            concluded_license_str =3D d.getVar("SPDX_CONCLUDED_LICENSE")

Should also check SPDX_CONCLUDED_LICENSE:${PN}

> +            if concluded_license_str:
> +                # Use explicitly set concluded license
> +                if concluded_license_str !=3D package_license and conclu=
ded_license_str !=3D d.getVar("LICENSE"):

I missed this last time, but this looks wrong to me. The check that
the concluded license matches the package makes sense, but the check
if it matches LICENSE doesn't, since the 'else' sets it to package
license, which means if if the concluded license doesn't match the
package license, but it _does_ match LICENSE, it will be set to the
package license.

Anyway, this check isn't even necessary. If you dig down into
add_license_expression() -> objset.new_licenses_expression(), you can
see that it has code to de-duplicate the license expressions. That
means that all you need to do is:

if concluded_license_str:
    concluded_spdx_license =3D add_license_expression(
        d, build_objset, concluded_license_str, license_data
    )
    pkg_objset.new_relationship(
        [spdx_package],
        oe.spdx30.RelationshipType.hasConcludedLicense,
        [oe.sbom30.get_element_link_id(concluded_spdx_license)],
    )

And it _should_ be automatically de-duplicated with any other existing lice=
nse.

> +                    concluded_spdx_license =3D add_license_expression(
> +                        d, build_objset, concluded_license_str, license_=
data
> +                    )
> +                else:
> +                    concluded_spdx_license =3D package_spdx_license
> +
> +                pkg_objset.new_relationship(
> +                    [spdx_package],
> +                    oe.spdx30.RelationshipType.hasConcludedLicense,
> +                    [oe.sbom30.get_element_link_id(concluded_spdx_licens=
e)],
> +                )
>
>              # NOTE: CVE Elements live in the recipe collection
>              all_cves =3D set()
> --
> 2.52.0
>

