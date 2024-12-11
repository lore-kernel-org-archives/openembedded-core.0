Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28F0E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 15:34:15 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.13875.1733931252927635889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 07:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2ROf1Wa;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df80eeeedso6562293e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 07:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733931251; x=1734536051; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4HRNUG+n7xIx13I1mZSH38FRDjs/TxNXbbD9X+Evmo=;
        b=I2ROf1Wa4oAxSoMAdnkCbvEFd4NDU3NrrbKO0UW/uuiK/3gktYm7TtxHA3l1mQGmb3
         CGdjuKlljYlETgX/3IQKOOnuuMWiOQi5sNcjzBIR0eQQ7ouXbfZ8cfGdRjcciNhLOXbx
         yZ+QH+9UNwG7X9txHRu3gXFDjF+3ybtlhz48jbMmq5e7upuj+ICESPdPa98JXyDFLzVT
         zNYUEbC9Xa919gJeZoNQPYWLYURP6hFmPhuXKzivr4BAJs2GJ6TLCdId+Ib4fJnHFpK3
         6j3OEgWljqAzun4ApZT+nemMRM6S7j1N0Z04X5XEPWxZX76WQGRd246WuU+15RCyltIe
         tV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931251; x=1734536051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4HRNUG+n7xIx13I1mZSH38FRDjs/TxNXbbD9X+Evmo=;
        b=kNSn6030ZV/uwRwgywaOj1kNflLuimw+h2NUEzgGuUzP8gCpx7ZO36nPaSbKqUqCZz
         sZxfrbxX7roSXaF6ccR2j09lOQbiVNZEFgF/y5wsmoAbgzWCWQabM8e0ngHHxZgbINpg
         1PVk1snd3oca/9hF260bOQnC1LlOs2KlamFTqEkG9a0GYlljLZZa7K2qjWEH5XPp1Es4
         GNe6nyxqEfF7gKk2aP4t4tHtI8MdHyTS+Pz9JJvQmXQRaBFyPUHS765aMe3OzvyQngra
         THKd8PEIeQMfSnsFe7upidXHaSQN/+Z8Svu7dLXKOVJ7zKFlQbU+jiHGem6yIoQMSPaS
         cMbA==
X-Gm-Message-State: AOJu0YyTUY0EsnzBZZljbmBw4CBTtjL7ZQeiSfyd/OHuosgmusGb82R6
	Adv4Fn3a8EtdxzJ0MhXJTYJWB/36eVNOBV2mi6vz/PYhA9QlI3KmnJArNJkSV69uhF1Er8GBmSJ
	zLLsDAQi5Nvt2Ce9nuFKCfEc59lI=
X-Gm-Gg: ASbGncuZXo5aoIiEobcxVYsRNi6j8QM7w2H9/HtstwOgLqxYoPkq/yCXZYQEoBpzxu9
	STg+2CthAG/DKdfrlatWbtf3sGJt1IJb1ge/Crx7n7WgYMOJz9g==
X-Google-Smtp-Source: AGHT+IFrthqye5CNf4JOIvbDzlM3ku0xboGfIgyIfpJKdt4++BupC44WPFLfUW8C5GYUYpkNFY1GlaFRX3iuvFZVVNs=
X-Received: by 2002:a05:6512:1044:b0:53e:44a4:34f0 with SMTP id
 2adb3069b0e04-5402a5e26a4mr1167082e87.20.1733931250647; Wed, 11 Dec 2024
 07:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20241211120728.3737604-1-hongxu.jia@windriver.com> <20241211120728.3737604-3-hongxu.jia@windriver.com>
In-Reply-To: <20241211120728.3737604-3-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Dec 2024 08:33:57 -0700
Message-ID: <CAJdd5GYhoVu__SjPjBZ3PrcsrN+cQ2igewfPvGQvmKMh8p7kQA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gcc-cross.inc: add var-SSTATE_ARCHS_TUNEPKG to
 vardeps of do_create_spdx
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 15:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208593

On Wed, Dec 11, 2024 at 5:07=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> The recipe gcc-cross inherited cross.bbclass which had class-native
> recipe behavior, but depends on class-target recipe linux-libc-headers.
> It caused the tweaking of ${TUNE_PKGARCH} for 32bit arm did not trigger
> rebuild of do_create_spdx in gcc-cross-arm
>
> Due to commit [meta/lib/oe/spdx30_tasks.py: fix hash link conflict while
> multiconfig enabled] applied, it added ${SSTATE_PKGARCH} to link prefix.
> While tweaking ${TUNE_PKGARCH} for 32bit arm, use do_create_spdx from
> sstate cache will caused ${SSTATE_PKGARCH} did not match
>
> In the following case, the link hash has no change while machine was chan=
ged
> $ echo 'MACHINE =3D "qemuarmv5"' >> conf/local.conf
> $ bitbake gcc-cross-arm
> $ grep linux-libc-headers tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-gcc=
-cross-arm.spdx.json
>         "http://spdxdocs.org/openembedded-alias/by-doc-hash/09523e44e7b6f=
e1aed03347e30191c00d93500ce6e1f453e8dfdfae98d325f3e/linux-libc-headers/UNIH=
ASH/build/recipe",
> $ echo 'MACHINE =3D "qemuarm"' >> conf/local.conf
> $ bitbake gcc-cross-arm
> $ grep linux-libc-headers tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-gcc=
-cross-arm.spdx.json
>         "http://spdxdocs.org/openembedded-alias/by-doc-hash/09523e44e7b6f=
e1aed03347e30191c00d93500ce6e1f453e8dfdfae98d325f3e/linux-libc-headers/UNIH=
ASH/build/recipe",
>
> Explicitly add var-SSTATE_ARCHS_TUNEPKG to vardeps of do_create_spdx to
> trigger rebuild in this situation. Add the code along with adding
> linux-libc-headers to gcc-cross's depends
>
> After applying this commit, the link hash has changed along with machine =
changed
>
> $ echo 'MACHINE =3D "qemuarmv5"' >> conf/local.conf
> $ bitbake gcc-cross-arm
> $ grep linux-libc-headers tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-gcc=
-cross-arm.spdx.json
>         "http://spdxdocs.org/openembedded-alias/by-doc-hash/09523e44e7b6f=
e1aed03347e30191c00d93500ce6e1f453e8dfdfae98d325f3e/linux-libc-headers/UNIH=
ASH/build/recipe",
> $ echo 'MACHINE =3D "qemuarm"' >> conf/local.conf
> $ bitbake gcc-cross-arm
> $ grep linux-libc-headers tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-gcc=
-cross-arm.spdx.json
>         "http://spdxdocs.org/openembedded-alias/by-doc-hash/087e29d3627a0=
6f5377effa627b99907607f5af0fe8f6d116b4490650c404a55/linux-libc-headers/UNIH=
ASH/build/recipe",
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index f85ccd5c23..d6936d063a 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -7,6 +7,7 @@ PROVIDES =3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGE=
T_PREFIX}g++"
>  python () {
>      if d.getVar("TARGET_OS").startswith("linux"):
>          d.setVar("EXTRADEPENDS", "linux-libc-headers")
> +        d.appendVarFlag("do_create_spdx", "vardeps", " SSTATE_ARCHS_TUNE=
PKG")

Does this need to be conditional? Maybe it should just always be a
vardep of do_create_spdx?

>  }
>
>  PN =3D "gcc-cross-${TARGET_ARCH}"
> --
> 2.25.1
>

