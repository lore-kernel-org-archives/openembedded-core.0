Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXvMo-0007gD-8Q for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 16:19:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4PE9Yu3002525;
	Fri, 25 May 2012 15:09:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01522-06; Fri, 25 May 2012 15:09:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4PE9RVK002519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 May 2012 15:09:28 +0100
Message-ID: <1337954965.20169.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2012 15:09:25 +0100
In-Reply-To: <20120525113057.GD3138@jama.jama.net>
References: <cover.1337933617.git.liezhi.yang@windriver.com>
	<fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
	<6CC0CB11-A526-457C-AC54-2D7C67E38DE2@dominion.thruhere.net>
	<20120525113057.GD3138@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2012 14:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-05-25 at 13:30 +0200, Martin Jansa wrote:
> On Fri, May 25, 2012 at 01:19:55PM +0200, Koen Kooi wrote:
> > 
> > Op 25 mei 2012, om 12:02 heeft Robert Yang het volgende geschreven:
> > 
> > > There is a bug if we:
> > > 1) bitbake core-image-sato-sdk MACHINE=qemux86
> > > 2) bitbake core-image-sato with MACHINE=crownbay
> > > 
> > > Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
> > > image even if there is one in deploy/ipk/core2 and we have set the
> > > core2's priority higher than i586, when the version in deploy/ipk/i586 is
> > > higher. This doesn't work for us, for example, what the crownbay need is
> > > xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
> > > 
> > > This is caused by opkg's selecting mechanism, if there are more than one
> > > candidates which have the same pkg name in the candidate list, for
> > > example, the same pkg with different versions, then it will use the last
> > > one which is the highest version in the list, this doesn't work for us,
> > > it should respect to the arch priorities in such a case.
> > 
> > This is a serious break with the current opkg behaviour and I don't think it's an improvement. Needing different versions for non machine specific packages indicates a more serious bug elsewhere.
> 
> It's not the same use-case as those 2 above, but what I don't like on
> current opkg behaviour is that it doesn't "reinstall" the package with
> the same version when it gets available in arch with higher priority.
> 
> e.g. I have armv7a device which has feed urls for armv4t and armv7a
> (armv7a of course with higher priority).
> 
> foo-1.0 in both feeds armv4t armv7a 
> 
> opkg update && opkg install foo -> foo-1.0_armv7a
> 
> distro builder publish foo-1.0-r1 sofar only in armv4t feed
> 
> opkg update && opkg upgrade -> foo-1.0_armv7a is upgraded to foo-1.0-r1_armv4t)
> 
> distro builder publish foo-1.0-r1 also to armv7a feed
> 
> opkg update && opkg upgrade -> nothing, but "upgrading" to foo-1.0-r1_armv7a) would be better
> 
> 
> On my distro builder I'm trying to prevent this scenario by rsyncing
> feeds only after build for *all* supported machines is completed, but
> that's still not really atomic operation. (And later I've also started
> to filter feeds which gets available on target image).

There is certainly cause to consider what opkg is doing here and whether
it makes sense. Preferring latest version over machine specific feeds is
not perhaps the behaviour we desire or expect. I agree if something
appears in a more optimised architecture, it should consider updating to
it too...

Has anyone talked to opkg upstream about the problems?

Cheers,

Richard





