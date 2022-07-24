Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1FACCA48A
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 09:53:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.15131.1658656399164737346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 02:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LddUq446;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id n185so5124129wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 02:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=LNOjBLmrIpvrEUIFCr3parCRFpGTl13KDGM6JRTu+Ho=;
        b=LddUq446lG2S05Jmes1Qd4SMVBWbynOc3kXoq57Ap4SmJHXCknHkR2QI8nYchndnvw
         MGJwXLt9LuYuq2GVg4Sj6UlavC1KKJXyHuPa07Kidtdg91xD+P6Q20miUrmlnXjhUvRa
         /cCQEUYiHNlBxFY0LdOX8iOwgHc9zThT2c86k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=LNOjBLmrIpvrEUIFCr3parCRFpGTl13KDGM6JRTu+Ho=;
        b=ClLMa/yopYr0O1bQogbRHZdAVWG/njsz+vFG5q1M7v/kV9JiRU7BcZvnLvZaOERp8H
         Ifl6iVxpxrPzODK9l14Ub04fsdvUEg5t5vYc9D3UdDa9AOx4fq93LPOCi2AG1utAPlr7
         66+KzVhUfyeBlAavqSgOyUghWndu9p8xPGA9lzCNGRDDyuERsqRAmv88idrqfQBuLo/I
         geVaMBtDwecxMhCX7f66s3ku0UQqfFSdmkq2/iY+qMpyK1vvrQkZ0GYsCVNsOsIQpn6B
         aFvCY4d1A5YgFHFltgPL7XUmGTwjhN590bZ7OEcJAA/jFuz5qJyQf3IZfYNiyM3yCF6R
         O1Ew==
X-Gm-Message-State: AJIora8t7cduutfyZwEW6Mm8GVm+68QryLxka5yTC85yjgmAai0/3yee
	8Hf9fsvJNfshFLDzgE29QqDwvg==
X-Google-Smtp-Source: 
 AGRyM1uotgWwcGb8H7YKZJ3sSJKzia5kJGOvz5zdYRZrk211u0jOquQnBm9yENNkgbiMdG8CZ7lrkw==
X-Received: by 2002:a05:600c:4f0e:b0:3a3:3077:e5b3 with SMTP id
 l14-20020a05600c4f0e00b003a33077e5b3mr5058190wmq.94.1658656397565;
        Sun, 24 Jul 2022 02:53:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3a49:d7f2:fe29:16f8?
 ([2001:8b0:aba:5f3c:3a49:d7f2:fe29:16f8])
        by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003a325bd8517sm12483913wmb.5.2022.07.24.02.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 02:53:16 -0700 (PDT)
Message-ID: 
 <a14df0caa6e07cbc042ac622758f97056608a2f8.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 2/3] archiver.bbclass: avoid kernel rebuilds
 caused by the do_unpack_and_patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io, daiane.angolini@foundries.io, Jose Quaresma
	 <jose.quaresma@foundries.io>
Date: Sun, 24 Jul 2022 10:53:16 +0100
In-Reply-To: <20220722123124.390710-2-jose.quaresma@foundries.io>
References: <20220722123124.390710-1-jose.quaresma@foundries.io>
	 <20220722123124.390710-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 09:53:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168450

On Fri, 2022-07-22 at 13:31 +0100, Jose Quaresma wrote:
> The commit b8c5680 [1] add the funcion is_work_shared and at the same
> time change from kernel-yocto.bbclass to a more generic kernel.bbclass.
>=20
> This is also a fixup for the commit fed0ed8 [2] to avoid kernel rebuilds
> because of the do_kernel_configme->do_unpack_and_patch task dependency.
>=20
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3Db8c5680a6=
7888d43540366a40bd0c501e926ac31
> [2] https://git.openembedded.org/openembedded-core/commit/?id=3Dfed0ed829=
28e6a7846fbad233ac657bd17bcefc7
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes/archiver.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index 5da369d422..9c605cc932 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -610,6 +610,6 @@ python () {
>      # sstatesig.py:sstate_rundepfilter has special support that excludes=
 this dependency
>      # so that do_kernel_configme does not need to run again when do_unpa=
ck_and_patch
>      # gets added or removed (by adding or removing archiver.bbclass).
> -    if bb.data.inherits_class('kernel-yocto', d):
> +    if bb.data.inherits_class('kernel', d):
>          bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpac=
k_and_patch', d)
>  }

This doesn't look right since do_kernel_configme is only available in
kernel-yocto.bbclass, not from kernel.bbclass?

Cheers,

Richard

