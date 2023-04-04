Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361AAC761AF
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 10:05:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.97486.1680602707700237979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 03:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UuWXkK5/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v1so32176098wrv.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680602706;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYDHNhWp8hCW6dbx6vr9G+eSAxwYmUI94CfcTUcKjio=;
        b=UuWXkK5/sQnoHpzxVWOakRyeXKbcFW6Lagk3qaLrgnsp/iBmg5coYO2dgr7ALdyVIR
         TgCzM45rCu34Kj0YkBe77OJkyIBqOhdI9bDNEbB4Mwy58LDfZjxRSpQAdVzzwcJDh/VD
         KIz/jal+99hYFVzNDsF8OKg2SQDlJnVE1mWn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680602706;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lYDHNhWp8hCW6dbx6vr9G+eSAxwYmUI94CfcTUcKjio=;
        b=wtwjUAt1t3YiaqbF+OcH6dMlFxEa7/so/q4jstD88WF8E8n+8FybdsMZPH7NXXiDK+
         CoShho1uslR05lJOhfwAiguGNTVz3+Vh6yZtfdToIV1xSHg9bBKRSKvym7eVZ1jOBN5Z
         /UbQXt9lHEE8OWcdBeII6IHO/zyCiY4UbxhCBfPAee6vgAGYuTDbvWs9rFRY4Aew844j
         LSyZVplpIdqhIzS34QvuCZzqrcXhbowm2hp7dNVZqOyv0VdwMvdGTpXuZypgxp+XwQFw
         1B5f+i2wu2ci16ebPymYUNTKQYyBwO9qXXR7vENT3oWnEmc4qjgqLEcG68YLInbcdrW3
         /Fdg==
X-Gm-Message-State: AAQBX9dt13a0JIcFH8O0XEZqAy93L+u7ZiQDkQHzuoNTTX3IkbsNRluW
	JmBc7JnzpWpmdBgh4AWMAD4alkpgYcyIJD79orQ=
X-Google-Smtp-Source: AKy350Y8b5A2Rz4lslq87jHQcRnpYTh/o56ouTrvuCBj+S0C9Sshe5V9lg9zhpUyCWKHeoUPWLGRVA==
X-Received: by 2002:adf:e352:0:b0:2cf:ef5d:4ee7 with SMTP id n18-20020adfe352000000b002cfef5d4ee7mr1120025wrj.69.1680602706120;
        Tue, 04 Apr 2023 03:05:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ff0f:d6ee:8211:76e0? ([2001:8b0:aba:5f3c:ff0f:d6ee:8211:76e0])
        by smtp.gmail.com with ESMTPSA id f9-20020adfe909000000b002c7163660a9sm11861359wrm.105.2023.04.04.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:05:05 -0700 (PDT)
Message-ID: <988002ed9a0e281efeea1d4a4098d486127030e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemu: retain default trace backend if
 'ust' is not enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Apr 2023 11:05:05 +0100
In-Reply-To: <20230403143730.26123-1-thomas.de_schampheleire@nokia.com>
References: <20230403143730.26123-1-thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 10:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179680

On Mon, 2023-04-03 at 16:37 +0200, Thomas De Schampheleire wrote:
> The qemu build system enables the 'log' trace backend by default, if no
> explicit choice was made with '--enable-trace-backend=3DCHOICE'.
>=20
> However, the qemu recipe uses the following PACKAGECONFIG line:
>     PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-b=
ackend=3Dnop,lttng-ust,"
>=20
> which means that the 'nop' trace backend will be explicitly selected if t=
he
> 'ust' feature is not enabled. The 'nop' backend removes almost all trace
> points at compile time, and thus basically means 'disable tracing'.
>=20
> To retain the default trace backend if 'ust' is not enabled, the above
> PACKAGECONFIG line should either explicitly fall back to the 'log' backen=
d,
> or not provide any value for the 'disabled' case. This commit chooses the
> latter to not make any assumption about the upstream default.
>=20
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com=
>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index b41055fe5d..ae99a9e87b 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -207,7 +207,7 @@ PACKAGECONFIG[libudev] =3D "--enable-libudev,--disabl=
e-libudev,eudev"
>  PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
>  PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
>  PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
> -PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-back=
end=3Dnop,lttng-ust,"
> +PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,,lttng-ust,"
>  PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,,"
>  PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp,libseccom=
p"
>  # libnfs is currently provided by meta-kodi

This triggered reproducible build test failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2659/ste=
ps/12/logs/stdio

which leads to:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230403-itxd_s5=
0/packages/diff-html/

i.e. the paths to files is being encoded the target source package
files.

We'll need to resolve that issue before we can turn the default tracing
on.

Cheers,

Richard




