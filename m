Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540D8C77B62
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 11:14:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.98574.1680606836293137938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 04:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1pjebp-0002HD-1h; Tue, 04 Apr 2023 13:13:53 +0200
Message-ID: <7f0461d39e639926f7367ba12f9b55099a02a6c3.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v2 0/9] Add barebox bootloader support (and
 testing)
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Alexander
 Kanavin <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com, afa
 <afa@pengutronix.de>
Date: Tue, 04 Apr 2023 13:13:50 +0200
In-Reply-To: <CAMKF1sp2benMoVS04jr-0Xps-jGyFR0ZbtipsKgL5sS3qNpETw@mail.gmail.com>
References: <20230331104025.1478393-1-ejo@pengutronix.de>
	 <7269b525eb965461ff7507ed59e79ccb24dbb388.camel@linuxfoundation.org>
	 <9e38cb1cc2e7f7f64a47a7398961d73d6b386a7d.camel@pengutronix.de>
	 <CAMKF1sp2benMoVS04jr-0Xps-jGyFR0ZbtipsKgL5sS3qNpETw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 11:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179686

Hi Khem,

> Am Montag, dem 03.04.2023 um 19:33 -0700 schrieb Khem Raj:


> [...]

> I see that it fails to build with clang
> https://errors.yoctoproject.org/Errors/Details/699467/

thanks for testing this!

> is it buildable with clang ? if not we can pin it to use gcc always in
> meta-clang but I want to make sure first.

barebox itself is unfortunately not buildable with clang since on some architectures like ARM32 it
uses GCC extensions that are not implemented by clang.

The barebox-tools however that are built for 'sandbox' should be buildable with clang.
It's just that when passing CROSS_COMPILE, barebox cannot guess if it has to append 'clang' or 'gcc'
suffix. The kernel seems to have an explicit handling for this by checking for "ifneq ($(LLVM),)"
and plugging together CC differently.

With barebox we could however still override the Makefile's default "CC = $(CROSS_COMPILE)gcc" when
passing CC explicitly to EXTRA_OEMAKE. We have just successfully tested this patch:

--- a/meta/recipes-bsp/barebox/barebox-tools_2023.03.0.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools_2023.03.0.bb
@@ -18,6 +18,8 @@ EXTRA_OEMAKE = " \
   ARCH=sandbox \
   CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
   CROSS_PKG_CONFIG=pkg-config \
+  CC='${CC}' \
+  LD='${LD}' \
   "


If that looks fine for you, I could add it to the recipe.


Best regards, Enrico

> 
> > 
> > Thanks in advance and best regards
> > 
> > Enrico
> > 
> > 
> > > Cheers,
> > > 
> > > Richard
> > > 
> > > 
> > 
> > --
> > Pengutronix e.K.                           | Enrico Jörns                |
> > Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
> > Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
> > 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179655): https://lists.openembedded.org/g/openembedded-core/message/179655
> > Mute This Topic: https://lists.openembedded.org/mt/97970644/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


