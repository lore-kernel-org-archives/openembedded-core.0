Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A2DEB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 03:36:54 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.80726.1691552205094393446
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 20:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WPTSRiKm;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-790a590237aso293975139f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 20:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691552204; x=1692157004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=131Mi5ZmlPUMCfshg0wtCO3AjM1me4Nlzvw73ykzeIw=;
        b=WPTSRiKmM/OQd6kbyQ5fFqyzDU3C7LBYaCE1PlDl+OvffL2OR10WiuPUn7UjHuvcZv
         GxPFjd7sZ4xnVaNEJ0hm3cwLO5puhbs2/IKxBzFNopWqGyC2JJ2/i1/GopKFwnTL4VfV
         yRRNeZzoWu374ooQaV1RabYz3vOw3EVf9rp7XoK6adU4zOzuQ6O8Fk4H2uSWifJxkDzQ
         9c2WhZHuWcbQNrEBl2iq6EnTunrUWaLuiYKWzQxI4QXP5BJhWU+z3iWjw5ivZQ3fo7h6
         DPhVrUWQJUbeMHv1PfRTMo64MOeLazqBbeDdUfH5DB4ccDJ1FkJ0HHAZyPe9O/52wOo8
         37zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691552204; x=1692157004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=131Mi5ZmlPUMCfshg0wtCO3AjM1me4Nlzvw73ykzeIw=;
        b=HaJDANUaZ1XYKTWNKZwZH0YrxGL3CJFKa8fTafZ1RerGOEPfK50HMZmi3RykdQPI50
         AvzTTbZO4ysaMeqMYKErTPQ2FcvFreE2VWg78zHIr/EoXZ0hztt80BgfGpbNvYr9a2rM
         DPmVoQ5f1QLgv1bQIRWTGZCaTKx4+zJI0QUHJ6Ao4JpMoocKS1T18iY4CKyCqNrCf1zr
         LrEiKo9O/Ht32tg5hEigIoKQ1i0mXCCAavTACuDPgFXKbi7f6nHBgV+62vf2XI98iKMy
         8yK0uSNT1M+J9C+AKC3hWSq9nm19GyJqI7Np0XEL6/a0xtAjlAk9hjdIRVKyTU7+NTn6
         R3Fg==
X-Gm-Message-State: AOJu0YziM72WcWkhleomXBMMEnM5zSCwbP1zBF3rXDF2RM9zsYdIMDYn
	pDJ3c3nk2Y9Dy20rWhL7IiE8XXlIGMOJN/dPwjc=
X-Google-Smtp-Source: AGHT+IGQm14It7epOKQ0M8y4TcMn6eeVgSYgQtnRd6IvXXCNfVgALGnyjRQkCLQMUXY5AZ4FBCC+4nOseHUnB/SfOfc=
X-Received: by 2002:a05:6e02:14d:b0:349:8023:d7f8 with SMTP id
 j13-20020a056e02014d00b003498023d7f8mr2016529ilr.0.1691552204190; Tue, 08 Aug
 2023 20:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
 <2023080810431190bf01b5@mail.local> <1779695BCF00A2D5.10230@lists.openembedded.org>
 <CADkTA4MtUzS+OgLorV_QHiuhnKiS2EEq2wC4kq=VFGJMZ4mSrg@mail.gmail.com> <20230808204932c467f561@mail.local>
In-Reply-To: <20230808204932c467f561@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Aug 2023 23:36:33 -0400
Message-ID: <CADkTA4OLMtwOb_KpCUPA0D-REEKU3rNjy+WiRVVbnydMSyjeOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] linux-yocto: consolidated kernel pull request
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 03:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185685

On Tue, Aug 8, 2023 at 4:49=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 08/08/2023 13:09:50-0400, Bruce Ashfield wrote:
> > On Tue, Aug 8, 2023 at 8:49=E2=80=AFAM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > On Tue, Aug 8, 2023 at 6:43=E2=80=AFAM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > Hello Bruce,
> > > >
> > > > While I didn't test this series yet, as discussed, I've tried to sw=
itch
> > > > to 6.4 by default. I got this warning:
> > >
> > > -tiny was clean here, but let me re-test and see if I've missed
> > > sending something in my 6.4 SRCREV bumps.
> > >
> >
> > Which Machine is this ? (I always have a hard time figuring that out
> > .. sad, I know).
> >
>
> This was qemuarm.
>

Ack'd.

I tested that config before sending the new recipes, but I've started
a new build with my latest and qemuarm.

I'll follow up on Wednesday when I know more.

Bruce

> > I have this series of commits:
> >
> > commit fa08cd6bd6f9415c91da0dd72f4338bff3c68c68
> > Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Date:   Mon Jul 10 11:21:58 2023 -0400
> >
> >     tiny: enable HID in tiny BSPs
> >
> >     HID is no longer selected, so to avoid -tiny warnings we need to
> >     explicitly enable it in more -tiny BSPs.
> >
> >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > :100644 100644 0fa5dae7ec9 51d597039c3 M
> > bsp/arm-versatile-926ejs/arm-versatile-926ejs-tiny.scc
> > :100644 100644 e4928b43416 5fdb341638a M        bsp/qemuarm64/qemuarm64=
-tiny.scc
> >
> > commit 4655de57a68a86e651fcea2eb2c7e88f3de3bbfb
> > Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Date:   Fri Jul 7 14:00:08 2023 -0400
> >
> >     common-pc-64/tiny: enable HID by default
> >
> >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > :100644 100644 7fcac7fd54a 0d083b0d2a5 M
> > bsp/common-pc-64/common-pc-64-tiny.scc
> >
> > commit 252c55e236cb46860bae0fd1b1e0641e6e8dd512
> > Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Date:   Fri Jul 7 10:39:41 2023 -0400
> >
> >     common-pc/tiny: enable HID by default
> >
> >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > :100644 100644 687414ae671 9fe725ac450 M        bsp/common-pc/common-pc=
-tiny.scc
> >
> > commit 849f920aa1b7c76c0be6c1054c5efb758ca07600
> > Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Date:   Fri Jul 7 10:36:39 2023 -0400
> >
> >     cfg: add CONFIG_HID base fragment
> >
> >     When testing the -tiny kernel against v6.4, configuration warnings
> >     were noticed as CONFIG_HID is disabled by our baseline allnoconfig.
> >
> >     We have BSPs that require HID support for drivers, and they will
> >     warn when building a -tiny variant.
> >
> >     Introducing a HID base fragment so they can share the enabling of
> >     these options as required.
> >
> >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > :000000 100644 00000000000 cfd84dbda45 A        features/hid/hid.cfg
> > :000000 100644 00000000000 28d242df7ad A        features/hid/hid.scc
> >
> > But if this is showing up on the AB, I must have missed an instance.
> >
> > My test build was just clean.
> >
> > Bruce
> >
> >
> > > Bruce
> > >
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/7=
876/steps/13/logs/stdio
> > > >
> > > > WARNING: linux-yocto-tiny-6.4.3+gitAUTOINC+dab56f52aa_dee78ad196-r0=
 do_kernel_configcheck: [kernel config]: specified values did not make it i=
nto the kernel's final configuration:
> > > >     [NOTE]: 'CONFIG_USB_HID' last val (y) and .config val (n) do no=
t match
> > > >     [INFO]: CONFIG_USB_HID : n
> > > >     [INFO]: raw config text:
> > > >         config USB_HID
> > > >                 tristate "USB HID transport layer"
> > > >                 default y
> > > >                 select HID
> > > >                 depends on USB && INPUT && USB && HID_SUPPORT
> > > >                 help
> > > >                   Say Y here if you want to connect USB keyboards,
> > > >                   mice, joysticks, graphic tablets, or any other HI=
D based devices
> > > >                   to your computer via USB, as well as Uninterrupti=
ble Power Supply
> > > >                   (UPS) and monitor control devices.
> > > >
> > > >                   You can't use this driver and the HIDBP (Boot Pro=
tocol) keyboard
> > > >                   and mouse drivers at the same time. More informat=
ion is available:
> > > >                   <file:Documentation/input/input.rst>.
> > > >
> > > >                   If unsure, say Y.
> > > >
> > > >                   To compile this driver as a module, choose M here=
: the
> > > >                   module will be called usbhid.
> > > >         Config 'USB_HID' has the following Direct dependencies (USB=
_HID=3Dn):
> > > >                 USB(=3Dy) && INPUT(=3Dy) && HID_SUPPORT(=3Dn)
> > > >         Parent dependencies are:
> > > >              INPUT [y] USB [y] HID_SUPPORT [n]
> > > >     [INFO]: config 'CONFIG_USB_HID' was set, but it wasn't assignab=
le, check (parent) dependencies
> > > >
> > > >
> > > > master has 86adbe4db668 ("linux-yocto-tiny/6.4: fix configuration
> > > > warnings (HID)") so I guess there is something missing.
> > > >
> > > >
> > > > On 07/08/2023 23:35:46-0400, Bruce Ashfield wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > Richard,
> > > > >
> > > > > Here's my queued set of -stable updates (as well as a -dev kernel=
 bump).
> > > > >
> > > > > I've got another round of updates under test, and will send them =
when
> > > > > ready.
> > > > >
> > > > > 6.4 marches along, it'll be up to date when those last issues kee=
ping
> > > > > it from being the default are resolved.
> > > > >
> > > > > Bruce
> > > > >
> > > > > The following changes since commit 058a44165ce375f405063e73a9fcd1=
b2757ef8da:
> > > > >
> > > > >   bitbake: fetch2: Check if path is 'None' before calculating che=
cksums (2023-08-04 11:48:26 +0100)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> > > > >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dzedd=
/kernel
> > > > >
> > > > > Bruce Ashfield (7):
> > > > >   linux-yocto/6.4: fix CONFIG_LEDS_TRIGGER_GPIO kernel audit warn=
ing
> > > > >   linux-yocto/6.4: update to v6.4.6
> > > > >   linux-yocto/6.1: update to v6.1.41
> > > > >   linux-yocto/6.4: update to v6.4.7
> > > > >   linux-yocto-dev: bump to v6.5+
> > > > >   linux-yocto/6.4: update to v6.4.8
> > > > >   linux-yocto/6.1: update to v6.1.43
> > > > >
> > > > >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
> > > > >  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
> > > > >  .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
> > > > >  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
> > > > >  .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
> > > > >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----=
------
> > > > >  meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----=
------
> > > > >  7 files changed, 42 insertions(+), 42 deletions(-)
> > > > >
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#185661): https://lists.openembedded.org/g/openemb=
edded-core/message/185661
> > > Mute This Topic: https://lists.openembedded.org/mt/100615695/1050810
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

