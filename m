Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C90CDE001
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:05:50 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10902.1782317145992930104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a1pw02Tz;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6642887c602so941333d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 09:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782317145; cv=none;
        d=google.com; s=arc-20240605;
        b=QOVMWkNmici1SYIrmsN1QOMIwN3yLQ2RoLaO2zQqIos0njpFbZaqkxYS0kF29rFO2L
         3nm6/RRayHKFIf4+vEb/8nfO01HqRnlrzDDPt10Ec0jCVhWVdsXlQRj0p11F24HiWCHY
         EGxPOYTFJNrQHkwwG1r8fMngrNJzV4eeFqmg5+stIqOR90tqyRmuX6N1jmDBEvnguSsg
         FBPt63r20XwovbzABQKx27e/zhpInNdZhqaoGz5oYHiGPIzXCjHs2ufHIUdGeQyF1l8a
         +wsS7hSVu6EcX14AyVOi/kNwibkX5Q/2IUTGN2ZIcKDgCZkdX+StavV1vhil9+XfqLK8
         f2+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TVfxAkw45oYfeiz3FxcIAwY3voYDiHsuv0VeAMc1IM=;
        fh=MVnIlZW9+NjPZHu+Gdyu415aph4LTJxRkcWuatbgDH0=;
        b=jbqeBeng0dc6EOK6b2NyAf0TOgvAdNmILPxlM4bc3JuIXISTicHa/iMXUarErg7lBt
         UxMB1qiLj1rU/qmgKULvomS4fUmv1HO+AiP4cEI5Qx+KeerPAk4bJNuQMYEjtYhtG1JE
         Lb8AnwtjYN1Hqqq/J267oRZv/Aw8UrrpLjzfq+yczq0vRZWzCIO4nPTb3rbWhmMphZeI
         mzT++o1zQNZ6F47Ya/irztxIXG8nuB2csFWAzBMRb47Q8MF5who2ATVBvemEGXEh9pOL
         3qaSW8BGdaJ+3hXSbuCMs+kKZGaZ2lJ95Vm0zJTStoZL2Lx+zmF75NVLOkK/quw/UhGa
         T7aA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782317145; x=1782921945; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TVfxAkw45oYfeiz3FxcIAwY3voYDiHsuv0VeAMc1IM=;
        b=a1pw02TzxTIFwlodgTT9nUPMMBp39h7GBVFcZjtuWNnPNZchWTmkOzgoyiduCIP8Cm
         d5Fj2dpIKq4Dg6GqoocBj9A6wjoaT3QqJ4QR12BPG04h1QWhpdxnFfECur8wuIGWBWKx
         x3nz+RLdjxQp5VDkX8zlv3ejF/2O4OQ3+8Z/CSYwJ/CdbuoekoBg4PQX8r1clpOtkF/c
         dewn+rxihilpBY/zf5W7bLJ7r8+6IFsEX9XmMBpWgGnSrBRRVya/VadEvglTEaGnG8TH
         FnmfA7kHE4adwE8Jg6KfQmZ0bn6hwtaNbOy6sbHOI07nFE7la3seG8aNzdOS+sZSM6ug
         GZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782317145; x=1782921945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TVfxAkw45oYfeiz3FxcIAwY3voYDiHsuv0VeAMc1IM=;
        b=iZYNqcPhEaWjHdITERz4d6ynpdeIYOFjPT4CY1kTuJFE/KipH7VWU61PVsJZjsipvx
         li9wpcFXxa5r0pvur3mChORuD+FrAOYCxxqVuMEgu7S+6IhUBkUF70TJG/67BaAnEnDY
         0uDIzSvf3EyIZYyPYKaAmA/GhoBKNe87d3To+T5kFz1dO5vM/59S1aglaDjL00QJ+Ezj
         lhUYj4/lJvfW2+3w8bbs2TXvQE/ev2fYiZJEyS37aPx2kxPUUvfwUTFVRboS3aQjFSrs
         yi8dG4YEzK8Q1UrCuEKt1Fwifmxnd1hPV3GhevD8uZ0usojwmgtklOjFi39rLBLlVPbU
         XKuA==
X-Gm-Message-State: AOJu0YwJt9+jZY9zriEZb4cCH3Vr3w3KYo9fZRJyHhCeTL6LzZvbv0Iz
	6oaukBfNJGIt25uJQ8+0u5ehrbnJVlitv91VDTxcMgVW0YV/JcB9V2zajb+yzgBde9MCdepN1hE
	Fhwr5YYMWzd8MbrVrfeFvXHzM9qe8HqliOw==
X-Gm-Gg: AfdE7ckJaOXXzYBMmfcnAIzgjfWXSRVormjim/kutpx5a4dd8RONly0lMMZsJ8Yn1RN
	GgZn4Cn8YegSKv9Xu1Og14w/0nrHTAOmMpgSM+W4dYXBevuoSuvLG71tU7FHcG7cmFfnimMYjVS
	efq/orYBkosj1870HxuE7DLKry2xPkNx4x4iBrFzOisR/igctraJRqr/elWcLTJKhPdApz3Lqlt
	+77xDHVQGgan96Wbe6589UMSFtOxJwW2KBKwwsmm4cVQAZWhW+j0xxb8+jita07kxAqlPtcipN7
	u6VQQJL7P3c=
