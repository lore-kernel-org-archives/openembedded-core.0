Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E3AC00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 21:37:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.12724.1658871463645114182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 14:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V1ryV1kn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id q18so11398493wrx.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Sy4NZ2b4SUdV7nMjVOcAex1b2M8gCHkbLlpxRhOwQl0=;
        b=V1ryV1knHk33htgPf7TemFpqYQc4fw/5TN2mbYOC7dg4BIKt0o/MhXVwdnphvDA+i/
         d2uix+qJ8nsN74CbjwWBgonBJbnWXKEyO0sAJFi18Hfma1V6WDGx8BMyXFrZdI9yEsnz
         BOXsOEI/KlstgXB48mPh8yGITnh9tOgNjyfh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Sy4NZ2b4SUdV7nMjVOcAex1b2M8gCHkbLlpxRhOwQl0=;
        b=AkKXeQpBgzXQAAqgIwiOjUzdT72vLmE4wQ4xF7Rk5WsZ9dSsTg6sJEKJRC2eGQBBnM
         v9PQNblBql3JCuqjtcgtJL3SHNyw3XJeybr0CiWg3Dj0ddC39jAW6zn2u4ZGjM/Pr35y
         5Kn5QdaXHu4IgpkTiclJK3iTq0YHQ8S/WHkK1Mw1EW5JZjjPCMgoFLq9Pf/KX5k0dHXJ
         XK3k+XD+LVy3G9DWDAQTwC9k/JsjlM+QulA0mbVxGoQcqu0H/lzFajykVX5yPBS+bgtg
         NSJoAtVwLTqNBZnu9GlupFgtTBazlVwel5uwj12IhoLG4WkISEDmIcE89M1D7o/hiySX
         fqUA==
X-Gm-Message-State: AJIora+rIf/8thtsbdqjXeCdxOjA+hZUTE0GO1aj2vxe2/Q7S0Z6MDde
	Oiu2VELlw8RD+aOsgkTgRfY53F2AfIZGDg==
X-Google-Smtp-Source: 
 AGRyM1s9t06eHG4y05rkVxpAhoe4zYA3yyptUbmZ/mHmoiatWf5SsJBdLZC2NvUTe+u3hsEEJm3n5A==
X-Received: by 2002:a5d:440e:0:b0:21d:85ce:6b8e with SMTP id
 z14-20020a5d440e000000b0021d85ce6b8emr11782123wrq.248.1658871461780;
        Tue, 26 Jul 2022 14:37:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:10da:2f6d:ad7e:fd?
 ([2001:8b0:aba:5f3c:10da:2f6d:ad7e:fd])
        by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003a35ec4bf4fsm159417wmb.20.2022.07.26.14.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 14:37:21 -0700 (PDT)
Message-ID: 
 <29469a94b96725978e7a2957de16d670fc981a7b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: revert one upstream change to work
 around broken DEBUG_BUILD build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2022 22:37:15 +0100
In-Reply-To: <20220726121821.3814251-1-Martin.Jansa@gmail.com>
References: <20220726121821.3814251-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 21:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168517

On Tue, 2022-07-26 at 14:18 +0200, Martin Jansa wrote:
> * work around for build failure with DEBUG_BUILD:
>   http://errors.yoctoproject.org/Errors/Details/661468/
>=20
>   TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/recipe-sysroot-na=
tive/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-li=
nux/11.3.0/ld.bfd:
>   TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/build-x86_64-oe-l=
inux/libc.a(libc-tls.o):
>   in function `__libc_setup_tls':
>   /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined referenc=
e to `_startup_fatal_not_constant'
>=20
>   introduced in:
>   https://git.openembedded.org/openembedded-core/commit/?id=3D50ca0eea542=
4c89c9b39cf69d8bd73fd65f06e95
>   with:
>   https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Da2a6bce7d7=
e52c1c34369a7da62c501cc350bc31
>=20
>   Temporary reverting as discussed in:
>   https://lists.openembedded.org/g/openembedded-core/message/168463
>   (it's also reverted in buildroot now with: https://lore.kernel.org/buil=
droot/20220720213853.1A27184110@busybox.osuosl.org/t/)
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...lement-a-useful-version-of-_startup_.patch | 128 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-Linux-Imple=
ment-a-useful-version-of-_startup_.patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-=
useful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0001-Reve=
rt-Linux-Implement-a-useful-version-of-_startup_.patch
> new file mode 100644
> index 0000000000..2421a63605
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-=
version-of-_startup_.patch
> @@ -0,0 +1,128 @@
> +From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sun, 24 Jul 2022 19:41:41 +0200
> +Subject: [PATCH] Revert "Linux: Implement a useful version of _startup_f=
atal"
> +
> +This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
> +Upstream-Status: Inappropriate [temporary work around]
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Khem and I talked briefly about this. The upstream glibc community
doesn't support building glibc with -O1, they require it always be -O2
or higher. I don't really want to be stuck carrying a glibc patch for
something like this we can't resolve.

Is there an underlying issue that should be fixed here or is this
really the case that this is something upstream simply don't expect to
work?

Cheers,

Richard





