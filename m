Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF38C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 20:09:28 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.4372.1685477364852260974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 13:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NcMhnHC8;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7747f76946bso5688939f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685477364; x=1688069364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM5/yD+f6aXvbSTo/CvfEQnQ4+cxMeTZ9q+Pv+Y+KTA=;
        b=NcMhnHC8FXXCu2WddQBBjPda1gs+CdMjdQSYNngzj+Z4AYZxnuYlyep91MOtAGo31h
         87LpM3Nwd+SAsX0OSODxnYthrL0R1ZFOXIvdnvzOeFNdyMuDi1v/Bhz3w++GWHJNiLSn
         DzfgdOIO9LLBPBM5+rbbgumv3Hvui6kIo4i3l/cimiiiDMXT2uFXun+15rXAmt7onM/v
         GVNdKBbHGC0gm9EWThixaEkUFYhKcfL4v0ONu/YRlt4EuVFtVC0wEE12u1dxb0Gtnxh+
         K/IvrXGn6C25przvRWjjfevjmy8hY/TtA7qB5AHTQBfZ+wiEtw+zIldGKy2fNYgKX6wk
         Nzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685477364; x=1688069364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WM5/yD+f6aXvbSTo/CvfEQnQ4+cxMeTZ9q+Pv+Y+KTA=;
        b=jCghoc4B9lH+qHNeFezi1RPq3oe3wqBGNNfOS2cHTdJSi2y6eg6jDGCvckiR6ORWvx
         Ynd/hVo7CubzTobXdiUZW13etSWZtyb+bdSXR827rICM4ytdOoaqLD4DrK/nyYd2crAr
         eBhsUaPL4f3IgY9chz9741HxVc8o9xaFbytBCWu17qJtb6TgQsjpM9cQzvy/g6DHbmaB
         uL5FVMONmCB9vM6vQAQMdh/Mh8DTcnZzy78/28jgnU11VMU7VxJUZ6fqRXH+ej36qSty
         mC85tMbCm8Z/L8AoStydF30qwtTM6wW5/d0LsB2J9+pu81GQtYUXJOkPz8je0RM7LlWr
         d7sQ==
X-Gm-Message-State: AC+VfDzhCmkTNwGCe/UVfrPxpyJJhA9AvqfO2WFE5fJ3elVcmnPnVKeh
	AUTUZNPtS8tof6fIrJ3/InGAuiSWPEUbn6Y32cQ=
X-Google-Smtp-Source: ACHHUZ7muBv3shkZgte3sZYo28oYn0zp/M9m3hu5681QFe/pTDjjp9cIZ27TNHQHxaPu5rzFl0rPbchVLhO3IBtiMck=
X-Received: by 2002:a92:d34a:0:b0:337:d335:6469 with SMTP id
 a10-20020a92d34a000000b00337d3356469mr490523ilh.5.1685477363733; Tue, 30 May
 2023 13:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230530170949.12045-1-liu.ming50@gmail.com> <CADkTA4M63mwkQeEeb_D-8uRkqtmt8sU5xJ1jvGCtdxV6GHZMeg@mail.gmail.com>
 <CALatG=4TeChkii4ZKH8NqgDvfz=tupAG1a6na6ZVpGqjbYGP6g@mail.gmail.com>
In-Reply-To: <CALatG=4TeChkii4ZKH8NqgDvfz=tupAG1a6na6ZVpGqjbYGP6g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 May 2023 16:09:15 -0400
Message-ID: <CADkTA4Ojqj8qVSqQn1fo6k1_DF4Ya58OYPo6spxvH5sTkyowOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org, francesco.dolcini@toradex.com, 
	max.krummenacher@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181947

On Tue, May 30, 2023 at 3:58=E2=80=AFPM Ming Liu <liu.ming50@gmail.com> wro=
te:
>
> Hi, Bruce:
>
> Please see my answers as below:
>
> > You've confirmed that the result is the same as the touches previously =
did when that variable isn't set ?
>
> Yes, I have verified that on a qemuarm64 machine.
>
> > Those comments are still valid
>
> I think after we introduce KERNEL_LOCALVERSION, then we generate the .scm=
version on purpose, not as a workaround or fix so those comments not valid =
any more?
>

