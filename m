Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BA71125876
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:31:47 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6177.1773261100572123197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 13:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YoUl8wWm;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ca6595c8aso355682d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773261100; cv=none;
        d=google.com; s=arc-20240605;
        b=gXN90Hg4JMUjPVpOd/SirLe+bxoACLZCj+yXexLJBoIEDxVKGJOO3o1Ki1HMfhdfxG
         YIsBHBpr2KUrUn+LyujodPzwf1tnrFHoxg5WfUV92Z+8wFF0j17KKiLuEfqhhbJ5VxwR
         Z6Pdmj8O5F/ddvFxmq1gdOTIXjOb/Dk+ziYA1zVjU27TT7IAspDzB5W87WRcyw+83W3M
         H55KXE9J/CQEJHQtB1e9bjj5cYe7vY5rl/i1PbeUdRw51gTNICliH/aYjfajSnTKiX+c
         83H4/zUk4HgwQIjE1ZFBgNqKnEE/eVp4lkIiYFl1GTL4p6Df1NUzBiRvzCZM9oXUcGey
         TyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGf1o/SnfcxlQBwxWFWn/kqte2J5fC2HhsuiSuND+bM=;
        fh=O40SYvcy1jGEmbceIO96QTsgI2+wv8m09kxalw+zz44=;
        b=S8q/S+6bRrq5pR6LCdgxpBUxferiPVDnVAzTckZvL0hFPS8nk/mPmwVe3hktuA/6du
         SKLmLvzUfdrycBff2EYevlDoFmEskIgWrWRwJK46XQPZR4RA8JHyqA9aKRFHdHh1F8jL
         GRfpnKEJ639Ni/BHBlqRnUsO7Sx5qO+GxLjCcgMEabVUyd6S4rt8QJh1f76rkyzQa8Zj
         gD02jlMPUhqndqnMqcaQpsTL/r6NE+ASNHW9OO+GmGNo9sEWSHxtBodFHxhRFixlLsBw
         40FIIKlv8XhLwWXOenYS8xWTIUEq1Jp2jn8Rr2pt4IX80Jh/JjbxFwladlvJOTf/y2GY
         kDAA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773261100; x=1773865900; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGf1o/SnfcxlQBwxWFWn/kqte2J5fC2HhsuiSuND+bM=;
        b=YoUl8wWmY/ixk2aa7eCugUsk3nexNyWUQ2VFbS7ND0dpZGUMPAign0dv6DyhVbnsv4
         A7WBwMEdjbsjr8LlLNQ/J8RLgVEqL/nCInHTeIPlxLfgzdBtUz+3+w9++uuf3Nbj/B07
         OCNtz8pxmtX8SeBX5C57Vw7KAiuetnOsCJDZGifx4PwWCts9kVg9XbWSwTlyDHK+546e
         rUwFN9sKd63q8053hi3pvsVh4mvFimME9H3CR2ZQBZZrlrtEJ2I1KHCwtAeQCm6etBLb
         9H2d1YcdQ7J4Ez2yfV1PxNvPf8aCq3+LLAazEA4oGE2Y2UtLF4sEDMFm7EtA7uJPx4L1
         v/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773261100; x=1773865900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGf1o/SnfcxlQBwxWFWn/kqte2J5fC2HhsuiSuND+bM=;
        b=nx5pVoJWq5qR9eRLrpiyt+tkHCaR1ky1GMDB2wNt1BVD+1LPjxOrGTW5HsaslwpnoI
         R7f+1aV0Z2g4W7mTCiNVBW2Nm19fbsV9iZcUoz3IRncpGCOWM1/9PZ91KXYiWt4t7aHY
         WistMLT1uZbZh6w98F20Zh9COJ6SXjEFFyof1RyWIpiAQ07RSeISHMHrgu2JGupO2yi1
         xNGiyHsiiXrQnMwbY5Bm4ck1sRaGaSLBM7C8veOFBuzPxcav9nya6ZltoH/cYrPrETmt
         cNnc2amjBRJYHhOk/f2qfCUKNnl8hE8wWuEFAMGRVpOtNSqX2Z1T/PhbA/oM34QL/TdG
         5J/A==
X-Gm-Message-State: AOJu0YwVLxLiiGxcVAMqlKjXf6AkUO+aHaUfAV6o5fjLOuSb4ZGoeyDM
	XS/joyndwbpimSBvdfoXUzk3QqOumME87O6Rl/DvMLP9y5jNLdYqnL1imhpvfqf6EvNJ7saQp0x
	RSoiu6ZExqm/jKQBWNoAp7tGeqfoj0ok=
