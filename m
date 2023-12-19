Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C1EC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:21:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.16012.1702999290838879150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ewz4MW/A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d2764c0f2so9923285e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 07:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702999289; x=1703604089; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Agt4W8vmVzPbn1dwbMJoOV5Dw84Dbj1T2edAzaczrjM=;
        b=ewz4MW/ABH+ST5zo++Titl/fnvbkm7FwUNiTcUdplOCPMeSadi473xNIGPJo1XI9xd
         Eb0iZQcFlVclmOiS8r3YQcPtbCeB0yICqJvbehiqpph4nWNmqHENbwTNraSJ53cScwJw
         PZ7uAx8VjeDP3qi5Kbd/FS+m5PfosuvVd6tXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702999289; x=1703604089;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Agt4W8vmVzPbn1dwbMJoOV5Dw84Dbj1T2edAzaczrjM=;
        b=VJZlVVzaIJq7nqAfOGWYP/5eZqckAScC75IeMVvqNbDz3haJBE6aE1fqW1lZ0VhFFL
         JX1sT1CUXbkZENdTbGneJTQ1doxIKgEdQhqbRAqsb8iUrChFI9KfA5YG1Jb2sWIE2m9m
         Zs3JtOJudZ1RGjaP5/68k69J/txp+godYEz1odho6ys1ktT7gyYrM4rMpthKjKfzq0n/
         FQ2toPIC8CHIwEvJ54tIyv0pHRpZHNlH69g6aNq9S+ptPsdOmRzAhqy8Q9AwpCXVlSx1
         82A9nFAZYKfyZ+VJpoYoj/j52/c/hFca5BN4gD42QfUGB+QSq7d3+JCH6yyKEOVDsiNq
         1f4A==
X-Gm-Message-State: AOJu0YzlAaWsUCF78t8WtFbvWifENNr+zCqvz3k8Uq9tF/t3FjRkue7L
	4Q+nz9M96YffDIWCGN+DwAoXnA==
X-Google-Smtp-Source: AGHT+IF2XJlQoG0nazJiLKbZB90+rQ6GiFnERcLvl59znYQM1Ko/xmI7T/fBny71GxvhPw4heBLpWw==
X-Received: by 2002:a05:600c:4d0d:b0:40b:5e21:bdd1 with SMTP id u13-20020a05600c4d0d00b0040b5e21bdd1mr9031379wmp.96.1702999289195;
        Tue, 19 Dec 2023 07:21:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87d:537f:7c6:e419? ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id s21-20020a05600c45d500b0040c3953cda5sm3296861wmo.45.2023.12.19.07.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 07:21:28 -0800 (PST)
Message-ID: <224aa4ffd7f77c4f2e78d16727086ecd8821eb60.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] create-spdx-2.2: combine spdx can try to
 write before dir creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jpuhlman@mvista.com, openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2023 15:21:28 +0000
In-Reply-To: <20231218175756.3622411-1-jpuhlman@mvista.com>
References: <20231218175756.3622411-1-jpuhlman@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192749

On Mon, 2023-12-18 at 09:57 -0800, Jeremy Puhlman via
lists.openembedded.org wrote:
> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>=20
> On occasion a file is attmpeded to be opened prior to the
> creation of the spdx_workdir. Create the directory before
> the open, just in case.
>=20
> File: '/build/layers/poky/meta/classes/create-spdx-2.2.bbclass', lineno: =
1081, function: combine_spdx
>      1077:        )
>      1078:
>      1079:    image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.js=
on")
>      1080:
>  *** 1081:    with image_spdx_path.open("wb") as f:
>      1082:        doc.to_json(f, sort_keys=3DTrue, indent=3Dget_json_inde=
nt(d))
>=20
> Add stringify of value passed as spdx_workdir
>=20
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index b0aef80db1..47c2366c7a 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -1075,7 +1075,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, =
rootfs_spdxid, packages, spdx
>              "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXI=
D),
>              comment=3D"Runtime dependencies for %s" % name
>          )
> -
> +    bb.utils.mkdirhier(str(spdx_workdir))
>      image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
> =20
>      with image_spdx_path.open("wb") as f:

FWIW I put a str() call onto the bitbake side of this in case we run
into this anywhere else.

Cheers,

Richard

