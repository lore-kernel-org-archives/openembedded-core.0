Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA48C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 21:20:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.84735.1680556806436844088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 14:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1pjRau-0007y0-1K; Mon, 03 Apr 2023 23:20:04 +0200
Message-ID: <9e38cb1cc2e7f7f64a47a7398961d73d6b386a7d.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/9] Add barebox bootloader support (and testing)
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>, 
	alexandre.belloni@bootlin.com
Date: Mon, 03 Apr 2023 23:20:01 +0200
In-Reply-To: <7269b525eb965461ff7507ed59e79ccb24dbb388.camel@linuxfoundation.org>
References: <20230331104025.1478393-1-ejo@pengutronix.de>
	 <7269b525eb965461ff7507ed59e79ccb24dbb388.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 21:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179655

Hi Richard,

Am Montag, dem 03.04.2023 um 16:49 +0100 schrieb Richard Purdie:
> On Fri, 2023-03-31 at 12:40 +0200, Enrico Jorns wrote:
> > This adds support for the barebox bootloader (and tools) to oe-core.
> > 
> > In order to have proper testing, this extends oe-selftest to allow
> > basic testing of bootloaders. While at it, cover both barebox and u-boot.
> > 
> > v2:
> >   * set myself as maintainer in maintainers.inc
> >   * move doc from documentation.conf to recipe
> >   * update to barebox v2023.03 (including fixes for musl, etc.)
> >   * set standard configs for qemu machines to allow building them
> >   * add better efi dir support in barebox recipe
> >   * enable testing bootloaders in oeqa
> >   * add test cases for barebox (and u-boot)
> > 
> > Enrico Jorns (7):
> >   barebox: set default BAREBOX_CONFIG for qemu machines
> >   oeqa/utils/qemurunner: support ignoring vt100 escape sequences
> >   oeqa/utils/qemurunner: simplify output parsing and make
> >     crlf-compatible
> >   oeqa/utils/commands: document runqemu context manager
> >   oeqa: support passing custom boot patterns to runqemu
> >   oeqa/selftest/cases: add barebox tests
> >   oeqa/selftest/cases: add basic u-boot test
> > 
> > Marco Felsch (2):
> >   barebox: add initial support
> >   barebox-tools: add initial barebox tools support
> 
> Testing on the autobuilder did trigger a few issues:
> 
> on musl:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5023
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6932
> 
> and some failing oe-selftests:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4971
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5023
> [there were more but look similar]

thank you for the autobuilder logs!

I fear we are running into a conceptional issue that I already feared we could run into (but did not
test for yet).

If I traced this down correctly, then the 'issue' is:

| NOTE: Multiple providers are available for virtual/bootloader (barebox, u-boot)
| Consider defining a PREFERRED_PROVIDER entry to match virtual/bootloader

The fitimage tests building "virtual/bootloader", silently assuming this is equal to u-boot (which
it actually was so far).

Now, the quick fix for this would be to properly set the correct PREFERRED_PROVIDER here, but I
could imagine that we run into similar issues in other builds, too.

Do you have a good solution for this at hand? Like defining a standard preferred provider for
virtual/bootloader?

I guess one could argue possibly that the mechanism does exactly what it is meant for. And a few
machines (like beaglebone-yocto or qemuloongarch) actually set the PREFERRED_PROVIDER, but not all
and this might lead to silently switching the bootloader (like in our tests).

I hope you have a better overview on the topic than I have and could give me a hint on how you would
like to see this being resolved?

Thanks in advance and best regards

Enrico


> Cheers,
> 
> Richard
> 
> 

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


