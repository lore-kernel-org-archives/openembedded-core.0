Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D080C77B7A
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 01:13:30 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.48920.1686532405567874406
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 18:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ldrz9PBk;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-559409cc490so2515207eaf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 18:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686532405; x=1689124405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFmhtyHiy2Y0bagSnCHZERrMUleXNLtii4qB2AKeGeY=;
        b=ldrz9PBkSFBK5SdLA8FVwNmq4JPcWrli0SK/y5x5TSlAZxlPxGDoqYza+1NoBo1A97
         r1HjR37/rN1eDQvix9F9nE9rkbscq4XVm9hSIPiWHUZ6E96dM+2D8Uc7QiLvJ/t0XE1C
         5uhaSJXfnNZIEz6EJCSpr4qcYZxCPvme+OrZ7mTQuSemMVZvHlofjiHFK1/WqfmLCQ1d
         Mrf0ct4rpbhyta80ojL57gqe2bQ8hM21bLdcePhXJsAHIQCG5u380G6NSxn6/uZyFMNr
         PlfJNO/BCnekfm8Hin7vrPcmiksnDcbUYo2mgTafYUJ3BDYv4KCAgpbeHIWre4Q8gX4Y
         PPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686532405; x=1689124405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFmhtyHiy2Y0bagSnCHZERrMUleXNLtii4qB2AKeGeY=;
        b=GVTtdNyoUV92bA3UMwPLEk9AyY6cqn5fqCULMrXDU09z8sZCRs1ck9or2Sh66IlO43
         vKj2ehsBjmOD8mdlwfz4NL6lRawhb1hTbw1a0yJTulbJL9evR+7YqpFmkKXkcDu2i2pr
         9kpiBt6f/WEXCRvGwKdF18EhE+xo4zhiNqRvKE/5ieEvFGtd6R8zYwQma7qFmDtpV5A6
         rwMFWIQrMAL/hOCFWJKIVXd52BraJN7PurIkyfDjmbQbAywtIVV20/17esvDhlVw7EjV
         CvOKtkqulPNy7wRZFm/BLFRgMRfryxZRA1u7vvZVwSk2/24aaA8GX4KE9mU8oJLyZwtg
         z7SA==
X-Gm-Message-State: AC+VfDzJF/ln1V0tUzqRjcX1XglGvP4krPMMaH2lhHlSQFrnBK8q3NzV
	gmWdniK2AMSpfeQB50NHCkg/D+6PsZW56SjG1gc=
X-Google-Smtp-Source: ACHHUZ5ljxMaZw07hZhEqj9fpXeS3fEasLfm46GHCdYaZwXaDStjiRkrANQFodlQT/1w69OVMQyZhv7u5OhJ5zsxw5I=
X-Received: by 2002:a4a:ce91:0:b0:558:a782:5209 with SMTP id
 f17-20020a4ace91000000b00558a7825209mr4496357oos.1.1686532404740; Sun, 11 Jun
 2023 18:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230611225342.1994556-1-vince@underview.tech> <CAMKF1srpcJ+95QVBAJQq8G5--Xjt9rLD=pnpu+uQtSvg7UZA1g@mail.gmail.com>
In-Reply-To: <CAMKF1srpcJ+95QVBAJQq8G5--Xjt9rLD=pnpu+uQtSvg7UZA1g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2023 18:12:58 -0700
Message-ID: <CAMKF1soODCwk2xq-+XS7TW3L4S7ORZwpeYuHnhOxO3CL6DNg=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-tools: fix base_libdir when usrmerge in DISTRO_FEATURES
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 01:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182645

something like this will be good

https://git.yoctoproject.org/poky-contrib/commit/?h=3Dyoe/mut&id=3D98781287=
ec0e12d1dc3506f84871b47993c6750b

On Sun, Jun 11, 2023 at 5:52=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sun, Jun 11, 2023 at 3:55=E2=80=AFPM Vincent Davis Jr <vince@underview=
.tech> wrote:
> >
> > if usrmerge included in DISTRO_FEATURES base_libdir is set to
> > "/usr/lib{64}" instead of "lib{64}". Build issues occur when
> > building vulkan-validation-layers or any recipe that
> > requires the output of spirv-tools (SPIRV-ToolsTarget.cmake).
> >
> > As INTERFACE_LINK_LIBRARIES cmake property value is set incorrectly.
> > _IMPORT_PREFIX is already set to <recipes-sysroot>/usr
> > if usrmerge included INTERFACE_LINK_LIBRARIES value would be
> > <recipes-sysroot>/usr/usr/lib
> >
> > Leading to bellow error
> >
> > recipe-sysroot/usr/usr/lib', needed by 'layers/libVkLayer_khronos_valid=
ation.so',
> > missing and no known rule to make it
> >
> > Solution:
> >
> > Remove "/usr/" from base_libdir string if present as base_libdir
> > should only contain name of directory.
> >
> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ---
> >  meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta=
/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
> > index 21f9dd9650..dbfdbd4e0a 100644
> > --- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
> > @@ -28,11 +28,22 @@ EXTRA_OECMAKE +=3D "\
> >      -DSPIRV_SKIP_TESTS=3DON \
> >  "
> >
> > +# Removes "/usr/" from base_libdir if exist as
> > +# it's already define in _IMPORT_PREFIX string
> > +# leading to <recipes-sysroot>/usr/usr/lib not
> > +# found as it doesn't exist.
> > +def update_base_libdir(d):
> > +    base_libdir=3Dd.getVar("base_libdir")
> > +    if '/usr/' in base_libdir:
> > +        return base_libdir.strip("/usr/")
> > +    return base_libdir
> > +
>
> baselib variable exists already. Please try to use that instead.
>
> >  do_install:append:class-target() {
> > +    baselibdir=3D"${@update_base_libdir(d)}"
> >      # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that =
dependent
> >      # tools can find the right library
> >      sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
> > -        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$=
\{_IMPORT_PREFIX\}\${base_libdir}":'
> > +        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$=
\{_IMPORT_PREFIX\}\${baselibdir}":'
> >  }
> >
>
>
>
> >  # all the libraries are unversioned, so don't pack it on PN-dev
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#182641): https://lists.openembedded.org/g/openembed=
ded-core/message/182641
> > Mute This Topic: https://lists.openembedded.org/mt/99472427/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

