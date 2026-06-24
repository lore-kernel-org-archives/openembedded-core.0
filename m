Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63543CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:30:50 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11551.1782318644664838414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r2fJazr/;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80260a90522so18153017b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 09:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782318644; cv=none;
        d=google.com; s=arc-20240605;
        b=TwfpAZmkVVt1T7fhpJKyrL1frCA3yhwhPgzoB9kEkWFzqK7Ev19ZEsTOR6s+apCDgl
         n7UXBD4QbGFbAPtfnGrQGTJjOXY+6gVdJ1n3Xtab5AybCtEsqehCi8oa1qQE/4FmZw1r
         Cp6dKoL/JPME1BcDg119u6xccw99gDV94lo64UQdJ4/jH30z35oPTf6nn2oXuYfGfZYs
         BmdWu/dWCB57YZT7UaVlGpcUqMhhODLwrr23gmXvx1DKQOIgW9fp5iQg0s1WLXAqIvzH
         hma5sRfv9CFeJLWN+80FAvH5kytl8a9CHpYqq6hZIwCKbkshKCoWDI2X/6/SiMBmAScw
         lJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ieTxcxo+1ysfFJaafw80u0A6GOomm/RefO2QOI+M+o=;
        fh=MVnIlZW9+NjPZHu+Gdyu415aph4LTJxRkcWuatbgDH0=;
        b=MMxM7aLv4SdgydID2EYzmG4IHMf8OQ/iA7oSsbFL+fxo5L+gjpD9mBmOc7qa4eWrYt
         JcNYMaRUI1zeJ4fANS+O9U1WNx5AO6mqyidrliXxdWMddO+U4PtqdA4NKJ4tlsZWqu5f
         uG6ZW5TrhVKHyChDz40yaGcD8AHC9TaFVbzphazOnl6ogTgVQlCN/AGcXN7iUsS2vLA7
         RHmDcB8mJV7AcngIUvlYJX6sUm33IhYMONHvPOuaAmXgPEB2Qn1hGo8epuIxpC30wdiF
         lbRW3PSRFsQdqMIPov9gcaCc+nC1YaTh+cL1+YaUZ0MQgFXZD1z/4AsriAm5a7xaKyOf
         8Flw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782318644; x=1782923444; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ieTxcxo+1ysfFJaafw80u0A6GOomm/RefO2QOI+M+o=;
        b=r2fJazr/v66IABcqEpMRD9BMBklzio7TSXvhJHl/sC5E/uwdycD97aoLDSfApMGJcC
         d+pSyX7/uDM7VvDqhrKYzuB2o9RKjaEDtJtTGlEmRXldkampfy1cFXHVJW7sOmSokBcI
         LfhaPuJV/kzoFVExMjZPGKZQsqEzCmmKANAb+GVIg8p/nlro6Dg7X7vDQxaSnxaMa37n
         iQgvwd5oYCUy0EglEzvR1KJaN98Z9vJF2Bn2kL3g1eX439xrINzfUj9vt4iqbsV3hhCk
         Ny4OhVrAKr9dTXQ1Z7z93cFGKDaI0DZc31nPzMOZFr/BTCQU7M5bqHBLIuQfuaFnYIuR
         TpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782318644; x=1782923444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ieTxcxo+1ysfFJaafw80u0A6GOomm/RefO2QOI+M+o=;
        b=VN2zMb67Zrh0DW3CEB1eo4JR9nux2/xnanW5axLG/Bq/t6UXRGCXEuBhbztIFSOxbu
         7OKZUOD2NUj17qfNQPqNpHPoEDWGX7FGNWre6AbVDWVoC3VYqX5MAp7MkkdBGKWNPzDR
         5emz2D8Ajs4Zpob8wrfMXsf9IZffedQtXZg0nudKTJ/hCIQf73hjtHBDrKhxBQoA9xez
         095fSwCXUp9aojYqffqWoFWuhBTvkUBVbaWAfSZj63BT1NBsxM+UgtyWbZT2EqoNCI8f
         5h4RxqNG+pSvX4JtQovIlkt0oHvA1ZteiSkO0wjtvHvTKkYE0qj17uYZtlE3w4RD6Ge/
         bOQA==