X-Received: by 2002:a05:690e:150a:b0:65c:7636:2b09 with SMTP id
 956f58d0204a3-6636e3c7765mr2973629d50.5.1782317144829; Wed, 24 Jun 2026
 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260618165032.347436-1-JPEWhacker@gmail.com> <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-6-JPEWhacker@gmail.com> <ajvqUhlN4Ge2MzG_@nuoska>
In-Reply-To: <ajvqUhlN4Ge2MzG_@nuoska>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 24 Jun 2026 10:05:33 -0600
X-Gm-Features: AVVi8Ccl8hUsHI2ffkDnDjPk2zVlOCgNywd7CNbmWN3a2fZsZ-3UnG_GYSpfqsU
Message-ID: <CAJdd5GZ0ne+ZcfSxBpND-g3nO4PXgHMOG7y1ywAs=E8VdxRx0A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 5/8] Add SPDX deploy tasks to various recipes
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239522

On Wed, Jun 24, 2026 at 8:31=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Wed, Jun 24, 2026 at 08:15:22AM -0600, Joshua Watt via lists.openembed=
ded.org wrote:
> > Adds SPDX deploy tasks to many recipes to record their output when
> > consumed in an SBoM
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes-recipe/barebox.bbclass             | 1 +
> >  meta/classes-recipe/devicetree.bbclass          | 1 +
> >  meta/classes-recipe/kernel-fit-image.bbclass    | 1 +
> >  meta/classes-recipe/kernel.bbclass              | 1 +
> >  meta/recipes-bsp/grub/grub-efi_2.14.bb          | 1 +
> >  meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 1 +
> >  meta/recipes-bsp/u-boot/u-boot.inc              | 1 +
> >  meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 +-
> >  8 files changed, 8 insertions(+), 1 deletion(-)
>
> Why not doing this in deploy.bbclass for all users of the class?

We probably could do that; I guess I'd like some feedback if anyone
else thinks that's a good idea or not. I initially did it this way
just to minimize disruption


>
> Cheers
>
> -Mikko
>
> > diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/=
barebox.bbclass
> > index 2411fb5caa..60437c1ad1 100644
> > --- a/meta/classes-recipe/barebox.bbclass
> > +++ b/meta/classes-recipe/barebox.bbclass
> > @@ -158,5 +158,6 @@ barebox_do_deploy () {
> >          fi
> >  }
> >  addtask deploy after do_compile
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
> > diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-reci=
pe/devicetree.bbclass
> > index ce9d008aac..35c2499bdb 100644
> > --- a/meta/classes-recipe/devicetree.bbclass
> > +++ b/meta/classes-recipe/devicetree.bbclass
> > @@ -164,6 +164,7 @@ devicetree_do_deploy() {
> >      done
> >  }
> >  addtask deploy before do_build after do_install
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  EXPORT_FUNCTIONS do_compile do_install do_deploy
> >
> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classe=
s-recipe/kernel-fit-image.bbclass
> > index ae8f3c6688..5115482eff 100644
> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > @@ -241,3 +241,4 @@ do_deploy() {
> >      fi
> >  }
> >  addtask deploy after do_compile before do_build
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/k=
ernel.bbclass
> > index 50cef17f69..8d0cb91688 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -842,6 +842,7 @@ kernel_do_deploy() {
> >  do_deploy[prefuncs] +=3D "read_subpackage_metadata"
> >
> >  addtask deploy after do_install do_populate_sysroot do_packagedata
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  EXPORT_FUNCTIONS do_deploy
> >
> > diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/=
grub/grub-efi_2.14.bb
> > index 6354b43989..e535d99710 100644
> > --- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > +++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > @@ -97,6 +97,7 @@ do_deploy() {
> >  }
> >
> >  addtask deploy after do_install before do_build
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  FILES:${PN} =3D "${libdir}/grub/${GRUB_TARGET}-efi \
> >                 ${datadir}/grub \
> > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-b=
sp/opensbi/opensbi_1.8.1.bb
> > index 0a9652c283..93646a97df 100644
> > --- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > @@ -45,6 +45,7 @@ do_deploy () {
> >  }
> >
> >  addtask deploy before do_build after do_install
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.=
*"
> >  FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_paylo=
ad.*"
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-bo=
ot/u-boot.inc
> > index a75948dfc3..acc2bf9819 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -471,3 +471,4 @@ uboot_deploy_spl () {
> >  }
> >
> >  addtask deploy before do_build after do_compile
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/rec=
ipes-core/systemd/systemd-boot_259.5.bb
> > index c6c443f929..c887835806 100644
> > --- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
> > @@ -72,4 +72,4 @@ do_deploy () {
> >  }
> >
> >  addtask deploy before do_build after do_compile
> > -
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > --
> > 2.54.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#239514): https://lists.openembedded.org/g/openembed=
ded-core/message/239514
> > Mute This Topic: https://lists.openembedded.org/mt/119957548/7159507
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mikko.rapeli@linaro.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

