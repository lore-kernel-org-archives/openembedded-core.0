Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0CCD609B2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:38:18 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25500.1765899436552514478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AmGMu/Y4;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-44fe6771b2dso1125775b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765899435; x=1766504235; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97MCw3+IlRrgNShHciIg8tptcG/4TQYLGJH3QBowIM4=;
        b=AmGMu/Y4oLSpTyXp1rrypPu0pkPBsyXAPwjbXNN5zHmTtL6uibrMyWUEBULSDMx1Yk
         9Oq1a8zg0yu0jDJ/s5ooHU5z0KzlsR8IhgjrkVbrOAqakxu6CJtgkfYKmuOATm+riIvM
         0TJ9CVO81YGgEzXZrMcq7GTMWUQ8K7YFDMu16P9Tj0IcKp6LRLezdi7BjTGJofvGkJ0z
         kYNbpcR62V7UB2CKKLh3VAca+DYL670kSVrr/pPha6dWODgn4y7LANOh0ZWu5v5CXt2d
         0bxvAt9wHt8Zqa07bdttUh1ynnfl1yk0ZEJN6qEkTuuGkwaABepR9xsKySaWUmLQ3yMh
         qQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899435; x=1766504235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97MCw3+IlRrgNShHciIg8tptcG/4TQYLGJH3QBowIM4=;
        b=p2zFqerfmmqofryd1Ky1DesLTVFATtb8dkhxl3WycVu1s5Yrk4arm67YfyRo3qrem+
         OszxrXcWqGil4GNQBAP5nSgsLmK3VzVqCsNAZCsIz9XJUEricySWq93PLAkSDdfiyr4A
         DYqJfvPK7NILuSx6/TpKRr52OC4c8zU0lX20o34HpfUq55owZM//ChjeSp2wrurK4XlS
         Y7VW/pJnZ/vtj+NlZS1Nz09FdM32nJALHQxwU6OjLltma2HMDb0OXGVTieUR3a9ngA+G
         UIVw68Zt2CEXJ6fCDng2xZ2fy4qj5jkEIBDBZEqWPzfdEMlRLD8Fyil8Yvduf3WLkrIJ
         nSog==
X-Gm-Message-State: AOJu0YzdelhoHaycEnjxjxzNRrKVaDLxgUY0tOQDz4ycVydB0PGOSJjO
	UMxte7wehi5MGCU4uc1djPiwM7VG8k8HMyRQ/C23SChBHA7a/mEdVwL/iOVHpnFoLfFZvmf6S4j
	7taApSJWgo4zLQzJMhzMk8CqIjG3F91GfDib1
X-Gm-Gg: AY/fxX6doFClzgRkqAC1oWNBSkZvoIpGKMPTBB/IRkqGfgKuQijlBCDklhxtXXEG4W4
	IITdEJ/KqoeN/WjwaVz/wKLivlbnZGW+e3nB8lIrkPqKXusZDQSBqvTlieRZjTkfgIe6Z/lqY5F
	y9+2hVsSHG+QybV/mdIDPB7cEDve40rSIJIcmNo0ykf+7Mf98PnhVzYIfGvjsYzxcRgwJpbnSHc
	qQEV/Qbr+ZkTKrLMz9vWdMRF5K/4wq4hzprcbhq2rWglGJOJc8zdgaxfCyP4yfbg5i8uh86pA==
X-Google-Smtp-Source: AGHT+IEEKrJBbqCwI9YFd4n514y/vEc+8SQyrgfi7AQ9bR40BhFeRHshQ4HgJpBeawdJkKmvYFwDXh047rvBMmAxnMM=
X-Received: by 2002:a05:6808:130f:b0:450:bb4e:8395 with SMTP id
 5614622812f47-455ac966753mr5939714b6e.53.1765899434755; Tue, 16 Dec 2025
 07:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com> <20251213095931.2571498-8-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-8-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 21:07:03 +0530
X-Gm-Features: AQt7F2p4BVI_xMt0hdE_RMmTRKrLuXiFIUOIKA9ju0zKDiunuv0UtWJzJT1Lhi0
Message-ID: <CADySD0GRngHZdiefCTsoj4Hez7sMkW1UUSABKiw3Sc+Z-hsteg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 08/67] llvm/clang: Upgrade to 21.1.6 release
To: openembedded-core@lists.openembedded.org
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227971

My recommendation is to include this patch.


On Sat, Dec 13, 2025 at 3:29=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Brings following bugfixes on top of 21.1.5
>
> a832a5222e48 (HEAD, tag: llvmorg-21.1.6) Reland "[LoongArch] Add `isSafeT=
oMove` hook to prevent unsafe instruction motion" (#167465)
> 2d631cc168b2 [CMake][Release] Stop linking against stage1 runtimes (#1640=
17)
> 6ca64545e1eb [MachineCopyPropagation] Remove logic to recognise and delet=
e no-op moves produced after forwarded uses (#167336)
> 69586a904bb8 [RISCV] Correct the CFA offsets for stack probing. (#166616)
> 2fde0df91125 [clang][modules] Fix crash in enum visibility lookup for C++=
20 header units (#166272)
> 251d2d374e01 [Github] Backport ABI Workflow Changes to Release Branch
> 4b2ac3f7a210 [debugserver] Fix debugserver build on < macOS 10.15 (#16659=
9)
> 4aaab27c2343 Bump version to 21.1.6
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit f5a44a698bb33615241b23333e6e402ea3af97ea)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc     | 2 +-
>  meta/recipes-devtools/clang/common-clang.inc | 2 +-
>  meta/recipes-devtools/clang/common.inc       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 6c3174cbb7..49e067eee7 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfie=
ld <bruce.ashfield@gmail.com>
>  RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-21.1.5 =3D "Khem Raj <raj.khem@=
gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 =3D "Khem Raj <raj.khem@=
gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
> index f5e3875d2c..4051ce6085 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
>
>  MAJOR_VER =3D "21"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "5"
> +PATCH_VER =3D "6"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
> index 6aec58d44d..f19599ae58 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?=3D "${LLVM_HTTP}/llvm-project/releases/downlo=
ad/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D "1794be4bf974e99a3fe1da4b2b9b1456c02ae9479c942f36=
5441d8d207bd650c"
> +SRC_URI[sha256sum] =3D "ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376=
eaf8a845b935762b"
>
>  SRC_URI =3D "\
>      ${BASEURI} \

