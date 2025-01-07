Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7605E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 16:40:29 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.25312.1736268025717913853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 08:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l89FBgbc;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3002c324e7eso178301891fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 08:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736268024; x=1736872824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33/8KUvk8IYesvXv81G0b8bxKSvJ4bW5GEQPtCytsmU=;
        b=l89FBgbcT3WtC0VA6+KSKAz8Dqf0SDgLMu0Tfe3GQZYWKSzcm5c5TFJ5MNTvZNy5aK
         /dcFb32VLkjHvuzETNYV61bJgTjPd3sTm5MlVcrU1rOilQA0QPoTKqdKT9SrGoUXGVVJ
         klGrFVc4bh7JR2X699ZOB5THjqc/SwRDqbQGpaFDVg6rRjP4yOSgCZb/xrRXGnWXIBqt
         Q0TcLh1HfyQRXt24W5jS7P4+AEbfjm8XcxERjUI6ap+1i0ESkH/JHhks2TG/3kHROJsP
         X0hdeA+XR6PpHlH9iPPKQikbXbt4OmTL4ppUl3uSsvo6vFuAlnM0clcGjBFT1Ww+ciwN
         cguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268024; x=1736872824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33/8KUvk8IYesvXv81G0b8bxKSvJ4bW5GEQPtCytsmU=;
        b=WX+hremH8R+qtG/PByUVRYXNSJHUOEPZ+MyR8igedXKm8soCzMm5vxOpSW4wW27Iw6
         bct+N2OqC7ZLs/RMQ/XOpFGr4NbKHRijfdYrsaKKz8vwHZ3qfaz/uJsoRxIeCNyO0Rpc
         fmZX2nzhnivwCClLgI9gb3pzOP2TEGnFBaIAJaxHMwWXcgH5T7t6Z+fOIfmGHe7TxnwY
         ADNsu4w01e3ortI3ahnf81rBRT9wmaH4nBH4uFhNe4dSgrEwZawMjcQyeUQlsEJQxHHp
         6EQiq0tS8uwcdMMH4llRiQLYMEmN14blUDNHIKMpUoNh4V3UJx7OgdjAUPBPMIhNIunV
         NaUQ==
X-Gm-Message-State: AOJu0YzLlzTmHeAs0q8Apx85Cxyt6cD3163rxLZT4c1FpZqyAfB6euBu
	ZOuL6saFbfoSoT++1a9GTIx6l0Drk9DsbixHVggYjSfFNi6s187hzuuNacd2N6Jae0mVNBvTEbV
	fbWwA7GRNSoXt3qMUjmWgsWbPWuo=
X-Gm-Gg: ASbGncv09qhu/HaAlp+iYuX5Kb2JEnYG4xGayK0OY6zA68y9VEXo4b4YjmW7gBXvKfB
	IEwYNXVKgzqqpuV2Ov2fYXTs2HkUmI1q9+ByPiAqgoQnpOKdEc4w+
X-Google-Smtp-Source: AGHT+IEIilrT1RPv4xtHzp7BJFmrLJ/bHuYAH31TytGkEOk7KUZlUMytUrdsm1ZhG6jrE/GDMaBNspYF65PIzelu2RQ=
X-Received: by 2002:a05:6512:398d:b0:540:1b07:e033 with SMTP id
 2adb3069b0e04-54229561af5mr17957060e87.45.1736268023177; Tue, 07 Jan 2025
 08:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20241230074045.213743-1-hongxu.jia@windriver.com>
In-Reply-To: <20241230074045.213743-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 7 Jan 2025 09:40:09 -0700
X-Gm-Features: AbW1kvb2IWfIBZwOphuBwlVAlQycHWZRE65z4T1Essr2xqf1kL0yDH1HftE7qu8
Message-ID: <CAJdd5Gam4o=yUFcC-QPMNJZgf4sKq6O0Nk2NAfOy4pwdyMk0cw@mail.gmail.com>
Subject: Re: [PATCH] meta/lib/oe/spdx30_tasks.py: add patched CVE to SPDX 3
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 16:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209476