X-Gm-Message-State: AOJu0Yx+tWzy0lt9tdhQPo7IrRZxLbfXByMEAFpeKqZdJUjdd2ieFVdp
	RBjoNUCR2g35XCaM5wXq+WjWcT3EUqTjCYUJ27502EjHpw6+2JawPYRjd/WTqV/fQKuIkpUH0ly
	D+sNq/i9A5halKnCYWiqrJEDbOBHZyFGEeGXo
X-Gm-Gg: AfdE7ck/dXug97wQvI37G9c6IdSsZALUqP7eYmE75pBglbwe7/CyI+5n/O6rzNWO/Ov
	BTADzB2uLs8SI6b6lJEzGHfp/jWQza7x83vFKy+O2lHza31G6FI6fmud7bGvURY2Ul5f+j5Nbsj
	i9kvwgRQQo+vH1bHmXM2WoAd7aIMjpAClzB1LIEPZiRyTrTjJQbk1w8tTR1mxfP+tilB+OOJPMs
	0V5/m+H+yw1SrdYzkRBYX5rePynr62DdkEkB53fWiNlX4xteREbb03Pe3ZJ/n9Zyr63M8h0q0zd
	CyCnMUQ91mg=
X-Received: by 2002:a05:690c:a92:b0:7b4:1ffe:f9f9 with SMTP id
 00721157ae682-806c148420fmr77725087b3.16.1782318643430; Wed, 24 Jun 2026
 09:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260618165032.347436-1-JPEWhacker@gmail.com> <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-6-JPEWhacker@gmail.com> <ajvqUhlN4Ge2MzG_@nuoska>
 <CAJdd5GZ0ne+ZcfSxBpND-g3nO4PXgHMOG7y1ywAs=E8VdxRx0A@mail.gmail.com> <ajwEo03Xm5nke9UP@nuoska>
In-Reply-To: <ajwEo03Xm5nke9UP@nuoska>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 24 Jun 2026 10:30:31 -0600
X-Gm-Features: AVVi8CeNSzw0HLIvVYwJuYUx6snqpG92MOfwBC7nB0PBozsXrwcjjhvNiF6t7WQ
Message-ID: <CAJdd5GYn7azEP+wt2SDRPFsmv1tECRAqyY9xQ9qdbkpJpNeaOw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 5/8] Add SPDX deploy tasks to various recipes
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239525

On Wed, Jun 24, 2026 at 10:24=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.=
org> wrote:
>
> Hi,
>
> On Wed, Jun 24, 2026 at 10:05:33AM -0600, Joshua Watt wrote:
> > On Wed, Jun 24, 2026 at 8:31=E2=80=AFAM Mikko Rapeli <mikko.rapeli@lina=
ro.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Jun 24, 2026 at 08:15:22AM -0600, Joshua Watt via lists.opene=
mbedded.org wrote:
> > > > Adds SPDX deploy tasks to many recipes to record their output when
> > > > consumed in an SBoM
> > > >
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >  meta/classes-recipe/barebox.bbclass             | 1 +
> > > >  meta/classes-recipe/devicetree.bbclass          | 1 +
> > > >  meta/classes-recipe/kernel-fit-image.bbclass    | 1 +
> > > >  meta/classes-recipe/kernel.bbclass              | 1 +
> > > >  meta/recipes-bsp/grub/grub-efi_2.14.bb          | 1 +
> > > >  meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 1 +
> > > >  meta/recipes-bsp/u-boot/u-boot.inc              | 1 +
> > > >  meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 +-
> > > >  8 files changed, 8 insertions(+), 1 deletion(-)
> > >
> > > Why not doing this in deploy.bbclass for all users of the class?
> >
> > We probably could do that; I guess I'd like some feedback if anyone
> > else thinks that's a good idea or not. I initially did it this way
> > just to minimize disruption
>
> As an example, meta-arm qemuarm64-secureboot machine builds u-boot with t=
f-a and optee
> which I think are all linked to a single u-boot binary. Both tf-a and opt=
ee binaries are
> captured via deploy directory, and u-boot exports the flash binary via de=
ploy
> directory as well. None of these are visible in the rootfs images if the =
userspace
> optee-client, optee-examples, optee-test, TEE applications like optee-ftp=
m or tf-a tests are not
> installed.
>
> Are all their SPDX and license data correctly captured with current appro=
ach via u-boot?

That is the intention. As long as the do_deploy of u-boot has a
dependency on do_deploy of the optee-ftpm and tf-a (either directly,
or transitively through prior tasks in u-boot), it should get
captured.

