Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F799C28B30
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:28:10 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.38645.1741789680525044923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 07:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MWXqdovY;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5495078cd59so7558855e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741789679; x=1742394479; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P88/dY+0ZIrhZspC+FN7MvmEgv6Md+Mfo0MXKGxR1yI=;
        b=MWXqdovYAEr9JNttptYMgTWdl0PBqnmeURIDapJj2L/An6gBenNvLRuJH/dinoW48q
         65q9xtDiaj0kj2roGLhus0zr34v+LIy8IG8f55lvSvggOXDfkKEv2S3XmQLG0/Ixlbd3
         Y83QX+MHeyHfTeUP1lXfDoHyOlj9OHIO/pqKs1G53YCzLEF1Jn5A4ZLS7wA87h4EC+C/
         oqhubLpQPhc9doDUtJdh9C9klhbuaWSSX+IvQQJdVlvrMqnbAXEyTDd/SWcEB8xPTu0P
         fy153AkpbaG8gu30yUy4SGVWrzv5wBaIro8IxijtZADPFaYa4pJksW9Twplz27BWteJd
         ihlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789679; x=1742394479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P88/dY+0ZIrhZspC+FN7MvmEgv6Md+Mfo0MXKGxR1yI=;
        b=Kf4uLqlv6dlJQLLhrZTxaQqZ8Bg99QMMMziIB8DCkbzn6K4P0DJbLc+FGyyETViC4l
         D8Tcu8qjDa/okvpW5hxlDIyCMtz446t0cIXDaEYuNoQVGBf6ltBzU69QY/9mBsbx7rtw
         vE4Hcpm0UmJ3+BNY8EbouKdmuAfubvkAwAKDgMI/bp8Z3Q2/PXfV+0BBXxzXQm7Ro+yV
         nIT1F/1yOIlBL5T+NL6BDzkqAsU07I6oAfbT8G+LTHXK4HOYdC9BeXdx9tudWY6aThGx
         c2DV2Pv/I9l79MxHfr5c2uHE1cUhGg+mae35d0GxetJqLPQRyqEuPmOj1qZW2uN3Qjpv
         LFCA==
X-Gm-Message-State: AOJu0Yz1hFE+M1Xlw02gWjfnEt0WccY7EmOFbY0pZ7goLevmKqgMv9ve
	cNu/Om3+UC2mrRIDEwT6CluEYJWguK9zWunal8oIBXo0Fo58Zh5ONFLx5XU41bZWpHHK5HVptVf
	wlb2oTcyKMouUH0V3KPtY6ZRZvXI=
X-Gm-Gg: ASbGncscRJJxkW08kAM4BUzLWdThoOxz7eSqPXRnAQ8OgQpH/5z6HWjl5nYFj2dEg7A
	Jq1fNJgEvVsaPgtiKyz13r0/oliXFvTy8fS9BWZkC/GyfI60i3pMwXqO1cEqQfsuN8egkbcdP3n
	rMuqrzBmYUA8Z9e5JWTe9nH/025w==
X-Google-Smtp-Source: AGHT+IGSITi6u3svTYNSocSm8SAHYzBidf6tDWqORtPGYebrqpyQl0XgPl20iDQbpkH7Rxf7V0z9+/JTdIcBAIgtK8g=
X-Received: by 2002:a05:6512:138d:b0:549:6451:7e76 with SMTP id
 2adb3069b0e04-549abae7019mr3320813e87.33.1741789678257; Wed, 12 Mar 2025
 07:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250312055803.801070-1-hongxu.jia@windriver.com>
In-Reply-To: <20250312055803.801070-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 12 Mar 2025 08:27:45 -0600
X-Gm-Features: AQ5f1Jom45guJWLGJcCwrKrcxZqjfFxhjJYbP0JmBfjM5dBm4xsvOp9YU1WuQeU
Message-ID: <CAJdd5GaOZRVenY65w9BQEDxRbY-nfD0fktVNqoAaxqR26YzaxA@mail.gmail.com>
Subject: Re: [PATCH] lib: spdx30_tasks: remove duplicated patched CVEs
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, mikko.rapeli@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 14:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212657

