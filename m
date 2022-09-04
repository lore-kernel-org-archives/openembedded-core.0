Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C980AECAAD5
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 21:35:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.18157.1662327300601033251
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 14:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d66dJ95Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id d5so4334111wms.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 14:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=zLc4BKV91+1oPEbH6uen77FvhdFB7ufE6/Su2Ivo7jg=;
        b=d66dJ95ZMeLa2japnHoMEWXo4Sw4tWTaZDTLI0WHAzL8ItlPNfRSZGiEVe8qq4Q64n
         wCH+VUFDWMTtaOtNiD+A+eZ0XEYj0jeGO2mntTUPyw+M6tVF0MvPVnp5hf6XcRt+/Xm1
         QHT4v4NKpBdGZCAFGrVoCbvNRprNPSLc1P1UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=zLc4BKV91+1oPEbH6uen77FvhdFB7ufE6/Su2Ivo7jg=;
        b=1Br9WUjG/kET3sIvkAfhGSwWzoeBAaqkH1Rbz9wp6b2FXq/ZJu6JDQNjqxoQKux5ZT
         RRnw/o1rsMpwRsHVnYC1UFhfk8tPKPb1WmU1zaKlPUb2qsON5cAXD1Kcqb5keWL3kQ/z
         4iCpQ28KH8GJVvNzAZfd70dszvrEcyOeFNwf3CyhNydCFzA8xJXbPGnqJHJcu2wpZeRo
         MoMLqeL1cP9qN4aZJhORzRg7F2ee47df5PFlIlDaiSjEWai401lFMqhtlmRBIn/XnBfz
         GOUTydxYZ/LVs7sKOELyZmyRb3wGE0f8KnmM2cucMxjfODj4+STwQVoKqwA1CTolGcvX
         g0mw==
X-Gm-Message-State: ACgBeo3ckC0uwBr/6G3aS1WkfvISpCLYRP1OXzk6F7KFT9HDRZvkETGZ
	Qe6s8zPzVlrQ0sC5kfjEhokCMQ==
X-Google-Smtp-Source: 
 AA6agR6jfQgIrxdkmgpPxvW8jnp1cSxGOSFmXce3JUn0vmOgCM/N0tF7UYAB9EEXCRSXP19czqpWlw==
X-Received: by 2002:a05:600c:410d:b0:3a6:1db8:b419 with SMTP id
 j13-20020a05600c410d00b003a61db8b419mr9070031wmi.119.1662327298845;
        Sun, 04 Sep 2022 14:34:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:df52:563:aee3:2030?
 ([2001:8b0:aba:5f3c:df52:563:aee3:2030])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003a3170a7af9sm9542742wmq.4.2022.09.04.14.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 14:34:58 -0700 (PDT)
Message-ID: 
 <505b59537c1fd243c902ee5f10ac929e5e428953.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: Fix for the linker
 issues caused by using the shell
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
	shivams@gmail.com
Date: Sun, 04 Sep 2022 22:34:55 +0100
In-Reply-To: <20220904180946.1954417-1-sundeep.kokkonda@gmail.com>
References: <20220904180946.1954417-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 21:35:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170295

On Sun, 2022-09-04 at 23:39 +0530, Sundeep KOKKONDA wrote:
> [Yocto #14892]
> This is a fix for YOCTO #14878 patch. When sheband is more than 128 chara=
cters the default shell /bin/sh is used to execute the linker instead of SD=
K shell, which causes problems with LD_LIBRARY_PATH.
> With this patch shell usage is avoided.
>=20
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  .../rust/files/target-rust-ccld.c             | 39 +++++++++++++++++++
>  .../rust/rust-cross-canadian.inc              | 11 +++---
>  2 files changed, 44 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-devtools/rust/files/target-rust-ccld.c
>=20
> diff --git a/meta/recipes-devtools/rust/files/target-rust-ccld.c b/meta/r=
ecipes-devtools/rust/files/target-rust-ccld.c
> new file mode 100644
> index 0000000000..13f06b38f8
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/target-rust-ccld.c
> @@ -0,0 +1,39 @@
> +/*
> +*
> +* Copyright (C) 2022      Wind River Systems
> +*
> +* SPDX-License-Identifier: GPL-2.0-only
> +*
> +*/
> +
> +#include <string.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +int main (int argc, char *argv[])
> +{
> +        int i=3D0;
> +        char cc[1024];
> +        char *cmd[1024];
> +        char *ccargs[2][1024];

I'm a bit concerned about the fixed lengths coded here. What if there
are more than 2 arguments in CC/LD? What if one of the arguments (or
the variable) is longer than 1024?

> +
> +        strcpy(cc,getenv("LD"));

The original code this replaces uses CC?


> +        char * pch;
> +        pch =3D strtok (cc," ");
> +        while (pch !=3D NULL)
> +        {
> +                strcpy(ccargs+i,pch);
> +                printf ("%s\n",ccargs+i);
> +                pch =3D strtok (NULL, " ");
> +                i++;
> +        }
> +
> +        strcpy(cmd,ccargs+0);
> +
> +        unsetenv("LD_LIBRARY_PATH");
> +        execv(cmd,argv);
> +

Where is ccargs used here (other than the first entry)?

Cheers,

Richard