X-Gm-Gg: ATEYQzz7vR2j+8/icd6b0UBxS+eRD9HGMdZQf4cv9IYNChzXNDTn14b0Qm8jsuNqETl
	YohyqHRT0dFT66UGH9P3oUo65nUgPWf0mlYmgEa0GCYDnXpwjLVfRntDkEOR8mpyBOLKCbT982s
	qMqwwsZ1EAmbPzs9FmvVmKKdjzBpBY0zk/19yK3xhFrDi7QJoI5HZSrAscx5qZwKYcvELb6ct3Q
	dJR7kqA2ORh095CVZbCrG/ljLmxBJRN1MeHWhH6a4XecPSrfZO5yLSkV+K6Omb5SG9xaoizSg50
	ymSEuJPT3M80jnIpEepwMQ==
X-Received: by 2002:a05:690e:141:b0:64a:cece:95f0 with SMTP id
 956f58d0204a3-64d657fad9amr2505758d50.61.1773261099659; Wed, 11 Mar 2026
 13:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com> <20260309132854.128375-3-stondo@gmail.com>
In-Reply-To: <20260309132854.128375-3-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 14:31:28 -0600
X-Gm-Features: AaiRm51ebYPKV6hZRNDE_PgQezR7mCXojgFLo4E5BjRrodZ0QqzpmfR5tFggdys
Message-ID: <CAJdd5Gay-0wkHKtLBhKpJUaCi887BcEQOa_cg_YnNDQegRF4nw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 2/7] spdx30: Add supplier support for image
 and SDK SBOMs
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 20:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232908

On Mon, Mar 9, 2026 at 7:29=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add SPDX_IMAGE_SUPPLIER and SPDX_SDK_SUPPLIER variables that allow
> setting a supplier agent on image and SDK SBOM root elements using
> the suppliedBy property.
>
> These follow the existing SPDX_PACKAGE_SUPPLIER pattern and use the
> standard agent variable system to define supplier information.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> ---
>  meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
>  meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index d4575d61c4..def2dacbc3 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -124,6 +124,16 @@ SPDX_ON_BEHALF_OF[doc] =3D "The base variable name t=
o describe the Agent on who's
>  SPDX_PACKAGE_SUPPLIER[doc] =3D "The base variable name to describe the A=
gent who \
>      is supplying artifacts produced by the build"
>
> +SPDX_IMAGE_SUPPLIER[doc] =3D "The base variable name to describe the Age=
nt who \
> +    is supplying the image SBOM. The supplier will be set on all root el=
ements \
> +    of the image SBOM using the suppliedBy property. If not set, no supp=
lier \
> +    information will be added to the image SBOM."
> +
> +SPDX_SDK_SUPPLIER[doc] =3D "The base variable name to describe the Agent=
 who \
> +    is supplying the SDK SBOM. The supplier will be set on all root elem=
ents \
> +    of the SDK SBOM using the suppliedBy property. If not set, no suppli=
er \
> +    information will be added to the SDK SBOM."
> +
>  SPDX_PACKAGE_VERSION ??=3D "${PV}"
>  SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, software_packag=
eVersion \
>      in software_Package"
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 5ced792d71..c3a23d7889 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1314,6 +1314,16 @@ def create_image_sbom_spdx(d):
>
>      objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_elements)
>
> +    # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
> +    supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DFalse)
> +    if supplier is not None:
> +        supplier_id =3D supplier if isinstance(supplier, str) else suppl=
ier._id
> +        if not isinstance(supplier, str):
> +            objset.add(supplier)
> +        for elem in sbom.rootElement:
> +            if hasattr(elem, "suppliedBy"):
> +                elem.suppliedBy =3D supplier_id
> +
>      oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
>
>      def make_image_link(target_path, suffix):
> @@ -1425,6 +1435,16 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_di=
r, toolchain_outputname):
>          d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
>      )
>
> +    # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
> +    supplier =3D objset.new_agent("SPDX_SDK_SUPPLIER", add=3DFalse)
> +    if supplier is not None:
> +        supplier_id =3D supplier if isinstance(supplier, str) else suppl=
ier._id
> +        if not isinstance(supplier, str):
> +            objset.add(supplier)
> +        for elem in sbom.rootElement:
> +            if hasattr(elem, "suppliedBy"):
> +                elem.suppliedBy =3D supplier_id
> +
>      oe.sbom30.write_jsonld_doc(
>          d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
>      )
> --
> 2.53.0
>

