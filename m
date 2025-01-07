Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50BBE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 16:44:59 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.25431.1736268296741646914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 08:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QcSAgJQc;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso15608491e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736268295; x=1736873095; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/h3spwq8r3lprQ1i/iVgd+3e8KlLtSPG6kHbzVMv34=;
        b=QcSAgJQcw4gUbyCvAggT57yTFBmhm/g526+HV0fPQ844dl+JBrWOZyCnIkSwXpkqli
         TBIMNYj0+gGICd6bPQWGKL6doH9CmfAChvZ8+eVLZKrvdIFoWAWz5Vaf7rZONC/10bsj
         8opm9yWKRJmiv3nrdbbIeeuSsaBiudvwEvlKHSwgMeqeN4cmP30BhcFpYmZl24qYqPfo
         LjDUm1kWYmGAtpmcBjflM9StZn+DzAwixHDN5GYETb8l9lpu3muJyNVAEQx9tzxbZLQl
         /OnZm5imzWzrnARYX+/N2woJ78pggmFb46rUXX4KrcjkM6OMVbWrG6/QKiuxbzafr3Dz
         DHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268295; x=1736873095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/h3spwq8r3lprQ1i/iVgd+3e8KlLtSPG6kHbzVMv34=;
        b=diFlIO56rsQSk1HY7W261Kn0kNvvGb6HatHF/3bRsXu4OeM6GVkIXoGxAoZ8CNrRRE
         QidBajejmezW0OHpGoXXQHg1zMVIN99QzwREj1BNaoFGNbxcNLicxC5BxI+k0UBv9pDY
         Q75A/ID08hZi/yyFe/mTivPHr0xqBaWrek3yhwcTbXF9uVBvClh6+NywmsDuE1mSRFs3
         VKrGDhsda9gHpJwOmWT514A2ZKaq682onRpJHz9G8FEjsJnEVvBkjTMJIzJNIdXIL1Yn
         FAwVzSDn9yO46SraA2+vDis7SKRDIB19SH/zKukRuMOfoQPJjip6usizj3jSr42IxqzA
         tSnw==
X-Gm-Message-State: AOJu0Yxmp1HJQVIXchH9rCnBINZDkNlidBC8F5q/n6L/J3Px4tur1U2L
	vRNo+0NR6miaq7w3D0d85SpR1wRtgu0JPFtttDPXM7v8ekZl6X1FB6cx64NRPJB5eSLUiNLKH0t
	vv9IuuKTcTxe6ayivapqxQuIgBbsDTw==
X-Gm-Gg: ASbGncvMrCieuaaM4c2Us9/p0aFmgjeMtQ9GO22cRbE7IAEJr+mlb98Zx7YBnXptcue
	xyPDsbmZkdtFuiNXHDG78cE1RCHabj94cfX7s/V9I8iAWxziWha35
X-Google-Smtp-Source: AGHT+IHt4BO77yYjDZo8S+2Qe0k2rgqbwaThithdDavbJJWo3Md8WIpkZII/Zz2GaAN4bBBuBCp1o7oRu1CP0GivJ6o=
X-Received: by 2002:a05:6512:118a:b0:542:28e3:2141 with SMTP id
 2adb3069b0e04-5422956be9fmr20808866e87.54.1736268294641; Tue, 07 Jan 2025
 08:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20241226054321.143382-1-hongxu.jia@windriver.com>
In-Reply-To: <20241226054321.143382-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 7 Jan 2025 09:44:41 -0700
X-Gm-Features: AbW1kvY9t3Kee9yw40hpBRmblmYpw7Hq7oV7x9dmxUUIxUYq77nZhFkBOc8fy5Y
Message-ID: <CAJdd5GZup=MyB6wHpOWeGbvWMXbn=w044mZ5KRRkx83oCMHRfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] meta/lib/oe/spdx30_tasks.py: set license alias to
 hasConcludedLicense relationship
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 16:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209479

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Wed, Dec 25, 2024 at 10:43=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> Set license alias other than spdxId to hasConcludedLicense relationship
>
> $ echo 'MACHINE =3D "qemux86-64"' >> conf/local.conf
> $ bitbake shadow
> $ In tmp/deploy/spdx/3.0.1/corei7-64/recipes/recipe-shadow.spdx.json
> Before this commit
> ...
>     {
>       "type": "Relationship",
>       ...
>       "from": "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99=
b12a405441/c34a0920c2f689375e786a80ab3176b844997d543b73dd5f99e6ffa8fcc72fee=
/source/8",
>       "relationshipType": "hasConcludedLicense",
>       "to": [
>         "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a40=
5441/c34a0920c2f689375e786a80ab3176b844997d543b73dd5f99e6ffa8fcc72fee/licen=
se/3_24_0/BSD-3-Clause"
>       ]
>     },
> ...
>
> After this commit
> ...
>     {
>       "type": "Relationship",
>       ...
>       "from": "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99=
b12a405441/c34a0920c2f689375e786a80ab3176b844997d543b73dd5f99e6ffa8fcc72fee=
/source/8",
>       "relationshipType": "hasConcludedLicense",
>       "to": [
>         "http://spdxdocs.org/openembedded-alias/by-doc-hash/cc72db638e3f8=
e283e722af0ecc77d19f93cc6736700ee76477e3773b6b07b05/shadow/UNIHASH/license/=
3_24_0/BSD-3-Clause"
>       ]
>     },
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index ae75311ed1..12588b3949 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -524,7 +524,7 @@ def create_spdx(d):
>      build_objset.new_relationship(
>          source_files,
>          oe.spdx30.RelationshipType.hasConcludedLicense,
> -        [recipe_spdx_license],
> +        [oe.sbom30.get_element_link_id(recipe_spdx_license)],
>      )
>
>      dep_sources =3D {}
> --
> 2.34.1
>

