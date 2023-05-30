Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4FDC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 17:21:58 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.128.1685467310877540574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 10:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DRX5Qi1v;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-33bdab7b4caso956265ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685467310; x=1688059310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KonkUNYKat/mHrI5Kn9ydM8FOmRKzV4pAQYITSJYlJM=;
        b=DRX5Qi1vRR3cdUlEp24ckrWcnDZvIcY8VUIyxBeCia7kYVFFoeUpdpb3BgCjy3zeoI
         lVaYuDaIuWxkJ6+YiY4+WgH7FgKLG8BJY7VbPnq/Gijs5jUhuv9RLDRLO8ttU1P2pooY
         7e4H3qaEkf5J++VEH9ehkl8ZQ9bBSvt5QFk0I0CIX8ISuE6xxlqcjxKLPLT5FlnHQLoO
         EiunuDW6tIdJCqPSMCMqYMqF76ubIZ38VPblRGJWb/U9xA4AaeSjRoB307Cp9oCIWb/1
         pr9IbwCVtiXauIDDmXGONH9OWMTmf7lTYCvwCIKR6XrtddV80EZ8AZTP4ad+3Ziksgdg
         Y5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467310; x=1688059310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KonkUNYKat/mHrI5Kn9ydM8FOmRKzV4pAQYITSJYlJM=;
        b=f0U1bUOD6f6bPhgt66OfZ8glm+eZUKXCUDQnAmOfWZoxOGFur9uN4YJ0elZMaAt4um
         LJDI5PpsGgKr7kre/b4vESzgU6tyqjBa2UZa2YiLisOOHxY1++a2p7Y+Qul6EM5s2pff
         mlC26+Kyj/PLDYhiKAK8/vo/1ZhRN6xw37pRV6odzEMs5LKqBsq1grFlREjklOHyyPV3
         myfTbAaQ/+TULvRCZbcBVsN0YrzJrjzKs1cStXdplxpG/1kW6dxzd8SPGb13ck43zS6m
         jrJHi6MXKdMhiHP250DCh6PGyyPs1VqdDOL08f+5xa4L+mc3QS53ZWANsW18N+T3U79h
         dJsA==
X-Gm-Message-State: AC+VfDzDHYiZmcTB+HQPZ/9f+0mDdcjj+amUeRNdgmfC7Qf/qRc6YsE8
	+exMX/EKWYHltD00THQJ4RKAcTZAuQ1Oq+Ny5u4=
X-Google-Smtp-Source: ACHHUZ5GbSUeES1SkgVVrRT/o2nRswEp2dVpKVPiL2ol5Qb44fVj3pqJWKqfoKLb4F+4sQMwRfg68l12801a4RIxBFs=
X-Received: by 2002:a92:d9cd:0:b0:32c:9c5e:900c with SMTP id
 n13-20020a92d9cd000000b0032c9c5e900cmr209556ilq.8.1685467310061; Tue, 30 May
 2023 10:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230530170949.12045-1-liu.ming50@gmail.com>
In-Reply-To: <20230530170949.12045-1-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 May 2023 13:21:41 -0400
Message-ID: <CADkTA4M63mwkQeEeb_D-8uRkqtmt8sU5xJ1jvGCtdxV6GHZMeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org, francesco.dolcini@toradex.com, 
	max.krummenacher@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 17:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181940

On Tue, May 30, 2023 at 1:10=E2=80=AFPM Ming Liu <liu.ming50@gmail.com> wro=
te:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
> to append a string to the name of the local version of the kernel
> image.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 10 +++++-----
>  meta/conf/documentation.conf       |  1 +
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index e634eabd49..3dd139eda9 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -616,6 +616,7 @@ do_shared_workdir () {
>  # We don't need to stage anything, not the modules/firmware since those =
would clash with linux-firmware
>  SYSROOT_DIRS =3D ""
>
> +KERNEL_LOCALVERSION ??=3D ""
>  KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} O=3D${B} olddefconfi=
g || oe_runmake -C ${S} O=3D${B} oldnoconfig"
>
>  python check_oldest_kernel() {
> @@ -633,11 +634,10 @@ check_oldest_kernel[vardepsexclude] +=3D "OLDEST_KE=
RNEL KERNEL_VERSION"
>  do_configure[prefuncs] +=3D "check_oldest_kernel"
>
>  kernel_do_configure() {
> -       # fixes extra + in /lib/modules/2.6.37+
> -       # $ scripts/setlocalversion . =3D> +
> -       # $ make kernelversion =3D> 2.6.37
> -       # $ make kernelrelease =3D> 2.6.37+

Those comments are still valid.

> -       touch ${B}/.scmversion ${S}/.scmversion
> +       if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> +               echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> +               echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> +       fi

You've confirmed that the result is the same as the touches previously
did when that variable isn't set ?

Bruce

>
>         if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B=
}/.config" ]; then
>                 mv "${S}/.config" "${B}/.config"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index a27d7a53c3..66b8e2f24f 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -253,6 +253,7 @@ KERNEL_MODULE_PROBECONF[doc] =3D "Lists kernel module=
s for which the build system
>  KERNEL_PACKAGE_NAME[doc] =3D "Name prefix for kernel packages. Defaults =
to 'kernel'."
>  KERNEL_PATH[doc] =3D "The location of the kernel sources. This variable =
is set to the value of the STAGING_KERNEL_DIR within the module class (modu=
le.bbclass)."
>  KERNEL_SRC[doc] =3D "The location of the kernel sources. This variable i=
s set to the value of the STAGING_KERNEL_DIR within the module class (modul=
e.bbclass)."
> +KERNEL_LOCALVERSION[doc] =3D "Appends a string to the name of the local =
version of the kernel image."
>  KFEATURE_DESCRIPTION[doc] =3D "Provides a short description of a configu=
ration fragment. You use this variable in the .scc file that describes a co=
nfiguration fragment file."
>  KMACHINE[doc] =3D "The machine as known by the kernel."
>  KTYPE[doc] =3D "Defines the kernel type to be used in assembling the con=
figuration."
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181939): https://lists.openembedded.org/g/openembedde=
d-core/message/181939
> Mute This Topic: https://lists.openembedded.org/mt/99224358/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

