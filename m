Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5449FC4708D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 19:18:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.2689.1672773482976636391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 11:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YkigLTyb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BAA6940002;
	Tue,  3 Jan 2023 19:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672773481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xa7BsK1UeYGoS2fK+Uhfiq3+39CagogLawY9600GUcg=;
	b=YkigLTybQTdaske+ZxIlfHFpk0Zb0n9hJMaw2U7B3i8Kva1YCiTDcE97acmoUVdimccVMT
	ABC2u2iPP4owW5tHZEn/0peBchUjYjBcRmcwLAAUfEFTPzbZ6rbxUAQjMMEefuNVw8XW1N
	ZRBz303vYfM+v7VQN3eSd8uWsFNk4QykdGHvYO0Xd1cEgGXMwIl++0AXCApm2FxOMPk3OE
	tJPWJtGpkeM7WkCC/SF2QoxVx4c1Hry+CJpui3CinS086kmg/HSSeWXFLXAcgf2/XkZrnQ
	GStldfuAig7BMjjCOlKtboriY6WlY0bYFdeKYYkTPSubee/Voii3mB55Z2dpGA==
Date: Tue, 3 Jan 2023 20:18:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] C.UTF-8 in glibc
Message-ID: <Y7R/aAbkEXMIKRtC@mail.local>
References: <CAO5Uq5Toa3pa5Tnb1fuxLNe_PDYSAJUM4eJ5JObdeBOCQWzHVg@mail.gmail.com>
 <528a76b9a3cfebab7d1fc3edc88db756197faa22.camel@linuxfoundation.org>
 <CAO5Uq5QMOz7eAuju_z4iCLK+9uQzNmiGh3u9dtdKaxfEr_A2iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO5Uq5QMOz7eAuju_z4iCLK+9uQzNmiGh3u9dtdKaxfEr_A2iQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 19:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175365

On 02/01/2023 16:40:20+0000, Alex Kiernan wrote:
> On Mon, Jan 2, 2023 at 4:28 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2023-01-01 at 18:32 +0000, Alex Kiernan wrote:
> > > glibc got an official C.UTF-8 in 2.35, but we don't appear to install
> > > it by default... if I add "c" to IMAGE_LINGUAS then it gets installed,
> > > but it feels like this ought to be default? Or even stronger and have
> > > it separate from IMAGE_LINGUAS so even if that's set to "" you still
> > > get it?
> > >
> > > I tripped over it because I was trying to get the ostree ptest suite
> > > to pass and it ended up with a time formatting failing a test because
> > > it wasn't running in C.UTF-8.
> >
> > Making it even stronger might be tricky given how our variables work
> > but we definitely should have that in the default locales list.
> >
> 
> My original thinking on trying to make it stronger was I expect you
> really want this, but given everyone's managed so far without, I guess
> if they need it now they can add it back in if they're overriding
> IMAGE_LINGUAS.
> 
> Just thinking about this more, we can't specify it for musl, the
> obvious way would be a glibc specific append, which would then mean
> that setting IMAGE_LINGUAS = "" you still get it, which doesn't
> immediately feel right (plus the general wish to avoid append in
> core), which I guess means it needs something with more trickery...
> I'll go play.
> 

Maybe:

IMAGE_LINGUAS_C:libc-glibc = "c"
IMAGE_LINGUAS = "${IMAGE_LINGUAS_C}"

> -- 
> Alex Kiernan

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175323): https://lists.openembedded.org/g/openembedded-core/message/175323
> Mute This Topic: https://lists.openembedded.org/mt/95993257/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

