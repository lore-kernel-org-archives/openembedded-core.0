Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86588FAD41C
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:42:50 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16845.1777020161085615333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 01:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2jK8gi8f;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso50895925e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777020159; x=1777624959; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9U8TRhm4+ZTRR2jfIrtnVHUMeI7qdFpNv8t3fAsCyk=;
        b=2jK8gi8fvFDj08UmJaftLgRdsAqIXlF11r/jkrzY7GHXUoPVTb7xjC9Vyk8gjjFbs6
         0I0+nHCBmFuvFoNa7A6AnVmCwcewHVqo1kYiKhihU9eSVwjoeUXgksLZ7PoZgtm8Z/a5
         R028DnaPTR5W01dLPsS6rrhrZfa2bx5R2+Tqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020159; x=1777624959;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9U8TRhm4+ZTRR2jfIrtnVHUMeI7qdFpNv8t3fAsCyk=;
        b=Ca3k/YCo6FUCd8wbmmnmgjvFqs1ECOpZJPBGrX5oqluPtZhhj62ejIBaL3D8WsiQMl
         MaSX9kDSrEHeAX2vdBx5BN//qG5uSBo8zg3Vfm+SdOAEKG6hYzJ1Q5SrgMERGyJcc7xv
         Xg9k70vAirdHzOot7vOrWF36hRSk+JCg19makuDEnMO+jf2aVVi1nGCA25sQCQ5uvkPZ
         ez7+bXJ34KFiRngtYPuSx7oQMEZsNnx3mUIkPcVz0I1Njt3bNYwrGL4P6zBq8IIeIcdS
         gtyaYS8oFS4+iex9xNx4DHwFuZweX02yjD4ntaFiF/aRNFObOeScWoRjBbBfg7ZzKQV7
         D1UA==
X-Forwarded-Encrypted: i=1; AFNElJ+guKYtGnqenmt08AMtJmBHLcj1RpaH41CCW/xvJiuQ8gISt1jWsCdvJT55OgvZgSEVoj7BTW+arQnElxnxAum8eg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPQ++VKrqE0BHEc/xvgXypNdu2Ku+O7VnHd24sgDb3Oh4dLdcr
	an53mwJHl/PniIfa4lzcYPMeF+O4UlAbS/XxNbpSRcYxIZHay+7tK8kR1B4v70PqCpo=
X-Gm-Gg: AeBDieuUlpiiSvBMNBi5IQpgSL5O5A60FX1AKmtRLdG3sLYMLL7CCDGr/X+qrR890eg
	F8oEt6QPiFGm4JX82mTjrCK8yvzU46TiUjmBqWghHWcfq18Vem0y/82dhn4gP6U8jp+2FlL+RYP
	ltRrCY1iIBjGNBh55ldtFqSFTDZC8K8j8GFKVz4oOD7mUXSqGfrn8FsaP/QsrL+8IVFd9+FCI1N
	qumQROSwkaFvXFS2pA7tYVEy/q8GWko+irqUByV/88RMRqbK3c3lS19WQLxIIXAQAnxcoYvvvzh
	QUlBTn6ci7qwFqeVRil/5trIy0gg2A6OjJ8jp0g+X4RXv7g9cFQnQkwDzhUN/v7RC2XnA/l7+Xx
	5odCLayDWDqEoy3FXPyNtk0wJoCfHD/sFFC9kxuIJ+cBIGJgJEJBsFVQBQUKAv6y60q+6UxIY4J
	x/TgnNqZIP9Onq1rlP46n+VyfuiGdv7+zbkPVILIqmsZDm8Jg6p5zRnzppVexaGGIqs++1j4MZl
	sKZNXljuv9vAnwmKTosSKBjGzftz+0zOuDd
X-Received: by 2002:a05:600c:c085:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-488fb784948mr340200505e9.25.1777020159423;
        Fri, 24 Apr 2026 01:42:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm57294109f8f.19.2026.04.24.01.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 01:42:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 10:42:38 +0200
Message-Id: <DI192N2M7DFY.2KF06OYFF458A@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 3/9] python3-requests: upgrade
 2.32.4 -> 2.32.5
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
 <20260409092936.1740143-4-daniel.turull@ericsson.com>
In-Reply-To: <20260409092936.1740143-4-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235845

On Thu Apr 9, 2026 at 11:29 AM CEST, Daniel Turull via lists.openembedded.o=
rg wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Changelog for python3-requests: 2.32.4 -> 2.32.5
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 2.32.5 (2025-08-18)
> -------------------
>
> **Bugfixes**
>
> - The SSLContext caching feature originally introduced in 2.32.0 has crea=
ted
>   a new class of issues in Requests that have had negative impact across =
a number
>   of use cases. The Requests team has decided to revert this feature as l=
ong term
>   maintenance of it is proving to be unsustainable in its current iterati=
on.
>
> **Deprecations**
> - Added support for Python 3.14.
> - Dropped support for Python 3.8 following its end of support.

Sorry but that mean dropping support for a python version we are
supposed to support:=20
Bitbake in scarthgap needs >=3D 3.8 and python3-requests can be -native so
that mean that a python 3.8 can run this code.

>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../{python3-requests_2.32.4.bb =3D> python3-requests_2.32.5.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-requests_2.32.4.bb =3D> pyt=
hon3-requests_2.32.5.bb} (91%)
>
> diff --git a/meta/recipes-devtools/python/python3-requests_2.32.4.bb b/me=
ta/recipes-devtools/python/python3-requests_2.32.5.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3-requests_2.32.4.bb
> rename to meta/recipes-devtools/python/python3-requests_2.32.5.bb
> index b86ecfba52..930d48fc5c 100644
> --- a/meta/recipes-devtools/python/python3-requests_2.32.4.bb
> +++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
> @@ -7,7 +7,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-python3-requests.sh \
>  "
> =20
> -SRC_URI[sha256sum] =3D "27d0316682c8a29834d3264820024b62a36942083d52caf2=
f14c0591336d3422"
> +SRC_URI[sha256sum] =3D "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a889=
3c3af500cec7d7cf"
> =20
>  inherit pypi python_setuptools_build_meta
> =20


--=20
Yoann Congal
Smile ECS


