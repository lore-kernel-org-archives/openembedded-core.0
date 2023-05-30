Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50092C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 13:51:52 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.10431.1685454711642031213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 06:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pr5o28RZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-77700e9aae3so105251239f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685454711; x=1688046711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoB9TUByOUD9aOvx4KDY42i/DSCi8K44V/SuLqdtYK4=;
        b=pr5o28RZSjPZwnP67LGhJbIMGCAGQ78umHju92zMDLUPmpl5v6VRYKZNSLyrneut7o
         MPOBq/Sj0Ibu9AXuVnyyNcPusyElGtW/XvawQrUJfSAzcHX9o3XAsF9gweSSC+YQb9Md
         DyUvaKFKpYqvKL1eSLcxWBJ4ReuJQhYoDrEwstYVmZEOfAo/J6snXn6SAeTYZZ/tUW6p
         nYYT5rexFQkZ0eU+xXrluBRg71m38WaKpNTPtJjv39uUsmVCBCwiMwy7w1aXYygJ77+N
         AVRFpLM5TfOmBH1YrC3OqJFuW3zl3Dk/rRDgA6/z1eB/PQaQNY89GHLNXL+5Np16HwZ8
         JkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685454711; x=1688046711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoB9TUByOUD9aOvx4KDY42i/DSCi8K44V/SuLqdtYK4=;
        b=f2CYJ1zPWvavxMejBLfPsKhAqEWA3qDr2HMr38ztcKhFmE80ZJFapTCgqAfV7EI6Lu
         9zygbEIZpmQzA/ZP0ZqDTTVqpYDoLhock1UqOobUFn1DU/KrjCMYzqZMv1Uo2ixS8tuZ
         ANnrs9ZSY8VVs2UHtpLvcP6aEnHAv8Jk7lI7zIWkZQ6zDW6SS+n9lh1N8Na2m5FCawBt
         x0sIgmEU/sDrEJomanSmsLKN3pAJNPCkkjVRGrQZTNOiF9bP5ro+r52ogn47ecTteU4E
         PxA52/CUgIa9r9zZMJxJ9d0tyG3L0j+OWdYKdme0jSeuMI67CrYpYvBtI5SZIaA6iMX6
         MvcQ==
X-Gm-Message-State: AC+VfDwj4cFYwPlzkL5npDWSz5TEW79aleSBe071yXFmKxvt8LJkBz9Y
	JsSIytYQtOv41bl7Pet9c3AnfD6JFKJvtY1cPmA=
X-Google-Smtp-Source: ACHHUZ6YNauD+t0a+kE6ew1JtEV7eoGGtFr9ITk2iqJLnngOXwH0s4hIEc/+KH6YSahjvO3DxMY8XeU6lwzoyXJgPPE=
X-Received: by 2002:a05:6602:2dd3:b0:774:8d6c:9fe7 with SMTP id
 l19-20020a0566022dd300b007748d6c9fe7mr8297813iow.3.1685454710717; Tue, 30 May
 2023 06:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 May 2023 09:51:39 -0400
Message-ID: <CADkTA4MLkWsaiLWJoj_7A+2uc4TP13Zyp=JASyZnraNZqrTwsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Split the qemu package
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 13:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181924

On Tue, May 30, 2023 at 9:17=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver=
.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Currently all files packaged into one package such as qemu-7.2.0-*.rpm.
> After the qemu package installed on the target, it will take up 464M
> which includes not only the one matches the arch of the target but aslo
> all available built qemu targets which set by QEMU_TARGETS.
>
> Split the qemu package into qemu-7.2.0-*.rpm, qemu-aarch64-7.2.0*.rpm,
> qemu-arm-7.2.0*.rpm, qemu-x86_64-7.2.0*.rpm and etc. And let user can onl=
y
> choose the corresponding qemu arch package they want to install should ea=
se
> the concerns who cares much about the size in embedded device as it
> decreases the qemu rpm(qemu-7.2.0*.rpm) size from about 65M to about 17M
> and the size of the extracted qemu RPM decreased from about 464M to about
> 248M.

I've been splitting the qemu packages in meta-virtualization for years now.

I find the python more difficult to read than just using overrides, as
it is much more explicit.

Is there a reason why that approach didn't work in this scenario ?

As Richard mentioned, you should also pull in all the subpackages by
default with the main qemu package, to avoid regressions.

Also, in the experience of meta-virt, you only want this splitting on
target builds, not native/host.

Bruce

>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index a87dee5c99..7302d63747 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -230,6 +230,25 @@ INSANE_SKIP:${PN} =3D "arch"
>
>  FILES:${PN} +=3D "${datadir}/icons"
>
> +python(){
> +    allarchs =3D d.getVar('QEMU_TARGETS').split()
> +    packages =3D d.getVar('PACKAGES').split()
> +    pn =3D d.getVar('PN')
> +
> +    newpackages=3D[]
> +    for arch in allarchs:
> +        archpackage =3D 'qemu-' + arch
> +        if archpackage not in packages:
> +            newpackages.append(archpackage)
> +        d.setVar('FILES:' + pn + "-" + arch, '${bindir}/qemu-' + arch)
> +        d.appendVar('FILES:' + pn + "-" + arch, ' ' + '${bindir}/qemu-sy=
stem-' + arch)
> +        if arch =3D=3D "mips":
> +            d.appendVar('RDEPENDS:' + pn + '-' + arch, ' ' + 'bash')
> +    packages =3D newpackages + packages
> +    d.setVar('PACKAGES', ' '.join(packages))
> +}
> +
> +
>  # Put the guest agent in a separate package
>  PACKAGES =3D+ "${PN}-guest-agent"
>  SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181922): https://lists.openembedded.org/g/openembedde=
d-core/message/181922
> Mute This Topic: https://lists.openembedded.org/mt/99219254/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

