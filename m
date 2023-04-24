Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67746C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 15:16:02 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.54432.1682349358249745868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 08:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1pqxv2-0000vW-4H; Mon, 24 Apr 2023 17:15:56 +0200
Message-ID: <2940736fc3607415a0d241c8735c899dd95eff47.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/9] barebox: set default BAREBOX_CONFIG for qemu
 machines
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Richard
 Purdie <richard.purdie@linuxfoundation.org>, alexandre.belloni@bootlin.com,
 afa <afa@pengutronix.de>
Date: Mon, 24 Apr 2023 17:15:54 +0200
In-Reply-To: <CANNYZj84_aCYbEZ3kOQRYZqgE-Q_LQ9mmJZH7euN5YEYX0vH2g@mail.gmail.com>
References: <20230331104025.1478393-1-ejo@pengutronix.de>
	 <20230331104025.1478393-4-ejo@pengutronix.de>
	 <CANNYZj8qDFMKa5HhnK=k7+Le=h_rhmV2Mm_WreLwjfbYWxiUcA@mail.gmail.com>
	 <5edb0cbe55f0b194b89b75a2c34b74b2f343f2c9.camel@pengutronix.de>
	 <CANNYZj84_aCYbEZ3kOQRYZqgE-Q_LQ9mmJZH7euN5YEYX0vH2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 15:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180357

Am Dienstag, dem 11.04.2023 um 16:16 +0200 schrieb Alexander Kanavin:
> On Mon, 3 Apr 2023 at 13:42, Enrico Jörns <ejo@pengutronix.de> wrote:
> > > > +# set defaults for oe-core MACHINEs to allow building barebox
> > > > +BAREBOX_CONFIG:qemuarm = "vexpress_defconfig"
> > > > +BAREBOX_CONFIG:qemuarm64 = "qemu_virt64_defconfig"
> > > > +BAREBOX_CONFIG:qemux86-64 = "efi_defconfig"
> > > 
> > > As all three are different perhaps there could be commentary in the
> > > recipe explaining why that and how they differ? Note that there's also
> > > a qemuall override if there's a single configuration that works for
> > > all qemu targets.
> > 
> > as these three are different archs/machines, I do not find it surprising that they require
> > different
> > configs. I assumed that this was self-explaining.
> 
> Not at all. What is this 'vexpress' thingy? What does 'express' mean?
> Why does it apply to arm, but not arm64? Why arm64 is using
> 'qemu_virt64', but not any other targets, if that config does not seem
> arm-specific? Why is x86 using 'efi' but not the arm targets?
> 
> The choices you made here should be explained.

Vexpress is "Versatile Express" which once was the ARMv7 reference platform and is one of the
platforms emulated in QEMU (when using "-machine vexpress-a9" or "-machine vexpress-a15").

virt, or virt64 are the generic QEMU ARM platform. For historical reasons, there is only a dedicated
vexpress defconfig in barebox.

EFI is used for x86 only, since on ARM barebox is normally used as the primary loader only.


However, since barebox builds are multi-platform builds by default, it should be possible to use the
standard multi_v7_defconfig and multi_v8_defconfig instead (for arm). I'll give it a try.

Regards, Enrico

> 
> Alex
> 

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


