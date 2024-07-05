Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFFAC30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 14:08:58 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.17646.1720188535466005908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 07:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+H7GAr4;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c98b080012so1173508a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720188535; x=1720793335; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjYAJb5dyl5sLWb5TjIqh888DI1RMdZUi7F+mfWkdHE=;
        b=H+H7GAr4FotJjBJMJ6SLI2argRQIM1eaRmuxuooVwwJEcq3u0aP1lR6l+69gCr2jyh
         IeL0AK0M+fWMv4PBRJnojP5aG3TqodtPuR56bvKjt4SuVO5wrK1BCNbwjEdSl6igX0Lr
         sBBTxiN1zxvrRKpfnpqncX2KFvSy8DxkxvpXZF2pGTD2/KqNBsqfEqguwcKf0USFCWB0
         pHB1eSimgaRyNsXz3akKRGOlhX8taMvPck952jBmD96BhDC3/uZgi+TuW3mV5NGCicDf
         NaY9gwJLqfHGtRDIqhSXQWOn+2nXMNT8A/mEgsUnDpfL0qVjUWtvxPn1mUgij5jZ/7J6
         YMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720188535; x=1720793335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjYAJb5dyl5sLWb5TjIqh888DI1RMdZUi7F+mfWkdHE=;
        b=Ub+rMy1/6VmZbpeUJBSadUPQj7torB60ojYbAVyX+qGkMryb4nRn/oa5PJoFfQnPkb
         dBkffNplv3aASA0HyTRacHmduFCGSbUqe1G657o+TeXwXKJa3Cf7TzGto4dG+hq1UXe+
         K2bOk/aai3F5+CPx5eUMPXWUqGjxDvQt0EDNaH0A3ROD8HdxWB4yLsUohpUS1UBWrCib
         hwV9o0tbVngen3q8gNGFlEFT+vDZn9q1NmCk5jMlPEpJ5vFB5ewWOffCxixsekaeLfO2
         hiKpIn73PlwuDlkac7RdXwpe8MWFy5KTrDDiVNuzGPIfrjx5N8qJFCMP5kHDnOV9HOip
         LZ/w==
X-Gm-Message-State: AOJu0YyhHxx8BXttXTt/nQGwPAVtp8Wg9kR5lNm/g4LBK0HcsRo+xjli
	nZ8VINK70K0efiUQRFk2kD8uckbuot1B6uiXFs+CxbcraIPHR850AtGbPaDI5jkws2J8GtIUsZe
	YLIi7olMT7tMWiTYWLwMqPp9S27g=
X-Google-Smtp-Source: AGHT+IFknATYh6neZ5RD7TAOd40VTSo72rAWoZBsDDw9V8SjD8f4bLzW4mvFhmh9x1MpR+AsINoPwcDPEU5SQ8aYrmI=
X-Received: by 2002:a17:90a:cc3:b0:2c9:64fb:1c7e with SMTP id
 98e67ed59e1d1-2c99c6af4a4mr3472575a91.14.1720188534415; Fri, 05 Jul 2024
 07:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <bc15a9ebae0ad3841ac2be887c288b451426e69b.1720185337.git.joerg.sommer@navimatix.de>
In-Reply-To: <bc15a9ebae0ad3841ac2be887c288b451426e69b.1720185337.git.joerg.sommer@navimatix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Jul 2024 10:08:41 -0400
Message-ID: <CADkTA4O-jWiZHHy4h4qw6TN=HZdvLSs2vdD80pqCjA8CFwnJaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/kernel: Delay module signing until
 after strip
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 14:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201608

On Fri, Jul 5, 2024 at 9:19=E2=80=AFAM J=C3=B6rg Sommer via lists.openembed=
ded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> The current do_package does not strip the kernel modules, if they are
> signed. Hence, the files in a release image stay very big and the debug
> information are not split into the kernel-dbg package.
>
> The idea of this change is to suppress the signing of the modules on
> `modules_install` and run `modules_sign` after the debug information was
> striped.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta/classes-recipe/kernel.bbclass | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
>
> Another idea would be to move the code to split the debug info in package=
.bbclass to a
> stand-alone tool and inject this in the kernel's modules_install.
>
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 89badd90f1..96e40be085 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -461,7 +461,8 @@ kernel_do_install() {
>         #
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> -               oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libd=
ir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/=
firmware modules_install
> +               # don't sign now, it's down after extraction of debug inf=
ormation
> +               oe_runmake CONFIG_MODULE_SIG_ALL=3Dn DEPMOD=3Decho MODLIB=
=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=3D$=
{D}${nonarch_base_libdir}/firmware modules_install

This isn't a good idea, since it both hardcodes the option name, and
it doesn't allow any method of overriding the setting.

>                 rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSIO=
N}/build"
>                 rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSIO=
N}/source"
>                 # Remove empty module directories to prevent QA issues
> @@ -497,6 +498,16 @@ kernel_do_install() {
>         ! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${=
KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
>  }
>
> +sign_kernel_modules() {
> +       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +       if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
> +               # modinst_pre=3D prevents the cleaning of the target befo=
re signing
> +               oe_runmake -C ${B} modinst_pre=3D DEPMOD=3Decho MODLIB=3D=
${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=3D$=
{PKGD}${nonarch_base_libdir}/firmware modules_sign
> +       fi
> +}
> +
> +PACKAGEBUILDPKGD +=3D "sign_kernel_modules"

I've been around for a while, and I've never run across this variable.
According to
my grep it is mostly internal and there are replacement variables that shou=
ld be
used.

But even if those other variables are used, this seems to force the extra
signing step, which I can say for certain that not everyone wants.

bruce

> +
>  # Must be ran no earlier than after do_kernel_checkout or else Makefile =
won't be in ${S}/Makefile
>  do_kernel_version_sanity_check() {
>         if [ "x${KERNEL_VERSION_SANITY_SKIP}" =3D "x1" ]; then
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201607): https://lists.openembedded.org/g/openembedde=
d-core/message/201607
> Mute This Topic: https://lists.openembedded.org/mt/107053401/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

