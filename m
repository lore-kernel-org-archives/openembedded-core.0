Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7B4CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:24:10 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11568.1782318248262976750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QIXGMink;
 spf=pass (domain: linaro.org, ip: 209.85.210.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8453427d3f4so810779b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 09:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782318248; x=1782923048; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kW0Z3WeNZ0r7z73j+R7Kl9/PNIXvRXMnkWL84zv3wQ=;
        b=QIXGMink4aTDjp7gpVSRL+KNr0xAnVI9I4w5RjtEBA0gk1IkVRYNFRlygqkKfiBYcz
         MQlulPd80TKbXwG8IIk7LK96jck+2IsTH7sFkgDuLrjJwpTs0DpjIqQVJLp9unsoRaqb
         JeJnQJUx8d9I8JRAF3wRG2j1NBIU3h4rfU1SjxBeVcnMUCaKHlyY0xC3qo4ac3GdzIDi
         vizE5nTDmTsl1nYffYjBtylMEKlLwCoYghS2SDDtVAtaIj6wktruJLzVaC9I1EK2Yw4F
         IZwhoUj8NxBKcpn0et/5FqV1Vtgccr5wN8wFtgW7e7kYr3psntP6PSrPECSAOFOp5WtM
         BicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782318248; x=1782923048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kW0Z3WeNZ0r7z73j+R7Kl9/PNIXvRXMnkWL84zv3wQ=;
        b=KMKgR6VbrAeUhtleo4PX+c6wDbNWZalNj384RCmEGCrC3k0sLF4wmt57Z5kpi8qIG5
         thmw6LpcdARcaXcBUm6jWuTscA2e4wXoaVD9xoMWNJh7qHg3yv0L9Mg2YgMT0l36JjTa
         J7a+0QOUnpdhBUoR6jl12TsuvHuiYaX3PRungCeC/21zZEs36gWtSAMuQ0FPgkao8oi5
         osByxNXLRcXbAeCIYWByx11thbGFgHnvBDev0iQvFB3TIkdYhOld8epnlolaflwQVDfd
         dHjB+3rBvO8Ws+JtaMQ4bg8wg+sRWG8V9897ECuSeGhS+IzLTzDyudJrkYpxEczmElDs
         GSIw==
X-Gm-Message-State: AOJu0Yy02OtO/1QcNiK9NILJDkbuU0bchWW4iQ6x41WKl9Pj+y5sid+A
	fmTL+V3LODcVAp1w0yeVShjMtErnJxrHmW+ZyeT1JbiiArIzfSmrn5l5as+N3igXmjM=
X-Gm-Gg: AfdE7cnMG/Bq0x3VlSZXHD90f/TbBJj71aFchmes6j3OQsjEPW8sserXon8wfdKjR39
	WpgkrF9Q4lU443bQS8e6dUmf8cPtmimg2qUv1XTekJV/03bDbdbroZsMQMRIOob7t4r8fxGL4eW
	XpEI+HWORqzWNWoM9+tn7xBJQc6A04B0NLsYawy6pJSWngT7Dk5lmDwNOreoX/nDbblduwzpU7d
	Qtozw7sC0Obekp5ZDUZHHb/bjdandM3yGCk9KsgMGWKFM5xPRm2eKNRf+lfxUnYegowRtZq6OSs
	d9xdKMvkH6fR70Ak2yvdxBmUh6B15l1SBP9gDxhBTO2Y5tJOggHgKAwaTlDhRSe8W1QhMimlfOw
	W29M8up3xuZLnKImoy8UvX7u4BsISRzLIGg2j3evyAiUYUu/B5SoWB9udDZhtxoDFAnAtzAcWkk
	7Ge4n8KsO5kkp19Z2RXEtI3tnwIOqpVtiCL+KWwqh9
X-Received: by 2002:a05:6a00:8014:b0:842:5a18:9af8 with SMTP id d2e1a72fcca58-845a27012acmr5249629b3a.12.1782318247259;
        Wed, 24 Jun 2026 09:24:07 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a413f604sm2551018b3a.60.2026.06.24.09.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 09:24:06 -0700 (PDT)
Date: Wed, 24 Jun 2026 19:24:03 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v3 5/8] Add SPDX deploy tasks to various recipes
Message-ID: <ajwEo03Xm5nke9UP@nuoska>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-6-JPEWhacker@gmail.com>
 <ajvqUhlN4Ge2MzG_@nuoska>
 <CAJdd5GZ0ne+ZcfSxBpND-g3nO4PXgHMOG7y1ywAs=E8VdxRx0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJdd5GZ0ne+ZcfSxBpND-g3nO4PXgHMOG7y1ywAs=E8VdxRx0A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239523

Hi,

