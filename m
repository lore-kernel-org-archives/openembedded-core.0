Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61780ECAAD3
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 07:55:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.5239.1662537315633640748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 00:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gq+YR+rj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t7so14000069wrm.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 00:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=YHovGF+CuYsngP6JOXPvIRj2R0UTveAdWiO980QBe6c=;
        b=Gq+YR+rjF4cKhrsfpDC94LtOYNgvHlCkCuFjY/ZlY4efv13FkXNVPPgby8ssL5CpBu
         uO4mIpVb2Eho6FfluTiA60RRfpfQLvNgpB+p2EqZpmYTvUQ1hN6mFWKNf7Tm0+1ZwxSi
         8f82Vr6n5FhmZ+idUa2CNvBww8pMY8iA5G9dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=YHovGF+CuYsngP6JOXPvIRj2R0UTveAdWiO980QBe6c=;
        b=2AseKnxkv4NHMYtxhMJUBLuLuirQdqNJXTqS7n5gu1d2Bu4skJOZveKp7WLW6U1PrK
         yPl05XiDt0m189zrQBjeE7weyeXgI0ibJ2NmSk4PBuMg1qndBbkmBVsqSl3fpAZHMWaS
         ZJgJQuWl7vieFPUcJ+/3zrvz0sJdTOydUj0w2ewJW2uiYwfGS6FTepIreoN46gQDpBuu
         MnzLOKt4iB202w02bNvlC8cKWUMufz/UhDPLnetAjKDMRK6io41PuocRb6/bPkkh7lcY
         W98DB5fFgnfzLw942n+1OlxacBXk8O+W8Q5xTN1ANP75NA4qyOoFaTd4edpYsoLLV12W
         RUEg==
X-Gm-Message-State: ACgBeo074ZAtEyAOQ/YywQ1XBZ5lv/FfWND2ZWeaDzFBPcp+T16eXoSu
	BS92ApqndEBNM0MnHkqajc/YZw==
X-Google-Smtp-Source: 
 AA6agR5akJKxhW3Qk+CHAtgx5heCjI3knK56JR2gqMNjyNQqAZWh6iafruIiz1jI07YZ2ruZGvTa6A==
X-Received: by 2002:adf:a702:0:b0:226:e205:fa56 with SMTP id
 c2-20020adfa702000000b00226e205fa56mr1179803wrd.637.1662537313898;
        Wed, 07 Sep 2022 00:55:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb69:bb70:edb:6315?
 ([2001:8b0:aba:5f3c:eb69:bb70:edb:6315])
        by smtp.gmail.com with ESMTPSA id
 c7-20020adfe747000000b00226dfac0149sm11135290wrn.114.2022.09.07.00.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 00:55:12 -0700 (PDT)
Message-ID: 
 <08ce90a26b9539b67026129e751c27b274017d77.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2] rust-cross-canadian: Fix for the issue
 caused by using sdk shell
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
	shivams@gmail.com
Date: Wed, 07 Sep 2022 08:55:10 +0100
In-Reply-To: <20220907021817.3309235-1-sundeep.kokkonda@gmail.com>
References: <20220907021817.3309235-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 07:55:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170372

On Wed, 2022-09-07 at 07:48 +0530, Sundeep KOKKONDA wrote:
> [YOCTO #14892]
> This is a fix for the fix in YOCTO #14878. When the shebang is more than
> 128 characters the default shell /bin/sh is used instead of SDK shell as
> a fallback, which causes problems with LD_LIBRARY_PATH. With this patch
> shell usage is avoided as we use a C wrapper and unset LD_LIBRARY_PATH
> that way.
>=20
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  .../rust/files/target-rust-ccld.c             | 21 +++++++++++++++++++
>  .../rust/rust-cross-canadian.inc              | 20 +++++++++++++++---
>  2 files changed, 38 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/rust/files/target-rust-ccld.c
>=20
> diff --git a/meta/recipes-devtools/rust/files/target-rust-ccld.c b/meta/r=
ecipes-devtools/rust/files/target-rust-ccld.c
> new file mode 100644
> index 0000000000..fa98c1dbd7
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/target-rust-ccld.c
> @@ -0,0 +1,21 @@
> +/*
> +*
> +* Copyright (C) 2022      Wind River Systems
> +*
> +* SPDX-License-Identifier: MIT
> +*
> +*/
> +
> +#include <string.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +int main (int argc, char *argv[])
> +{
> +    unsetenv("LD_LIBRARY_PATH");
> +    execvp("target-rust-ccld-wrapper", argv);
> +
> +    return 0;
> +}
> +
> +
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/re=
cipes-devtools/rust/rust-cross-canadian.inc
> index 7bf75a4712..7536579313 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -7,13 +7,18 @@ LICENSE =3D "MIT"
> =20
>  MODIFYTOS =3D "0"
> =20
> +DEPENDS +=3D "virtual/${SDK_PREFIX}gcc-crosssdk virtual/nativesdk-libc v=
irtual/nativesdk-${SDK_PREFIX}compilerlibs"
> +
> +SRC_URI +=3D "file://target-rust-ccld.c"
> +LIC_FILES_CHKSUM =3D "file://target-rust-ccld.c;md5=3Db6bc5662440675fd7d=
64688087a2f679;endline=3D7"
> +S =3D "${WORKDIR}"

Thanks. This patch changes the license which is good but it doesn't
update the LIC_FILES_CHKSUM. Since this is blocking the release build,
I've fixed that. Please work out why that didn't show up in your local
testing though!

Cheers,

Richard