They are definitely still valid.  The files need to exist, or the +
gets added. Other layers and kernel recipes have been touching and
using those files in their own way, the kernel.bbclass was just a
default to ensure if they didn't handle it, that those noise wouldn't
be generated.

That variable is completely optional, so we are not always generating
it on purpose. Also CONFIG_LOCALVERSION is used by linux-yocto and
other recipes, so the default of empty to ensure that nothing is added
by kbuild is the case, and also makes them valid.

Bruce


> the best,
> thank you
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2023=E5=B9=B45=E6=9C=
=8830=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:21=E5=AF=AB=E9=81=93=
=EF=BC=9A
>>
>> On Tue, May 30, 2023 at 1:10=E2=80=AFPM Ming Liu <liu.ming50@gmail.com> =
wrote:
>> >
>> > From: Ming Liu <liu.ming50@gmail.com>
>> >
>> > Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
>> > to append a string to the name of the local version of the kernel
>> > image.
>> >
>> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> > ---
>> >  meta/classes-recipe/kernel.bbclass | 10 +++++-----
>> >  meta/conf/documentation.conf       |  1 +
>> >  2 files changed, 6 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass
>> > index e634eabd49..3dd139eda9 100644
>> > --- a/meta/classes-recipe/kernel.bbclass
>> > +++ b/meta/classes-recipe/kernel.bbclass
>> > @@ -616,6 +616,7 @@ do_shared_workdir () {
>> >  # We don't need to stage anything, not the modules/firmware since tho=
se would clash with linux-firmware
>> >  SYSROOT_DIRS =3D ""
>> >
>> > +KERNEL_LOCALVERSION ??=3D ""
>> >  KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} O=3D${B} olddefco=
nfig || oe_runmake -C ${S} O=3D${B} oldnoconfig"
>> >
>> >  python check_oldest_kernel() {
>> > @@ -633,11 +634,10 @@ check_oldest_kernel[vardepsexclude] +=3D "OLDEST=
_KERNEL KERNEL_VERSION"
>> >  do_configure[prefuncs] +=3D "check_oldest_kernel"
>> >
>> >  kernel_do_configure() {
>> > -       # fixes extra + in /lib/modules/2.6.37+
>> > -       # $ scripts/setlocalversion . =3D> +
>> > -       # $ make kernelversion =3D> 2.6.37
>> > -       # $ make kernelrelease =3D> 2.6.37+
>>
>> Those comments are still valid.
>>
>> > -       touch ${B}/.scmversion ${S}/.scmversion
>> > +       if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
>> > +               echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>> > +               echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>> > +       fi
>>
>> You've confirmed that the result is the same as the touches previously
>> did when that variable isn't set ?
>>
>> Bruce
>>
>> >
>> >         if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "=
${B}/.config" ]; then
>> >                 mv "${S}/.config" "${B}/.config"
>> > diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.co=
nf
>> > index a27d7a53c3..66b8e2f24f 100644
>> > --- a/meta/conf/documentation.conf
>> > +++ b/meta/conf/documentation.conf
>> > @@ -253,6 +253,7 @@ KERNEL_MODULE_PROBECONF[doc] =3D "Lists kernel mod=
ules for which the build system
>> >  KERNEL_PACKAGE_NAME[doc] =3D "Name prefix for kernel packages. Defaul=
ts to 'kernel'."
>> >  KERNEL_PATH[doc] =3D "The location of the kernel sources. This variab=
le is set to the value of the STAGING_KERNEL_DIR within the module class (m=
odule.bbclass)."
>> >  KERNEL_SRC[doc] =3D "The location of the kernel sources. This variabl=
e is set to the value of the STAGING_KERNEL_DIR within the module class (mo=
dule.bbclass)."
>> > +KERNEL_LOCALVERSION[doc] =3D "Appends a string to the name of the loc=
al version of the kernel image."
>> >  KFEATURE_DESCRIPTION[doc] =3D "Provides a short description of a conf=
iguration fragment. You use this variable in the .scc file that describes a=
 configuration fragment file."
>> >  KMACHINE[doc] =3D "The machine as known by the kernel."
>> >  KTYPE[doc] =3D "Defines the kernel type to be used in assembling the =
configuration."
>> > --
>> > 2.25.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#181939): https://lists.openembedded.org/g/openembe=
dded-core/message/181939
>> > Mute This Topic: https://lists.openembedded.org/mt/99224358/1050810
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

