Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72370C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 05:38:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.4275.1665639483626539325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 22:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1oiquv-0002iP-7x; Thu, 13 Oct 2022 07:38:01 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1oiqus-001WDX-LC; Thu, 13 Oct 2022 07:37:58 +0200
References: <20221012071813.778-1-alex.kiernan@gmail.com>
 <7C7AB85E-C822-4DCC-B462-AD314119EAE4@arm.com>
 <CAO5Uq5Tqqt=oaGQt7kyZUg4gkJ6Uo_ahNR6itZSEwYyDX8rKrQ@mail.gmail.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig
 to a class
Date: Thu, 13 Oct 2022 07:31:14 +0200
In-reply-to: <CAO5Uq5Tqqt=oaGQt7kyZUg4gkJ6Uo_ahNR6itZSEwYyDX8rKrQ@mail.gmail.com>
Message-ID: <6ro7ugcmh5.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 05:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171680

On Wed, Oct 12 2022 at 20:43 +0100, "Alex Kiernan" <alex.kiernan@gmail.com>=
 wrote:
> On Wed, Oct 12, 2022 at 5:36 PM Ross Burton <Ross.Burton@arm.com> wrote:
>>
>> On 12 Oct 2022, at 08:18, Alex Kiernan via lists.openembedded.org <alex.=
kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > Move savedefconfig task to a class so we can reuse it in other recipes
>> > which support it.
>>
>> There are three users of cml1 in oe-core: kernel, uboot, and busybox.  D=
oes busybox support savedefconfig?
>>
>
> It doesn't and fairly obviously goes boom...
>
> ERROR: busybox-1.35.0-r0 do_savedefconfig: oe_runmake failed
> ERROR: busybox-1.35.0-r0 do_savedefconfig:
> ExecutionError('/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busyb=
ox/1.35.0-r0/temp/run.do_savedefconfig.12421',
> 1, None, None)
> ERROR: Logfile of failure stored in:
> /home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/tem=
p/log.do_savedefconfig.12421
> Log data follows:
> | DEBUG: Executing shell function do_savedefconfig
> | Saving defconfig to:
> | /home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/b=
usybox-1.35.0/defconfig
> | NOTE: make CC=3Dx86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcor=
e2
> -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
> --sysroot=3D/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1=
.35.0-r0/recipe-sysroot
> LD=3Dx86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
> --sysroot=3D/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1=
.35.0-r0/recipe-sysroot
> V=3D1 ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-poky-linux- SKIP_STRIP=3Dy
> HOSTCC=3Dgcc  HOSTCPP=3Dgcc  -E -C
> /home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/bus=
ybox-1.35.0
> savedefconfig
> | make: Entering directory
> '/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/bu=
sybox-1.35.0'
> | make -f scripts/Makefile.build obj=3Dscripts/basic
> | /home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/b=
usybox-1.35.0/scripts/gen_build_files.sh
> /home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/bus=
ybox-1.35.0
> /home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/bus=
ybox-1.35.0
> | mkdir -p include
> | make -f scripts/Makefile.build obj=3Dscripts/kconfig savedefconfig
> | make[1]: *** No rule to make target 'savedefconfig'.  Stop.
> | make: *** [Makefile:444: savedefconfig] Error 2
> | make: Leaving directory
> '/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/bu=
sybox-1.35.0'
> | ERROR: oe_runmake failed
>
>> I=E2=80=99m thinking to avoid tiny classes we can just add this to
>> cml1.bbclass and make it print a decent error message if it doesn=E2=80=
=99t
>> work.
>>
>
> So where I started, was adding it to u-boot.inc (which isn't a class,
> I guess an artefact of history), because tiny classes felt like a poor
> choice. I can add it to cml1 instead, at which point I've tried all
> three options, maybe that's the best option and if you have a consumer
> that doesn't do it, you just get a fail as above.
>
> Are there are other users of cml1 other than these three? My suspicion
> is there isn't (though I've only looked at layers I've got checked
> out).

There is the barebox bootloader which supports 'savedefconfig', whose
recipe in meta-ptx uses cml1 via [2] and which would benefit from this
change.

Best regards
Ulrich


[1] https://barebox.org/
[2] https://github.com/pengutronix/meta-ptx/blob/master/recipes-bsp/barebox=
/barebox.inc#L12
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

