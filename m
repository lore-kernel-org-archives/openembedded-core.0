Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABA5E92FD9
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 20:34:35 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51052.1767040472775657269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 12:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DZnHBUQt;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.54, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6467c5acb7dso5138357d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 12:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767040472; x=1767645272; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgTB8tyKoDM3Mi/g11dYq8JG2bcTuZTOzFvsVpVxI6k=;
        b=DZnHBUQtgWyc32JMTitAJRwyl3h3TklvOfJeMOKgkqIy4S1uVUKz4tMSuIVC1GFGAD
         y0OVsBf8gRaI1lGmdpQ2duVzECV20TnN+dsglzIRep0bUvS79uc1m2Sr+el8Yfc5FEmQ
         UQ68lcMI7GI6XN4YFqKeQMeNbdAQ4YFHFQiE1saL74sDrgkXZknifSGODXRTWnGlbrV5
         psgb0q2n/CTvJARA1bc8DQ8jE7lRjkhqHfBa2qb9MQJdRoTWaCnORA+tjtZth8+OqVo3
         WbD4bZoZdAtvG+RtT4yiuk4Qu5N/TcO7LJkqbFHj76fO8/DO2656Dz95OiUuPYfJ0b0j
         0x+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767040472; x=1767645272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OgTB8tyKoDM3Mi/g11dYq8JG2bcTuZTOzFvsVpVxI6k=;
        b=fmhj1YCB8sz4Ts8LKbEUMv6CMdy/ULDat2W6P7p0CCKkJoAin6wnV4I8BSAVGXKXqx
         cm7vrs+PpGNUXqFTOf5HHkTaOStwsbPL1OP07rznyqEQe2W0mTGxCTU5BnduGYmWN1/W
         hKh65UIcX7bB1730oEUpMsymDocMZiWsjJec6iY9npa4yiuXvAWvTeBjYj1GL7FNjRH/
         zao3X2ePyxap8ejMbdp9RMKFRmiei21F9KYl1oltAeQEz7FB2xk6QsA9KS9xY/0d9167
         F1eR0fcjZM5CoNRA3EJFMBGTby23F5Wd1mIoAS196OFLqCEekQD9RE00vsTtLNOTBpcN
         tpnw==
X-Gm-Message-State: AOJu0Yyjnn/NpIbPZhY0Ygc42KoNNzHob6VAQ3NPvm5rnjGbbT2ws1G4
	iGy6SKUkpPLylXdEJhAuYiWjvSRlyHEUqYYA/Y/BlxEQg/dCWDVLc2IWb9JTGPm4X5b1owf3Hmf
	GnDoxRfCOUV5AP7sXzHLN7lUWdorYAgc6ISr15sPILg==
X-Gm-Gg: AY/fxX77KWgIubPWqs16US/+zH8Aq7zWLcPpTOa5o2XTxJq9Y1Cenf9sjCmNxwdchGI
	3oKNvGv6PK8Tzki3oCEyZF7AYMvmt9rLfpA1rMuW+NlLMvbvkqAznFMi/CYxA4VYbHkU7PUqRDw
	aDV3kAuIA00juilo1xHWi3OCV5Kqabb2w9X86Mgan576NS/51iX5AwP7Zr9tdbAJsl4PkLVL4ga
	2RKLutfQcnyrJK8WxQKF5nWCyXxJ83eA2Wx91WZO/FoE8Pwh305Vv4648Fy554yJbOzNuSeI7ex
	SK4+qA4jzeGUdYU5SpvN+uvlbsE=
X-Google-Smtp-Source: AGHT+IGpXZBh+rwHONrY2tYnGZSwmXcI/NHcfeIXzSM/JuX1p42Y7k/szbRIE4g8UIPWT2VOoNGa9ummzCvEMKPxH3M=
X-Received: by 2002:a05:690e:bc9:b0:646:5127:ad81 with SMTP id
 956f58d0204a3-6466a8ec208mr24099356d50.95.1767040471861; Mon, 29 Dec 2025
 12:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com> <20251219032209.960840-22-ankur.tyagi85@gmail.com>
In-Reply-To: <20251219032209.960840-22-ankur.tyagi85@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 29 Dec 2025 12:34:20 -0800
X-Gm-Features: AQt7F2p1FrUNJ50SdDLrQ_ab-UZGi8JCY5vDgkc7cxVFc0DAS5Yyb-Q3MWQZ_pg
Message-ID: <CAOSpxdZyis0uTZfX46DC8ZxHKNevWSU6NBYA=OEWTWG_d7zboQ@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH v2 21/29] llvm/clang: Upgrade to
 21.1.7 release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, ankur.tyagi85@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 20:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228614

Khem,

Do you feel that the upgrades from 21.1.5 to 21.1.7 are suitable for a
stable release?

Thanks,

Steve

On Thu, Dec 18, 2025 at 7:23=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Brings following bugfixes on top of 21.1.6
>
> 292dc2b86f66 (HEAD, tag: llvmorg-21.1.7) [LLD][COFF] Align EC code ranges=
 to page boundaries (#168222)
> 9ed1927442a4 [server-llvm-21][MC] Fixing vector overflow
> 922c9914e14b [clangd] Clangd running with `--experimental-modules-support=
` crashes when the compilation database is unavailable (#153802)
> 33e1a55a8bc7 Bump version to 21.1.7
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 2351cc82dca18e159c9630266a81571a95394bfe)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc     | 2 +-
>  meta/recipes-devtools/clang/common-clang.inc | 2 +-
>  meta/recipes-devtools/clang/common.inc       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 163d9808ad..efe8fb5f09 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfie=
ld <bruce.ashfield@gmail.com>
>  RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 =3D "Khem Raj <raj.khem@=
gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-21.1.7 =3D "Khem Raj <raj.khem@=
gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
> index 4051ce6085..ae0caa6f01 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
>
>  MAJOR_VER =3D "21"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "6"
> +PATCH_VER =3D "7"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
> index f19599ae58..c960bf2d1d 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?=3D "${LLVM_HTTP}/llvm-project/releases/downlo=
ad/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D "ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376=
eaf8a845b935762b"
> +SRC_URI[sha256sum] =3D "e5b65fd79c95c343bb584127114cb2d252306c1ada1e0578=
99b6aacdd445899e"
>
>  SRC_URI =3D "\
>      ${BASEURI} \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228189): https://lists.openembedded.org/g/openembedde=
d-core/message/228189
> Mute This Topic: https://lists.openembedded.org/mt/116854382/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

