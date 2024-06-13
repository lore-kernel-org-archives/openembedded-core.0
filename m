Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F37C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 13:01:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.7939.1718283681303802175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 06:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IAiumWEq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7552FF806;
	Thu, 13 Jun 2024 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718283679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=McG82R827qhsjNC5fFnVcyE4cXmVUmoCfOxHjojyfd0=;
	b=IAiumWEq3LF9CWm5IcsiYuzzoCnjTeiCSjePYmcFJ068sjfnmq1berUrJ43o2J1Rykj0y6
	nRhZjTVyJuylGONahEV9ftDMqdpDlchNFfWecmnuEgQc7WiotiNQJCOfdhms/Srzg1k04g
	GjwTKS9Lr21rxwRzv2LcHeyhTs1LLBF2q5Dgr2Wo9H1uWxy+ymvyK5BArcwWKoNSJrD7Kc
	UwmO2YIbUljRYCLY8oWN4F4fBifaalHGDQaSRjmfTd4M64F6fH5cCwWDTpOaQjo+mhGqom
	ZZvHPVnLEupGU9K4ueZ2Gjul/WhNKltypYEQB8ut3GFxJf/hfYk/Q17Wp47RSA==
Date: Thu, 13 Jun 2024 15:01:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Johannes Schneider <johannes.schneider@leica-geosystems.com>,
	openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH v11 0/3] pkg-database and systemd-sysext image
Message-ID: <20240613130118d23ee04e@mail.local>
References: <20240604065040.2771-1-johannes.schneider@leica-geosystems.com>
 <4a6b60ec8200956e25e031cd28bf1023cf02df3f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a6b60ec8200956e25e031cd28bf1023cf02df3f.camel@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 13:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200601

Hello,

On 13/06/2024 07:44:59+0100, Richard Purdie wrote:
> On Tue, 2024-06-04 at 08:50 +0200, Johannes Schneider wrote:
> > systemd-sysext allows to overlay another image (or multiple) ontop of
> > a "base-image" = the current rootfs, via the use of overlayfs; to add
> > tools and features meant for development purposes.
> > 
> > To quote the documentation on systemd-sysext:
> > " ...addition in order to make debugging/development easier). System
> > extension images should not be misunderstood as a generic software
> > packaging framework, ..."
> > 
> > To build a lean image, that only holds packages that are not already
> > part of the base-image, a snapshot of the package-database is taken
> > after the installation of the base-rootfs is done, and picked up
> > again
> > when collecting the rootfs of such a extension image.
> > 
> > with all this in place an example usage could look like this:
> > some-core-image.bb
> > � inherit core-image
> > � IMAGE_GEN_PKGDBFS = "1"
> > 
> > extending-image.bb
> > � inherit image-sysext
> > � IMAGE_FSTYPES = "squashfs"
> > � IMAGE_BASE_PKGDB = "some-core-image"
> > � # the above pointing at a package-db similar to:
> > � # build/deploy/images/$MACHINE/some-core-image-$MACHINE-
> > 20240210172305-pkgdb.rootfs.tar.gz
> > 
> > then on the device, running some-core-image, with the extension image
> > placed at FN:
> > $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> > $> systemd-sysext list
> > $> SYSTEMD_LOG_LEVEL=debug systemd-sysext merge
> > 
> > As long as the VERSION_ID of the extension image matches the os-
> > release
> > in the base image, the above commands return sucessfully;
> > for details on the compativility check see the docs for systemd-
> > sysext.
> 
> I'm unsure what to so with this series/change.�I'm a bit worried that
> it is copy and pasting the debugfs image code to another form and once
> we have this form, I suspect others will then also want things to be
> added for other image update use cases or similar. That code is already
> hard to read and this is not going to improve that. I can understand
> the use case for the code though and I can certainly see why you'd want
> this code upstream as it would be hard to maintain standalone. Having
> the tests do help but the also illustrate this all feels a bit fragile.
> 
> I've just seen further failures in testing:
> 
> https://valkyrie.yoctoproject.org/#/builders/76/builds/55/steps/14/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/35/builds/47
> https://valkyrie.yoctoproject.org/#/builders/48/builds/16
> https://valkyrie.yoctoproject.org/#/builders/54/builds/57
> 
> and https://valkyrie.yoctoproject.org/#/builders/23/builds/58 will
> probably fail too but is currently still building.
> 
> What really worries me about these failures is that there isn't a good
> error message, so if this happens some time in the future we're going
> to be scratching our heads wondering what is wrong. I'm worrying this
> is going to be particularly hard to maintain and keep working in the
> future.
> 
> In many ways I'm wishing there was an API you could hook into so that
> the core project didn't need to take on the responsibility for this
> complexity.
> 
> Regardless, unfortunately we're still not to the bottom of the failures
> as evidenced above :(

I'm actually surprised it failed for you as v11 was successful on the AB
for me. Anyway, In the meantime, I dropped the series.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

