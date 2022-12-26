Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BFDC4332F
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 08:34:09 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.133252.1672043643739092907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 00:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GAGCIxpe;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3D207240005;
	Mon, 26 Dec 2022 08:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672043641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ddQBnzKkNiIJCyQ4JspabsasIVp+qEeyqyK93F/dgI=;
	b=GAGCIxpeJOwtQVrZAXpt99UrE7qPxaDGSSPTR4SlxhkGz8e5DBu6GpmW8u3c0cubo6thM1
	pWruH2XeMb2R3VGIrgUGIOan5u88zyR8yrV5tQxSUiXVCLvLNsaizfe52/567hpiAmpZ6c
	jxcAjI5fpsS7Di7v2dG1DVeDL9dRufU72G2uWkWdTIQqwZ6kWtDTqDC+YBSSslnfmnwt+b
	jBg9rfixDH3FE+4HsvozyQv1PS1iwS6mYM3JBSOQ7MsITDkS6iqpB37IkS0OK07W9m+7Sf
	TcIrbC01FX1tsHexD/v9MKNC56XPeWCrNiuRfPl/6J0aRZr88eOMXYQiElrh7Q==
Date: Mon, 26 Dec 2022 09:33:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: richard.purdie@linuxfoundation.org, Chen Qi <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Message-ID: <Y6lcdwf2L70Rw1fM@mail.local>
References: <20221124025528.114101-1-Qi.Chen@windriver.com>
 <Y39W7D6ps5v1cCyn@mail.local>
 <CO6PR11MB5602B903C8B0BB9EB6C94214ED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <Y39rTVzD41m41oyP@mail.local>
 <CO6PR11MB56029B5C9F7EA25EB2CE1F6AED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <Y39zIuEp2//QoOxc@mail.local>
 <e9cc745903744a94f830e1e897c9cbabb66cd373.camel@linuxfoundation.org>
 <CO6PR11MB5602D48B1A9960C0E627C2F6ED0E9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <a6c3d013926c1c18e41efd9f860a2c74f6155470.camel@linuxfoundation.org>
 <95441494-5a98-6831-3897-83e58dec8fff@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95441494-5a98-6831-3897-83e58dec8fff@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 08:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175012

On 25/12/2022 19:13:43-0500, Randy MacLeod wrote:
> On 2022-11-25 08:00, Richard Purdie via lists.openembedded.org wrote:
> > Hi Qi,
> > 
> > On Fri, 2022-11-25 at 05:56 +0000, Chen Qi wrote:
> > > The AB is actually running 'all' tests.
> > > 
> > > The '--skip-tests (-R)' option means 'Run all (unhidden) tests except
> > > the ones specified.', according to its help message. This is also its
> > > actual effect for now. You can see there's an implicit 'run all
> > > tests' meaning in this option.
> > > The '-T (--exclude-tag)' options means 'Exclude all (unhidden) tests
> > > that match any of the specified tag(s)', according to its help
> > > message.
> > > 
> > > So the AB's oe-selftest command means: execute all tests except the
> > > ones tagged with 'machine' and 'toolchain-user', and also skip
> > > 'distrodata.Distrodata.test_checkpkg
> > > buildoptions.SourceMirroring.test_yocto_source_mirror reproducible'.
> > 
> > You're right, a different build has -t machine and I'm confusing the
> > two, sorry.
> > 
> > I don't really like making changes which require lockstep changes to
> > the autobuilder configuration but I can see why we could do with doing
> > so here.
> > 
> > I was thinking there should be symettry between -r and -R like there is
> > with -T and -t but that also probably doesn't make sense when you think
> > about it more.
> > 
> > Alex: We'll probably have to work out how to make this change...
> 
> Nudge and Happy Holidays.

Yes, this is still on my radar.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

