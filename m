Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780EBC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 17:49:07 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.20.1668361740573043197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 09:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jhWhUhIi;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id u11so10320741ljk.6
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uV6mp2xw9QZjFwV34mEAxKeXB73GGXyTI6my0OI16wA=;
        b=jhWhUhIioo9e0ujpgN9PIpXb2yJ6vHHq2ai4dQQoWYGEPwFqmtTeEoRTuV6TS0uIlO
         AuQuAwRn31KzO8wyn/5MrzEdk3NmVQ9oGm4gdQFNV5qqaF/3VQk08Ufo8K3ErVJY3FxD
         VyCQhQtPrybVpBVOqW3sZmZA2GpEXGFkyBhB4a47d004/8wBTnqWoL0aUnoamgD51O5I
         o2JW39UDmnKR/S0OdpvQxTfllqYiLnjyACa68k2Uk+q4eYmsoOIOrdTvGVqBIDTpqJ9h
         +9GAA1AD70WtjM21UMtQ+UPxIO1wXOO6Am7pOauxCW0cad6pS1sYZ3/6uPTNNSydnrCp
         pN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV6mp2xw9QZjFwV34mEAxKeXB73GGXyTI6my0OI16wA=;
        b=POoywf+bKTny5/DRUVr5DjQClu0KzmKXvtWeCAoVPViaZ7tAba4skUiDTjDj2AbOEC
         JaEh9/TzxAUo7zUjJ5JsQgi5rgKG7qrQdtqX4UNJZ2xYv7jnK3sVdbda0YwPBNpbpYyE
         Rez3mM/hRsijJFAJuhgZK9qA4ZMm8F/yNuq9stTT1oQj1etxx4C0G/QAQazPGez4qA9e
         6KTTt3Ltbm82wL7tEXyNMuet1/V3E/L1wwLiljbziMoDUGQiOSF1DwGH1J5FvS+Nycjw
         HzVbk94Yvpem9Wud2cgNG5JtPTndcB5tDfgFYvanMBS3tIXJxka2Iwve6xlYnkzP4lPe
         dd/g==
X-Gm-Message-State: ANoB5pkZ09vZmWe/TvmHHug3mtuZ/oHKQmDYADtrRUj53QN961p2eHXO
	bDhVd8QYeGKGpLq5MT0qp6GVm1pj2LtNYOyniAY=
X-Google-Smtp-Source: AA0mqf4Pa9ewxuZxB9OgvTCcZEQztmvaMi0pWqhhkKllLXe6cnYz5KtIpLe7sAFSOszPNIezUUFqPuKNeHsHab7QIxk=
X-Received: by 2002:a05:651c:b14:b0:277:e01:6119 with SMTP id
 b20-20020a05651c0b1400b002770e016119mr3550910ljr.33.1668361738520; Sun, 13
 Nov 2022 09:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20221112163103.42796-1-christoph.lauer@email.de> <b6ac86a81444402796ff28436add5731@axis.com>
In-Reply-To: <b6ac86a81444402796ff28436add5731@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 13 Nov 2022 18:48:47 +0100
Message-ID: <CANNYZj-CrvJpLCNFTi9Q__NWBc_25nUJqKwTqpEsHbU8wvCo6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] initial configs: set initial
 {DISTRO|MACHINE|IMAGE}FEATUREs as weak as possible
To: Christoph Lauer <christoph.lauer@email.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Christoph Lauer <christoph.lauer@xtronic.de>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 17:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173208

It helps if you explain what use case this enables that cannot be
currently fulfilled. (not a generic 'change features with weak
defaults' but specific examples of adding and removing and setting
features).

Alex

