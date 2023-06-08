Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64A4C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 13:33:39 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.9065.1686231210857107479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 06:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Dr9LS20N;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-33e517e5f99so1794935ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686231210; x=1688823210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqHUJClOY6qY9wcCixxMATibn6Ip1Ku6SLgXQtKuZxU=;
        b=Dr9LS20NxkD2o8sm5MboBDLZKlHsvaVm6gaNbqgimKEGJw5gnAaSYzpIBgZ+6knxr7
         CUokEYthQANdcy+cAFpsx8PLwkmfoMqLZz8D8yyDir9ZKSgE9cwNdzeFBkKd/4sRsiUk
         we9mwyQkBNnM4eEqKm0OkYGW4mdjaTtMAD73nJV0omq7hHy7ULPowGy1Nm3vBtN5DrCi
         wsw+JpQNIOJrqB4SASwJ4DH9SeEh9MWUdyRH9yE1Ap0maZfL0AWidnyCQT6eVRE9r2hJ
         HL+7GhSepX1RyHpBvPyy8JnFJAYEl6RCpHQKUG7xRIOLTq/AAS+NxGiuQjB1idHnAaKi
         zO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686231210; x=1688823210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqHUJClOY6qY9wcCixxMATibn6Ip1Ku6SLgXQtKuZxU=;
        b=NwldA/mM/KkXWOGY9jFHDn1iziZ8TCFI5TfWBlbmt38h6fkV5blOwhQBD6D4vtPw1D
         PbfkV00s/Ae+mesWe2EPLMoBrFuX0RwxSE6h4r5LynubP4xh18YbBHWAyqpW0OCpDXev
         BkUXl08KI/cfi0b4RTIRY6vzTKCfKPDwCKGlYc2KkPJh7qO4Y9ErA/m1l9Pe5+0QHvF2
         CemDpd7dAO5WBu7sq9Szk1o23Q4/4n7MKYQkgkUfSJ81FM+qiGiB0OufBWrSv081d4RT
         /W+MBNRuQOTh3ZvsbI00OPUrupM1ZdPQAQC6jx3jJse7YkXLjlUGrXt+V6Fw9ISvSEtB
         fGSQ==
X-Gm-Message-State: AC+VfDw/8UOED3kyqLHtOg+TpU1D+RdEHECVR/VGxEZnRHV4h3YYlkX8
	ICLAErZ2vaLBgtG3nIBxyEZQXCMa3Vz58S/fwHA=
X-Google-Smtp-Source: ACHHUZ6w4dj0RNOqmfiyld4d8wqpBUi41rDCYPhBPdbDO6V/HlqeNR+94V1y8FY3KI1fN+0rFcLG0OWRtoxTTyAm5z4=
X-Received: by 2002:a05:6602:1859:b0:774:9994:d321 with SMTP id
 d25-20020a056602185900b007749994d321mr6803187ioi.16.1686231209864; Thu, 08
 Jun 2023 06:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230607205347759a5df5@mail.local> <20230608054525.3293334-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230608054525.3293334-1-mingli.yu@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Jun 2023 09:33:26 -0400
Message-ID: <CADkTA4Mj2WdncdduX+P6fT8HU0KjkS6+vjTePbhPc0FXL2d_CA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] qemu: Split the qemu package
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 13:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182509

On Thu, Jun 8, 2023 at 1:45=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver.=
com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Currently all files as below packaged into one package such as
> qemu-7.2.0-*.rpm. After the qemu package installed on the target,
> it will take up about 464M which includes not only the one matches
> the arch of the target but aslo all available built qemu targets
> which set by QEMU_TARGETS.
>
>  # ls tmp-glibc/work/core2-64-wrs-linux/qemu/7.2.0-r0/image/usr/bin/
>  qemu-aarch64  qemu-img          qemu-mips64el   qemu-ppc64
>  qemu-sh4    qemu-system-loongarch64  qemu-system-ppc      qemu-system-x8=
6_64
>  qemu-arm      qemu-io           qemu-mipsel     qemu-ppc64le
>  qemu-storage-daemon  qemu-system-mips         qemu-system-ppc64
>  qemu-x86_64 qemu-edid     qemu-loongarch64  qemu-mips.real
>  qemu-pr-helper  qemu-system-aarch64  qemu-system-mips64
>  qemu-system-riscv32 qemu-ga       qemu-mips         qemu-nbd
>  qemu-riscv32    qemu-system-arm      qemu-system-mips64el
>  qemu-system-riscv64 qemu-i386     qemu-mips64       qemu-ppc
>  qemu-riscv64    qemu-system-i386     qemu-system-mipsel qemu-system-sh4
>
> Split the qemu package into qemu-7.2.0-*.rpm, qemu-system-*.rpm,
> qemu-user-*.rpm and etc. And let user can only choose the corresponding
> qemu arch package they want to install should ease the concerns who
> cares much about the size in embedded device as it decreases the qemu rpm
> (qemu-7.2.0*.rpm) size from about 65M to about 13M and the size of the
> extracted qemu RPM decreased from about 464M to about 230M.
>
> For the users who want to install all arch packages, they can install
> qemu-system-all and qemu-user-all to meet their need.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index a87dee5c99..367b924f9c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -230,6 +230,26 @@ INSANE_SKIP:${PN} =3D "arch"
>
>  FILES:${PN} +=3D "${datadir}/icons"
>
> +# For user who want to install all arch packages
> +PACKAGES =3D+ "${PN}-system-all ${PN}-user-all"
> +
> +ALLOW_EMPTY:${PN}-system-all =3D "1"
> +ALLOW_EMPTY:${PN}-user-all =3D "1"
> +
> +python populate_packages:prepend() {
> +    archdir =3D d.expand('${bindir}/')
> +    syspackages =3D do_split_packages(d, archdir, r'^qemu-system-(.*)$',=
 '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=3DT=
rue)
> +    if syspackages:
> +        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(=
syspackages))
> +
> +    userpackages =3D do_split_packages(d, archdir, r'^qemu-((?!system|ed=
id|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU ful=
l user emulation binaries(%s)' , prepend=3DTrue)
> +    if userpackages:
> +        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(us=
erpackages))
> +    mipspackage =3D d.getVar('PN') + "-user-mips"
> +    if mipspackage in ' '.join(userpackages):
> +        d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX"=
) + 'bash')
> +}

At this point, you can probably see why I ended up using the explicit
variables and overrides versus python when doing the
meta-virtualization splits. :)

I have a few more comments that I made in v1, that I haven't seen
directly handled or replied to.

My only remaining concern (and it may just be my own concern), is that
there's no way to change this packaging split. Either you take the
programatic split, or you take the -all packages.

Other packages (glibc, kernel-modules) have a variable that controls
whether the split happens or not, I'd like to see something similar
here .. but I do realize that it makes test complexity more, and that
Richard normally doesn't like conditionals like that.

Alternatively, did we rule out using PACKAGESPLITFUNCS to add the
splitting routine ? With that, we could remove the processing in
places we don't want it, in particular for the native/sdk builds, as I
found that we really don't want the splitting of qemu in those
scenarios.

Bruce

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
> View/Reply Online (#182494): https://lists.openembedded.org/g/openembedde=
d-core/message/182494
> Mute This Topic: https://lists.openembedded.org/mt/99401176/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

