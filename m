Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849E2C6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 09:46:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.3002.1676367972518412882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 01:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1pRrt4-00036h-8a; Tue, 14 Feb 2023 10:46:10 +0100
Message-ID: <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Marco Felsch
	 <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, barebox@lists.infradead.org
Date: Tue, 14 Feb 2023 10:46:09 +0100
In-Reply-To: <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
	 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177136

Hi Richard,

Am Freitag, dem 03.02.2023 um 14:17 +0000 schrieb Richard Purdie:
> On Fri, 2023-02-03 at 14:50 +0100, Marco Felsch wrote:
> > This adds the support for the barebox bootloader to oe-core. The recipe
> > is based on the recipe found in meta-ptx [1] with a few minor adaptions.
> > 
> > This basic support includes the bootloader and the target tools to
> > interact with the bootloader. The host tools support is not part of
> > this commit. This will be added later on as separate recipe.
> > 
> > [1] https://github.com/pengutronix/meta-ptx/tree/master/recipes-bsp/barebox
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  meta/conf/documentation.conf                  |   7 +
> >  meta/recipes-bsp/barebox/barebox.inc          | 123 ++++++++++++++++++
> >  meta/recipes-bsp/barebox/barebox_2023.01.0.bb |   5 +
> >  ...IMAGE_COMPRESSION-per-default-to-lz4.patch |  40 ++++++
> >  4 files changed, 175 insertions(+)
> >  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
> >  create mode 100644 meta/recipes-bsp/barebox/barebox_2023.01.0.bb
> >  create mode 100644 meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-
> > to-lz4.patch
> 
> In order to add something to OE-Core, we need to see it being used by a
> reasonable portion of the ecosystem. Is there enough usage of barebox
> on common boards that justifies this?

I understand that not each and every package can and should be added to OE-core, so let me provide
my view on why adding barebox could be reasonable.

First of all, since it is a bootloader and oe-core's purpose is to provide basic common recipes
required to bring up a device, I found it to be a proper location for the recipe.
It does not add any further dependencies in the oe-core ecosystem so additional maintenance should
be limited in scope.

With over 300 individual contributors and regular monthly releases [1] I would call the barebox
bootloader a common, stable and mature project that is around since ~2009 and provides support for a
wide range of architectures, SoCs and platforms [2] including freely available common boards like
RPI, beaglebone, i.MX eval kits and UEFI in general.

Ever since, barebox has also been used by different hardware vendors (e.g. [4]) and was chosen by
Kalray [5] as their bootloader. Of course, as you know, it is always difficult to have a reliable
overview of the user base of an open source project as barebox.

So far there are already a number of barebox oe recipes around [3] that I find worth to consolidate
with adding one reference recipe to oe-core.


The question if these are sufficient arguments for adding barebox to oe-core probably needs to be
answered by the broader community, but I found it to be a good added value to have a bootloader in
oe-core that adapts many of the well-known schemes of Linux and focuses on being developer-friendly
and framework-driven.
(Let me just drop [6] for those interested in a bit details on what I summed up very roughly here.)

> I noticed there is no maintainers entry being added so this will throw
> QA errors on the autobuilder.

I would take responsibility for the recipe, backed by other barebox developers here.

> Also, I'm not sure adding doc varflags for individual recipe variables
> to documentation.conf makes sense. We should probably have them in the
> recipe or just put entries into the manual?

To be honest, this was inspired by the UBOOT_ variables that are placed in documentation.conf thus
we assumed this could be a proper place. We can simply move them into the recipe to limit intrusion
into the rest of the oe ecosystem.


Many thanks for your initial thoughts! Best regards,

Enrico

> Cheers,
> 
> Richard


[1] https://barebox.org/download/
[2] https://barebox.org/doc/latest/boards.html
[3] http://layers.openembedded.org/layerindex/branch/master/recipes/?q=barebox
[4] https://www.phytec.eu/en/cdocuments/?doc=YQ4RCg
[5] https://en.wikipedia.org/wiki/Kalray
[6] https://www.youtube.com/watch?v=fru1n54s2W4&ab_channel=TheLinuxFoundation

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


