Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A168C79FBC
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 19:28:23 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72751.1767641294014653295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 11:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FcTVG2n5;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fc3572431so3685687b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767641293; x=1768246093; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaSBbnTIq2HxYBxLPHiXBGlJAW750YEXm4f8HDcBufU=;
        b=FcTVG2n5fqWJcmO7rWTkfymgtfyEz36KzVHUa4dl7STEq/zd/BSCiW1QGGoPbo8JAL
         LUoizy77t9v5x+3s/gi0iLO+j9PNfGbSu0SjmrmHSz33H72hg5zBDQiGUQv+qic/ZfUk
         VlteqkztQTirY8RugwPL1aQJvj+X8PGfKCkUr7MuLfT3HCImOyw50eFqcuuQItI7HZZS
         EsEoyqnoppZ3zxXJ//NaMH86IAWWRnjEdzs9Pk8DwSEGqdziLAO0N/uuUgqAkey9X/LZ
         7MJXcSxQu5+Bflt8ipkbeNyhPDqeZ+rPGD/xceOs/ZS3YIpMYiyn1/bPN3qK69uv4RCy
         2E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767641293; x=1768246093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaSBbnTIq2HxYBxLPHiXBGlJAW750YEXm4f8HDcBufU=;
        b=HlvpF48wRc1gIkENYUnpqtEIz02NJg8k6rbnwD3IcFTfkfFJs5NT34uFYlw+DbWfTN
         J4hHj4AVnvEJI8nCIMspf7NXw0okjZhhnK0w+99yufsGtyaBGzyxUGdCOS89RW5386M1
         QjVtQL7lSa28ECm/9t932yVh3iFERbXwOxknA7BcivbUTjgg40k+q7iBPmyYWW/GIO8A
         +LkjfmAUkPWKDjrmndKJKq5NkuqfWHTBd/mSHrdw2XSDJ/bRgCNfsr2ErpAt/lv11n8x
         TnVmI6n9IGqJwlTR4HR+JvJguD4zWgPlCgXC2XgF0PY7Ayxyv4nDCHy4M+2w/V7gj7VF
         rjTw==
X-Gm-Message-State: AOJu0Yx99bFlfbKneQrF//YSCn+UB/T7X673zc0VobGlRKOt53KM3aRV
	/SUTJx8N1T6mZ0sIE0Gi99ueZQ7aDeZSRmmjnzRrErb3FpG7Lw3PcdVbKFasEvTeJtDxJHkYGbv
	totOkfOWKd7CDNbFCrIBxSAvoE+LjLq8=
X-Gm-Gg: AY/fxX4uj35up8vvRuqN2NZQfZ8SmX1rQKTFBxHDfCqWHFO1J57K/9u/gscqnFd6XZc
	FEfWVEWVEnobwYmj/d3puP3PRoowavz/C/i2UdNqF6d1okhaMI2hxULVgi5Ty0YCtFh03ryHmNR
	PHbpJN91dhp8S59mv2xQEDnSWWKL/H5Kljw4tXhRq9IxH8TK1GF1BtIHyQuuAQaXCUdrE5Q8nFu
	J+lZsW93ljltsxjenkUBjaLquhqeuCHkpT5zhepc6/s+UacLc2tlhzSlp6UOcDQwpMJMA3oYFJ1
	SGwNjcEreg==
X-Google-Smtp-Source: AGHT+IErzT/6FvoEUSPxzinxBDNeSD/FDJqc3inCLxfxHFYIJiMOQv8jHduy9LKrSx8AQ+Z+wH4S3F1icwtteZM2P9Y=
X-Received: by 2002:a05:690c:9c12:b0:787:ffc0:40c7 with SMTP id
 00721157ae682-790a8b6bbb1mr5466377b3.68.1767641293060; Mon, 05 Jan 2026
 11:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20251218120139.104155-1-stondo@gmail.com> <20251218120139.104155-3-stondo@gmail.com>
