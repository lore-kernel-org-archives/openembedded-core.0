Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA991C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 21:57:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.43.1657922238328930845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 14:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FE3PMaSF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A0239240002;
	Fri, 15 Jul 2022 21:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657922236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+zibUH5F0AufxV95ZGwxec42SVbO5ZvNGO5cAGNfT/o=;
	b=FE3PMaSFqTEupb7S8ZAGemMKpw7D0YXTWhfxpaBNr54XspWdzX+ozUS8c6DmttvUdKB8Ny
	3iHzknqZa2WzM4M8ACYBHI76CFqinVj7wB+j8WXBhYCWVPNgKD+5G4xT04mOWsNeDtdVm4
	cgbC9TD+ZaOJ3Q7IXp570iNx25jVwKDNOJUw/ol4pTnwokUJ/v1airLUNzVNqyFFSBhO7T
	fbtQFDjGZuL/PN8/TuK9Oy5Wx+8fygpAEkaW9hTJBYXrC5PkcPO4k9V8ZSe3Onw8GshLKi
	WB1Uv9Sk5XLeCuV2MCEqIrhH9ozqFuNdpW2ppXd35qLv45rBtO4w5FeHSRcZnw==
Date: Fri, 15 Jul 2022 23:57:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Message-ID: <YtHiu9pR5QMFkXRP@mail.local>
References: <20220706182329.3085564-1-alex@linutronix.de>
 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
 <CANNYZj_fo5_KbvnXvCqPvoPiy6wgNr+By8Xf724aQm70xxCpkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANNYZj_fo5_KbvnXvCqPvoPiy6wgNr+By8Xf724aQm70xxCpkg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 21:57:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168141

On 15/07/2022 18:00:57+0200, Alexander Kanavin wrote:
> On Fri, 15 Jul 2022 at 16:42, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > We'd always intended that site.conf was more something the user would
> > setup once for their environment and not need to change. It was
> > therefore deliberately left out of the auto-setup piece.
> > I hadn't remembered we have an sample version of it. I think a sample
> > is fine as an example of how a site might setup a shared downloads
> > directory or common proxy information but I don't think the layer
> > should be installing it, particularly if it can trample an existing
> > file which I think the patch could as it stands.
> 
> Ah I see where the problem is: the sample file is installed subject to
> existence of local.conf in the destination build directory, which is
> ok most of the time, but not all of the time. It should check for
> existence of site.conf.
> 
> The idea is to serve two use cases:
> - when setting up a build from the poky template, there's a sample
> file installed. Same as local.conf.sample, we give users something to
> play with via commented out examples. They'll never find it in
> meta-poky/conf, even you had no idea it's there :)
> - when setting up a build from an organizational template, the right
> servers get configured without any extra steps. Ross pointed out that
> can be achieved with 'meta-product/conf/site.conf', but that can't be
> edited when needed, and can't be used to configure different settings
> for different builds (e.g. where the caches are - such things can be
> under access control restrictions).
> 
> I think this is worth reworking and making the commit message clearer.
> Or we should come up with a different way to provide 'official' way to
> set up site.conf, because otherwise it's back to 'write a custom
> script'.
> 

I don't think you need a custom script for site.conf, it is searched for
relative to BBPATH? I usually just put it directly as conf/site.conf in
the custom layer so it is in version control and not copied to BUILDDIR.

> Alex

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168121): https://lists.openembedded.org/g/openembedded-core/message/168121
> Mute This Topic: https://lists.openembedded.org/mt/92212803/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