>
> If yes, then things are better, but there are still a lot of external BSP=
 etc
> layer recipes which use only deploy.bbclass to export their blobs which g=
et flashed
> to target. Covering those as well via use of deploy.bbclass would be bett=
er, IMO.

Right. Even if it's not done in deploy.bbclass, adding the
`SPDX_DEPLOY_TASKS +=3D "do_deploy"` should be all that is needed,
making it easy if not automatic.

>
> Cheers,
>
> -Mikko
>
> > >
> > > Cheers
> > >
> > > -Mikko
> > >
> > > > diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-rec=
ipe/barebox.bbclass
> > > > index 2411fb5caa..60437c1ad1 100644
> > > > --- a/meta/classes-recipe/barebox.bbclass
> > > > +++ b/meta/classes-recipe/barebox.bbclass
> > > > @@ -158,5 +158,6 @@ barebox_do_deploy () {
> > > >          fi
> > > >  }
> > > >  addtask deploy after do_compile
> > > > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > > >
> > > >  EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
> > > > diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-=
recipe/devicetree.bbclass
> > > > index ce9d008aac..35c2499bdb 100644
> > > > --- a/meta/classes-recipe/devicetree.bbclass
> > > > +++ b/meta/classes-recipe/devicetree.bbclass
> > > > @@ -164,6 +164,7 @@ devicetree_do_deploy() {
> > > >      done
> > > >  }
> > > >  addtask deploy before do_build after do_install
> > > > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > > >
> > > >  EXPORT_FUNCTIONS do_compile do_install do_deploy
> > > >
> > > > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/cl=
asses-recipe/kernel-fit-image.bbclass
> > > > index ae8f3c6688..5115482eff 100644
> > > > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > > > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > > > @@ -241,3 +241,4 @@ do_deploy() {
> > > >      fi
> > > >  }
> > > >  addtask deploy after do_compile before do_build
> > > > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > > > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-reci=
pe/kernel.bbclass
> > > > index 50cef17f69..8d0cb91688 100644
> > > > --- a/meta/classes-recipe/kernel.bbclass
> > > > +++ b/meta/classes-recipe/kernel.bbclass
> > > > @@ -842,6 +842,7 @@ kernel_do_deploy() {
> > > >  do_deploy[prefuncs] +=3D "read_subpackage_metadata"
> > > >
> > > >  addtask deploy after do_install do_populate_sysroot do_packagedata
> > > > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > > >
> > > >  EXPORT_FUNCTIONS do_deploy
> > > >
> > > > diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-=
bsp/grub/grub-efi_2.14.bb
> > > > index 6354b43989..e535d99710 100644
> > > > --- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > > > +++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > > > @@ -97,6 +97,7 @@ do_deploy() {
> > > >  }
> > > >
> > > >  addtask deploy after do_install before do_build
> > > > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > > >
> > > >  FILES:${PN} =3D "${libdir}/grub/${GRUB_TARGET}-efi \
> > > >                 ${datadir}/grub \
> > > > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recip=
es-bsp/opensbi/opensbi_1.8.1.bb
> > > > index 0a9652c283..93646a97df 100644
> > > > --- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > > > +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > > > @@ -45,6 +45,7 @@ do_deploy () {
> > > >  }
> > > >
> > > >  addtask deploy before do_build after do_install
> > > > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > > >
> > > >  FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_j=
ump.*"
> > > >  FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_p=
ayload.*"
> > > > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/=
u-boot/u-boot.inc
> > > > index a75948dfc3..acc2bf9819 100644
> > > > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > > > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > > > @@ -471,3 +471,4 @@ uboot_deploy_spl () {
> > > >  }
> > > >
> > > >  addtask deploy before do_build after do_compile
> > > > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > > > diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta=
/recipes-core/systemd/systemd-boot_259.5.bb
> > > > index c6c443f929..c887835806 100644
> > > > --- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
> > > > +++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
> > > > @@ -72,4 +72,4 @@ do_deploy () {
> > > >  }
> > > >
> > > >  addtask deploy before do_build after do_compile
> > > > -
> > > > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > > > --
> > > > 2.54.0
> > > >
> > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#239514): https://lists.openembedded.org/g/opene=
mbedded-core/message/239514
> > > > Mute This Topic: https://lists.openembedded.org/mt/119957548/715950=
7
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [mikko.rapeli@linaro.org]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >

