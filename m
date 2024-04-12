Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560DDC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:21:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.43682.1712917308992005966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 03:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WjqAixt1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85568240009;
	Fri, 12 Apr 2024 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712917307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u8Tv2CAAPDb7Ibs2m+F9vOKp2fpaC6NznHLF4ubXu+c=;
	b=WjqAixt1cvLFvUCDFYELyc6XTDejzNf3/tH1c/lcU1oyN85wCHCWcMjiHw/T5w/apj9e2s
	THplFhiX+kjQxzJdOSLjxoGTEMCrJrm33dqC5AcFv2wfm+WhffFUVWIuIftlYqbPRLa6zr
	bGm3S8vZ2HgbUg7eXavOfW0i73iXqFGF4LvVRk3YzWdkH53jCSBr6y7LQaRcubpnkBxGbx
	YJxto8U9e3poeEEA/rHHEkqU33aHERjkLwCZA1sEb0K3GbvpIczQ5qPVTps4fDTUrfGNSA
	grvTaaeqHHffjrsIU51MKuEXDwt7rMx7WSV8JgJoVvZK6Cm+cJ/9mSDlRSxJyA==
Date: Fri, 12 Apr 2024 12:21:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joe.slater@windriver.com
Cc: Ross Burton <Ross.Burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Message-ID: <20240412102145f2fb8036@mail.local>
References: <20240411011745.574202-1-joe.slater@windriver.com>
 <20240411011745.574202-2-joe.slater@windriver.com>
 <6216932520b3db7a6613f284e1c1a77b547c0d66.camel@linuxfoundation.org>
 <767076DA-A341-4508-950D-981ADBF412D3@arm.com>
 <DS0PR11MB728713383FA86BC36CD515EE88052@DS0PR11MB7287.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB728713383FA86BC36CD515EE88052@DS0PR11MB7287.namprd11.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 10:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198161

On 11/04/2024 14:58:40+0000, Joe Slater via lists.openembedded.org wrote:
> 
> 
> > -----Original Message-----
> > From: Ross Burton <Ross.Burton@arm.com>
> > Sent: Thursday, April 11, 2024 7:21 AM
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>; Slater, Joseph
> > <joe.slater@windriver.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>; MacLeod, Randy
> > <Randy.MacLeod@windriver.com>
> > Subject: Re: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend
> > ifupdown
> > 
> > On 11 Apr 2024, at 10:33, Richard Purdie via lists.openembedded.org
> > <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> > >> --- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interfaces
> > >> +++ /dev/null
> > >> @@ -1,5 +0,0 @@
> > >> -# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
> > >> -
> > >> -# The loopback interface
> > >> -auto lo
> > >> -iface lo inet loopback
> > >
> > > Is this patch meant to touch ifupdown as well as the packagegroup?
> > 
> > I suspect not, given that runqemu manually brings up network devices and the
> > last thing we want is DHCP running again.
> > 
> > Joe, please remove this chunk.
> 
> This was accidental since I removed the qemuall/interfaces in order to use the main one with qemu.  I'm sending new patches.  Maybe, though, we don't really need the qemuall stuff.

This broke all the tests of this build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6786

> 
> Joe
> > 
> > Ross

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198136): https://lists.openembedded.org/g/openembedded-core/message/198136
> Mute This Topic: https://lists.openembedded.org/mt/105454861/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