On Mon, Dec 30, 2024 at 12:40=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> Some CVEs may be patched during the build process without incrementing
> the version number, save the CVEs fixed by patches to cve_by_status
> which was parsed as "Patched" status to add new_vex_patched_relationship
> to pkg_objset
>
> Take recipe unzip for example, CVE-2015-1315 is patched in oe-core and
> is available in package SPDX
>
> oe-core$ grep "CVE-2015-1315" -rn meta
> meta/recipes-extended/unzip/unzip_6.0.bb:12:    file://06-unzip60-alt-ico=
nv-utf8_CVE-2015-1315.patch \
> meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315=
.patch:6:CVE: CVE-2015-1315
>
> $ bitbake unzip
> $ vim tmp/deploy/spdx/3.0.1/corei7-64/packages/package-unzip.spdx.json [1=
]
> ...
>     {
>       "type": "security_VexFixedVulnAssessmentRelationship",
>       "spdxId": "http://spdx.org/spdxdocs/unzip-d5d383ad-de07-5ac4-8814-3=
c95ed6bdaaa/6e57f2cbf8f80a80ee21628b8a35cdddaa8ee800cc9e42367d866eb8daa41bb=
0/vex-fixed/c8d7748f0d64a2a46a3a2545c891ad39"
>       "creationInfo": "_:CreationInfo1",
>       "extension": [
>         {
>           "type": "https://rdf.openembedded.org/spdx/3.0/id-alias",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs=
.org/openembedded-alias/by-doc-hash/22ab8d6eced4525f57bb861acc0fe983d8af580=
5dd97e702c22c1ffe04621cb2/unzip/UNIHASH/vex-fixed/c8d7748f0d64a2a46a3a2545c=
891ad39"
>         }
>       ],
>       "from": "http://spdxdocs.org/openembedded-alias/by-doc-hash/539e1de=
ec075c3a51b8c6975352b0a9ad320a130a4d7d516316b35994a830f93/unzip/UNIHASH/vul=
nerability/CVE-2015-1315",
>       "relationshipType": "fixedIn",
>       "to": [
>         "http://spdx.org/spdxdocs/unzip-d5d383ad-de07-5ac4-8814-3c95ed6bd=
aaa/6e57f2cbf8f80a80ee21628b8a35cdddaa8ee800cc9e42367d866eb8daa41bb0/packag=
e/unzip"
>       ],
>       "security_vexVersion": "1.0.0"
>     },
> ...
>
> [1] https://spdx.github.io/spdx-spec/v3.0.1/model/Security/Classes/VexFix=
edVulnAssessmentRelationship/
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 036c58bf4b..842962f609 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -515,6 +515,21 @@ def create_spdx(d):
>
>      cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getV=
ar("CVE_VERSION"))
>
> +    # Some CVEs may be patched during the build process without incremen=
ting the version number,
> +    # so querying for CVEs based on the CPE id can lead to false positiv=
es. To account for this,
> +    # save the CVEs fixed by patches to cve_by_status.
> +    patched_cves =3D oe.cve_check.get_patched_cves(d)
> +    for cve, patched_cve in patched_cves.items():
> +        if patched_cve["abbrev-status"] !=3D "Patched":
> +            continue
> +        spdx_cve =3D build_objset.new_cve_vuln(cve)
> +        build_objset.set_element_alias(spdx_cve)
> +        cve_by_status.setdefault("Patched", {})[cve] =3D (
> +            spdx_cve,
> +            None,
> +            None,
> +        )
> +

Thanks for finding and fixing this, I didn't notice it was missing. It
looks great, except that it should be in the `if include_vex !=3D
"none"` block so that it's not included if the user requested no VEX

>      source_files =3D add_download_files(d, build_objset)
>      build_inputs |=3D source_files
>
> --
> 2.25.1
>

