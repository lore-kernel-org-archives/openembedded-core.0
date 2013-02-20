Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U84SY-00039a-6r
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 08:51:23 +0100
Received: by mail-pb0-f44.google.com with SMTP id wz12so2724354pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 23:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YvXO2lQZXysH/mUgMc3FatNY+VWbtc5zwJpKX7lX3wU=;
	b=IAZhbAu6UXxA2UMK79uJ8BLcrH6ae/Qjh1uS2d1f2t8UzFSTGve6YEXeGvnACioKf0
	yGA6uljD0iRLk027qPlWEkymtOI/lV5htKGio0Ogax0POOJBikZ/V0P1xsP/cz8UIq10
	415CJFZx1vdwW3I5zhXyoRpFlAlP3Bzh/RaS7WirqGFyRm7bjJnLXrUa14FacvJ4WFau
	uI/VeC5u7OPg9pAMLLJjcy7htjktiB8WqL8Pl/7FRUiqY9jR7SCEsqjT7Kc91wAYNqVV
	lXBZ9QipNyAPM62fHiSehXOTyhrGxD1Xw6W6K0Ft3xOZd0+awYMWaWy8WG2yWrkY08hx
	pgJw==
X-Received: by 10.68.189.199 with SMTP id gk7mr46918976pbc.164.1361345711250; 
	Tue, 19 Feb 2013 23:35:11 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id in5sm20777613pbc.20.2013.02.19.23.35.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 19 Feb 2013 23:35:10 -0800 (PST)
Date: Tue, 19 Feb 2013 23:34:56 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Michael_E_Brown@Dell.com
Message-ID: <20130220073455.GB23958@sakrah.homelinux.org>
Mail-Followup-To: Michael_E_Brown@Dell.com, dvhart@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <DB6E482E89290547898851B8CC9D8110DC3609D8@AUSX7MCPS302.AMER.DELL.COM>
	<5106C8D5.9000705@linux.intel.com>
	<DB6E482E89290547898851B8CC9D8110DC3609E1@AUSX7MCPS302.AMER.DELL.COM>
MIME-Version: 1.0
In-Reply-To: <DB6E482E89290547898851B8CC9D8110DC3609E1@AUSX7MCPS302.AMER.DELL.COM>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: udev blacklist ineffective
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 07:51:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/01/13 13:09), Michael_E_Brown@Dell.com wrote:
> > _______________________________________
> > From: Darren Hart [dvhart@linux.intel.com]
> > Sent: Monday, January 28, 2013 12:52 PM
> > To: Brown, Michael E
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] udev blacklist ineffective
> > 
> > On 01/28/2013 08:36 AM, Michael_E_Brown@Dell.com wrote:
> > > I have two embedded systems that share some devices over an i2c bus. Only one system may load the device driver at a time, and loading the device driver is already well-controlled by the HA subsystem.
> > >
> > > Our new yocto build with udev enabled is auto-loading these device drivers with catastrophic results. We must absolutely prohibit such automatic behaviour for our list of devices. I have tried:
> > >
> > > $ cat etc/modprobe.d/blacklist.conf
> > > blacklist seepmtd
> > > ... cut ...
> > >
> > > And this does *NOT* work. I have tried renaming blacklist.conf to
> > > modprobe.conf as well as creating modprobe.conf with these blacklist
> > > entries.
> > >
> > > This is a huge blocking issue and I have been unable to figure out a
> > > workaround for it. I would appreciate any suggestions.
> > 
> > 
> > OK, so... this needs to be addressed.
> > 
> > However, can you just not build/install the drivers for the system that
> > shouldn't be accessing them? Or do you require a more general image?
> 
> Both systems have to access these devices. They just cannot load the drivers simultaneously. The driver load is under control of the HA process that ensures that only one system at a time accesses the devices, and takes care of fencing, etc.
> 
> We have a custom FPGA that can switch access to the devices between two systems, loading drivers from both systems twiddles bits that ought not to be twiddled and catastrophically crashes one or both systems.
>  
> > You will need to provide details about the version of oe-core you are
> > using, kmod or modutils, and any relevant DISTRO configurations you have
> > made, which bit of software do you expect to be honoring the blacklist, etc.
> 
> Yocto release 1.3, danny branch + meta-oe/meta-systemd for system startup
> udev_v195-r10
> libkmod2_9-r0.0
> 
> Distro is poky + systemd
> 
> What is happening is that, on boot, the udev Coldplug startup step is loading drivers that must not be loaded based on i2c discovery.

yes udev is exactly for that. You are up for writing some udev rules
here may be something etc/udev/rules.d/10-local.rules and add
OPTIONS=="ignore_device" if condition (that you will define based on
device you want to ignore) is met.

> --
> Michael
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


