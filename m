Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB616C001B0
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 22:48:33 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.3364.1687906112579915497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 15:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zCTeEE3S;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51d805cb33aso5257662a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 15:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687906111; x=1690498111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRGnIx25k4/ZjIU1RkRAdJGS1Hk96l9MDk2z+Fc+OjM=;
        b=zCTeEE3SfQt+TWgoqVzByKAMugfFQIwN8SAfAQJcb9awTHu/eQ3dVqRgL+wEKp8uDf
         L/V0cuGbNSXzNVq8agNWcGoDaF/lIUyj9NBxJJRH9m12T0kXMkqsLvbZWubE671RMx/g
         jhhB1CQkvld/QWXoBVqcEna4gZyH1cktUYepNsFvVv6kGZjIji5u2FFqRcJjGePGhGK/
         w4M2aMwUi83EnZdmN1/q7QUqwqtmim2f4jd46F77Yhy1RQdCmZUxtwKpAc4YjNhh+lzV
         C2hNgUaV2x2MZkQwhoSDglin2A87PGGqeeLSN7UFbKWTUBMZprScoLWztZqj3IQCVv4w
         5jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687906111; x=1690498111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRGnIx25k4/ZjIU1RkRAdJGS1Hk96l9MDk2z+Fc+OjM=;
        b=BP1ONk29aSqXRCldjMMX4oQvQWMMqsfCq1Eq+3OZD5ELoDnyxGCbpQBJaxZqdBFoB3
         fkOTf04qErnNal9pnMchgCqtKdENasZBnKYHue1e6pM/WJfNhXdyIruRdJ3HhxgJLwxO
         zZAk0qGDdp1cOYRgr+p6PQJS4690JUAbczK8gids1fp7S1OdzsfymsH5xLlFmkxYpykR
         tY9cKKeEyGPniABGNdKUWljM5F8SXsQP3WojN3SfK3mNuCltY1CCPTSAW94OxkF0TbWs
         pWgh7MWcy8XijLZzMarAMgzqbj14DEy0UgYd6mC9bI1En2B3xfUKYell18VBxUlluKkc
         NRvg==
X-Gm-Message-State: AC+VfDy5WCtXf8VJ+1CnUTj8A8lm7MvATovAB0cQNaXGTGbGUOkt6Egl
	qVfYnfwF/hYAGMm55Lh6MzUMMkvSjtw3VP4jx4/tkA==
X-Google-Smtp-Source: ACHHUZ6jHvJc7PGOtHtscvYcDs5vkWrtO+RMGZVZmjnfj3kmhJoysk+9zcpcQ3UDImiMtmbPl0RSbdlCtvEvO1mUU4I=
X-Received: by 2002:a05:6402:799:b0:51d:893c:60c3 with SMTP id
 d25-20020a056402079900b0051d893c60c3mr6858292edy.9.1687906110923; Tue, 27 Jun
 2023 15:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230627223557.899986-1-bruce.ashfield@gmail.com>
In-Reply-To: <20230627223557.899986-1-bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 Jun 2023 12:48:19 -1000
Message-ID: <CAOSpxdaEU2o1XL6GVaO0-jqMhyZrZ9biD+WA7P4+gU0G-nz4CQ@mail.gmail.com>
Subject: Re: [PATCH][kirksone] linux-yocto/5.10: cfg: fix DECNET configuration warning
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 22:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183507

Thanks Bruce!

Steve

On Tue, Jun 27, 2023 at 12:36=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Dropping CONFIG_DECNET as it has been removed from -stable
> and we now get a configuration warning.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_5.10.bb
> index 8e7b0b32a0..7976b96a61 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> @@ -12,7 +12,7 @@ python () {
>  }
>
>  SRCREV_machine ?=3D "46fb028ad9413cfa8d47a6dc8bf9a57d9d5edf8b"
> -SRCREV_meta ?=3D "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
> +SRCREV_meta ?=3D "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.10;destsuffix=3D${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_5.10.bb
> index 5c4eb9e990..85dac1d874 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL =3D "2"
>
>  SRCREV_machine:qemuarm ?=3D "6e0299be775387485e22edcd57ac6099c08f4356"
>  SRCREV_machine ?=3D "772cf990473f73ebf34c1a1ef4f06eb3e297c4db"
> -SRCREV_meta ?=3D "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
> +SRCREV_meta ?=3D "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes=
-kernel/linux/linux-yocto_5.10.bb
> index 6e82782a38..2c7a3e2597 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> @@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?=3D "dafc025b033585311d1693255c=
80b60b690b0e54"
>  SRCREV_machine:qemux86-64 ?=3D "dafc025b033585311d1693255c80b60b690b0e54=
"
>  SRCREV_machine:qemumips64 ?=3D "ee18c4343db52d5846a0f332cd6df26a6f72dd45=
"
>  SRCREV_machine ?=3D "dafc025b033585311d1693255c80b60b690b0e54"
> -SRCREV_meta ?=3D "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
> +SRCREV_meta ?=3D "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.10;destsuffix=3D${KMETA}"
> --
> 2.34.1
>

