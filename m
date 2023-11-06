Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E208C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:58:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.58402.1699286304235063574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iBmC/NW3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso34176865e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699286302; x=1699891102; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RXdrX9Mz62B94AV7/XWg3Z8NZ3qMvWJziuELOHeQVi8=;
        b=iBmC/NW3FEO5Pl+7e/xCz0G8jjwRoTKn9kteDawowZGNgU0+5H94bcb9DHgFzcJmbE
         Pxy5Ky9edAyq9J9BjCJEmkIPlrtB/3Fh3mtpQbNP63LUXSdKRpbSQUkPtHB6VrqlpqlT
         r6sJFvpdglDm9Akj7zBTF4EliuMZEdxI3xajs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286302; x=1699891102;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXdrX9Mz62B94AV7/XWg3Z8NZ3qMvWJziuELOHeQVi8=;
        b=gm+eGw6J1gdlRzg9wQz+oFawmU/IHh1xGSyoknNvcEP7Mo2WO9dqhzy0Q0Z1Yi/uEF
         2VThYygN/NLWPIERSdrk5JAgtCCQqBJvs6/Sk/PmksIQF+IPWE6IGNQPx9XFeRWvK/t5
         v+g+SxzA9fNOMRRDhsTv6sPQmncvc5p/iVKyXpKT+muRZYnAncPLnPF8CD7jidz1SoGR
         QnrIx31En2nwLAeoGaO77H9Q0dBDPvvTuNDYGmHuriyKAXMJ7+xSnp7DXEvUF/Jbzz7q
         rw033G5S46ZE2Fcso0t4M9rDQlAopuSevuJYmSF6v9lBS2Z4targX0TWf2MPKKgL910O
         DXMQ==
X-Gm-Message-State: AOJu0Yy6vqhpvA3LwSyHP9YCy4qbZa6/Yn/RXS5yHjl8bD8meEc6nzda
	hmz3J/ymbBEY1MGAOxGQu/W6JQ==
X-Google-Smtp-Source: AGHT+IHTxnWsZYqWWz37zqfaF+9WDwvxksob46HJyFI5naUyag7WCW2qX647PujRtd80hH53XutJtA==
X-Received: by 2002:a1c:4c0a:0:b0:406:c6de:2bea with SMTP id z10-20020a1c4c0a000000b00406c6de2beamr89441wmf.17.1699286302548;
        Mon, 06 Nov 2023 07:58:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bc8d0000000b0040684abb623sm12292141wml.24.2023.11.06.07.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:58:22 -0800 (PST)
Message-ID: <24935f5f7c41ebee05e49332358640daf32add8a.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC v2 03/12] oe/sbom: change the write_doc to
 prepare for spdx3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <louis.rannou@syslinbit.com>, 
	openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com, Marta Rybczynska <marta.rybczynska@syslinbit.com>,
  Samantha Jalabert <samantha.jalabert@syslinbit.com>
Date: Mon, 06 Nov 2023 15:58:21 +0000
In-Reply-To: <20231031224733.367227-4-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
	 <20231031224733.367227-4-louis.rannou@syslinbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190234

On Tue, 2023-10-31 at 23:47 +0100, Louis Rannou wrote:
> This changes the prototype of write_doc as the SPDX3 documentation does n=
ot
> specify yet which is the root element.
>=20
> Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
> ---
>  meta/classes/create-spdx.bbclass | 2 +-
>  meta/lib/oe/sbom.py              | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

I was looking through the patches and a couple of things jumped out
below.

>=20
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
> index 19c6c0ff0b..b604973ae0 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -5,4 +5,4 @@
>  #
>  # Include this class when you don't care what version of SPDX you get; i=
t will
>  # be updated to the latest stable version that is supported
> -inherit create-spdx-2.2
> +inherit create-spdx-3.0

This change probably doesn't belong in this commit but a separate one?

> diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
> index 824839378a..ec543fa43d 100644
> --- a/meta/lib/oe/sbom.py
> +++ b/meta/lib/oe/sbom.py
> @@ -68,7 +68,9 @@ def doc_path(spdx_deploy, doc_name, arch, subdir):
>      return spdx_deploy / arch / subdir / (doc_name + ".spdx.json")
> =20
> =20
> -def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3DNone, indent=3DNo=
ne):
> +# WARNING: This is for SPDX3. As long as we don't know which is the root
> +# element, this suggest a virtual graph as top of the tree
> +def write_doc(d, spdx_graph, spdx_doc, arch, subdir, spdx_deploy=3DNone,=
 indent=3DNone):
>      from pathlib import Path
> =20
>      if spdx_deploy is None:
> @@ -77,7 +79,7 @@ def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3D=
None, indent=3DNone):
>      dest =3D doc_path(spdx_deploy, spdx_doc.name, arch, subdir)
>      dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
>      with dest.open("wb") as f:
> -        doc_sha1 =3D spdx_doc.to_json(f, sort_keys=3DFalse, indent=3Dind=
ent)
> +        doc_sha1 =3D spdx_graph.to_json(f, sort_keys=3DFalse, indent=3Di=
ndent)
> =20
>      l =3D _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNam=
espace)
>      l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)

Shouldn't this patch also change users of write_doc in spdx 2.2?

Cheers,

Richard