In-Reply-To: <20251218120139.104155-3-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 5 Jan 2026 12:28:01 -0700
X-Gm-Features: AQt7F2oWnzU7W4Cxd6pI7rgnvB9c4bZLNIPW2weeayeoVO1NcvdBkego2jOe2xU
Message-ID: <CAJdd5GY4Va+jpt7CA23P81yoAt=sc-DikH+NOKAps3gsNKKbrg@mail.gmail.com>
Subject: Re: [OE-core] [OE-core 2/2] spdx30_tasks: Add concluded license
 support with SPDX_CONCLUDED_LICENSE
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, stefano.tondo.ext@siemens.com, 
	peter.marko@siemens.com, adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 19:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228876

On Thu, Dec 18, 2025 at 5:02=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
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
> By default, concluded license equals declared license (indicating no
> separate license analysis was performed).

This is incorrect. If the concluded license was not specified, then no
analysis was performed. Setting the concluded license to the declared
license means that you (the end user) agree that the declared license
is the applicable one, which is not the same thing. As stated, we
cannot set the concluded license to a default value in any core code,
since we can't make that assumption for our users.

When differences are found,
> users should:
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
>  meta/classes/spdx-common.bbclass | 13 +++++++++++++
>  meta/lib/oe/spdx30_tasks.py      | 21 +++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index ca0416d1c7..3ca4c70cc0 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -36,6 +36,19 @@ SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licen=
ses.json"
>
>  SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
>
> +SPDX_CONCLUDED_LICENSE ??=3D ""
> +SPDX_CONCLUDED_LICENSE[doc] =3D "The license concluded by manual or exte=
rnal \
> +    license analysis. This should only be set when license analysis (man=
ual review \
> +    or external scanning tools) identifies differences from the declared=
 LICENSE. \
> +    When unset or empty, the concluded license defaults to the declared =
license, \
> +    indicating no separate analysis was performed. When differences are =
found, the \
> +    preferred approach is to correct the LICENSE field in the recipe and=
 contribute \
> +    the fix upstream to OpenEmbedded. Use this variable locally only whe=
n upstream \
> +    contribution is not immediately possible or when the license conclus=
ion is \
> +    environment-specific. This allows tracking license analysis results =
in SBOM \
> +    while maintaining recipe LICENSE field for build compatibility. \
> +    Example: SPDX_CONCLUDED_LICENSE =3D 'MIT & Apache-2.0'"
> +
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
>  python () {
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 286a08ed9b..84d70f6f72 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -712,6 +712,27 @@ def create_spdx(d):
>                  oe.spdx30.RelationshipType.hasDeclaredLicense,
>                  [oe.sbom30.get_element_link_id(package_spdx_license)],
>              )
> +
> +            # Add concluded license relationship
> +            # Use SPDX_CONCLUDED_LICENSE if set, otherwise default to de=
clared license
> +            concluded_license_str =3D d.getVar("SPDX_CONCLUDED_LICENSE")
> +            if concluded_license_str:
> +                # Use explicitly set concluded license
> +                if concluded_license_str !=3D package_license and conclu=
ded_license_str !=3D d.getVar("LICENSE"):
> +                    concluded_spdx_license =3D add_license_expression(
> +                        d, build_objset, concluded_license_str, license_=
data
> +                    )
> +                else:
> +                    concluded_spdx_license =3D package_spdx_license
> +            else:
> +                # Default: concluded =3D declared (no analysis performed=
)
> +                concluded_spdx_license =3D package_spdx_license
> +
> +            pkg_objset.new_relationship(
> +                [spdx_package],
> +                oe.spdx30.RelationshipType.hasConcludedLicense,
> +                [oe.sbom30.get_element_link_id(concluded_spdx_license)],
> +            )
>
>              # NOTE: CVE Elements live in the recipe collection
>              all_cves =3D set()
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228119): https://lists.openembedded.org/g/openembedde=
d-core/message/228119
> Mute This Topic: https://lists.openembedded.org/mt/116840957/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

