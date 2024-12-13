Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87049E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 23:44:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.8747.1734133466527298044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 15:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QzqLrlMW;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3c47434eso2244860e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 15:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734133465; x=1734738265; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxd8/EWOOlV8Zw+y20Tu/xuqD4nuMPplQkcLaXnfthM=;
        b=QzqLrlMWiHEG5WIh2yASEapC62SnlGSSliYfObKu2pHhvTHxAshlTHWiSdXoNKqqwB
         J/mJ5z3ql/kqw/szU6UbDB/hm2Y7zVHFsVIXd98QSDX7Ppd+plRmAIUS7pDvEIQPf0Ko
         eE2Y7T2xy0ILINlLkUT6mQ0Y8yyMeaK6hj+bOGzrZcrvDpNzg7w32cNJ/Mohvcrs4BWa
         3rV/PFVE/mLD6ZVhEONhbQemKF8Vr/qy0Lm8pK5Hqh/QlW0sf3NWHVW/PRwOUzCWO7oo
         g06qmYY+1ZZonBCZix27ekMhr/MWRj4ojP705uLKOyR811pCn6sMYtBoL+rSRrlHVIUe
         RbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734133465; x=1734738265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxd8/EWOOlV8Zw+y20Tu/xuqD4nuMPplQkcLaXnfthM=;
        b=rVJ0p3Va+b4m00S+QLFhEFq/wnnMuvLgP9D00Uk7xYMWNAfC7tApkTt4SyXpDzmzFW
         9t9TsaFLLvTQdy/3eIdukJ2yYv9AYDG1Rq7yofkTK343Qr2TMRNpoHF96z2lWkxtCkG9
         GYMIpbs3gfBwq7TXQZbx76JwqjPfV+16E7xS8lhmL4q19ptHT/8Koz++kE9H/Z3MKPbH
         sSUCYNH0C9F7+t76UnNSt3gEZIQBfbIEzERcaCSIFPRyIsHYJ+OeeeRDszh6cCTMFt1N
         3gfgU3Wul/fywnyU8fT+yKwHDdIANC7j9dyN9DwJovDMMKUSDIt10QxN3RYNlvzG3xQa
         Hd4A==
X-Gm-Message-State: AOJu0YxEQieP6dxVlOPdhrP61ibWUgoHk9m3MYVX7zKq4iAQrQ9lDC6H
	qlc8YIDorRjtULPY9vn44VWhcBMx4Nq1WqgnoxUwSRjFmc1tRb47PX3ZI0YxD2aTIXJUHrnR/P9
	BAwZ2DIPGKa862X/vMMr3cw3yXIo=
X-Gm-Gg: ASbGncsLhGHZjhhp3NmnWeWVrRkHEGmDNv7eF/STsyreIOhvr8XXfMXxHGMWucXNIYb
	SkQSWkMXHRX3hJax1bTFQxrPlYqhR1HKj0JAPcfmjLpJTcCXssOdA
X-Google-Smtp-Source: AGHT+IE08Ec7Bkse/KN4tvPOGccoexp9A24139FFv3vfo+JL9bB6nCOxFUwDjr9xulVXBqX+zUwU96U9mnzTRnOXpNA=
X-Received: by 2002:a05:6512:1288:b0:540:3572:bb6 with SMTP id
 2adb3069b0e04-54090557f0emr1589112e87.15.1734133462579; Fri, 13 Dec 2024
 15:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20241212110932.2063844-1-hongxu.jia@windriver.com>
In-Reply-To: <20241212110932.2063844-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Dec 2024 16:44:10 -0700
Message-ID: <CAJdd5GboPsjC+A9PBBSGX_41PYLGdWCoJF5V1u6J2+R-NC1W4w@mail.gmail.com>
Subject: Re: [PATCH] meta/lib/oe/spdx30_tasks.py: fix alias in
 simplelicensing_customIdToUri not extracted
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 23:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208699

On Thu, Dec 12, 2024 at 4:09=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> After commit [spdx 3.0: Rework how SPDX aliases are linked] applied, it s=
et
> license_text_map with alias other than actual spdxId
>
> The property of simplelicensing_customIdToUri is ListProp(ObjectProp(Dict=
ionaryEntry))),
> and class DictionaryEntry has key and value, the property of value is Str=
ingProp other
> than ObjectProp in which could not support to decode/extract alias with a=
ctual spdxId in
> image jsonld file
>
> $ bitbake core-image-minimal
> $ vim tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.s=
pdx.json
> ...
>       "simplelicensing_customIdToUri": [
>         {
>           "type": "DictionaryEntry",
>           "key": "LicenseRef-PD",
>           "value": "http://spdxdocs.org/openembedded-alias/by-doc-hash/d5=
3e90e23b12c4ad640809a74a810e86f31c76cdbdf36487712d22a33d53362a/sqlite3-nati=
ve/UNIHASH/license-text/PD"
>         }
>       ],
> ...
>
> After applying this commit, revert [spdx 3.0: Rework how SPDX aliases are=
 linked]
> to set actual spdxId other than alias to dictionary license_text_map
> ...
>       "simplelicensing_customIdToUri": [
>         {
>           "type": "DictionaryEntry",
>           "key": "LicenseRef-PD",
>           "value": "http://spdx.org/spdxdocs/sqlite3-native-e5cc0672-d8dd=
-57e8-a2df-fe4615831fda/162c62b5b011cd3f82f413b3dae4d6d1542201552c964d5ce69=
fe170e0720b85/license-text/PD"
>         }
>       ]
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 036c58bf4b..82fcfe7a63 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -107,9 +107,7 @@ def add_license_expression(d, objset, license_express=
ion, license_data):
>
>          spdx_license =3D "LicenseRef-" + l
>          if spdx_license not in license_text_map:
> -            license_text_map[spdx_license] =3D oe.sbom30.get_element_lin=
k_id(
> -                add_license_text(l)
> -            )
> +            license_text_map[spdx_license] =3D add_license_text(l)._id

Ah, sorry, this will not work because the SPDX IDs can be wrong
anytime that documents are referenced across sstate objects. This is
why we have aliases in the first place so that they can be "looked up"
independently of their actual SPDX ID, until they are all linked
together in the final SPDX document. This works for normal object
references just fine because the alias SPDX IDs are "missing" when the
document is merged, and our code knows how to pull in those SPDX IDs
by the "missing" alias to resolve them.

Unfortunately, since a DictionaryEntry holds a free form string for
the value, that doesn't work here. Instead, we will need to add
special code in the linking to manually go through all of the
simplelicensing_customIdToUri DictionaryEntry items and resolve any
aliases to actual objects. I think that needs to go in
expand_collection() in sbom30.py

>
>          return spdx_license
>
> --
> 2.25.1
>

