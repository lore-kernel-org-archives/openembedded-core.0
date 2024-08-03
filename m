Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B96CC3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 21:07:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.16258.1722719251256223784
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Aug 2024 14:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IyYuxLDX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8923E40002;
	Sat,  3 Aug 2024 21:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722719249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pye+cy3fG8pEGhhROVsL1+gbKeJNNRHzXLS9F/YBvM=;
	b=IyYuxLDXdEwsUdT28QV59rf/JlUVl2HSltKYblXhoJDrM7TAudvO3qnbLW4Ktys/VJP5cA
	EuWXGJa6KPeIBDkhyTM9l3pO9imrgUz1rlQ0Pt8wp9UmEFD8WnUEc3lMNIxyDpw5zom7sQ
	Irvvh/r0UM/ZsjphwLLeUFNEKMgVBIRYxasfzypMyjUgYRIkBt6MYeBnek0m30hyHTJ7YZ
	H35gEYuhKozjeUj7mxsnBu/HgtK7qWOeYfr8tiieMIXqXoZ3GdfNlVEZS20hZ5GfBU9Iyj
	vNT6ZauX4PNXA3ic+bgntbqq3C7afkRZQgi9Yvdxu0oZdqam6TwOA+6zoD2haw==
Date: Sat, 3 Aug 2024 23:07:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: ross.burton@arm.com,
	Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/2] ell: add ptests
Message-ID: <20240803210728094632f9@mail.local>
References: <20240801082253.974486-1-martin@geanix.com>
 <AE35C2E5-DFDE-4817-8068-95D30C567870@arm.com>
 <b1828490c77c3546ce1b263cf4968bd25f52a573.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1828490c77c3546ce1b263cf4968bd25f52a573.camel@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Aug 2024 21:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202937

On 02/08/2024 13:51:45+0100, Richard Purdie wrote:
> On Fri, 2024-08-02 at 12:36 +0000, Ross Burton via
> lists.openembedded.org wrote:
> > On 1 Aug 2024, at 09:22, Martin Hundeb?ll via lists.openembedded.org
> > <martin=geanix.com@lists.openembedded.org> wrote:
> > > diff --git a/meta/recipes-core/ell/ell_0.67.bb b/meta/recipes-
> > > core/ell/ell_0.67.bb
> > > index 6b0ebbe62113..ee9aa73d2908 100644
> > > --- a/meta/recipes-core/ell/ell_0.67.bb
> > > +++ b/meta/recipes-core/ell/ell_0.67.bb
> > > @@ -10,9 +10,27 @@ SECTION = "libs"
> > > LICENSE  = "LGPL-2.1-only"
> > > LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> > > 
> > > -DEPENDS = "dbus"
> > > +DEPENDS = "dbus openssl-native xxd-native"
> > 
> > This should be conditional on ptest, right?
> > 
> > > +EXTRA_OECONF += "--enable-tests --enable-maintainer-mode"
> > 
> > Make this conditional on ptest too?
> > 
> > > +do_compile:prepend() {
> > > +    mkdir -p ${B}/unit
> > > +}
> > 
> > This sounds like a broken Makefile.am that has a bad assumption in.
> > 
> > > +do_install_ptest() {
> > > +    install -m755 -Dt ${D}${PTEST_PATH} $(find ${B}/unit -
> > > executable -type f)
> > > +    install -Dt ${D}${PTEST_PATH}/unit \
> > > +        ${S}/unit/dbus.conf \
> > > +        ${S}/unit/settings.test \
> > > +        $(find ${B}/unit -name \*.pem -type f)
> > > +}
> > 
> > As the test scripts are built with libtool, it’s best to use libtool
> > —mode=install to install them.
> 
> Thanks for the review Ross. There was also a failure in automated
> testing on the autobuilder:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6864/steps/12/logs/stdio
> 
> The arm tests haven't run yet in that build.

It failed to build on arm64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6689/steps/11/logs/stdio

> 
> Cheers,
> 
> Richard
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202907): https://lists.openembedded.org/g/openembedded-core/message/202907
> Mute This Topic: https://lists.openembedded.org/mt/107661617/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

