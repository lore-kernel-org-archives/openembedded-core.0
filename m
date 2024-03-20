Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD5AC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 05:22:10 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.36969.1710912126681226100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 22:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F6AH1s/S;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-221822a7dc7so3388490fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 22:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710912126; x=1711516926; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebtSKFzHGDO8PyiETiJnOWgYU2DhMBTC7fmh97HmPjQ=;
        b=F6AH1s/SdOGqlqhjMksSmSPo2/SSCmJ8RduTPr1ExQfgQftDiQUbs5eFf3TYtvRR6N
         1iLq+dSXl7Esr3EYf934auvJbFaM/Ix/AQCuI64t/7ovWrCaekufQdV9jydzg0nBtSdN
         D7MW2RV8YsYaZ6n3yICbQMwQEJOVlx34AS5mgRR7av1f017JjrdVQznJCq/mXH1N5yu5
         32aaTtWmRFS82M245eELOxjgzqsHlhfp7Yz1WZGrqPJabZC3GgNUKS1LTHYtEj9KXt1m
         Av38HCo+/HrlOtNxzoiQ6KmFwgO24XWFe2fMqtN91xdFKHrN9hs0USc6Tjqty25sIlee
         Zvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710912126; x=1711516926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebtSKFzHGDO8PyiETiJnOWgYU2DhMBTC7fmh97HmPjQ=;
        b=eLv8sjtZxoS9owsxGkkdkATnClSgt310b/KLPUEAl9LojT782pbSmxvUMQ2owQf9pk
         VKkdEyUyhR7odryUQFpXHtEde50ZCMmZ7yl6yAp+SFZf+cYL+MGgg1GEYH1Nhk3Qp8Wa
         qOMpew9KadxxYpv9ZA25/fD5005v6m8Cmi2MlEtgxHWCPEA3dLt1pfvZJolBS00OMP+u
         hHqV4PxBb2o2wMi4Ijf7YVx5TMYlH/cjFWbiMPupwc03PrKWvBRoMDmRtdvIM9htGQpR
         nHItdArghcP6vrRf7DG2fAt2vHWUKtGFpkHjvA9LbdaexCEpjhAnXQja+XgMOpCWTlRT
         O7+Q==
X-Gm-Message-State: AOJu0YwV6LrUeqylXDiL2PAcKf1xfZPTU5Y3veF+xucvW6VDD2ywFzeU
	6FXwsb1LTHNHWcviD1S9SQ02VuUiAWBxCiT1kXdipGkvPNMA8+d7R91VkbaIL0sXTWOMiMi1aJK
	1461lrjHCy7CfVd955TB18dQ/GdEv0W+NFCc=
X-Google-Smtp-Source: AGHT+IHa7NbNq6PVNcLK3IA4QYU/pDrefXftcp0zoLHqW7vDpUvxCPIYXQ+hLLbg4/K6Br7CdtxctP26VwJVJRDavfs=
X-Received: by 2002:a05:6870:e40c:b0:21e:a332:ceb2 with SMTP id
 n12-20020a056870e40c00b0021ea332ceb2mr19457154oag.31.1710912125820; Tue, 19
 Mar 2024 22:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240319004524.1270639-1-leimaohui@fujitsu.com>
In-Reply-To: <20240319004524.1270639-1-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Mar 2024 22:21:39 -0700
Message-ID: <CAMKF1sp69BBJjUCFZ2Jnk3jE8O-kmhFfLg0CjxodykmZbvP_Vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libbsd: Fix conflict error when enable multlib.
To: leimaohui@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 05:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197347

This causes mg build failures see
https://errors.yoctoproject.org/Errors/Details/759473/

On Mon, Mar 18, 2024 at 5:45=E2=80=AFPM leimaohui via lists.openembedded.or=
g
<leimaohui=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Lei Maohui <leimaohui@fujitsu.com>
>
> Error: Transaction test error:
>   file /usr/include/bsd/sys/cdefs.h conflicts between attempted installs
> of libbsd-dev-0.12.1-r0.core2_64 and lib32-libbsd-dev-0.12.1-r0.core2_32
>
> The difference of bsd/sys/cdefs.h between libbsd-dev and
> lib32-libbsd-dev is as following:
>
>  /* Define the ABI for the current system. */
>  -#define LIBBSD_SYS_TIME_BITS 64
>  +#define LIBBSD_SYS_TIME_BITS 32
>  #define LIBBSD_SYS_HAS_TIME64 1
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-support/libbsd/libbsd_0.12.1.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libbsd/libbsd_0.12.1.bb b/meta/recipes-=
support/libbsd/libbsd_0.12.1.bb
> index 161dc6df43..84edd9bafa 100644
> --- a/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> +++ b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> @@ -40,8 +40,12 @@ SRC_URI =3D "https://libbsd.freedesktop.org/releases/$=
{BPN}-${PV}.tar.xz"
>
>  SRC_URI[sha256sum] =3D "d7747f8ec1baa6ff5c096a9dd587c061233dec90da0f1aed=
d66d830f6db6996a"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig multilib_header
>
>  DEPENDS +=3D "libmd"
>
> +do_install:append () {
> +       oe_multilib_header bsd/sys/cdefs.h
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197315): https://lists.openembedded.org/g/openembedde=
d-core/message/197315
> Mute This Topic: https://lists.openembedded.org/mt/105016171/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