On Tue, Mar 11, 2025 at 11:58=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> Due to commit [lib: spdx30_tasks: Handle patched CVEs][1] applied,
> duplicated CVE identifier for each CVE which increased +25% build
> time (image task: do_create_image_sbom_spdx)
>
> $ bitbake binutils-cross-x86_64
> $ jq . tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-binutils-cross-x86_64.=
spdx.json | grep CVE-2023-25584
>       "spdxId": "http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-=
80e6-55c5-8b1f-cc37f04fbe09/962efd5da447b81b017db54d3077be796d2e5b6e770a6b0=
50467b24339c0995f/vulnerability/CVE-2023-25584",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs=
.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce=
7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2=
023-25584"
>           "identifier": "CVE-2023-25584",
>             "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
>             "https://www.cve.org/CVERecord?id=3DCVE-2023-25584"
>       "spdxId": "http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-=
80e6-55c5-8b1f-cc37f04fbe09/962efd5da447b81b017db54d3077be796d2e5b6e770a6b0=
50467b24339c0995f/vulnerability/CVE-2023-25584",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs=
.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce=
7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2=
023-25584"
>           "identifier": "CVE-2023-25584",
>             "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
>             "https://www.cve.org/CVERecord?id=3DCVE-2023-25584"
>
> Since the commit [cve-check: annotate CVEs during analysis][2] improved
> function get_patched_cves to:
> - Check each patch file;
> - Search for additional patched CVEs from CVE_STATUS;
>
> And return dictionary patched_cve for each cve:
> {
>   "abbrev-status": "xxx",
>   "status": "xxx",
>   "justification": "xxx",
>   "resource": "xxx",
>   "affected-vendor": "xxx",
>   "affected-product": "xxx",
> }
>
> But while adding CVE in meta/lib/oe/spdx30_tasks.py, the cve_by_status
> requires decoded_status
> {
>   "mapping": "xxx",
>   "detail": "xxx",
>   "description": "xxx",
> }
>
> This commit converts patched_cve to decoded_status
>
>   patched_cve["abbrev-status"] --> decoded_status["mapping"]
>   patched_cve["status"] --> decoded_status["detail"]
>   patched_cve["justification"] --> decoded_status["description"]
>
> And remove duplicated search for additional patched CVEs from CVE_STATUS
> (calling oe.cve_check.decode_cve_status)
>
> After applying this commit
> $ bitbake binutils-cross-x86_64
> $ jq . tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-binutils-cross-x86_64.=
spdx.json | grep CVE-2023-25584
>       "spdxId": "http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-=
80e6-55c5-8b1f-cc37f04fbe09/381bf593d99c005ecd2c2e0815b86bca2b9ff4cc2db5958=
7aaddd3db95c67470/vulnerability/CVE-2023-25584",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs=
.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce=
7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2=
023-25584"
>           "identifier": "CVE-2023-25584",
>             "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
>             "https://www.cve.org/CVERecord?id=3DCVE-2023-25584"
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D1ff496546=
279d8a97df5ec475007cfb095c2a0bc
> [2] https://git.openembedded.org/openembedded-core/commit/?id=3D452e605b5=
5ad61c08f4af7089a5a9c576ca28f7d
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index e20bb0c86f3..3d80f05612f 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -498,18 +498,13 @@ def create_spdx(d):
>      # Add CVEs
>      cve_by_status =3D {}
>      if include_vex !=3D "none":
> -        for cve in oe.cve_check.get_patched_cves(d):
> -            spdx_cve =3D build_objset.new_cve_vuln(cve)
> -            build_objset.set_element_alias(spdx_cve)
> -
> -            cve_by_status.setdefault("Patched", {})[cve] =3D (
> -                spdx_cve,
> -                "patched",
> -                "",
> -            )
> -
> -        for cve in d.getVarFlags("CVE_STATUS") or {}:
> -            decoded_status =3D oe.cve_check.decode_cve_status(d, cve)
> +        patched_cves =3D oe.cve_check.get_patched_cves(d)

The name of get_patched_cves() is apparently a lie now :)

Nevertheless, LGTM to me. Thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


> +        for cve, patched_cve in patched_cves.items():
> +            decoded_status =3D {
> +                "mapping": patched_cve["abbrev-status"],
> +                "detail": patched_cve["status"],
> +                "description": patched_cve.get("justification", None)
> +            }
>
>              # If this CVE is fixed upstream, skip it unless all CVEs are
>              # specified.
> --
> 2.34.1
>

