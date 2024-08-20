Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9162CC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 19:14:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.2939.1724181258500057533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 12:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SFpu0veM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 423E8C0004;
	Tue, 20 Aug 2024 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724181256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SsI6+4SNjXf5o/E9TcAHTewHOCBNJNeywOyJOdI0GRg=;
	b=SFpu0veM4v07df8wesUwJPOmse9sKQWUaw+bArMQ0iiFSTdDFoRV0zuW5OHif1bRQZlX8R
	JdJ6DHq7QsGT8Q9Dl0h0nbzL2yYx0ubjfTqXt57gz2H4aHclFYkTFSH8XppL5qNnqHEB+m
	ufP4hrnxmraFL7+aZ4y5mPEcfkbTMQw0VYYr/AdCNo8YN1ndUFUkek8xmPcjousET1nk3s
	ZfSQQWr4ohDX7/8AunhYRXWsi5r3KkYBKfuRrkUN9X6ramp+lDqOWGiuAQJz04K3RAIvKu
	+GRW8hpVasmIgir4/G54Sfy7MoGwBUpIejoExnDpyfbRSh4jqhB22SrYnDmNZA==
Date: Tue, 20 Aug 2024 21:14:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] piglit: upgrade 22eaf6a91c -> c11c9374c1
Message-ID: <2024082019141589a62e42@mail.local>
References: <20240815140736.3189704-1-tgamblin@baylibre.com>
 <2024082016241749789ab3@mail.local>
 <4a465e4d-9cb5-462c-929b-1107e5e227c0@baylibre.com>
 <17ED7F9EA2077539.18027@lists.openembedded.org>
 <CANNYZj_=bBn1tuTjuL3Setj=CyJX56g4qRc2FoFXpj+0-XR=jg@mail.gmail.com>
 <1b2a0a57-db8e-43ae-ac59-27c3678391b6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b2a0a57-db8e-43ae-ac59-27c3678391b6@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 19:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203564


There were other build failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5211/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9395/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9407/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9226/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6299/steps/12/logs/stdio

On 20/08/2024 14:39:16-0400, Trevor Gamblin wrote:
> 
> On 2024-08-20 1:24 p.m., Alexander Kanavin wrote:
> > I looked. There is a condition:
> > 
> > https://gitlab.freedesktop.org/mesa/piglit/-/blob/main/CMakeLists.txt?ref_type=heads#L108
> > 
> > if(PIGLIT_USE_X11)
> > find_package(X11 REQUIRED)
> > set(PIGLIT_HAS_X11 True)
> > add_definitions(-DPIGLIT_HAS_X11)
> > endif()
> 
> Changing the x11 PACKAGECONFIG line to this seems to work:
> 
> PACKAGECONFIG[x11] = "-DPIGLIT_USE_X11=1 -DPIGLIT_BUILD_GL_TESTS=ON
> -PIGLIT_BUILD_DMA_BUF_TESTS=ON,-DPIGLIT_USE_X11=0
> -DPIGLIT_BUILD_GL_TESTS=OFF -DPIGLIT_BUILD_DMA_BUF_TESTS=OFF,${X11_DEPS},
> ${X11_RDEPS}"
> 
> Is there a cleaner way to do this?
> 
> > 
> > Alex
> > 
> > On Tue, 20 Aug 2024 at 19:22, Alexander Kanavin via
> > lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> > wrote:
> > > On Tue, 20 Aug 2024 at 19:18, Trevor Gamblin via
> > > lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> > > wrote:
> > > > 
> > > > On 2024-08-20 12:24 p.m., Alexandre Belloni wrote:
> > > > 
> > > > Unfortunately, this doesn't build on the AB:
> > > > 
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9383/steps/11/logs/stdio
> > > > 
> > > > Seems to be because of this line in the config:
> > > > 
> > > > DISTRO_FEATURES:remove = 'x11'
> > > > 
> > > > I see that consolekit has REQUIRED_DISTRO_FEATURES = "x11" in the recipe. Is this the right approach then for piglit?
> > > Only if the X11 support is unconditional. You first need to look at
> > > the failure log that says:
> > > 
> > > |   Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)
> > > 
> > > And then check piglit source code and its cmake configuration files to
> > > see where that particular check is performed and whether it's wrapped
> > > into a condition that we can tweak via cmake subject to x11 in
> > > DISTRO_FEATURES.
> > > 
> > > Alex
> > > 
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#203561): https://lists.openembedded.org/g/openembedded-core/message/203561
> > > Mute This Topic: https://lists.openembedded.org/mt/107914101/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

