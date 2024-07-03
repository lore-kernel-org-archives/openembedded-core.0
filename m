Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC96C30658
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 03:31:13 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.42249.1719977472433659993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 20:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IFKK5ygo;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-25d634c5907so3075286fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 20:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719977471; x=1720582271; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6UWJ5W+RTQiJZo+3JsMVoFtnCNe0SOXrFKWsYqfCdk=;
        b=IFKK5ygo9aaRwUWoWViN8JdYzYtMLSO/y152102COnOWTeY8KBk+TrY9voZxETbk4o
         JzzMI8K+pQZJDwCpvmKFJkME0Eks6YSv8mw2B4vYq7eEjoLLt/0MeE7zO/JsSltTziwB
         0CYvL8GN+ZzRa3CoMv1g1H4X5cfGwDdxKDIvFFQSUPH8CmVcQpU2UwQYGoJJ3DIXCEq6
         9HN9fq/vPLDhqDm+zc7VbF8YZz8hJy0MatBXlu06QQBe9k7kggqDwuQKS+8u+4btINBe
         Gk0AB8jq8IQ5OCe30wccA9NQZo4YqqNKJeEKV0nCI0IlwiuDDwFVoe8ncnccIy5EsXt1
         9cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719977471; x=1720582271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6UWJ5W+RTQiJZo+3JsMVoFtnCNe0SOXrFKWsYqfCdk=;
        b=R0Gr1lRfkxbr3c3ZUpr9w5WzKgsnneCCgmJdlmRG1NvlOXph0RN0nMH5UoC6wEl8IX
         7gkldvz3OOUNV8j6WFJTneJDGYh7jo0AJSAMGmO4tKRnlXlXUwVdfJ7Gw04VzAhtZOdb
         p08KX+Q6t4ycqYI9L0Dgq/lLcnZRIrf5JoegSEwG7QPPaVw+3vyiFRj5TfDUedBEEQ12
         vx+UCUNN8fzmQOhyET7UHbWdsU0pGXCMeEXoM/pOUXgIOMGyonW/QNNLxjY70gMEqBkp
         s84RZiqfRt90qdaSMgeZmTIwkxr48Ly3+PTWhINIoJcwYeQVjlFWVJu8KylSkDGtR3mC
         kDsQ==
X-Gm-Message-State: AOJu0YxDI3AKLbhtlzmY0FdUDVpcI2oWIQ3i61RLI33uh58faZa+alD+
	DmDrSXmB5SOVfJSMipuV9u9714x0L+DPS3iVTarTF4BCFiE2INMdYMqyqNkfsNknw4Ua2lQS5Zb
	f1AI0GnETBDRkjPgTev6V+m0hdbDD4PyJ
X-Google-Smtp-Source: AGHT+IGt+/t9KTqEq19E8pUN0Phe3MYYZlIrnQINh/Ypc9Q1/Pi8iGV8gd+h1YfTk+aX99upkzNQV0R3FkpaN5xUwDo=
X-Received: by 2002:a05:6871:24db:b0:25d:ff4c:6772 with SMTP id
 586e51a60fabf-25dff4c6bc2mr2257579fac.3.1719977471608; Tue, 02 Jul 2024
 20:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240703020027.3434756-1-ruiqiang.hao@windriver.com>
In-Reply-To: <20240703020027.3434756-1-ruiqiang.hao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Jul 2024 20:30:45 -0700
Message-ID: <CAMKF1spnQpsOZFe_bseefaNtPA0T8z23MStYPxZEfCh8bMMqiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune: octeontx2: remove crypto from TUNE_FEATURES
To: Ruiqiang.Hao@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 03:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201450

On Tue, Jul 2, 2024 at 7:00=E2=80=AFPM Ruiqiang Hao via lists.openembedded.=
org
<Ruiqiang.Hao=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
>
> Since GCC's configuration includes the crypto feature when specifying
> '-mcpu=3Docteontx2', there's no need to additionally include this feature
> in TUNE_FEATURES. Removing crypto to fix the following error:
>
> aarch64-wrs-linux-clang: error: unsupported argument 'octeontx2+crypto' f=
or option '-mcpu=3D'

This is a clang problem. It should be fixed in clang, not here.
Additionally we check for 'crypto' in TUNE_FEATURES in
many recipes for making specific tweaks, they will fail for octeonx2
if we apply this. See
https://github.com/kraj/meta-clang/blob/master/classes/clang.bbclass#L49-L5=
3

>
> Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
> ---
>  meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc b/=
meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> index e9d7a59c51..d51d19b980 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> @@ -9,6 +9,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  AVAILTUNES +=3D "octeontx2"
>  ARMPKGARCH:tune-octeontx2             =3D "octeontx2"
>  # We do not want -march since -mcpu is added above to cover for it
> -TUNE_FEATURES:tune-octeontx2          =3D "aarch64 crypto octeontx2"
> +TUNE_FEATURES:tune-octeontx2          =3D "aarch64 octeontx2"
>  PACKAGE_EXTRA_ARCHS:tune-octeontx2    =3D "${PACKAGE_EXTRA_ARCHS:tune-ar=
mv8-2a-crypto} octeontx2"
>  BASE_LIB:tune-octeontx2               =3D "lib64"
> --
> 2.45.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201448): https://lists.openembedded.org/g/openembedde=
d-core/message/201448
> Mute This Topic: https://lists.openembedded.org/mt/107012841/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

