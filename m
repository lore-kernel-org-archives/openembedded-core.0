Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9NCi-0003yA-VR for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 23:32:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85LJimX030603;
	Wed, 5 Sep 2012 22:19:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28994-02; Wed,  5 Sep 2012 22:19:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85LJb2i030597
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Sep 2012 22:19:38 +0100
Message-ID: <1346879977.21985.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 05 Sep 2012 22:19:37 +0100
In-Reply-To: <E182019A-4B42-4F70-BA82-EDC685EDFA9A@dominion.thruhere.net>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
	<32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
	<1346845447.21985.50.camel@ted>
	<E182019A-4B42-4F70-BA82-EDC685EDFA9A@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 05 Sep 2012 21:32:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-05 at 15:24 +0200, Koen Kooi wrote:
> Op 5 sep. 2012, om 13:44 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Wed, 2012-09-05 at 12:05 +0200, Koen Kooi wrote:
> >> Op 5 sep. 2012, om 11:31 heeft Robert Yang <liezhi.yang@windriver.com> het volgende geschreven:
> >> 
> >>> This is for fixing the problem:
> >>> 1) bitbake core-image-sato-sdk with MACHINE=qemux86
> >>> 2) bitbake core-image-sato with with MACHINE=crownbay
> >>> 
> >>> The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but several
> >>> i586 packages will be installed into crownbay's rootfs though there are
> >>> core2 packages. For example, there are:
> >>> 
> >>> xserver-xorg_1.11.2-r4_i586.ipk
> >>> xserver-xorg_1.9.3-r1_core2.ipk
> >>> 
> >>> The crownbay.conf says:
> >>> PREFERRED_VERSION_xserver-xorg ?= "1.9.3"
> >>> 
> >>> What the crownbay's image needs is xserver-xorg_1.9.3-r1_core2.ipk, but
> >>> the xserver-xorg_1.11.2-r4_i586.ipk will be installed, this is
> >>> incorrect.
> >> 
> >> It is the correct behaviour, though.
> > 
> > No, it isn't. You told bitbake to build some specific versions, it did
> > that, then put something else in the rootfs. Without mentioning any of
> > this to the user.
> 
> You forget that, you, as the user, instructed bitbake to build the
> other version when switching machine. Should bitbake refuse to build
> the packages in this scenario?

That would be better than silently doing something non-deterministic.

The bit I hate about this is the fact that sometimes a build would
result in one thing, sometimes another. It should always error out with
an invalid configuration rather than do that.

>  That would make more sense than trying to clean up the mess in the
> package_ipk bbclass. If you have online feeds the problem will
> reappear anyway.

I care more about builds being deterministic than online feeds.
Sorry ;-).

> > So the current behaviour is totally broken and it needs to do one of:
> > 
> > a) Put the things the user asked for in the rootfs
> > b) Tell the user its not going to
> > c) Error out and ask the user to fix the problem
> > 
> > Builds are meant to be deterministic and this clearly isn't as what you
> > get out depends on the order of what you build.
> 
> How do we know what the user expects? The user already did something
> that isn't right by building compatible arch packages with different
> versions. And this is deterministic, the user instructed bitbake to
> build a more recent, but compatible version, which will end up in the
> rootfs. If would be non-deterministic if opkg would decide at random
> what to install.

Having a different image depending on whether I build MACHINE A or B
first is not what the user expects and is not deterministic in my world
or I suspect in most user's. We can go and ask some if you really think
we need to?

> So, fix this problem at the root and make bitbake error out if your
> build breaks PREFERRED_VERSION.

How do we detect this? I want deterministic builds so I need the error
to appear regardless of whether I build A or B first (just like I expect
a consistent image).

I also do want to support these situations where we need special
versions. I appreciate its ugly but we have several significant users
with this problem and pretending it doesn't exist doesn't work, much as
I wish we could.

What I really need here is help with coming up with some working
solution. Putting our heads in the sand and arguing whether its even a
problem isn't going to go anywhere :(.

Its really easy to shoot down ideas on the mailing list. Its much harder
to be creative and find ways to take the project to better places whilst
addressing everyone's concerns. I'm starting to find I'm simply
physically and mentally running out of bandwidth for some of these
discussions. I try very hard to hear different opinions, explain
decisions, come up with creative solutions and so on and I think this
process is one of the better features of the project. I am going to need
help in order to be able to continue to do this and scale the project
though.

Cheers,

Richard




