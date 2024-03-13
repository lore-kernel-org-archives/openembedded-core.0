Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26631C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:55:58 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.2727.1710352550389744731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h8jJ2Qzi;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-221ffba5c8bso122507fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710352549; x=1710957349; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOLC9vDV82XqyHm3Vq/9CofV1kBNX1n/X8SOuezJUKo=;
        b=h8jJ2QziK8kAsWTboFUrlcOEftxaH6grvXIfW/hZpPsYN7prqutahx9M6YnzWoJMYF
         25Fh5FjNyY4wkRjvkLlrrqOU2ZwraBCjdog/DOR1V9Cs9ufPOfaBkM+HXmpJ3uuGe8hd
         oW52nbGWsF+0kb8KUZljm6ZGbyHeR+uwiW4G081+e2OOk8m3lU/JW9edbqb5wU4NPNv/
         h49St5s+mcP6Ixw35t4pJp1bLU6MdSKXpHa5fwCrLdFsI3EiHZR/yTalWfk7fg/phqzx
         JifpiBudS2fc4SWy8XkUL/GvWuQSlXDHMCzWFN+iZoBg5I37j+ZCxTo7mciZgf4qPwDp
         PxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352549; x=1710957349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOLC9vDV82XqyHm3Vq/9CofV1kBNX1n/X8SOuezJUKo=;
        b=Eg24Qm92M5Z5k8KqVAPzjA2/KMhoKKeteKkYliBvD+m0HCEu5XxASa1gZNBZfbsBb5
         LWqLrOjNXxumHrdTx9kSmt1IAL8vqpPiLlatiMbEdGON/HAbHWrQ7br4l78eiM7p/EbV
         2Xfk7GN/iNgwQVJLofYUrk+Xq8xCTdy1QrC8g8Ta9DtjvyxvmeeQ8DQPFBwqsh5T1NXP
         Zs8dhbT/OKwWrYIS4jvRZDfE21m5vct1A/E0PmMW78izvq9lfBt1+k8JSfO1Wf427iTu
         PTDjfVCX1KX1vVMOz/rlGFSO+u40mO8VkrvbUFIAA+qtTZpSexQuWLabxCHhDA7Df32d
         ciDg==
X-Gm-Message-State: AOJu0Yx1gE8DxdqZV0aIrX+Fn+0fXYSW+UDS/jY5bpY/74qhQKuBp6v8
	txrc76rNvilFrHIb/nUrlxJ/fhRAvi0Bs5jGfHfApGmwaHp+IIZ0LjdKxVTpNnvxnMZLi7TGh37
	UkL9N0nyvL3Xsz0xFYI8xxkd3rb8=
X-Google-Smtp-Source: AGHT+IHj62pOuGqiyLeG40WDS/uul6xypkpLZkEtVdUfYbaezSNA3cWO/0GSjWe91hbGG1kcMDSEg9qdXv/aiTpLluE=
X-Received: by 2002:a05:6870:a449:b0:21e:aca4:883 with SMTP id
 n9-20020a056870a44900b0021eaca40883mr14055078oal.15.1710352549604; Wed, 13
 Mar 2024 10:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240313173336.3900178-1-alex@linutronix.de> <20240313173336.3900178-21-alex@linutronix.de>
In-Reply-To: <20240313173336.3900178-21-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Mar 2024 10:55:23 -0700
Message-ID: <CAMKF1spuZD1nHfbygJ9qPpWZmC=g6QJea-ZUYmX=K9faJWKcXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 21/21] man-pages: use env from coreutils-native
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197076

On Wed, Mar 13, 2024 at 10:34=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This is the outcome of investigating the selftest-armhost fail:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3028/s=
teps/15/logs/stdio
>
> When man-pages recipe builds on ubuntu 18.04, /usr/bin/env on that is too
> old to support -S option, and the outcome is that man-pages quietly
> installs nothing, and no packages get created, and the test
> that expects the package to exist fails.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-GNUmakefile-use-env-from-PATH.patch  | 31 +++++++++++++++++++
>  .../man-pages/man-pages_6.06.bb               |  4 +++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-extended/man-pages/man-pages/0001-GNUmak=
efile-use-env-from-PATH.patch
>
> diff --git a/meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-u=
se-env-from-PATH.patch b/meta/recipes-extended/man-pages/man-pages/0001-GNU=
makefile-use-env-from-PATH.patch
> new file mode 100644
> index 00000000000..a644d24328a
> --- /dev/null
> +++ b/meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-=
from-PATH.patch
> @@ -0,0 +1,31 @@
> +From fbf0544138af02be4d6dd3085e7ecf98ad060bb4 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 13 Mar 2024 17:30:02 +0100
> +Subject: [PATCH] GNUmakefile: use env from PATH
> +
> +This allows using env from coreutils-native (rather than host env),
> +which resolves the problem of missing -S option on distributions
> +with much older coreutils such as Ubuntu 18.04.
> +
> +Once all autobuilder distros are newer than that, this patch
> +can be dropped, together with corutils-native dependency.
> +
> +Upstream-Status: Inappropriate [made for obsolete host distros]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + GNUmakefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/GNUmakefile b/GNUmakefile
> +index 1234194..65ba327 100644
> +--- a/GNUmakefile
> ++++ b/GNUmakefile
> +@@ -21,7 +21,7 @@
> + #######################################################################=
#
> +
> +
> +-SHELL :=3D /usr/bin/env
> ++SHELL :=3D env
> + .SHELLFLAGS :=3D -S bash -Eeuo pipefail -c
> +
> +
> diff --git a/meta/recipes-extended/man-pages/man-pages_6.06.bb b/meta/rec=
ipes-extended/man-pages/man-pages_6.06.bb
> index fa2e6b266e3..0f091bbd7d7 100644
> --- a/meta/recipes-extended/man-pages/man-pages_6.06.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_6.06.bb
> @@ -19,12 +19,16 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3D72cff06b795=
4222c24d38bc2c41b234e \
>                      "
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
>             file://0001-man.ml-do-not-use-dev-stdin.patch \
> +           file://0001-GNUmakefile-use-env-from-PATH.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "006906e7be81a71c2d347809597bcb91485fa7fa488acdaa=
79e681ddfa894568"
>
>  inherit manpages
>
> +# can be dropped when ubuntu 18.04 is not in use anymore
> +DEPENDS +=3D "coreutils-native"

does buildtools tarball contain it ? if so, we may instead recommend
that or add it to buildtools tarball instead of adding this dep
for every host environment.

> +
>  MAN_PKG =3D "${PN}"
>
>  PACKAGECONFIG ??=3D ""
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197073): https://lists.openembedded.org/g/openembedde=
d-core/message/197073
> Mute This Topic: https://lists.openembedded.org/mt/104910691/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