On Sun, 13 Nov 2022 at 14:43, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Christoph Lauer
> > Sent: den 12 november 2022 17:31
> > To: openembedded-core@lists.openembedded.org
> > Cc: Christoph Lauer <christoph.lauer@xtronic.de>
> > Subject: [OE-core] [PATCH] initial configs: set initial {DISTRO|MACHINE|IMAGE}FEATUREs as weak as possible
> >
> > From: Christoph Lauer <christoph.lauer@xtronic.de>
> >
> > This gives BSP creators the flexibility to change features with weak defaults
> >
> > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> > ---
> >  meta-poky/conf/distro/poky.conf               |  2 +-
> >  meta/conf/bitbake.conf                        | 28 +++++++++----------
> >  .../distro/include/default-distrovars.inc     |  6 ++--
> >  meta/conf/machine/include/qemu.inc            |  2 +-
> >  meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
> >  5 files changed, 20 insertions(+), 20 deletions(-)
> >
> > diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
> > index 3e90766349..3a453ef9ed 100644
> > --- a/meta-poky/conf/distro/poky.conf
> > +++ b/meta-poky/conf/distro/poky.conf
> > @@ -18,7 +18,7 @@ POKY_DEFAULT_DISTRO_FEATURES = "largefile opengl ptest multiarch wayland vulkan"
> >  POKY_DEFAULT_EXTRA_RDEPENDS = "packagegroup-core-boot"
> >  POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
> >
> > -DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
> > +DISTRO_FEATURES ??= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
> >
> >  PREFERRED_VERSION_linux-yocto ?= "5.19%"
> >  PREFERRED_VERSION_linux-yocto-rt ?= "5.19%"
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index dea573986d..b2540bb3f5 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -885,31 +885,31 @@ OES_BITBAKE_CONF = "1"
> >  # Machine properties and packagegroup-base stuff
> >  ##################################################################
> >
> > -MACHINE_FEATURES ?= ""
> > -DISTRO_FEATURES ?= ""
> > +MACHINE_FEATURES ??= ""
> > +DISTRO_FEATURES ??= ""
> >
> > -DISTRO_EXTRA_RDEPENDS ?= ""
> > -DISTRO_EXTRA_RRECOMMENDS ?= ""
> > -MACHINE_EXTRA_RDEPENDS ?= ""
> > -MACHINE_EXTRA_RRECOMMENDS ?= ""
> > -MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
> > -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
> > +DISTRO_EXTRA_RDEPENDS ??= ""
> > +DISTRO_EXTRA_RRECOMMENDS ??= ""
> > +MACHINE_EXTRA_RDEPENDS ??= ""
> > +MACHINE_EXTRA_RRECOMMENDS ??= ""
> > +MACHINE_ESSENTIAL_EXTRA_RDEPENDS ??= ""
> > +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ??= ""
> >
> >  EXTRA_IMAGE_FEATURES ??= ""
> >  IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
> >
> >  # Native distro features (will always be used for -native, even if they
> >  # are not enabled for target)
> > -DISTRO_FEATURES_NATIVE ?= "x11 ipv6 xattr"
> > -DISTRO_FEATURES_NATIVESDK ?= "x11"
> > +DISTRO_FEATURES_NATIVE ??= "x11 ipv6 xattr"
> > +DISTRO_FEATURES_NATIVESDK ??= "x11"
> >
> >  # Normally target distro features will not be applied to native builds:
> >  # Native distro features on this list will use the target feature value
> > -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
> > -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
> > +DISTRO_FEATURES_FILTER_NATIVE ??= "api-documentation debuginfod opengl wayland"
> > +DISTRO_FEATURES_FILTER_NATIVESDK ??= "api-documentation debuginfod opengl wayland"
> >
> > -DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
> > -MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> > +DISTRO_FEATURES_BACKFILL ??= "pulseaudio sysvinit gobject-introspection-data ldconfig"
> > +MACHINE_FEATURES_BACKFILL ??= "rtc qemu-usermode"
> >
> >  COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
> >  COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> > index abf48f79f0..3b3d439ad3 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -19,9 +19,9 @@ DISTRO_FEATURES_DEFAULT:remove:arc = "seccomp"
> >  # seccomp is not yet ported to microblaze
> >  DISTRO_FEATURES_DEFAULT:remove:microblaze = "seccomp"
> >
> > -DISTRO_FEATURES_DEFAULT ?= "acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
> > -DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
> > -IMAGE_FEATURES ?= ""
> > +DISTRO_FEATURES_DEFAULT ??= "acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
> > +DISTRO_FEATURES ??= "${DISTRO_FEATURES_DEFAULT}"
> > +IMAGE_FEATURES ??= ""
> >
> >  COMMERCIAL_AUDIO_PLUGINS ?= ""
> >  # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
> > diff --git a/meta/conf/machine/include/qemu.inc
> > b/meta/conf/machine/include/qemu.inc
> > index d9bed7708d..04ffe55309 100644
> > --- a/meta/conf/machine/include/qemu.inc
> > +++ b/meta/conf/machine/include/qemu.inc
> > @@ -10,7 +10,7 @@ XSERVER ?= "xserver-xorg \
> >              xf86-video-fbdev \
> >              "
> >
> > -MACHINE_FEATURES = "alsa bluetooth usbgadget screen vfat"
> > +MACHINE_FEATURES ??= "alsa bluetooth usbgadget screen vfat"
> >
> >  MACHINEOVERRIDES =. "qemuall:"
> >
> > diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
> > index 0b399ac1f9..f5f9f89a9f 100644
> > --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> > +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> > @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ??= "u-boot"
> >  require conf/machine/include/qemu.inc
> >  require conf/machine/include/riscv/tune-riscv.inc
> >
> > -MACHINE_FEATURES = "screen keyboard ext2 ext3 serial"
> > +MACHINE_FEATURES ?= "screen keyboard ext2 ext3 serial"
> >
> >  KERNEL_IMAGETYPE = "Image"
> >  KERNEL_IMAGETYPES += "uImage"
> > --
> > 2.17.1
>
> This is a breaking change, which can have a lot of not easily detected
> consequences, and I would advise against it. Changing ??= to ?= means
> that you can no longer do, e.g., DISTRO_FEATURES += " foo" in your
> configuration. For comparison, if you add the following to a recipe or
> your local.conf:
>
> FOOBAR1 ??= "foo"
> FOOBAR1 += "bar"
> FOOBAR2 ?= "foo"
> FOOBAR2 += "bar"
>
> the result will be:
>
> FOOBAR1=" bar"
> FOOBAR2="foo bar"
>
> If your patch is applied to Poky, this is the resulting change in the
> configuration:
>
> --- a.txt       2022-11-13 14:34:17.882922391 +0100
> +++ b.txt       2022-11-13 14:34:37.902531305 +0100
> @@ -7,6 +7,6 @@
>  DISTRO_FEATURES_NATIVE="x11 ipv6 xattr"
>  DISTRO_FEATURES_NATIVESDK="x11"
>  IMAGE_FEATURES=" debug-tweaks ptest-pkgs debug-tweaks tools-debug"
> -MACHINE_FEATURES="alsa bluetooth usbgadget screen vfat x86 pci rtc qemu-usermode"
> +MACHINE_FEATURES=" x86 pci rtc qemu-usermode"
>  MACHINE_FEATURES_BACKFILL="rtc qemu-usermode"
>  MACHINE_FEATURES_BACKFILL_CONSIDERED=" "
>
> As can be seen, your change has modified the default configuration for
> qemux86-64 and you did not notice, even though you were aware that you
> were changing the variables. Imagine what it would do to others...
>
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173193): https://lists.openembedded.org/g/openembedded-core/message/173193
> Mute This Topic: https://lists.openembedded.org/mt/94982790/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

