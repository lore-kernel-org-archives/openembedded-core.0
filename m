Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FA7C79FBC
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 19:25:43 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72693.1767641133601190990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 11:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ijkfRrOD;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-787eb2d8663so4904457b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 11:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767641133; x=1768245933; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyBL3ERnpyDecLcEVvyvE0n/5nZW91Wi6CPt5wUxdCU=;
        b=ijkfRrOD6fdQPyv90RV+Z30HIw2DYlWNy5Ab5rSWIa22h1nbmHewdebNIp706/Pj3N
         cB+8WquJ3lFvsrXr86rENlieJrJNmwYWflT3R6gGglFPOnpVouWucefpN4W8QK0YEVzR
         RMuyWHKUzsxxQxENt9IvsDjXZK1e2wMDNKp4nM2Humpkmz/lfDKwGFJh9ZdIhjemMxvY
         7uRySYWp2eFVBuDJX/x7S2plITBWEPatZqoYy40v/5sRlRs0T/XsKwF0tY+ff04u6nHz
         x7z5U6HTFvleBp2jcvz9DwvroOp8tLtQilC1TKM+7Apaf3Du+AVVuHNc6jtWEYf5eJig
         o1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767641133; x=1768245933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyBL3ERnpyDecLcEVvyvE0n/5nZW91Wi6CPt5wUxdCU=;
        b=gA/KpoInpB11jNZf1aotnxvL0b1H0ueXMwnJg2TrsLLHxKz79figaUO2JJT/YzIlaT
         ZRc9WJdEiSNdi379pRgrS/zkxsb9XQmT+qErrgt1DQwIwdl3/Edpwqemubrl+EwpYVB/
         mjq8eCAmlIBFQFnWe6HaEz/M2Kro5Rw7weAiE9Q5UByTHPvpaMhB9+v1ipf3S3j4rTwe
         mwoPHtQcVMsAT9wERHdjjlzjs0dnTrkCT8u9NSUX0TpY2J3wOlg4plxBaLKZkZo/ptXq
         qURRDqgHI1wySU2u/T0qHeIe7miZVvZvicoeiuOLZNxu3aVtE+3duYELJlkc295l+v+U
         y24w==
X-Gm-Message-State: AOJu0YwFhndV5HlWQXsh7fuqjwY8Q1oS+gZEF9ex7GEvhHC5jGPYAGl6
	dx07rlnwp3/cTipTWFK+969FAOZ8IxURvDCT/jDVGQdcFZ540h46IaznKlTpDHq7oG0itdla7lE
	XyCmJC6nbmApZ17ZzR35z3NtPx0vIT2k=
X-Gm-Gg: AY/fxX4jompGbMuAUIE4gmphjMlTASAuq7XBpOASNIVTc6iMi2jaWOZXzjm+IZaxn/U
	rIczgOqyVQ5VHOzfCFunMAVi79dpqOg/J41LYazNgv9zZqpMhQLfHFGeKI1l2MfOJHwMMOhiBDM
	EeY9uuPeX7GZsbBDt3e3WFxW1/gKlyvQ8EKoQvyLPR8r+2pO05OwTLah/kzFkw7Rqb21f7IYIb7
	Yey8CDK8rD33XxDI+jN/DURkx7hm8Mdj4G9w57GEHGZcOSMrC/lJDLIOxGdyL0mVrhrD61eyCfC
	V6vaJArHogchRZmO7nnd
X-Google-Smtp-Source: AGHT+IELQcUT5g2zDsx5VKwyFkdamplqINzUXcwrhLHAbF5w86xwdXJbl4ZLPlpL80K++5qebkOTcCD6Q6Yk3HK6sZQ=
X-Received: by 2002:a05:690c:19:b0:78f:86cd:5626 with SMTP id
 00721157ae682-790a96e76f8mr2323527b3.26.1767641132654; Mon, 05 Jan 2026
 11:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20251218120139.104155-1-stondo@gmail.com> <20251218120139.104155-3-stondo@gmail.com>
In-Reply-To: <20251218120139.104155-3-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 5 Jan 2026 12:25:19 -0700
X-Gm-Features: AQt7F2pEregLdEMTJyGS5XjG5wSxxyj4Dlor6c_HsX8WBBg3FtwHaT1x_4GXMBQ
Message-ID: <CAJdd5GZgUotwXvYt-xR5uXxxoLnRx8TuS5mo7Wwi6_Q9j3CzFA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 19:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228875

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
> separate license analysis was performed). When differences are found,
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

It's unfortunate that the concluded license can't use an actual SPDX
license string; using an OE license string means converting.

Presumably, the reason for doing this is so that you can do:

SPDX_CONCLUDED_LICENSE =3D "${LICENSE}"

Is that a valid use case? If not, we should use an actual SPDX license
string instead.

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

You can't make the concluded license default to the declared license.
The concluded license is the license that you (then end user)
determines is applicable, and we can't have the core code making that
assumption for users. If no concluded license is explicitly set by the
user, then it should not be in the SPDX.

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

