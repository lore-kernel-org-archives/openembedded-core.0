Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9EDp-0004fQ-Nz for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 13:56:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85BiHN3026568;
	Wed, 5 Sep 2012 12:44:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24187-08; Wed,  5 Sep 2012 12:44:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85Bi7qQ026561
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Sep 2012 12:44:08 +0100
Message-ID: <1346845447.21985.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 05 Sep 2012 12:44:07 +0100
In-Reply-To: <32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
	<32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] package_ipk.bbclass: use "--force-arch" when install package
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
X-List-Received-Date: Wed, 05 Sep 2012 11:56:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-05 at 12:05 +0200, Koen Kooi wrote:
> Op 5 sep. 2012, om 11:31 heeft Robert Yang <liezhi.yang@windriver.com> het volgende geschreven:
> 
> > This is for fixing the problem:
> > 1) bitbake core-image-sato-sdk with MACHINE=qemux86
> > 2) bitbake core-image-sato with with MACHINE=crownbay
> > 
> > The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but several
> > i586 packages will be installed into crownbay's rootfs though there are
> > core2 packages. For example, there are:
> > 
> > xserver-xorg_1.11.2-r4_i586.ipk
> > xserver-xorg_1.9.3-r1_core2.ipk
> > 
> > The crownbay.conf says:
> > PREFERRED_VERSION_xserver-xorg ?= "1.9.3"
> > 
> > What the crownbay's image needs is xserver-xorg_1.9.3-r1_core2.ipk, but
> > the xserver-xorg_1.11.2-r4_i586.ipk will be installed, this is
> > incorrect.
> 
> It is the correct behaviour, though.

No, it isn't. You told bitbake to build some specific versions, it did
that, then put something else in the rootfs. Without mentioning any of
this to the user.

So the current behaviour is totally broken and it needs to do one of:

a) Put the things the user asked for in the rootfs
b) Tell the user its not going to
c) Error out and ask the user to fix the problem

Builds are meant to be deterministic and this clearly isn't as what you
get out depends on the order of what you build.

> > This is caused by opkg's selecting mechanism: when more than one
> > candidate is found, it will use the higher version one and ignore the
> > arch priority.
> 
> As expected and wanted.

Under certain situations but not this one.

> > we have several conf files which set the PREFERRED_VERSION_pkg = "..." ,
> > but there is no such a mechanism which can let us tell the opkg to
> > install the preferred version.
> 
> As pointed out before, your DISTRO needs to fix this and you should
> NOT break opkg in the way you are doing now. 

Maybe.

What you're suggesting is that we have to force every package on a given
architecture to the lowest common denominator which makes no sense.

I understand about the "un-removable" package issue you previously
mentioned. There is a difference between what we build at rootfs time
and any ultimate disto package feeds however and I think we need to at
least consider this proposal.

It would appear at face value to at least make builds deterministic and
do what the users expects them to do. The side effect is making on
target package management more difficult.

Going back to the un-removable package problem, I think that opkg
probably should always prefer arch specific over version. The question
is how do you get back to say arch specific rather than machine specific
at some later date. I'd argue that removing the arch specific package
from the feed would be the trigger for that. Could that work as a
mechanism to get us out of this problematic situation?

Please try and help us figure out a way out of this. I will warn that
above all else builds need to be deterministic and so Robert's patch is
tempting right now as it fixes that.

Cheers,

Richard







