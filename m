Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B006C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 09:24:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.3011.1678267476718118492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 01:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hNSab8Rb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id l1so14625529wry.12
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678267475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jnUFshtRo2XZq+7dttP8J1bQLB1RzWzSMcbfKYArgs=;
        b=hNSab8RbEC39cLcCKsEfaT2buP7yL2qH1tfHGpE5oUSJqBU9Hytywehmt2U9PXHVOa
         0FFrarkTedQRUfMtx5qS6ulo+Fyil2aCIugSEeV9E3sgHpdwEvAPMMDfOvR0SA0QDh9D
         DXMEm/ghJLbI6JlwjdFrRS0e+0pZl8NWeOqt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678267475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jnUFshtRo2XZq+7dttP8J1bQLB1RzWzSMcbfKYArgs=;
        b=6s/rMWec00o/jZYP2z0fL1wH5IaW5vN5x9bRhnW/3Vee7S3MikMD+XM4YDZPedB4AO
         q/Bl78w0A1jyH4SipRrC7lS4e+Z03/GnFoSMxjebC4wQWP/kh7rvNEYX4ddB5XtVON1Z
         mGeX9TfHic/K7nA3RkZjV0R1YZpojhr2WYvFrg4vc/p76bYgua1Qoj3ot51p165aM0Rp
         9vgO7eUtHcEpnXwgGfORn/49K6DlH74oBgM+68mjehsL4Aqe71PABIIxVApFxxvXJKe1
         cRkXkZAA5ICWhj+LZ21E2Ke87LpiTRe1YrFiqgbrrgDmy7Rive1klt4DrVce9p2TXLba
         eyUg==
X-Gm-Message-State: AO0yUKUQAqY3rB+pjZv81FzyGPNMgchALzmNOP+Gbgum7EFsJwprrGNn
	LSP2QsflBpsP13ZOgzjnFDcj5GJOFw6vO7ZEBjQ=
X-Google-Smtp-Source: AK7set+7gLetEjLivlFzzDXd84577cwoNMUIuv9e8SGmuRy4PKrjEk4WSDjGs+AgLZc4sSgKga/hWw==
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id a2-20020adfeec2000000b002c58d0675c2mr13039678wrp.35.1678267475168;
        Wed, 08 Mar 2023 01:24:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b? ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d68ca000000b002c59e001631sm15036537wrw.77.2023.03.08.01.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 01:24:34 -0800 (PST)
Message-ID: <6e1d1ccb86355e4bd4cdf669e06069706b702afd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 5/5] bash: Fix install conflict when enable
 multilib.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Wed, 08 Mar 2023 09:24:34 +0000
In-Reply-To: <1678239619-21210-5-git-send-email-wangmy@fujitsu.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
	 <1678239619-21210-5-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178159

On Wed, 2023-03-08 at 09:40 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Error: Transaction test error:
>   file /usr/bin/bashbug conflicts between attempted installs of lib32-bas=
h-bashbug-5.2.15-r0.armv7ahf_neon and bash-bashbug-5.2.15-r0.aarch64
>=20
> The differences between the two files are as follows:
> @@ -26,14 +26,14 @@
>  # configuration section:
>  #      these variables are filled in by the make target in Makefile
>  #
> -MACHINE=3D"aarch64"
> -OS=3D"linux-gnu"
> -CC=3D"aarch64-poky-linux-gcc  -mcpu=3Dcortex-a57 -march=3Darmv8-a+crc -f=
stack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-securit=
y -Werror=3Dformat-security "
> +MACHINE=3D"arm"
> +OS=3D"linux-gnueabi"
> +CC=3D"arm-pokymllib32-linux-gnueabi-gcc  -march=3Darmv7-a -mfpu=3Dneon -=
mfloat-abi=3Dhard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wfor=
mat -Wformat-security -Werror=3Dformat-security "
>  CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types  -DNON_INTERACTIV=
E_LOGIN_SHELLS -DHEREDOC_PIPESIZE=3D65536 -DBRACKETED_PASTE_DEFAULT=3D0"
>  RELEASE=3D"5.2"
>  PATCHLEVEL=3D"15"
>  RELSTATUS=3D"release"
> -MACHTYPE=3D"aarch64-poky-linux-gnu"
> +MACHTYPE=3D"arm-pokymllib32-linux-gnueabi"
>=20
>  PATH=3D/bin:/usr/bin:/usr/local/bin:$PATH
>  export PATH
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-extended/bash/bash_5.2.15.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-extended/bash/bash_5.2.15.bb b/meta/recipes-ext=
ended/bash/bash_5.2.15.bb
> index f78f79fcc5..ce81496f52 100644
> --- a/meta/recipes-extended/bash/bash_5.2.15.bb
> +++ b/meta/recipes-extended/bash/bash_5.2.15.bb
> @@ -20,3 +20,6 @@ DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.conta=
ins('TUNE_CCARGS', '-mthumb
>  DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> =20
>  BBCLASSEXTEND =3D "nativesdk"
> +
> +inherit multilib_script
> +MULTILIB_SCRIPTS =3D "${PN}-bashbug:${bindir}/bashbug"

I think we should just change the MACHINE, OS, CC and MACHTYPE lines to
something like "<redacted for multilib compatibility>".

Cheers,

Richard