On Wed, Jun 24, 2026 at 10:05:33AM -0600, Joshua Watt wrote:
> On Wed, Jun 24, 2026 at 8:31 AM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >
> > Hi,
> >
> > On Wed, Jun 24, 2026 at 08:15:22AM -0600, Joshua Watt via lists.openembedded.org wrote:
> > > Adds SPDX deploy tasks to many recipes to record their output when
> > > consumed in an SBoM
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  meta/classes-recipe/barebox.bbclass             | 1 +
> > >  meta/classes-recipe/devicetree.bbclass          | 1 +
> > >  meta/classes-recipe/kernel-fit-image.bbclass    | 1 +
> > >  meta/classes-recipe/kernel.bbclass              | 1 +
> > >  meta/recipes-bsp/grub/grub-efi_2.14.bb          | 1 +
> > >  meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 1 +
> > >  meta/recipes-bsp/u-boot/u-boot.inc              | 1 +
> > >  meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 +-
> > >  8 files changed, 8 insertions(+), 1 deletion(-)
> >
> > Why not doing this in deploy.bbclass for all users of the class?
> 
> We probably could do that; I guess I'd like some feedback if anyone
> else thinks that's a good idea or not. I initially did it this way
> just to minimize disruption

As an example, meta-arm qemuarm64-secureboot machine builds u-boot with tf-a and optee
which I think are all linked to a single u-boot binary. Both tf-a and optee binaries are
captured via deploy directory, and u-boot exports the flash binary via deploy
directory as well. None of these are visible in the rootfs images if the userspace
optee-client, optee-examples, optee-test, TEE applications like optee-ftpm or tf-a tests are not
installed.

Are all their SPDX and license data correctly captured with current approach via u-boot?

If yes, then things are better, but there are still a lot of external BSP etc
layer recipes which use only deploy.bbclass to export their blobs which get flashed
to target. Covering those as well via use of deploy.bbclass would be better, IMO.

Cheers,

-Mikko

> >
> > Cheers
> >
> > -Mikko
> >
> > > diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
> > > index 2411fb5caa..60437c1ad1 100644
> > > --- a/meta/classes-recipe/barebox.bbclass
> > > +++ b/meta/classes-recipe/barebox.bbclass
> > > @@ -158,5 +158,6 @@ barebox_do_deploy () {
> > >          fi
> > >  }
> > >  addtask deploy after do_compile
> > > +SPDX_DEPLOY_TASKS += "do_deploy"
> > >
> > >  EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
> > > diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
> > > index ce9d008aac..35c2499bdb 100644
> > > --- a/meta/classes-recipe/devicetree.bbclass
> > > +++ b/meta/classes-recipe/devicetree.bbclass
> > > @@ -164,6 +164,7 @@ devicetree_do_deploy() {
> > >      done
> > >  }
> > >  addtask deploy before do_build after do_install
> > > +SPDX_DEPLOY_TASKS += "do_deploy"
> > >
> > >  EXPORT_FUNCTIONS do_compile do_install do_deploy
> > >
> > > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> > > index ae8f3c6688..5115482eff 100644
> > > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > > @@ -241,3 +241,4 @@ do_deploy() {
> > >      fi
> > >  }
> > >  addtask deploy after do_compile before do_build
> > > +SPDX_DEPLOY_TASKS += "do_deploy"
> > > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> > > index 50cef17f69..8d0cb91688 100644
> > > --- a/meta/classes-recipe/kernel.bbclass
> > > +++ b/meta/classes-recipe/kernel.bbclass
> > > @@ -842,6 +842,7 @@ kernel_do_deploy() {
> > >  do_deploy[prefuncs] += "read_subpackage_metadata"
> > >
> > >  addtask deploy after do_install do_populate_sysroot do_packagedata
> > > +SPDX_DEPLOY_TASKS += "do_deploy"
> > >
> > >  EXPORT_FUNCTIONS do_deploy
> > >
> > > diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > > index 6354b43989..e535d99710 100644
> > > --- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > > +++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > > @@ -97,6 +97,7 @@ do_deploy() {
> > >  }
> > >
> > >  addtask deploy after do_install before do_build
> > > +SPDX_DEPLOY_TASKS += "do_deploy"
> > >
> > >  FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
> > >                 ${datadir}/grub \
> > > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > > index 0a9652c283..93646a97df 100644
> > > --- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > > +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > > @@ -45,6 +45,7 @@ do_deploy () {
> > >  }
> > >
> > >  addtask deploy before do_build after do_install
> > > +SPDX_DEPLOY_TASKS += "do_deploy"
> > >
> > >  FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
> > >  FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> > > index a75948dfc3..acc2bf9819 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > > @@ -471,3 +471,4 @@ uboot_deploy_spl () {
> > >  }
> > >
> > >  addtask deploy before do_build after do_compile
> > > +SPDX_DEPLOY_TASKS += "do_deploy"
> > > diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
> > > index c6c443f929..c887835806 100644
> > > --- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
> > > +++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
> > > @@ -72,4 +72,4 @@ do_deploy () {
> > >  }
> > >
> > >  addtask deploy before do_build after do_compile
> > > -
> > > +SPDX_DEPLOY_TASKS += "do_deploy"
> > > --
> > > 2.54.0
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#239514): https://lists.openembedded.org/g/openembedded-core/message/239514
> > > Mute This Topic: https://lists.openembedded.org/mt/119957548/7159507
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >

